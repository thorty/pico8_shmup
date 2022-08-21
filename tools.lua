--tools

function draw_starfield()
	for i=1,#stars do
		local scol=7
		if stars[i].spd<1 then
			scol=1			
		elseif stars[i].spd<1.5 then
			scol=13
		end
		--pset(starx[i],stary[i],scol)
		line(stars[i].x,stars[i].y,stars[i].x,stars[i].y+1,scol)
	end
end

function animatestars()

	for i=1,#stars do
		local sy=stars[i].y
		sy=sy+stars[i].spd
		if sy>128 then
			sy=sy-128
		end
		stars[i].y=sy
	end
end


function blink()
	blinka = {5,5,5,5,5,5,5,6,6,6,6,6,6,7,7,7,7,7,7}
	blinkt+=1
	if blinkt>#blinka then
		blinkt = 1
	end
	return blinka[blinkt]
end

function col(a,b) 
	a_left=a.x
	a_top=a.y
	a_right=a.x+a.colw-1 
	a_bottom=a.y+a.colh-1 
	b_left=b.x
	b_top=b.y
	b_right=b.x+b.colw-1 
	b_bottom=b.y+b.colh-1 	

	if a_top>b_bottom then return false end
	if b_top>a_bottom then return false end
	if a_left>b_right then return false end
	if b_left>a_right then return false end

	return true
end



function drwallspr(sprs)	
	for sp in all(sprs) do
		spr(sp.sp,sp.x,sp.y)
	end
end

function drwspr(sp)	
		spr(sp.sp,sp.x,sp.y,sp.spw,sp.sph)
end

function flashspr()
			for i=1,15 do
				pal(5,7)
				pal(6,7)
				pal(1,7)
			end
end


function explode(expx,expy,isbossmode)
	if isbossmode then
		-- boxx explosion
		local myp={}
		myp.x=expx
		myp.y=expy
		myp.xs=0
		myp.ys=0
		myp.maxage=10
		myp.c=7
		myp.size=20
		myp.first=true
		add(parts,myp)
		for i=0,50 do
			local myp={}
			myp.first=false
			myp.x=expx
			myp.y=expy
			myp.xs=(rnd()-0.5)*4
			myp.ys=(rnd()-0.5)*4
			myp.maxage=35+rnd(20)
			myp.c=7
			myp.size=10
			add(parts,myp)
		end
	else
		-- enemyexplosion
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
		create_pixelexplosion(expx,expy)
	end
	create_bigshwave(expx,expy)
end

function draw_explosion()
	for part in all(parts) do
		--pset(part.x,part.y,part.c)
		if part.first==false then
			if part.maxage<30 then
				part.c = 6		 
				part.size-=0.5	
			elseif part.maxage<15 then
				part.c = 5
			elseif part.maxage<5 then
				part.size-=0.5		
			end
		else 
			part.size-=1
		end
		if part.spark then
			pset(part.x,part.y,7)
		else
			circfill(part.x,part.y,part.size,part.c)		
		end
		--move
		if part.spark and part.maxage<=20 then
			--do not move them
		else 
	    	part.x+=part.xs
	    	part.y+=part.ys

			part.sx=part.xs*0.8
			part.sy=part.ys*0.8
		end
		part.maxage-=1
		if part.size<=0 and not part.spark then
			del(parts,part)
		elseif part.spark and part.maxage <=18 then
			del(parts,part)
		end
	end
end

function  create_shwave(x,y)
	local mysw={}
	mysw.x=x
	mysw.y=y
	mysw.r=3
	mysw.tr=4
	mysw.speed=2
	add(shwaves,mysw)
end

function  create_bigshwave(x,y)
	local mysw={}
	mysw.x=x
	mysw.y=y
	mysw.r=5
	mysw.tr=25
	mysw.speed=3.5
	add(shwaves,mysw)
end

function draw_shwaves()
	for mysw in all(shwaves) do
		circ(mysw.x,mysw.y,mysw.r, 7)
		mysw.r+=mysw.speed
		if mysw.r >mysw.tr then
			del(shwaves,mysw)
		end
	end
end

function create_pixelexplosion(expx,expy)
	for i=0,12 do
		local myp={}
		myp.first=false
		myp.x=expx
		myp.y=expy
		myp.xs=(rnd()-0.5)*6
		myp.ys=(rnd()-0.5)*6
		myp.maxage=30
		myp.c=7
		myp.size=3
		myp.spark=true
		add(parts,myp)
	end
end


function create_hitpixel(expx,expy)
	hitpixels = rnd(3)+1
	for i=0,hitpixels do
		local myp={}
		myp.first=false
		myp.x=expx
		myp.y=expy
		myp.xs=(rnd()-0.5)*4
		myp.ys=(rnd()-1)*2
		myp.maxage=28
		myp.c=7
		myp.size=3
		myp.spark=true
		add(parts,myp)
	end
end

function get_center(text)
	center= 64 - #text*2	
	--printh(#text ..center)
	return center
	
end

function print_center(text, y, c)
	print(text, get_center(text), y, c)
end

function make_spr()
	local myspr={}	
	myspr.sp=0		
	myspr.flash=0
	myspr.x=0
	myspr.y=0
	myspr.speed=rnd(1)+0.5
	myspr.aniframe=1
	myspr.spw=1
	myspr.sph=1
	myspr.colw=8
	myspr.colh=8
	return myspr
end