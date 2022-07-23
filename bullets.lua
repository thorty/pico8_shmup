function add_bullet()
	local bul={
			x=ship.x,
			y=ship.y-2,
			sp=16		
		}
	 add(bullets, bul)	
end

function move_bullets()
	for i=#bullets,1,-1  do
		bullets[i].y=	bullets[i].y-4
		if bullets[i].y < -8 then
			del(bullets, bullets[i])
		end
	end
end

function anim_bullets()
	for i=1,#bullets do
		local bu = bullets[i] 
		bu.sp+=1
		if bu.sp>=19 then
			bu.sp=16
		end
		bullets[i].sp=bu.sp
	end
end