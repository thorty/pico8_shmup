
function _init()		
	mode="start"
	blinkt=0
	levelt=0
	entype=1
	wave=1
	parts={}
end

--drawing every frame (30 fps)
function _draw()		
	if mode=="game" then
		draw_game()
	elseif mode=="start" then
		-- star screen
		draw_start()
	elseif mode=="levelscreen" then		
		draw_levelscreen()		
	elseif mode=="over" then
		-- game over
		draw_over()
	end		
end


function _update()		
	if mode=="game" then
		update_game()
	elseif mode=="start" then		
		update_start()
	elseif mode=="levelscreen" then		
		update_levelscreen()		
	elseif mode=="over" then		
		update_over()		
	end
end
