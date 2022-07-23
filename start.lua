
function update_start()	
	blinkt = blinkt+1
	if btnp(4) or btnp(5) then
		mode="levelscreen"
	end
end


function update_levelscreen()
	levelt=levelt+1
	if levelt>20 then
		levelt=0
		startgame()
	end
end


function draw_start()
	cls(0)
	print("space madness !",34,40,7)
	print("press any key to start",20,70,blink())
end

function draw_levelscreen()
	cls(0)
	print("wave "..wave,"51","50",12)
end
	