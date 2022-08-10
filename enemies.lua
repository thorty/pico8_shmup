--add enemies and random place
function spawnwave()	
	enemies={}
	enemiesmax=4
	spawnenemies()
end

--add enemies and random place
function spawnenemies()	
	
	enemies={}
	enemiesmax=4

	for i=1,enemiesmax do
		if #enemies < enemiesmax then
			local myen={}
			myen.hp=2
			myen.flash=0
			myen.x=rnd(120)	
			myen.y=rnd(10)*-1
			myen.sp=21
			myen.speed=rnd(1)+0.5
			add(enemies,myen)
		end
	end
end





