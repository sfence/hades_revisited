local S = minetest.get_translator("hades_bounds")

local players_out_of_bounds = {}
local players_out_of_bounds_blinding = {}

local has_death_messages_mod = minetest.get_modpath("hades_death_messages") ~= nil

-- Minetest world boundaries, as of 5.4.1
local END_MAX = 30927
local END_MIN = -30912

-- Where the player starts to take damage
local BOUNDARY_DIFF = 500.5
-- Where the textual out-of-bounds warning appears
local BOUNDARY_WARNING_DIFF = BOUNDARY_DIFF + 50
-- Where the out-of-bounds "green radiation warning screen" appears
local BOUNDARY_WARNING_DIFF_2 = BOUNDARY_DIFF + 20
-- At which time interval (in seconds) the player takes radiation damage
local BOUNDARY_TIME_CHECK = 1
-- Every how many blocks the radiation damage increases
local BOUNDARY_DAMAGE_INCREASE = 50
-- Maximum boundary damage to deal
local BOUNDARY_MAX_DAMAGE = 4

local timer = 0

local function out_of_bounds(pos, diff)
	local boundary_min = END_MIN + diff
	local boundary_max = END_MAX - diff
	return pos.x > boundary_max or pos.x < boundary_min or pos.z > boundary_max or pos.z < boundary_min or pos.y > boundary_max
end
local function out_of_bounds_farthest(pos, diff)
	local boundary_min = END_MIN + diff
	local boundary_max = END_MAX - diff
	local dists = {
		pos.x - boundary_max,
		pos.x - boundary_min,
		pos.z - boundary_max,
		pos.z - boundary_min,
		pos.y - boundary_max,
	}
	local far = -1
	for d=1, #dists do
		if math.abs(dists[d]) > far then
			far = dists[d]
		end
	end
	return far
end

minetest.register_globalstep(function(dtime)
	timer = timer + dtime
	if timer < BOUNDARY_TIME_CHECK then
		return
	end
	timer = 0
	local players = minetest.get_connected_players()
	for p=1, #players do
		local player = players[p]
		local name = player:get_player_name()
		local pos = player:get_pos()
		if out_of_bounds(pos, BOUNDARY_WARNING_DIFF) then
			local oob = out_of_bounds(pos, BOUNDARY_DIFF)
			local text, img
			if oob then
				text = S("WARNING: Critically high radiation!")
				img = "hades_bounds_screen_radiation_full.png"
			else
				text = S("WARNING: High radiation!")
				if out_of_bounds(pos, BOUNDARY_WARNING_DIFF_2) then
					img = "hades_bounds_screen_radiation_warn.png"
				end
			end
			if not players_out_of_bounds[name] then
				local hudid = player:hud_add({
					hud_elem_type = "text",
					text = text,
					position = { x = 0.5, y = 0.2 },
					number = 0xFFFF00,
					z_index = 100,
					scale = { x = 100, y = 100 },
					size = { x = 2, y = 2 },
				})
				players_out_of_bounds[name] = hudid
			else
				player:hud_change(players_out_of_bounds[name], "text", text)
			end
			if img and not players_out_of_bounds_blinding[name] then
				local hudid = player:hud_add({
					hud_elem_type = "image",
					text = img,
					position = { x = 0.5, y = 0.5 },
					number = 0xFFFF00,
					z_index = -400,
					scale = { x = -100, y = -100 },
				})
				players_out_of_bounds_blinding[name] = hudid
			elseif img then
				player:hud_change(players_out_of_bounds_blinding[name], "text", img)
			end
			local hp = player:get_hp()
			if oob and hp > 0 then
				local how_deep_in = out_of_bounds_farthest(pos, BOUNDARY_DIFF)
				local dmg = math.min(BOUNDARY_MAX_DAMAGE, math.max(1, math.floor(how_deep_in / BOUNDARY_DAMAGE_INCREASE)))
				if has_death_messages_mod then
					hades_death_messages.player_damage(player, S("Radiation poisoning"))
				end
				player:set_hp(hp - dmg)
			end
		else
			if players_out_of_bounds[name] then
				player:hud_remove(players_out_of_bounds[name])
				players_out_of_bounds[name] = nil
			end
		end
		if not out_of_bounds(pos, BOUNDARY_WARNING_DIFF_2) then
			if players_out_of_bounds_blinding[name] then
				player:hud_remove(players_out_of_bounds_blinding[name])
				players_out_of_bounds_blinding[name] = nil
			end
		end
	end
end)

minetest.register_on_leaveplayer(function(player)
	local name = player:get_player_name()
	players_out_of_bounds[name] = nil
	players_out_of_bounds_blinding[name] = nil
end)
