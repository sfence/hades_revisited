local S = minetest.get_translator("hades_skins")
local F = minetest.formspec_escape

hades_skins = {}

local editor_color_states = {} -- current skin/clothing colors per-player
local editor_cloth_states = {} -- current clothing IDs per-player

local editor_current_color = {} -- current value of color widgets in color editor
local editor_current_color_cloth = {} -- clothing type ID that the player currently edits the color of

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

-- Returns simple random skin color (dark brown, brown, beige, light beige)
-- TODO: More balancing
local get_skin_color = function()
	local x = math.random(200, 1000)
	local r = math.floor((x/1000) * 255)
	local g = math.floor((x/1000) * 191)
	local b = math.floor((x/1000) * 127)
	local cspec = {r=r, g=g, b=b}
	local cstr = string.format("#%.2X%.2X%.2X", r, g, b)
	return cstr, cspec
end

local styles = {
	hair = {
		{ name = "medium", desc = S("Medium hair") },
		{ name = "long", desc = S("Long hair") },
		{ name = "beard", desc = S("Hair with beard") },
	},
	accessory_head = {
		{ name = "blank", desc = S("No accessory") },
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

-- Also styles by ID for reverse lookup
local style_ids = {}
for k,v in pairs(styles) do
	local style = styles[k]
	style_ids[k] = {}
	for q,r in pairs(style) do
		style_ids[k][r.name] = q
	end
end

-- Sort styles by the rough position on the body (from top to bottom)
local styles_sorted = {
	"skin", "accessory_head", "hair", "eyes", "shirt", "belt", "pants", "shoes"
}

local load_skin = function(player)
	local meta = player:get_meta()
	local bases_meta = meta:get_string("hades_skins_bases")
	local colors_meta = meta:get_string("hades_skins_colors")
	if bases_meta == "" or colors_meta == "" then
		-- If skin could not loaded, select a initial random one
		hades_skins.player_set_random_textures(player, true)
		return
	end
	local bases = string.split(bases_meta, ",")
	local colors = string.split(colors_meta, ",")
	local name = player:get_player_name()
	for b=1, #bases do
		local kv = string.split(bases[b], "=")
		local k = kv[1]
		local v = kv[2]
		if style_ids[k] and style_ids[k][v] then
			editor_cloth_states[name][k] = style_ids[k][v]
		else
			-- Fallback if no corresponding ID found
			editor_cloth_states[name][k] = 1
		end
	end
	for c=1, #colors do
		local kv = string.split(colors[c], "=")
		local k = kv[1]
		local v = kv[2]
		editor_color_states[name][k] = tonumber(string.sub(v, 2), 16)
	end
end

local save_skin = function(player)
	local name = player:get_player_name()
	local cells = {}
	for k,v in pairs(styles) do
		local cloth_state = editor_cloth_states[name][k]
		local cloth_style = v[cloth_state].name
		table.insert(cells, k .. "=" .. cloth_style)
	end
	local outstr = table.concat(cells, ",")
	local meta = player:get_meta()
	meta:set_string("hades_skins_bases", outstr)

	cells = {}
	for k,v in pairs(editor_color_states[name]) do
		table.insert(cells, k .. "=" .. string.format("#%.6X", v))
	end
	outstr = table.concat(cells, ",")
	meta:set_string("hades_skins_colors", outstr)
end

function hades_skins.get_random_textures_and_colors(initial)
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
		if initial and k == "skin" then
			-- Special case for initial skin color
			color[k], cspec = get_skin_color()
		else
			color[k], cspec = get_color()
		end
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
	.. tex.accessory_head
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
	save_skin(player)
	hades_player.player_set_textures(player, textures)
	-- Set meshhand
	hades_meshhand.set_skin_color(player, skin_color)
end

-- Sets random textures for player. If initial==true, then
-- this is for an initial skin with limited skin selection
-- to avoid some of the "crazier" skins to be chosen for new
-- players
function hades_skins.player_set_random_textures(player, initial)
	local texcol = hades_skins.get_random_textures_and_colors(initial)
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
		button[0.5,9.75;3,0.8;random;]]..F(S("Random skin"))..[[]
		button_exit[9.55,9.75;2,0.8;submit;]]..F(S("Close"))..[[]
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

function hades_skins.show_skin_editor_color(player, texture, color)
	local name = player:get_player_name()
	if not texture then
		texture = hades_player.player_get_textures(player)
		if not texture then
			return
		end
		texture = texture[1]
	end
	if not color then
		local cloth = editor_current_color_cloth[name] or "shirt"
		local k = editor_color_states[name][cloth] or 0xFFFFFF
		local r = math.floor(k / 65536)
		local g = math.floor(k / 256) % 256
		local b = k % 256
		editor_current_color[name].r = r
		editor_current_color[name].g = g
		editor_current_color[name].b = b
	else
		editor_current_color[name] = table.copy(color)
	end
	local form = [[
	formspec_version[4]
	size[12,11]
	box[0.4,0.4;4.2,8.2;#FFFFFF4F]
	box[0.5,0.5;4,8;#000000FF]
	model[0.5,0.5;4,8;playerpreview;character.b3d;]]..texture..[[;0,180;false;true;0,79]
	scrollbaroptions[min=0;max=255;smallstep=8;largestep=64]
	scrollbar[5,1.5;5,0.5;horizontal;red;]]..editor_current_color[name].r..[[]
	scrollbar[5,3.5;5,0.5;horizontal;green;]]..editor_current_color[name].g..[[]
	scrollbar[5,5.5;5,0.5;horizontal;blue;]]..editor_current_color[name].b..[[]
	label[5,1.1;]]..F(S("Red"))..[[]
	label[5,3.1;]]..F(S("Green"))..[[]
	label[5,5.1;]]..F(S("Blue"))..[[]
	button[0.5,9.75;3,0.8;random;]]..F(S("Random color"))..[[]
	button[5,7.75;3,0.8;update;]]..F(S("Update preview"))..[[]
	button_exit[9.55,9.75;2,0.8;submit;]]..F(S("Back"))..[[]
]]
	minetest.show_formspec(name, "hades_skins:skin_editor_color", form)
end

minetest.register_on_joinplayer(function(player)
	local name = player:get_player_name()
	-- Initialize skin states
	editor_color_states[name] = {}
	editor_cloth_states[name] = {}
	editor_current_color[name] = { r = 255, g = 255, b = 255 }
	for k,_ in pairs(styles) do
		editor_cloth_states[name][k] = 1
		editor_color_states[name][k] = math.random(0, 0xFFFFFF)
	end
	-- Load skin
	load_skin(player)
	local out = hades_skins.editor_state_to_textures(player)
	hades_skins.player_set_textures(player, out.textures, out.colors.skin)
end)
minetest.register_on_leaveplayer(function(player)
	local name = player:get_player_name()
	save_skin(player)
	editor_color_states[name] = nil
	editor_cloth_states[name] = nil
	editor_current_color[name] = nil
end)

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname == "hades_skins:skin_editor" then
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
				editor_current_color_cloth[name] = stylename
				hades_skins.show_skin_editor_color(player)
				return
			end
		end
		if fields.random then
			hades_skins.player_set_random_textures(player)
			hades_skins.show_skin_editor(player)
		end
	elseif formname == "hades_skins:skin_editor_color" then
		local function update_skin(player)
			local name = player:get_player_name()
			local cloth = editor_current_color_cloth[name] or "shirt"
			editor_color_states[name][cloth] =
				editor_current_color[name].r * 0x10000 +
				editor_current_color[name].g * 0x100 +
				editor_current_color[name].b
			local out = hades_skins.editor_state_to_textures(player)
			hades_skins.player_set_textures(player, out.textures, out.colors.skin)
		end

		local name = player:get_player_name()
		local f = { "red", "green", "blue" }
		local fmap = { "r", "g", "b" }
		for i=1, #f do
			local fname = f[i]
			if fields[fname] then
				local evnt = minetest.explode_scrollbar_event(fields[fname])
				if evnt.type == "CHG" then
					editor_current_color[name][fmap[i]] = evnt.value
				end
			end
		end
		if fields.update then
			update_skin(player)
			hades_skins.show_skin_editor_color(player, nil, editor_current_color[name])
			return
		end
		if fields.random then
			local color = {}
			color.r = math.random(0,255)
			color.g = math.random(0,255)
			color.b = math.random(0,255)
			editor_current_color[name] = table.copy(color)
			update_skin(player)
			hades_skins.show_skin_editor_color(player, nil, color)
			return
		end
		if fields.submit then
			update_skin(player)
			hades_skins.show_skin_editor(player)
			return
		end
	end
end)
