function add_bullet()
	local bul=make_spr()
	bul.x=ship.x+1.5
	bul.y=ship.y-4
	bul.sp=34			
	bul.colw=5
	bul.ani={34}
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
		anim_sprite(bu,1)
	end
end

