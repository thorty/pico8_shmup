
function update_start()	
	blinkt = blinkt+1
	if btnp(4) or btnp(5) then
		mode="levelscreen"
		startgame()
	end
end

function draw_start()
	cls(0)
	print("enemys atacking human spacestation. ",22,20,7)
	print("Yyu are the last defender of human live. ",18,30,7)
	print("now Fight. warrior!",34,40,7)-- our radar system recognizes 9 waves and one mothership
	print("this is truely....",34,50,7)
	print("space madness !",36,60,7)
	print("press any key to start",20,80,blink())
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
	cls(0)
	draw_game()
	print("wave "..wave,"51","50",blink())
end
	
function startnewwave()
	wave+=1
	mode="levelscreen"
	if wave >= 3 then
		mode="won"
	end
end

function update_over()	
	screentime-=1
	if screentime <=0 then
		if btnp(4) or btnp(5) then
			startgame()
			mode="start"
		end
	end
end


function draw_over()
	cls(0)
	print("game over",45,40,8)
	print("press any key to continue",16,70,blink())
end


function update_won()	
	screentime-=1
	if screentime <=0 then
		if btnp(4) or btnp(5) then
			startgame()
			mode="start"
		end
	end
end


function draw_won()
	cls(0)
	print("congrats. you defeat human race!",10,40,8)
	print("your score: "..score,15,50,8)
	print("press any key to continue",16,70,blink())
end