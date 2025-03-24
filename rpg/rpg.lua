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
end
-- <TILES>
-- 000:0000000000000000000000400000011000000400000004000000040000000000
-- 001:555595555555955555559555aaaaaaaa555555565555555655555556aaaaaaaa
-- 002:5555555559aaaa65599556655695569556955695b595565aa595565eb595565b
-- 003:0820000008200000082000000820000008200000082000000820000008200000
-- 016:0000000000000000000040000400010001110400404004000000040000000000
-- 017:655555596555555965555559aaaaaaaa655555596555555965555559aaaaaaaa
-- 018:a595565eb595504ba5d5586eb5955f7ba6d5565eb995565ba6d5575eb9d5575b
-- 019:08200aa00820aaaa08200140082040010820014008204001082001400aa00aa0
-- 020:495956524a5a9692babaaeaecfeffbf3495956524a5a9692babaaeaecfeffbf3
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
-- 000:0000000000000000000000000000000000000000550000005500000055000000
-- 016:55000000aa000000aa000000aa000000aa000000ff000000ff000000ff000000
-- 032:ff00000000000000000000000000000000000000000000000000000000000000
-- </SPRITES>

-- <MAP>
-- 001:000000000000000000213030303030303031000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 002:000000000000000000213030303030303031007100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 003:000100000100000000213030303040503031006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 004:000000000000000000213030303041513031006110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 006:000001000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 007:110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 008:000000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 009:001101000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 011:000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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

