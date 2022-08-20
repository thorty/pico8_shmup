function startgame()	
	music(1)
	t=0
	ship={}	
	ship.sp=2
	ship.y=70
	ship.x=60
	ship.sx=0
	ship.sy=0	
	flamespr=5
	bullets={}
	shwaves={}
	bulltimer=5
	parts={}
	gameovertime=30
	--shootanim on ship	
	muzzle=0
	
	wave=1
	score=0
	lives=2	
	invul=0

	
	stars={}
	for i=1,100 do
		local newstar={}
		newstar.x =flr(rnd(128))
		newstar.y=flr(rnd(128))
		newstar.spd=rnd(2)+0.5		
		add(stars,newstar)
	end

	
	
end

function update_game()		
	t+=1

	ship.sx=0
	ship.sy=0	
	ship.sp=2
	--control	
	if btn(0) then
		ship.sx=-2
		ship.sy=0
		ship.sp=1
	end
	if btn(1) then
		ship.sx=2		
		ship.sy=0
		ship.sp=3
	end
	if btn(2) then
		ship.sx=0
		ship.sy=-2
	end
	if btn(3) then
		ship.sx=0	
		ship.sy=2		
	end	
	
	if btn(5) then
		if bulltimer<=0 then
			add_bullet()	
		 muzzle=2
			sfx(0)
			bulltimer=3
		end		
	end
	bulltimer-=1
	
	-- animate muzzle flash
	if muzzle>0 then
	 muzzle=muzzle-1
	end
	
	anim_bullets()

	
	--checking edge
	if ship.x > 116 then
--		shipx=116
		ship.x=3
	elseif ship.x < 3 then
--		shipx=3
		ship.x=116
	end	
	if ship.y > 115 then
--		shipy = 115
		ship.y = 4
	elseif ship.y < 4 then
--		shipy = 4
		ship.y = 115
	end

	--move ship
	ship.x+=ship.sx	
	ship.y+=ship.sy	

	--movieng enemies
	for myen in all(enemies) do
		myen.y+=myen.speed	

		myen.aniframe+=myen.speed/2	
		if flr(myen.aniframe)>#myen.ani then
			myen.aniframe=1
		end
		myen.sp=myen.ani[flr(myen.aniframe)]

		if myen.y > 130 then
			del(enemies,myen)
		end
	end	
	
	--collision enemie x bullets
	for myen in all(enemies) do
		for mybul in all(bullets) do
			if col(myen, mybul) then
				del(bullets, mybul)
				--create_shwave(mybul.x+4,mybul.y+4)
				create_hitpixel(myen.x+4,myen.y+4)
				myen.hp-=1
				sfx(3)
				myen.flash=5
				if myen.hp<=0 then
					del(enemies, myen)
					score+=100
					sfx(2)
					explode(myen.x+4,myen.y+4)

					if #enemies <=0 then
						startnewwave()
					end

				end				
			end
		end
	end
		
	
	--collision ship x enemies
	if invul<=0 then
		for myen in all(enemies) do
			if col(myen, ship) then
				lives-=1
				sfx(1)
				invul=60
				--del(enemies, myen)
				if lives<=0 then
					explode(ship.x+4,ship.y+4, true)
				else
					explode(ship.x+4,ship.y+4, false)
					
				end
			end
		end
	else
		invul-=1
	end

	-- check if enemy is out of screen then respawn
	for myen in all(enemies) do
		if myen.y>115 then
			myen.y=-4
		end
	end


	--time befor gameoveranimation
	if lives <=0 then
		--gameoverti me-=1
		--if gameovertime<=0 then
			mode="over"
			music(-1)
			sfx(4)
		--end
	end

	--anim flame
	if lives<=0 then
		flamespr=flamespr+1
		if flamespr>8 then
			flamespr=5
		end
	end

	move_bullets()

	animatestars()
	
end


--drawing every frame (30 fps)
function draw_game()	
	cls(0)	
	draw_starfield()
	if lives > 0 then
		if invul<=0 then
			spr(flamespr,ship.x,ship.y+7)	
			spr(ship.sp,ship.x,ship.y)	
			t=0
		else -- ship is shootet
			if sin(t/5)<0.2 then
				spr(flamespr,ship.x,ship.y+7)	
				spr(ship.sp,ship.x,ship.y)	
			end
		end
	end
	for myen in all(enemies) do
		if myen.flash>0 then
			myen.flash-=1
			flashspr()
		end
		drwspr(myen)	
		pal()--reset default colers
	end	
	drwallspr(bullets)	
	
	--draw muzzle
	if muzzle>0 then
 		circfill(ship.x+3,ship.y-4,muzzle,7)
 	end


	--drawing shwaves 
	draw_shwaves()

	--draw eyplosion
	draw_explosion()
		
	--metainfo
	print("score:"..score,85,1,7)		
	for i=1,4 do
		if lives>=i then
			spr(10,i*9-8,1)
		else
			spr(9,i*9-8,1)
		end
	end
end