local S = minetest.get_translator("hades_skins")
local F = minetest.formspec_escape

hades_skins = {}

local editor_color_states = {}
local editor_cloth_states = {}

local get_color = function(r, g, b)
	if not r then
		r = math.random(0,255)
	end
	if not g then
		g = math.random(0,255)
	end
	if not b then
		b = math.random(0,255)
	end
	local cspec = {r=r, g=g, b=b, a=255}
	local cstr = string.format("#%.2X%.2X%.2X", r, g, b)
	return cstr, cspec
end

local styles = {
	hair = {
		{ name = "medium", desc = S("Medium hair") },
		{ name = "long", desc = S("Long hair") },
		{ name = "beard", desc = S("Hair with beard") },
	},
	accessoire_head = {
		{ name = "blank", desc = S("No accessoire") },
		{ name = "ribbon", desc = S("Ribbon") },
		{ name = "headband", desc = S("Headband") },
		{ name = "flowers", desc = S("Head flowers") },
	},
	shirt = {
		{ name = "shirt", desc = S("Shirt") },
		{ name = "t-shirt", desc = S("T-Shirt") },
		{ name = "tanktop", desc = S("Tanktop") },
		{ name = "top", desc = S("Top") },
	},
	belt = {
		{ name = "blank", desc = S("No belt") },
		{ name = "simple", desc = S("Belt") },
	},
	pants = {
		{ name = "long", desc = S("Long pants") },
		{ name = "shorts", desc = S("Shorts") },
		{ name = "hotpants", desc = S("Hotpants") },
	},
	shoes = {
		{ name = "simple", desc = S("Shoes") },
	},
	skin = {
		{ name = "base", desc = S("Skin") },
	},
	eyes = {
		{ name = "pupils", desc = S("Eyes") },
	},
}

-- Sort styles by the rough position on the body (from top to bottom)
local styles_sorted = {
	"skin", "accessoire_head", "hair", "eyes", "shirt", "belt", "pants", "shoes"
}

function hades_skins.get_random_textures_and_colors()
	-- for texture handling
	local color = {} -- colorstring
	local base = {} -- clothing name

	-- for editor states table
	local color_state = {} -- color as number
	local base_id = {} -- clothing ID

	local tex = {}
	for s=1, #styles_sorted do
		local k = styles_sorted[s]
		local cspec
		color[k], cspec = get_color()
		color_state[k] = cspec.r * 0x10000 + cspec.g * 0x100 + cspec.b

		local v = styles[k]
		base_id[k] = math.random(1, #v)
		base[k] = v[base_id[k]].name
	end
	return { colors = color, bases = base, base_ids = base_id, color_states = color_state }
end

function hades_skins.build_texture(base, color)
	local tex = {}
	for k, v in pairs(styles) do
		if base[k] ~= "blank" then
			tex[k] = "^(hades_skins_"..k.."_"..base[k]..".png"
			tex[k] = tex[k] .. "^[multiply:"..color[k]..")"
		else
			tex[k] = ""
		end
	end

	if not color.skin then
		color.skin = get_color()
	end
	if not color.eyes then
		color.eyes = get_color()
	end

	local eyes = "^(hades_skins_eyes_base.png"
		.. "^(hades_skins_eyes_pupils.png^[multiply:"..color.eyes.."))"

	local skin = "((hades_skins_skin_base.png^hades_skins_mouth.png)^[multiply:"..color.skin..")"

	local texture = skin
	.. eyes
	.. tex.pants
	.. tex.shoes
	.. tex.shirt
	.. tex.belt
	.. tex.hair
	.. tex.accessoire_head
	return { textures = { texture }, colors = color }
end

function hades_skins.editor_state_to_textures(player)
	local name = player:get_player_name()
	local bases = {}
	local colors = {}
	for k,v in pairs(editor_cloth_states[name]) do
		bases[k] = styles[k][v].name
	end
	for k,v in pairs(editor_color_states[name]) do
		colors[k] = string.format("#%.6X", v)
	end
	return hades_skins.build_texture(bases, colors)
end

function hades_skins.player_set_textures(player, textures, skin_color)
	hades_player.player_set_textures(player, textures)
	-- Set meshhand
	hades_meshhand.set_skin_color(player, skin_color)
end

function hades_skins.player_set_random_textures(player)
	local texcol = hades_skins.get_random_textures_and_colors()
	local name = player:get_player_name()
	for k,v in pairs(texcol.base_ids) do
		editor_cloth_states[name][k] = v
	end
	for k,v in pairs(texcol.color_states) do
		editor_color_states[name][k] = v
	end
	local out = hades_skins.build_texture(texcol.bases, texcol.colors)
	hades_skins.player_set_textures(player, out.textures, out.colors.skin)
end

function hades_skins.show_skin_editor(player, texture)
	if not texture then
		texture = hades_player.player_get_textures(player)
		if not texture then
			return
		end
		texture = texture[1]
	end
	local formspec = [[
		formspec_version[4]
		size[12,11]
		box[0.4,0.4;4.2,8.2;#FFFFFF4F]
		box[0.5,0.5;4,8;#000000FF]
		model[0.5,0.5;4,8;playerpreview;character.b3d;]]..texture..[[;0,180;false;true;0,79]
		button[5.15,9.75;1,0.8;random;]]..F(S("Random"))..[[]
		button[6.15,9.75;1,0.8;reset;]]..F(S("Reset"))..[[]
		button_exit[9.55,9.75;2,0.8;submit;]]..F(S("Done"))..[[]
	]]
	local name = player:get_player_name()
	local y = 0.5
	for i=1, #styles_sorted do
		local s = styles_sorted[i]
		local id = editor_cloth_states[name][s]
		local choice = styles[s][id].name
		local desc = styles[s][id].desc
		formspec = formspec .. "button[5.15,"..y..";1,0.8;"..s.."_prev;<]"
		formspec = formspec .. "button[6.15,"..y..";3,0.8;"..s..";"..F(desc).."]"
		formspec = formspec .. "button[9.15,"..y..";1,0.8;"..s.."_next;>]"
		formspec = formspec .. "button[10.55,"..y..";1,0.8;"..s.."_color;"..F(S("Color")).."]"
		y = y + 0.9
	end

	minetest.show_formspec(player:get_player_name(), "hades_skins:skin_editor", formspec)
end

minetest.register_on_joinplayer(function(player)
	local name = player:get_player_name()
	editor_color_states[name] = {}
	editor_cloth_states[name] = {}
	for k,_ in pairs(styles) do
		editor_cloth_states[name][k] = 1
		editor_color_states[name][k] = math.random(0, 0xFFFFFF)
	end
end)
minetest.register_on_leaveplayer(function(player)
	local name = player:get_player_name()
	editor_color_states[name] = nil
	editor_cloth_states[name] = nil
end)

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "hades_skins:skin_editor" then
		return
	end
	local name = player:get_player_name()
	local update_skin = function(player)
		local out = hades_skins.editor_state_to_textures(player)
		hades_skins.player_set_textures(player, out.textures, out.colors.skin)
		hades_skins.show_skin_editor(player)
	end
	for stylename,_ in pairs(styles) do
		if fields[stylename] or fields[stylename.."_next"] then
			editor_cloth_states[name][stylename] = editor_cloth_states[name][stylename] + 1
			if editor_cloth_states[name][stylename] > #styles[stylename] then
				editor_cloth_states[name][stylename] = 1
			end
			update_skin(player)
			return
		elseif fields[stylename.."_prev"] then
			editor_cloth_states[name][stylename] = editor_cloth_states[name][stylename] - 1
			if editor_cloth_states[name][stylename] < 1 then
				editor_cloth_states[name][stylename] = #styles[stylename]
			end
			update_skin(player)
			return
		elseif fields[stylename.."_color"] then
			editor_color_states[name][stylename] = math.random(0, 0xFFFFFF)
			update_skin(player)
			return
		end
	end
	if fields.random then
		hades_skins.player_set_random_textures(player)
		hades_skins.show_skin_editor(player)
	end
end)
