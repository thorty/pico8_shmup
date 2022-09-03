--add enemies and random place
function spawnwave()		
	--nemiesmax=4
	--	wave=5
	sfx(7)	
	attackrate=40
	if wave==1 then		
		lvl = {
			{0,1,1,1,1,1,1,1,1,0},
			{0,1,1,1,1,1,1,1,1,0},
			{0,1,1,1,1,1,1,1,1,0},
			{0,1,1,1,1,1,1,1,1,0}
		}
	elseif wave==2 then		
		lvl = {
			{0,1,1,1,1,1,1,1,1,0},
			{0,1,3,3,3,3,3,3,1,0},
			{0,1,2,2,2,2,2,2,1,0},
			{0,1,1,1,2,2,1,1,1,0}
		}
	elseif wave==3 then		
		lvl = {			
			{0,4,4,4,4,4,4,4,4,0},
			{0,3,3,3,3,3,3,3,3,0},
			{0,2,2,2,2,2,2,2,2,0},
			{0,3,3,3,3,3,3,3,3,0}
		}
	elseif wave==4 then		
		lvl = {			
			{0,4,4,4,4,4,4,4,4,0},
			{0,4,4,2,2,2,2,4,4,0},
			{0,4,4,4,4,4,4,4,4,0},
			{0,4,4,3,3,3,3,4,4,0}
		}
	elseif wave==5 then
		--enemiesmax=1
		--spawnen(5)	
		attackrate=50
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
	myen.anispeed=1
	myen.aniframe=1
	myen.spw=1
	myen.sph=1
	myen.mission="flyin"
	myen.wait=wait
	myen.shake=0

	if entype==nil or entype==1 then
		--krappler
		myen.hp=2
		myen.sp=21
		myen.ani={21,22,23,24}
		myen.sy=1.7
		myen.sx=0
		myen.entype=1
	elseif entype==2 then
		--spider
		myen.hp=3
		myen.sp=37
		myen.ani={37,38,39,40}
		myen.sy=2.7
		myen.sx=0
		myen.entype=2	
			
	elseif entype==3 then
		--hotn
		myen.hp=3
		myen.sp=53
		myen.ani={53,54,55,56}
		myen.sy=2.7
		myen.sx=0
		myen.entype=3	

	elseif entype==4 then
		--ghost maybe boss
		myen.hp=3
		myen.sp=48
		myen.ani={48,49,50,51}
		myen.sy=3
		myen.sx=0
		myen.entype=4	
		myen.shooter=true	
	elseif entype==5 then	
		myen.spw=2
		myen.sph=2
		myen.hp=20
		myen.sp=130
		myen.ani={130,132,134}
		myen.colw=16
		myen.colh=16
		myen.sy=0
		myen.sx=0
		myen.entype=5	
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

	if myen.wait>0 then
		myen.wait-=1
		return
	end
 if myen.mission=="flyin" then
	 -- flying in
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
	
	if myen.entype == 1 then
		myen.sx=sin(t/45)
		-- when boarder go to center
		if myen.x<32 then
			myen.sx+=1-(myen.x/32)
		end
		if myen.x>88 then
			myen.sx-=(myen.x-88)/32
		end
	end

	if myen.entype == 2 then
		myen.sx=sin(t/45)
		-- when boarder go to center
		if myen.x<32 then
			myen.sx+=1-(myen.x/25)
		end
		if myen.x>88 then
			myen.sx-=(myen.x-88)/25
		end
	end

	if myen.entype == 3 then
		if myen.sx==0 then
		--fly down
			myen.sy=2
			if ship.y <=myen.y then
				myen.sy=0
				if ship.x<myen.x then
					myen.sx=-2
				else
					myen.sx=2
				end
			end			
		end
	end

	if myen.entype == 5 then
		myen.sy=0.35
		if myen.y>100 then
			myen.sy=2
		end		
	end
	-- do not move type 4. he shoots
	if myen.entype==4 then
		return
	end
	move(myen)
 end
end

function enemyatacktimer()
	if mode!="game" then
		return
	end
	if attackrate==0 then
		return
	end
	if t%attackrate==0 then
		newattack()
	end
end

function newattack()
	local frontlinecount = determfrontline()		
	local maxnum=min(frontlinecount,#enemies) --10 oder der count wenn count<10
	local myenindex = flr(rnd(maxnum))
	myenindex = #enemies-myenindex
	local myen=enemies[myenindex]
	if myen==nil then return end
	if myen.mission=="protec" then		
		if myen.entype != 4 then
			myen.wait=30	
			myen.shake=30
			myen.mission="attac"
		end
		if myen.entype == 4 then
			add_enbullet(myen)
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

function killen(myen)
	del(enemies, myen)
	score+=100
	sfx(2)
	explode(myen.x+4,myen.y+4)
	if myen.mission=="attac" then
		newattack()	
	end
end


