
function update_start()	
	blinkt = blinkt+1
	if btnp(4) or btnp(5) then
		mode="levelscreen"
		startgame()
	end
end

function draw_start()
	cls(0)
	--print_center("enemys atacking human spacestation. ",20,7)
	--print_center("you are the last defender of human live. ",30,7)
	-- our radar system recognizes 9 waves and one mothership
	--print_center("this truely is....",50,7)
	print_center("space madness",20,7)
	print_center("press any key to start",80,blink())
end

function update_levelscreen()
	levelt=levelt+1
	update_game()
	if levelt>60 then
		levelt=0
		bullets={}
		mode="game"
		spawnwave()	
	end
end

function draw_levelscreen()
	draw_game()
	local text = "wave "..wave
	print(text, get_center(text),"50",blink())
end
	
function startnewwave()
	wave+=1
	mode="levelscreen"
	if wave > 5 then
		mode="won"
	end
end

function update_over()	

	if btn(4)==false and btn(5)==false then
		btnreleased=true
	end
	if btnreleased then
		if btnp(4) or btnp(5) then
			startgame()
			mode="start"
			btnreleased=false
		end
	end
end


function draw_over()
	draw_game()
	if btn(4)==false and btn(5)==false then
		btnreleased=true
	end
	if btnreleased then
		print("game over",45,40,8)
		print("press any key to try again",16,70,blink())
	end
end


function update_won()	
	if btn(4)==false and btn(5)==false then
		btnreleased=true
	end
	if btnreleased then
		if btnp(4) or btnp(5) then
			startgame()
			mode="start"
			btnreleased=false
		end
	end
end


function draw_won()
	draw_game()
	print_center("congratulation",30,12)
	print_center("-- you beat it! --",40,12) 
	print_center("score: "..score,70,8)
	print_center("press any key to continue",90,blink())
end