-- title:   game title
-- author:  lettucepie
-- desc:    Monster Collector RPG
-- site:    website link
-- license: MIT License (change this to your license of choice)
-- version: 0.1
-- script:  lua

Anim = {}
metaAnim = {}
metaAnim.__index = Anim

function Anim.new(t)
	local i = setmetatable({}, metaAnim)
	i.n=t[1]
	i.f=t[2]
	i.w=t[3]
	i.h=t[4]
	i.b=t[5]
	i.p=t[6]
	i.i=t[7]
	return i
end

function Anim:displayName()
	trace("DISPLAYNAME")
	trace(self)
	return self.n
end

t=0
walk_forward = {}
walk_forward_idx = 1

function set4bpp()
	poke4(2 * 0x3ffc, 2)
end

function set2bpp()
	poke4(2 * 0x3ffc, 4)
end

function BOOT()
	trace("BOOT")
	set2bpp()
	walk_forward = Anim.new{"walk_f",0,2,2,0,2,{512,514,512,516}}
 trace(walk_forward)
 trace(walk_forward.n)
 trace(walk_forward.displayName())
end

function TIC()
	cls()
	map(0,0,30,16,0,0)
	if t > 12 then
	walk_forward_idx = walk_forward_idx + 1
		if walk_forward_idx > 4 then walk_forward_idx = 1 end
	end
--	spr(walk_forward.ids[walk_forward_idx],20,20,-1,1,0,0,walk_forward.w,walk_forward.y)
	t = t + 1
end
-- <TILES>
-- 000:0000000000000000000000400000011000000400000004000000040000000000
-- 001:555595555555955555559555aaaaaaaa555555565555555655555556aaaaaaaa
-- 002:5555555559aaaa65599556655695569556955695b595565aa595565eb595565b
-- 003:082097970820666608209b9b0820eeee08207979082066660820b9b90820eeee
-- 004:cffffffff0300c0030300c0030300c0030300c0030300c0030300c00f0f00c30
-- 005:fff30c000c0f0c000c0c0c000c0c0c300c0c0c300c0c0c000c0c0c000c3c0c00
-- 006:0000000000000000000010000000400005004040001401100082050000800100
-- 007:00000000000400000410140004a6a61000aa6a0005aaa80009a5aa000aa9a520
-- 016:0000000000000000000040000400010001110400404004000000040000000000
-- 017:655555596555555965555559aaaaaaaa655555596555555965555559aaaaaaaa
-- 018:a595565eb595504ba5d5586eb5955f7ba6d5565eb995565ba6d5575eb9d5575b
-- 019:08200aa00820aaaa08200140082040010820014008204001082001400aa00aa0
-- 020:0497e520046699100b9be6e00ceebb3049795e5246669991b9b96e6eceeebbb3
-- 021:00000c0000000c0000000c000c300c300c300c300c0000000c0000000c000000
-- 022:00060200400882000920a04100a0a4200486aa00000aa2000009b0410009b080
-- 023:0aaaa9605a9aaaa01aeaa9a1aaaaaeae6a9aaa6aabd2aaaa8aa696a21abaaafa
-- 032:0000000000000000000000000011111104444444001111110444444400111111
-- 033:0000444400001111000044441100111144004444111011104400440011101110
-- 034:444475551111baaa4444755511117555444475550011baaa0444755500117555
-- 035:5555555daaaaaaae5555555d5555555d5555555daaaaaaae5555555d5555555d
-- 037:0000000000000000000000000000000000000000000000450000005a000004aa
-- 038:0081000004960000499a1000a9a86100aaaaa4105a6a99506aa69550aeaaaa20
-- 039:000aa820000ef300000ee000000ab000000da0000009b000008eb000008fe200
-- 048:0444444400111111044444440011111104444444001111110444444400111111
-- 049:4400440011101110440044001110111144004444111011114400444411101111
-- 050:0444565600115656044456561111565644445656111156564444565611115656
-- 051:6666655699995ef666655656995ef656655656565ef6565656565656f6565656
-- 052:5656565656565ef656565655565ef699565655665ef6999956556666f6999999
-- 053:9595089a9595009a95950045959508aa95950a6a95958a9a95954aae959586aa
-- 054:a9baaa20623a6990a9655692696aaaa2aaaaa2a1696eaa80a95baaa1b5aaaaa2
-- 055:000000000000100000140410049a9a1000a9aa00002aaa5000aa5a60085a6aa0
-- 064:0444444400111111044444440011111100444444000000000000000000000000
-- 065:4400aa6d1110aaea4400aa641110aaaa4400aaaa0000aaaa0000aaaa0000aaaa
-- 066:69aaaaaaf8aaaaaa49aaaaaaaaaaaaaaaaaaaaaaaaaadbaaaaaa79aaaaaad8aa
-- 067:aaaa9595aa4a9fb5a25a5595a549669f6559995565596666a55b9999eeea6666
-- 068:9595955995959fb595959595b595959f959595959fb5959555959595669f9595
-- 069:999906a966664aaa599908a2b56600f09559000b9fb5000c95950000959f0000
-- 070:aaa6a6a02a95aa51aa5aaaa006daeba1069236602f9daa91ff95a150cff00000
-- 071:096aaaa00af6bfa5465f96a4b6a6a69aafaa6ab9a5aaabfa89a5aaa2aaa9a5b4
-- 080:377777775dddddddceeeeeee5baaaaaacaaaaaaa5b22aa22caa8aaa85baaaaaa
-- 081:777faaaaddd5aaaaee63aaaaaae5aaaaaa63aaaaaae5aaecaa63aa65aae5aa2b
-- 082:aaaa3777aaaa5dddaaaaceeeaaaa5baaaaaacaaadb225baa79a8caaad8aa5baa
-- 083:77770000dddd0000eeee0000aaaa0000aaaa0000aaaa0000aaaa0000aaaa0000
-- 086:0fb000000ef000000fb000000ef000000fb000000ef000000ff20000efef0000
-- 096:caaaaaaa5baaaaaacaaaaaaa5baaaaaacaaaaaaa5b22aa22caa8aaa85baaaaaa
-- 097:aa63aa6daae5aaeaaa63aa64aae5aaaaaa63aaaaaae5aa22aa63aaa8aae5aaaa
-- 098:69aacaaaf8aa5baa49aacaaaaaaa5baaaaaacaaaaa225baaaaa8caaaaaaa5baa
-- 099:aaaa0000aaaa0000aaaa0000aaaa0000aaaa0000aaaa0000aaaa0000aaaa0000
-- 112:caaaaaaa5baaaaaacaaaaaaa5baaaaaacaaaaaaa5b999999becccccc11111111
-- 113:aa630000aae50000aa630000aae50000aa63000099950000ccc3000011150000
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
-- 000:030000c00f8aa2f00cbaae300cfaaf30096a5a60086619100b57d500cf555500
-- 001:00000000030000c00f8aa2f00cbaae300cfaaf30096a5a60cb661910cf57d500
-- 002:00000000030000c00f8aa2f00cbaae300cfaaf30096a5a60086619100857d500
-- 008:0000500000005100000451000005510000055100000541000045450000510500
-- 009:0000000000000000000000000041000000455100004555000045450000414500
-- 010:0000000000000000045551000455510005104100050000000500000005000000
-- 016:ce5555a00ebaaeb00ceffb200faaaaf0c5baae530f8aa2f00c8282000cc3c300
-- 017:ce5555000e5555a00ebaaeb00feffb20c5baaaf00f8aaa530c8a61f00cc3c300
-- 018:03555500cf5555a0cebaaeb00ceffbf00faaae53c5aaa2f00f49a2000cc3c300
-- 024:0055050004550500041005000410050005100500050005000000000000000000
-- 025:0041450000414510004105100041041000414510004555100005510000000000
-- 026:0500000005000000051000000550050004555500004555000000000000000000
-- </SPRITES>

-- <MAP>
-- 000:0000000000000000000000000000000000000000000000e0f0e3f3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 001:0000000000000000008170707070707070910000000000e1f1e4f4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 002:0000000000000000002130303030303030310000000000e2f2e4f4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 003:0001000001000000002130303030303030310071000000e0f0e4f4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 004:0000000000000000002130303030405030310060100000e1f1e4f4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 005:0000000000000000002130303030415130310061000000e2f2e4f4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 006:0000010000000000010000000000022200000000000000e0f0e4f4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 007:1100000000000000000000000000032300000000000000e1f1e1f1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 008:0000000000011000000000000000032300000000000000e2f2e2f2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 009:001101000000000000000212121243331200100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 010:0000000000000000000003133214141414000000c0d00000556515652500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 011:000000b2c2d20000000003132300100000a10000c1d15565441666162600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 012:000000b3c3d30000000003132300000000b00000e2f20717171717172700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 013:000000b4c4d40000000000000000000000b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 014:000000b5c5d50000000000000000000000b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 015:0000000000000000000000000000000000b1008090909090a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
-- 001:000000303030919191f2f2f2000000000000000000000000000000000000000000000000000000000000000000000000
-- </PALETTE>

-- <PALETTE1>
-- 000:440000007900000089a19d009d009900a1a1f6f2ee3c3c38555555956d95d29d616191c2e6914cd25d484059ce40c23c
-- </PALETTE1>

