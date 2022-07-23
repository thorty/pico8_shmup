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




function explode(expx,expy)

	local myp={}
	myp.x=expx
	myp.y=expy
	myp.xs=0
	myp.ys=0
	myp.maxage=10
	myp.c=7
	myp.size=6
	myp.first=true
	add(parts,myp)

	for i=0,10 do
		local myp={}
		myp.first=false
		myp.x=expx
		myp.y=expy
		myp.xs=(rnd()-0.5)*2
		myp.ys=(rnd()-0.5)*2
		myp.maxage=20+rnd(20)
		myp.c=7
		myp.size=3
		add(parts,myp)
	end
end