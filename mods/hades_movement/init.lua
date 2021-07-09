local HIDE_JUMP_HUD_AFTER = 5 -- seconds after which to hide jump HUD
local JUMP_FACTOR_HIGH = 1
local JUMP_FACTOR_MED = 0.85
local JUMP_FACTOR_LOW = 0.65

local ctrls = {} -- cache player controls
local jump_modes = {} -- current jump modes of each player
	-- mode 0: high jump
	-- mode 1: med jump
	-- mode 2: low jump
local jump_huds = {} -- current HUD IDs of each player
local remove_time = {} -- countdown timer to hide the jump HUD icon again

minetest.register_globalstep(function(dtime)
	for _, player in pairs(minetest.get_connected_players()) do
		local name = player:get_player_name()
		local ctrl = player:get_player_control()
		if not ctrls[name] then
			ctrls[name] = {}
		end
		if not jump_modes[name] then
			jump_modes[name] = 0
		end
		-- Aux1 key: Cycle jump mode (high, medium, low jump strength)
		if ctrl.aux1 == true then
			if not ctrls[name].aux1 then
				local mode = jump_modes[name]
				mode = (mode - 1) % 3
				jump_modes[name] = mode
				local jump_height = JUMP_FACTOR_HIGH
				local img = "hades_movement_jump_high.png"
				if (mode == 1) then
					jump_height = JUMP_FACTOR_MED
					img = "hades_movement_jump_med.png"
				elseif (mode == 2) then
					jump_height = JUMP_FACTOR_LOW
					img = "hades_movement_jump_low.png"
				end
				playerphysics.add_physics_factor(player, "jump", "jump_mode", jump_height)
				if jump_huds[name] then
					player:hud_change(jump_huds[name], "text", img)
				end
				minetest.sound_play({name="hades_movement_change_jump_mode", gain=0.4}, {pitch=1-mode*0.1}, true)
				remove_time[name] = HIDE_JUMP_HUD_AFTER
			end
			ctrls[name].aux1 = true
		else
			if remove_time[name] and remove_time[name] > 0 then
				remove_time[name] = remove_time[name] - dtime
				if remove_time[name] <= 0 then
					player:hud_change(jump_huds[name], "text", "blank.png")
					remove_time[name] = nil
				end
			end
			ctrls[name].aux1 = false
		end
	end
end)

minetest.register_on_joinplayer(function(player)
	local name = player:get_player_name()
	ctrls[name] = {}
	jump_modes[name] = 0
	-- Show icon that displays the current jump mode
	jump_huds[name] = player:hud_add({
		hud_elem_type = "image",
		position = { x=1, y=1 },
		alignment = { x=-1, y=-1 },
		size = { x=100, y=100 },
		scale = { x=3, y=3},
		offset = { x=-4, y=-4},
		text = "blank.png",
		z_index = 0,
	})
	remove_time[name] = HIDE_JUMP_HUD_AFTER
end)

minetest.register_on_leaveplayer(function(player)
	local name = player:get_player_name()
	ctrls[name] = nil
	jump_modes[name] = nil
	jump_huds[name] = nil
	remove_time[name] = nil
end)
