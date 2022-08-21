
function _init()		
	mode="start"
	music(0)
	blinkt=0
	levelt=0
	entype=1
	wave=1
	parts={}
	lastwave=1
	enemies={}
	t=0
	--for handling button mashing between screens
	lockout=0	
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
	elseif mode=="won" then
		-- game over
		draw_won()	
	end		
	--print(t,5,5,12)	
	--print(lockout)	
end


function _update()
	t+=1		
	if mode=="game" then
		update_game()
	elseif mode=="start" then		
		update_start()
	elseif mode=="levelscreen" then		
		update_levelscreen()				
	elseif mode=="over" then		
		update_over()		
	elseif mode=="won" then		
		update_won()		
	end
end
