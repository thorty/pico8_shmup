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
	blinka = {5,5,5,5,5,5,5,6,6,6,7,7,7}
	if blinkt>#blinka then
		blinkt = 1
	end
	return blinka[blinkt]
end

function col(a,b) 
	a_left=a.x
	a_top=a.y
	a_right=a.x+7 
	a_bottom=a.y+7
	b_left=b.x
	b_top=b.y
	b_right=b.x+7 
	b_bottom=b.y+7	
	
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
		spr(sp.sp,sp.x,sp.y)
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
		for i=0,40 do
			local myp={}
			myp.first=false
			myp.x=expx
			myp.y=expy
			myp.xs=(rnd()-0.5)*4
			myp.ys=(rnd()-0.5)*4
			myp.maxage=25+rnd(20)
			myp.c=7
			myp.size=10
			add(parts,myp)
		end
	else
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
		
		circfill(part.x,part.y,part.size,part.c)		
		--move
	    part.x+=part.xs
	    part.y+=part.ys

		part.sx=part.xs*0.8
		part.sy=part.ys*0.8
	 
	    part.maxage-=1
		if part.size<=0 then
			del(parts,part)
		end
	end
end
