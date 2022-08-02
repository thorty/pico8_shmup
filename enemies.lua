--add enemies and random place
function spawnenemies()			
	for i=1,enemiesmax do
		if #enemies < enemiesmax then
			local myen={}
			myen.hp=2
			myen.flash=0
			myen.x=rnd(120)	
			myen.y=rnd(30)-5
			myen.sp=21
			myen.speed=rnd(2)+0.5
			add(enemies,myen)
		end
	end
end



