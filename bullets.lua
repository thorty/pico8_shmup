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

	for en in all(enbullets)  do
		en.y=en.y+2
		if en.y > 130 then
			del(enbullets, en)
		end
	end	
	for i=#bullets,1,-1  do
		bullets[i].y=	bullets[i].y-4
		if bullets[i].y < -8 then
			del(bullets, bullets[i])
		end
	end
	anim_bullets()
end

function anim_bullets()
	for i=1,#bullets do
		local bu = bullets[i] 		
		anim_sprite(bu,1)
	end
	for i=1,#enbullets do
		local bu = enbullets[i] 		
		anim_sprite(bu,1)
	end
end


function add_enbullet(en)
	local bul=make_spr()
	bul.x=en.x+1.5
	bul.y=en.y-4
	bul.sp=16			
	bul.colw=2
	bul.colh=2
	bul.ani={16,17,18}
	add(enbullets, bul)	
end
