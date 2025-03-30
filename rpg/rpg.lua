-- title:   game title
-- author:  lettucepie
-- desc:    Monster Collector RPG
-- site:    website link
-- license: MIT License (change this to your license of choice)
-- version: 0.1
-- script:  lua

function set4bpp()
	poke4(2 * 0x3ffc, 2)
end

function set2bpp()
	poke4(2 * 0x3ffc, 4)
end

function BOOT()
	set2bpp()
end

function TIC()
	cls()
	map(0,0,30,16,0,0)
	spr(512,10,100,0,1,0,0,2,2)
	spr(514,25,100,0,1,0,0,2,2)
	spr(516,40,100,0,1,0,0,2,2)
	spr(528,55,100,0,1,0,0,2,2)
	spr(530,70,100,0,1,0,0,2,2)
	spr(532,85,100,0,1,0,0,2,2)
end
-- <TILES>
-- 000:0000000000000000000000400000011000000400000004000000040000000000
-- 001:555595555555955555559555aaaaaaaa555555565555555655555556aaaaaaaa
-- 002:5555555559aaaa65599556655695569556955695b595565aa595565eb595565b
-- 003:082097970820666608209b9b0820eeee08207979082066660820b9b90820eeee
-- 004:cffffffff030c0033030c0033030c0033030c0033030c0033030c003f0f0c30f
-- 005:fff30c000c0f0c000c0c0c000c0c0c300c0c0c000c0c0c000c0c0c000c3c0c30
-- 006:0000000000000000000010000000400005004040001401100082050000800100
-- 007:00000000000400000410140004a6a61000aa6a0005aaa80009a5aa000aa9a520
-- 016:0000000000000000000040000400010001110400404004000000040000000000
-- 017:655555596555555965555559aaaaaaaa655555596555555965555559aaaaaaaa
-- 018:a595565eb595504ba5d5586eb5955f7ba6d5565eb995565ba6d5575eb9d5575b
-- 019:08200aa00820aaaa08200140082040010820014008204001082001400aa00aa0
-- 020:0497e520046699100b9be6e00ceebb3049795e5246669991b9b96e6eceeebbb3
-- 022:00060200400882000920a04100a0a4200486aa00000aa2000009b0410009b080
-- 023:0aaaa9605a9aaaa01aeaa9a1aaaaaeae6a9aaa6aabd2aaaa8aa696a21abaaafa
-- 032:0000000000000000000000000011111104444444001111110444444400111111
-- 033:0000000000000000000000001100000044000000111000004400000011100000
-- 039:000aa820000ef300000ae000000aa0000009a0000009a000008ab000008ee200
-- 048:0444444400111111044444440011111104444444001111110444444400111111
-- 049:4400000011100000440000001110000044000000111000004400000011100000
-- 064:0444444400111111044444440011111100444444000000000000000000000000
-- 065:4400000011100000440000001110000044000000000000000000000000000000
-- </TILES>

-- <TILES1>
-- 001:0000000000000000000000000000000000000000000000020000002200000020
-- 002:0000000000000000000000000000000022200000200000000000000000000000
-- 003:0000000000000000000000000000000000000030000000300000003000000030
-- 004:0000000000000000300000000330000000030000000300000003000000030000
-- 017:0000002000000022000000000000000000000000000000000000000000000000
-- 018:0000000020000000220000000000000000000000000000000000000000000000
-- 019:0000003000000030000000300000000000000000000000000000000000000000
-- 020:0003000000030000000300000003000000300000003000000000000000000000
-- </TILES1>

-- <SPRITES>
-- 000:0000000000041000000510000045100000551000045410000514100005041000
-- 001:0004100000455000005551000050410000004100000045000000050000004500
-- 002:0005500004555100045151000000410000005100000451000045500000455100
-- 008:0000500000005100000451000005510000055100000541000045450000510500
-- 009:0000000000000000000000000041000000455100004555000045450000414500
-- 010:0000000000000000045551000455510005104100050000000500000005000000
-- 016:0004100000051000000510000005000000050000045551000455510000000000
-- 017:0000450000004100045555000455551004551450045100500000005000000000
-- 018:0000510000004100000041000454510004555100004510000000000000000000
-- 024:0055050004550500041005000410050005100500050005000000000000000000
-- 025:0041450000414510004105100041041000414510004555100005510000000000
-- 026:0500000005000000051000000550050004555500004555000000000000000000
-- </SPRITES>

-- <MAP>
-- 000:0000000000000000000000000000000000000000000000e0f0e0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 001:0000000000000000008170707070707070910000000000e1f1e1f1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 002:0000000000000000002130303030303030310000000000e2f2e2f2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 003:0001000001000000002130303030303030310071000000e0f0e0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 004:0000000000000000002130303030405030310060100000e1f1e1f1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 005:0000000000000000002130303030415130310061000000e2f2e2f2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 006:0000010000000000010000000000022200000000000000e0f0e0f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 007:1100000000000000000000000000032300000000000000e1f1e1f1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 008:0000000000011000000000000000032300000000000000e2f2e2f2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 009:001101000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 010:0000000000000000000000000000000000000000c0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 011:0000000000000000000000000000100000000000c1d10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 012:0000000000000000000000000000000000000000e2f20000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- </MAP>

-- <WAVES>
-- 000:00000000ffffffff00000000ffffffff
-- 001:0123456789abcdeffedcba9876543210
-- 002:0123456789abcdef0123456789abcdef
-- </WAVES>

-- <SFX>
-- 000:000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000304000000000
-- </SFX>

-- <TRACKS>
-- 000:100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- </TRACKS>

-- <PALETTE>
-- 000:eeeee2aeaaaa6d6d6d282828ffcd75a7f07038b76425717929366f3b5dc941a6f673eff7f4f4f494b0c2566c86333c57
-- </PALETTE>

-- <PALETTE1>
-- 000:440000007900000089a19d009d009900a1a1f6f2ee3c3c38555555956d95d29d616191c2e6914cd25d484059ce40c23c
-- </PALETTE1>

