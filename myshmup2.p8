pico-8 cartridge // http://www.pico-8.com
version 36
__lua__
#include main.lua
#include game.lua
#include gamescreens.lua
#include tools.lua
#include enemies.lua
#include bullets.lua

--todo:
-- counter how many enemies are on base --> wintarget not more then 10 -- show this on screen
-- 1れか wave to come through the game
-- nicer screens
-- enemie bullets
-- better music (opt)

__gfx__
00000000000550000005500000055000000000000000000000000000000000000000000006600660066006600550000000000000000000000000000000000000
00000000005665000056650000566500000000000006600000066000000660000007700060066006666666665775000000000000000000000000000000000000
00700700005665000056650000566500000000000067760000677600006776000076670060000006666666665775000000000000000000000000000000000000
00077000005666500556655005566500000000000076670000666600007667000077770060000006666666665775000000000000000000000000000000000000
00077000057766505657756505667750000000000006600000066000000660000007700006000060066666600550000000000000000000000000000000000000
00700700056666505756657505666650000000000000000000000000000000000000000000600600006666006006000000000000000000000000000000000000
00000000055565500555555005565550000000000000000000000000000000000000000000066000000660000000000000000000000000000000000000000000
00000000005775000057750000577500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00220000002200000022000000000000000000000550055005500550055005500550055060055500600000006000555000600000600555006000000000000000
0288200002ee20000288200000000000000000005565565555655655556556555565565550566750500000000505667505000000505667505000000000000000
287e82002e77e20028ee820000000000000000005666666556666665566666655666666505666665000000000056666650000000056666650000000000000000
28ee82002e77e20028e7820000000000000000005677576556775765567757655677576505555555000000000055555550000000055555550000000000000000
0288200002ee20000288200000000000000000000675576006755760067557600675576065665765600000000656657656000000656657656000000000000000
00220000002200000022000000000000000000000057750000577500005775000057750000565650000000000005656500000000005656500000000000000000
00000000000000000000000000000000000000000505505005055050050550500505505005555555000000000055555550000000055555550000000000000000
00000000000000000000000000000000000000000500005050000005050000500550055005000005000000000050000050000000050000050000000000000000
00000000000000000999000000000000000000005000000505000050005005005000000500700070000000000070000070000000070000070000000000000000
00000000000000009979900000000000000000005560065555600655556006555560065500070700000000000007000700000000700000007000000000000000
00089000080000809a7a900000000000000000000555555005555550055555500555555000000000000000000000000000000000000000000000000000000000
00899800e5e00e5e9a7a900000000000000000000075570000755700007557000075570000000000000000000000000000000000000000000000000000000000
00889800878008789a7a900000000000000000000055550000555500005555000055550000000000000000000000000000000000000000000000000000000000
00c88c008a8008a899a9900000000000000000000557655005567550055665500557755000000000000000000000000000000000000000000000000000000000
000cc0000a0000a00999000000000000000000005550055555500555555005555550055500000000000000000000000000000000000000000000000000000000
00000000000000000090000000000000000000005000000505000050005005005000000500000000000000000000000000000000000000000000000000000000
00555500005555000055550000555500000000000600006060000006060000606000000600000000000000000000000000000000000000000000000000000000
05666650056666500566665005666650000000000600006006000060060000600600006000000000000000000000000000000000000000000000000000000000
56667665566776655667766556666665000000000060060000600600006006000060060000000000000000000000000000000000000000000000000000000000
56677665566766655667766556666665000000000076670000766700007667000076670000000000000000000000000000000000000000000000000000000000
56666665566666655666666556666665000000000057750000577500705775070057750000000000000000000000000000000000000000000000000000000000
55555555555555555555555555555555000000007505505705055050050550500505505000000000000000000000000000000000000000000000000000000000
50505050505050500505050550505050000000000000000007000070000000000700007000000000000000000000000000000000000000000000000000000000
50005000005000500005000500500050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000066666660000000000000000000000000666666600000000000000000000000000666666600000000000000000000000006666666000000000000
00000000006666666666600000000000000000000066666666666000000000000000000000066666666666000000000000000000000666666666660000000000
00000000066666666666660000000000000000000666666666666600000000000000000000666666666666600000000000000000006666666666666000000000
00000000666666666666666000000000000000006666666666666660000000000000000006666666666666660000000000000000066666666666666600000000
00000006666666666666666600000000000000066666666666666666000000000000000066666666666666666000000000000000666666666666666660000000
00000006666666666666666600000000000000066666666666666666000000000000000066666666666666666000000000000000666666666666666660000000
00000006666666666666666600000000000000066666666666666666000000000000000066666666666666666000000000000000666666666666666660000000
00000006666666666666666600000000000000066666666666666666000000000000000066666666666666666000000000000000666666666666666660000000
00000006666766666667666600000000000000066667666666676666000000000000000066667666666676666000000000000000666676666666766660000000
00000005666666666666666600000000000000056666666666666666000000000000000066666666666666665000000000000000666666666666666650000000
00000006666666666666666000000000000000066666666666666660000000000000000006666666666666666000000000000000066666666666666660000000
00000000066666666666660000000000000000000666666666666600000000000000000000666666666666600000000000000000006666666666666000000000
00000000065666666666656000000666000000000656666666666560000000000000000006566666666665600000000066600000065666666666656000000000
00000000066666666660666600006566000000000666666666606666000000000000000066660666666666600000000066560000666606666666666000000000
66666000666066000660066560066660000000006660660006600665600000000000000656600660006606660000000006666006566006600066066600066666
56656600666066600665056666066600000006006660666006650566660000000000006666505660066606660060000000666066665056600666066600665665
60066600660066600065600066566000000066006600666000656000665660000006656600065600066600660066000000066566000656000666006600666006
00006506660006660066660066666000000065066600066600666600666666000066666600666600666000666056000000066666006666006660006660560000
00006666500006660006660006656000000066665000066600066600066566600666566000666000666000056666000000065660006660006660000566660000
00006666000000560000660000000000000066660000005600006600000065666656000000660000650000006666000000000000006600006500000066660000
00000000000006660000560000000000000056600000066600005600000006566560000000650000666000000665000000000000006500006660000000000000
00000000000066660000660000000000000065600000666600006600000000000000000000660000666600000656000000000000006600006666000000000000
00000000000665600000665000000000000000000006656000006650000000000000000005660000065660000000000000000000056600000656600000000000
00000000006566000000656666600000066666000065660000006566000000000000000066560000006656000066666000000666665600000066560000000000
00000000666600000000066665666600656656656666000000006660000000000000000006660000000066665665665600666656666000000000666600000000
00000666666000000000000006666600656666666660000666666600000000000000000000666666600006666666665600666660000000000000066666600000
00006656000000000000000000006600000066560000006656656000000000000000000000065665660000006566000000660000000000000000000065660000
00006660000000000000000000006500000000000000066660000000000000000000000000000006666000000000000000560000000000000000000006660000
00006500000000000000000000006600000000000000000000000000000000000000000000000000000000000000000000660000000000000000000000560000
00006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000660000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60055500600000000060000000000600000600000000600006000000000000600000000000000000000000000000000000000000000000000000000000000000
50566750500000000050005555000500005000555500050000500055550005000000000000000000000000000000000000000000000000000000000000000000
05666665000000000005056556505000000505655650500000050565565050000000000000000000000000000000000000000000000000000000000000000000
05555555000000000000567667650000000056766765000000005676676500000000000000000000000000000000000000000000000000000000000000000000
65665765600000000005677667765000000567766776500000056776677650000000000000000000000000000000000000000000000000000000000000000000
00565650000000000055656556565500005565655656550000556565565655000000000000000000000000000000000000000000000000000000000000000000
05555555000000000056565555656500005656555565650000565655556565000000000000000000000000000000000000000000000000000000000000000000
05000005000000000056666556666500005666655666650000566665566665000000000000000000000000000000000000000000000000000000000000000000
00700070000000000605666556665060000566655666500000056665566650000000000000000000000000000000000000000000000000000000000000000000
00070700000000000650677557760560655067755776055605506775577605500000000000000000000000000000000000000000000000000000000000000000
00000000000000000000567557650000000056755765000006005675576500600000000000000000000000000000000000000000000000000000000000000000
00000000000000000000055775500000000005577550000000000557755000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000507007050000000050700705000000005070070500000000000000000000000000000000000000000000000000000000000000000000
00000000000000000005000000005000000500000000500000050000000050000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000500000050000000500000000500000500000000005000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000070000700000000070000007000007000000000000700000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100003d530365302f52027520215201d520155200f52009520065100351002510015100051000500005000050000500005000150001500015000050000500005000050023500285002c500005000050000500
000500001563012630106300f6300c6300a6300962008620076200762007620076200661004610026100161000600046000f6001160013600156001a600246002860000000000000000000000000000000000000
00010000350502f05029640186200b6100a6100761005610046100261003650016000260003600006500160000600016501920003600036000265003600036000360000200002000020000200002000020000200
000100002f55029550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000b00000c330133301b3301f3202232024320223201b320113300f3300c3300c330083300a3200c3200832003320003200033000000000002100023000250000000009000090000000009000070000000004000
00110000185501b5501d5502255027550295502b5502b5502b55027550225501d5501b55018550185501b5501f55022550225502455024550275502755027550225501d5501b55018550185501b5501f55024550
000800001370011050160501b0501d0501b5501b550290501b5502e0501d55035050370501f5503c0503c0502255029050220501d050220502405027050225502e0502e050300503305022550300502b05027050
01050000375323553233532315322e5322d5322a532275322553223532205321f5321d5221c5221a5221952216522165221352211512105120d5120b512095120751206512045120151200512005000050000500
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01100000265301a5001f5302453027530235002753024530225301f5301b530165300f5300f500165301350024530185001f5302453027530235002753024530225301f5301b530165300f5300f5350000000000
011000000415300100001000010004153001000010000100041530010000100001000415304153001000010004153001000010000100041530010000100001000415300100001000010004153041530010000100
010900001151514525185351b545015000b50013515165251a5351d545135001350015515185251c5351f54522555275552555528550285402853228522285122851500500005000050000500005000050000500
000900001175514755187551b755017000b70013755167551a7551d755137001370015755187551c7551f75522755277552575528750287502875228752287522875500700007000070000700007000070000700
3310000022111271112a1111c1000c0000c00022111271112a1110c0000c0000c00022111271112a1110c0000c0000c00022100271002a1002a100221000c0000000000000000000000000000000000000000000
001000001d1111a1111611114111111110f1110d1110a111081110711106111011111f1001f1001f1001f1001f1001f1001f1001f1001d1001a1001610014100111000f1000d1000a10008100071000610001100
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000002a0502b0102c0102d0102d0102d0501b0501c0501c0502c0502805024050200501d050170501f050120500a05005050030502b0502c0502d0502e0502c05029050290502705024050200502005000300
0110000024734187041f7342473427734237042773424734227341f7341b734167340f7340f7040f7041170424734187041f7342473427734237042773424734227341f7341b734167340f7341f7041b70416704
__music__
07 0a4b5544
03 0b0b4344
07 0c474344
07 0c0d4e44
01 4f454344
02 0f424344

