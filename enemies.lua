--add enemies and random place
function spawnwave()		
	enemiesmax=4
--	wave=5
	if wave==1 then
		spawnen(1)
	elseif wave==2 then
		spawnen(2)
	elseif wave==3 then
		spawnen(3)
	elseif wave==4 then
		spawnen(4)
	elseif wave==5 then
		enemiesmax=1
		spawnen(5)
		
	end
	
end

--add enemies and random place
function spawnen(entype)	
		
	for i=1,enemiesmax do
		if #enemies < enemiesmax then
			printh("spawn: "..i .."-"..enemiesmax)
			local myen={}
			myen.hp=2
			myen.flash=0
			myen.x=rnd(120)	
			myen.y=rnd(10)*-1
			myen.speed=rnd(1)+0.5
			myen.aniframe=1
			myen.spw=1
			myen.sph=1
			if entype==nil or entype==1 then
				--krappler
				myen.hp=3
				myen.sp=21
				myen.ani={21,22,23,24}
			elseif entype==2 then
				--spider
				myen.hp=5
				myen.sp=37
				myen.ani={37,38,39,40}
			elseif entype==3 then
				--hotn
				myen.hp=2
				myen.sp=53
				myen.ani={53,54,55,56}
			elseif entype==4 then
				--ghost maybe boss
				myen.hp=2
				myen.sp=48
				myen.ani={48,49,50,51}
			elseif entype==5 then	
				myen.spw=4
				myen.sph=4
				myen.hp=64
				myen.sp=48
				myen.ani={64,68,72,76}
			end
			add(enemies,myen)
		end
	end
end





