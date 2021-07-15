hades_compass = {}

local huds = {}

local ly = 5 -- letter Y offset
local lx = 24 -- letter X offset

local USE_DOTS = true

local dim = function(x)
	return tostring(x-lx)..","..ly
end

-- Returns the image for the "cardinal direction letters", depending
-- on the language of player.
local get_letters = function(player)
	local lang = minetest.get_player_information(player:get_player_name()).lang_code

	if lang == "de" then
		return "hades_compass_dirs_nosw.png"
	else
		return "hades_compass_dirs_nesw.png"
	end
end

local get_image = function(player)
	-- HINT: Append "^hades_compass_dots.png" for more precision
	return "hades_compass_lines.png^" .. get_letters(player)
end

minetest.register_on_joinplayer(function(player)
	local name = player:get_player_name()
	huds[name] = {}
	local bg = player:hud_add({
		hud_elem_type = "image",
		position = { x = 0.5, y = 0 },
		offset = { x = 0, y = 5 },
		size = { x = 125, y = 50 },
		scale = { x = 1, y = 1 },
		alignment = { x = 0, y = 1 },
		text = "", -- initialize hidden
		z_index = 20,
	})
	local compass = player:hud_add({
		hud_elem_type = "compass",
		position = { x = 0.5, y = 0 },
		offset = { x = 0, y = 5 },
		size = { x = 125, y = 50 },
		scale = { x = 1, y = 1 },
		alignment = { x = 0, y = 1 },
		text = "", -- initialize hidden
		dir = 2,
		z_index = 21,
	})
	huds[name].bg = bg
	huds[name].compass = compass
end)

function hades_compass.enable(player)
	local name = player:get_player_name()
	if not huds[name] then
		return false
	end
	player:hud_change(huds[name].bg, "text", "hades_compass_bg.png")
	player:hud_change(huds[name].compass, "text", get_image(player))
end

function hades_compass.disable(player)
	local name = player:get_player_name()
	if not huds[name] then
		return false
	end
	player:hud_change(huds[name].bg, "text", "")
	player:hud_change(huds[name].compass, "text", "")
end

minetest.register_on_leaveplayer(function(player)
	local name = player:get_player_name()
	huds[name] = nil
end)
