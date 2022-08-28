--add enemies and random place
function spawnwave()		
	--nemiesmax=4
	--	wave=5
	sfx(7)	
	if wave==1 then
		attackrate=40
		lvl = {
			{0,1,1,1,1,1,1,1,1,0},
			{0,1,1,1,1,1,1,1,1,0},
			{0,1,1,1,1,1,1,1,1,0},
			{0,1,1,1,1,1,1,1,1,0}
		}
	elseif wave==2 then
		attackrate=10
		lvl = {
			{0,1,1,1,1,1,1,1,1,0},
			{0,3,3,3,3,3,3,3,3,0},
			{0,2,2,2,2,2,2,2,2,0},
			{0,1,1,1,1,1,1,1,1,0}
		}
	elseif wave==3 then
		attackrate=30
		lvl = {			
			{0,4,4,4,4,4,4,4,4,0},
			{0,3,3,3,3,3,3,3,3,0},
			{0,2,2,2,2,2,2,2,2,0},
			{0,3,3,3,3,3,3,3,3,0}
		}
	elseif wave==4 then
		attackrate=20
		lvl = {			
			{0,4,4,4,4,4,4,4,4,0},
			{0,4,4,2,2,2,2,4,4,0},
			{0,4,4,4,4,4,4,4,4,0},
			{0,4,4,3,3,3,3,4,4,0}
		}
	elseif wave==5 then
		--enemiesmax=1
		--spawnen(5)	
		attackrate=0
		lvl = {
			{0,0,0,5,0,0,5,0,0,0}	
		}			
	end	
	placeen(lvl)
end


--add enemies and random place
function spawnen(entype,x,y,wait)						
	local myen=make_spr()
	myen.hp=2
	myen.flash=0
	myen.x=x*2-45
	myen.y=y-66
	myen.posx=x
 	myen.posy=y
	myen.speed=1
	myen.aniframe=1
	myen.spw=1
	myen.sph=1
	myen.mission="flyin"
	myen.wait=wait

	if entype==nil or entype==1 then
		--krappler
		myen.hp=2
		myen.sp=21
		myen.ani={21,22,23,24}
	elseif entype==2 then
		--spider
		myen.hp=3
		myen.sp=37
		myen.ani={37,38,39,40}
	elseif entype==3 then
		--hotn
		myen.hp=3
		myen.sp=53
		myen.ani={53,54,55,56}
	elseif entype==4 then
		--ghost maybe boss
		myen.hp=3
		myen.sp=48
		myen.ani={48,49,50,51}
	elseif entype==5 then	
		myen.spw=2
		myen.sph=2
		myen.hp=64
		myen.sp=130
		myen.ani={130,132,134}
		myen.colw=16
		myen.colh=16
	end
	return myen	
end

function placeen(lvl)
	for y=1,#lvl do
		for x=1,10 do
			if lvl[y][x] != 0 then
				add(enemies, spawnen(lvl[y][x],x*12-6,y*12,x+8))
			end
		end
	end
end

function doenmission(myen)
 if myen.mission=="flyin" then
	 -- flying in
	if myen.wait>0 then
		myen.wait-=1
		return
	end
	--myen.y+=myen.speed+1

	--basic easing function for smoth animations
	--x+=(targetx-x)/n
	myen.x+=(myen.posx-myen.x)/9
	myen.y+=(myen.posy-myen.y)/9

	if abs(myen.posy-myen.y)<0.7 then
		myen.y=myen.posy	 
		myen.mission="protec"
	end
 elseif myen.mission=="protec" then
 --staying
 elseif myen.mission=="attac" then
 --attac
	myen.y+=1.7
 end
end

function enemyatack()
	if mode!="game" then
		return
	end
	if attackrate==0 then
		return
	end
	if t%attackrate==0 then
		local frontlinecount = determfrontline()

		local maxnum=min(frontlinecount,#enemies) --10 oder der count wenn count<10
		local myenindex = flr(rnd(maxnum))
		myenindex = #enemies-myenindex

		local myen=enemies[myenindex]
		if myen.mission=="protec" then
			myen.mission="attac"		
		end
	end
end

function determfrontline()
	local enmaxy = 0
	local frontlinecount = 0
	-- get max y position from all enemies
	for i=1,#enemies do
		if enemies[i].y>enmaxy then
			enmaxy = enemies[i].y
		end
	end
	--count all with the same y position
	for i=1,#enemies do
		if enemies[i].y==enmaxy then
			frontlinecount=frontlinecount+1
		end
	end
	return frontlinecount
end




