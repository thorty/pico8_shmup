function update_over()
	blinkt = blinkt+1	
	if btnp(4) or btnp(5) then
		mode="start"
	end
end


function draw_over()
	cls(0)
	print("game over",45,40,8)
	print("press any key to continue",16,70,blink())
end
