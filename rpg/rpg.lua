-- title:   game title
-- author:  lettucepie
-- desc:    Monster Collector RPG
-- site:    website link
-- license: MIT License (change this to your license of choice)
-- version: 0.1
-- script:  lua

--
-- Classes
--
Char = {}
metaChar = {}
metaChar.__index = Char

function Char.new(t)
	local i = setmetatable({}, metaChar)
	i.n = t[1] -- Name
	i.fs = t[2] -- Animation FrameSheet
	i.wx = t[3] -- world_X
	i.wy = t[4] -- world Y
	i.a = i.fs.walk_d -- Current Anim
	i.fi = 1 -- Current Frame Index
	i.ft = 0 -- Current Frame Tick
	i.p = true -- Paused
	i.act = false -- Acting / performing action
	return i
end

Movement = {}
metaMovement = {}
metaMovement.__index = Movement

function Movement.new(t)
	local i = setmetatable({}, metaMovement)
	i.c = t[1] -- Character
	i.s = t[2] -- speed increment
	i.d = t[3] -- direction
	i.fx = t[4] -- final worldx
	i.fy = t[5] -- final worldy
	i.act_type = "movement"
	return i
end
--
-- Global Variables
--
t=0
inputs={
	up = {
		held = false,
		time = 0
	},
	down = {
		held = false,
		time = 0
	},
	left = {
		held = false,
		time = 0
	},
	right = {
		held = false,
		time = 0
	}
}
game_state = "world"
player={}
characters={}
origin_x=0
origin_y=0
actions={}
--
-- Game Data
--
anim_glossary = {
	player = {
		walk_d = {512,514,512,516},
		walk_u = {518,520,518,522},
		walk_l = {580,582},
		walk_r = {576,578}
	},
	sarah = {
		walk_d = {2,4,6,8}
	}
}
--
-- Helpers
--
function set4bpp() poke4(2 * 0x3ffc, 2) end

function set2bpp() poke4(2 * 0x3ffc, 4) end

function tableContains(t, v)
	found = false
	for _, x in pairs(t) do
		if x == v then
			found = true
		end
	end
	return found
end

function tableLength(t)
	local count = 0
	for _ in pairs(t) do count = count + 1 end
	return count
end

function round(num, dec)
	local mult = 10^(dec or 0)
	return math.floor(num * mult + 0.5) / mult
end
--
-- Game
--
function make_character(name, x, y)
	trace("MAKING CHAR: " .. name .. " AT X:" .. x .. " Y:" .. y)
	if anim_glossary[name] ~= nil then
		trace("FOUND")
		return Char.new({name,anim_glossary[name],x,y})
	else
		trace("NOT FOUND")
		return false
	end
end

function stop_character(char)
	char.p = true
	char.fi = 1
end

function make_movement(char, dir)
	if char.act == false then
		trace("MAKING CHAR_MOVEMENT: ".. char.n .. " DIR: " .. dir)
		fx = char.wx
		fy = char.wy
		if dir == "up" then fy=fy-2 end
		if dir == "down" then fy=fy+2 end
		if dir == "left" then fx=fx-2 end
		if dir == "right" then fx=fx+2 end
		--fx = fx + 0.0
		--fy = fy + 0.0
		trace("movementgoal: " .. tostring(fx).. "," .. tostring(fy))
		char.act = true
		return Movement.new({char, 0.2, dir, fx, fy})
	else return false end
end

function BOOT()
	trace("BOOT")
	set2bpp()
	trace("MAKEPLAYER")
	player = make_character("player", 14, 8)
	table.insert(characters, make_character("sarah", 16, 8))
	trace("HOW MANY CHARACTERS?")
	trace(tableLength(characters))
	trace("WHO IS CHARACTER NUM:1 ?")
	trace(characters[1].n)
	trace("MAKE test")
	make_character("test", 10, 10)

end

function proc_Input()
	if btnp(0) then
		inputs.up.held = true
		inputs.up.time = 0
	end
	if btn(0) then inputs.up.time = inputs.up.time + 1 else inputs.up.held = false end
	if btnp(1) then
		inputs.down.held = true
		inputs.down.time = 0
	end
	if btn(1) then inputs.down.time = inputs.down.time + 1 else inputs.down.held = false end
	if btnp(2) then
		inputs.left.held = true
		inputs.left.time = 0
	end
	if btn(2) then inputs.left.time = inputs.left.time + 1 else inputs.left.held = false end
	if btnp(3) then
		inputs.right.held = true
		inputs.right.time = 0
	end
	if btn(3) then inputs.right.time = inputs.right.time + 1 else inputs.right.held = false end
end

function query_WorldMovement(input_dir, anim, dir)
	if input_dir.held then
		if input_dir.time < 2 then
			player.a = anim
			player.ft = 0
			stop_character(player)
		else player.p = false end
		if input_dir.time > 5 then
			local new_movement = make_movement(player, dir)
			if new_movement ~= false then table.insert(actions, new_movement) end
		end
	elseif input_dir.time >= 2 then
		stop_character(player)
		input_dir.time = 0
	end
end

function build_Acts()
	if game_state == "world" then
		query_WorldMovement(inputs.up, player.fs.walk_u, "up")
		query_WorldMovement(inputs.down, player.fs.walk_d, "down")
		query_WorldMovement(inputs.left, player.fs.walk_l, "left")
		query_WorldMovement(inputs.right, player.fs.walk_r, "right")
	end
end

function proc_Acts()
	for k,v in pairs(actions) do
		finished = false
		if v.act_type == "movement" then
			trace("ACTION IS MOVEMENT")
			if round(v.c.wx,1) == round(v.fx,1) and round(v.c.wy,1) == round(v.fy,1) then
				trace("**MOVEMENT IS FINISHED")
				finished = true
				v.c.act = false
			end
			if finished == false then
				trace("MOVEMENT MATH")
				if v.d == "up" then v.c.wy=v.c.wy-v.s end
				if v.d == "down" then v.c.wy=v.c.wy+v.s end
				if v.d == "left" then v.c.wx=v.c.wx-v.s end
				if v.d == "right" then v.c.wx=v.c.wx+v.s end
				--v.c.wx = round(v.c.wx, 1)
				--v.c.wy = round(v.c.wy, 1)
			end
			trace("X: " .. tostring(v.c.wx) .. " Y: " .. tostring(v.c.wy))
		end
		if finished then
			v = nil
			table.remove(actions, k)
		end
	end
end

function proc_Map()
	origin_x = round(player.wx, 0) - 14
	origin_y = round(player.wy, 0) - 8

	map(origin_x, origin_y, 31, 18)
end

function proc_Anims()
	if player.p == false then
		if player.ft > 12 then
			player.ft = 0
			player.fi = player.fi + 1
			if player.fi > tableLength(player.a) then player.fi = 1 end
		end
		player.ft = player.ft + 1
	end
	for k,v in pairs(characters) do
		if v.p == false then
			if v.ft > 12 then
				v.ft = 0
				v.fi = v.fi + 1
				if v.fi > tableLength(v.a) then v.fi = 1 end
			end
			v.ft = v.ft + 1
		end
	end
end

function proc_Spr()
	spr(player.a[player.fi],112,64,0,1,0,0,2,2)
	for k,v in pairs(characters) do
		spr(v.a[v.fi],(v.wx-origin_x)*8,(v.wy-origin_y)*8,0,1,0,0,2,2)
	end
end

function TIC()
	cls()
	proc_Input()
	build_Acts()
	proc_Acts()
	proc_Map()
	proc_Anims()
	proc_Spr()
	if t > 12 then t = 0 end
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
-- 055:a820000af3000006d70004dfa61004a66a0000aaa80005aaaa0009a5a5200aa9
-- 064:0444444400111111044444440011111100444444000000000000000000000000
-- 065:4400aa6d1110aaea4400aa641110aaaa4400aaaa0000aaaa0000aaaa0000aaaa
-- 066:69aaaaaaf8aaaaaa49aaaaaaaaaaaaaaaaaaaaaaaaaadbaaaaaa79aaaaaad8aa
-- 067:aaaa9595aa4a9fb5a25a5595a549669f6559995565596666a55b9999eeea6666
-- 068:9595955995959fb595959595b595959f959595959fb5959555959595669f9595
-- 069:999906a966664aaa599908a2b56600f09559000b9fb5000c95950000959f0000
-- 070:aaa6a6a02a95aa51aa5aaaa006daeba1069236602f9daa91ff95a150cff00000
-- 071:a9600aaaaaa47a9aa5dfd7caa6a6a69aafaa6abae5aaabf2d9a5aab6eaa9a5aa
-- 080:377777775dddddddceeeeeee5baaaaaacaaaaaaa5b22aa22caa8aaa85baaaaaa
-- 081:777faaaaddd5aaaaee63aaaaaae5aaaaaa63aaaaaae5aaecaa63aa65aae5aa2b
-- 082:aaaa3777aaaa5dddaaaaceeeaaaa5baaaaaacaaadb225baa79a8caaad8aa5baa
-- 083:77770000dddd0000eeee0000aaaa0000aaaa0000aaaa0000aaaa0000aaaa0000
-- 086:0fb000000ef000000fb000000ef000000fb000000ef000000ff20000efef0000
-- 087:a96ffaaaaaa77a9aa5dfd7caa6a6a69aafaa6abae5aaabf2d9a5aab6eaa9a5aa
-- 096:caaaaaaa5baaaaaacaaaaaaa5baaaaaacaaaaaaa5b22aa22caa8aaa85baaaaaa
-- 097:aa63aa6daae5aaeaaa63aa64aae5aaaaaa63aaaaaae5aa22aa63aaa8aae5aaaa
-- 098:69aacaaaf8aa5baa49aacaaaaaaa5baaaaaacaaaaa225baaaaa8caaaaaaa5baa
-- 099:aaaa0000aaaa0000aaaa0000aaaa0000aaaa0000aaaa0000aaaa0000aaaa0000
-- 103:faaaa96b5a9aaaafdaeaa9adaaaaaeae6a9aaa6aabd2aaaabaa696aedabaaafa
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
-- 003:030000c00f8aa2f00caaaa3008aaaa2009aaaa6004aaaa200056a9e0005565f3
-- 004:00000000030000c00f8aa2f00caaaa3008aaaa2009aaaa6004aaaae00056a9e3
-- 005:00000000030000c00f8aa2f00caaaa3008aaaa2009aaaa6004aaaa200056a9e0
-- 006:0000c300008aa300008aeb0000aad72008aa512008a65d000baa5500cfa65500
-- 008:0000500000005100000451000005510000055100000541000045450000510500
-- 009:0000000000000000000000000041000000455100004555000045450000414500
-- 010:0000000000000000045551000455510005104100050000000500000005000000
-- 016:ce5555a00ebaaeb00deffb600faaaaf0c5baae530f9aa6f00d9696500cc3c300
-- 017:ce5555000e5555a00ebaae700feffb60c5baaaf00f9aaa530d9a65f00dd7d750
-- 018:03555500cf5555a0cebaaeb00deffbf00faaae53c5aaa6f00f59a6500dd7d750
-- 019:0aaaaaa30aaefaa0059ffb70059e7950c55baf53055555500555555000c3c330
-- 020:005565330aaaaaa00aaefaa0059ffb700f9e7953c57baf500f559a500455eb50
-- 021:005565f30aaaaaa30aafbaa005effa70c5afdaf005daef5305a655f005eb5510
-- 022:cea555a00ebaaeb00deffb600faaaaf0c5baae530f9aa6f00d9696500cc3c300
-- 024:0055050004550500041005000410050005100500050005000000000000000000
-- 025:0041450000414510004105100041041000414510004555100005510000000000
-- 026:0500000005000000051000000550050004555500004555000000000000000000
-- 032:000c30000000f000008ae200008afa0000aaf52008aa542008a6570008aa5500
-- 033:00000000000c30000000f000008ae200008afa0000aaf52008aa542008a65700
-- 034:000c3000000f0000008ba20000afa200085faa000015aa2000d59a200055aa20
-- 035:00000000000c3000000f0000008ba20000afa200085faa000015aa2000d59a20
-- 048:00a6553000a55df0085faec0085aa500005aa500049aae00040efe00050fff00
-- 049:08aa553000a65df000a55dc0085fa500085aa500005aae0004dbaf3045c30f00
-- 050:00559a000c755a000c8af5200095a5200095a500008aa610008fb01000cff050
-- 051:0055aa2000559a0000455a000cbaf5200c85a5200085a5000cfae71000f0c351
-- </SPRITES>

-- <MAP>
-- 000:000000000000000000000000000000000000000000e1e4f4e4f4e4f4e4f4e4f4e4f4e5f5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 001:000000000000000000817070707070707091000000f3e6f6e6f6e6f6e6f6e6f6e6f6e6f6000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 002:000000000000000000213030303030303031000000e1e5f5e5f5e5f5e5f5e5f5e5f5e5f5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 003:000100000100000000213030303030303031007100f3e6f6e6f6e6f6e6f6e6f6e6f6e6f6000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 004:000000000000000000213030303040503031006010e1e5f5e5f5e5f5e5f5e5f5e5f5e5f5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 005:000000000000000000213030303041513031006100f3e6f6e6f6e6f6e6f6e6f6e6f6e6f6000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 006:000001000000000001000000000002220000000000e1e5f5e5f5e5f5e5f5e5f5e5f5e5f5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 007:110000000000000000000000000003230000000000e2e6f6e6f6e6f6e6f6e6f6e6f6e6f6000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 008:00000000000110000000000000000323000000000000e2f2e2f2e2f2e2f2e2f2e2f2e2f2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 009:001101000000000000000212121243331200100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 010:0000000000000000000003133214141414000000c0d00000556515652500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 011:000000b2c2d20000000003132300100000a10000c1d15565441666162600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 012:000000b3c3d30000000003132300000000b00000e2f20717171717172700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 013:000000b4c4d40000000000000000000000b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 014:000000b5c5d50000000000000000000000b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 015:0000000000000000000000000000000000b1008090909090a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 134:000000000000000000000000000000000000000000e00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 135:000000000000000000000000000000000000000000e00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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

