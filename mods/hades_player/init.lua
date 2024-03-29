-- See README.txt for licensing and other information.

-- Player animation blending
-- Note: This is currently broken due to a bug in Irrlicht, leave at 0
local animation_blend = 0

hades_player = {}

hades_player.registered_player_models = { }

-- Local for speed.
local models = hades_player.registered_player_models

function hades_player.player_register_model(name, def)
	models[name] = def
end

-- Default player appearance
hades_player.player_register_model("character.b3d", {
	animation_speed = 30,
	textures = {"character.png", },
	animations = {
		-- Standard animations.
		stand     = { x=  0, y= 79, },
		lay       = { x=162, y=166, },
		walk      = { x=168, y=187, },
		mine      = { x=189, y=198, },
		walk_mine = { x=200, y=219, },
		-- Extra animations (not currently used by the game).
		sit       = { x= 81, y=160, },
	},
})

-- Player stats and animations
local player_model = {}
local player_textures = {}
local player_anim = {}
local player_sneak = {}
hades_player.player_attached = {}

function hades_player.player_get_animation(player)
	local name = player:get_player_name()
	return {
		model = player_model[name],
		textures = player_textures[name],
		animation = player_anim[name],
	}
end

-- Called when a player's appearance needs to be updated
function hades_player.player_set_model(player, model_name)
	local name = player:get_player_name()
	local model = models[model_name]
	if model then
		if player_model[name] == model_name then
			return
		end
		player:set_properties({
			mesh = model_name,
			textures = player_textures[name] or model.textures,
			visual = "mesh",
			visual_size = model.visual_size or {x=1, y=1},
			damage_texture_modifier = "^[colorize:#FF000080",
		})
		hades_player.player_set_animation(player, "stand")
	else
		player:set_properties({
			textures = { "player.png", "player_back.png", },
			visual = "upright_sprite",
		})
	end
	player_model[name] = model_name
end

function hades_player.player_set_textures(player, textures)
	local name = player:get_player_name()
	player_textures[name] = textures
	player:set_properties({textures = textures,})
end

function hades_player.player_get_textures(player)
	local name = player:get_player_name()
	local props = player:get_properties()
	return props.textures
end

function hades_player.player_set_animation(player, anim_name, speed)
	local name = player:get_player_name()
	if player_anim[name] == anim_name then
		return
	end
	local model = player_model[name] and models[player_model[name]]
	if not (model and model.animations[anim_name]) then
		return
	end
	local anim = model.animations[anim_name]
	player_anim[name] = anim_name
	player:set_animation(anim, speed or model.animation_speed, animation_blend)
end

-- Update appearance when the player joins
minetest.register_on_joinplayer(function(player)
	hades_player.player_attached[player:get_player_name()] = false
	hades_player.player_set_model(player, "character.b3d")
	player:set_local_animation({x=0, y=79}, {x=168, y=187}, {x=189, y=198}, {x=200, y=219}, 30)
	
	-- set GUI
	-- Note: Crafting inventory is set in sfinv
	player:hud_set_hotbar_itemcount(10)
	player:get_inventory():set_size("main", 4*10)
	player:hud_set_hotbar_image("hades_gui_hotbar.png")
	player:hud_set_hotbar_selected_image("hades_gui_hotbar_selected.png")
	player:set_formspec_prepend(
[=[listcolors[#000000;#C68D3C;#ffffff;#C68D3C;#000000]
style_type[*;sound=hades_player_gui_button]]
style_type[tabheader;sound=hades_player_gui_tab]]
style_type[dropdown;sound=hades_player_gui_tab]]=])
end)

minetest.register_on_leaveplayer(function(player)
	local name = player:get_player_name()
	player_model[name] = nil
	player_anim[name] = nil
	player_textures[name] = nil
end)

-- Localize for better performance.
local player_set_animation = hades_player.player_set_animation
local player_attached = hades_player.player_attached

-- Check each player and apply animations
minetest.register_globalstep(function(dtime)
	for _, player in pairs(minetest.get_connected_players()) do
		local name = player:get_player_name()
		local model_name = player_model[name]
		local model = model_name and models[model_name]
		
		if model and not player_attached[name] then
			local controls = player:get_player_control()
			local walking = false
			local animation_speed_mod = model.animation_speed or 30

			-- Determine if the player is walking
			if controls.up or controls.down or controls.left or controls.right then
				walking = true
			end

			-- Determine if the player is sneaking, and reduce animation speed if so
			if controls.sneak then
				animation_speed_mod = animation_speed_mod / 2
			end

			-- Apply animations based on what the player is doing
			if player:get_hp() == 0 then
				player_set_animation(player, "lay")
			elseif walking then
				if player_sneak[name] ~= controls.sneak then
					player_anim[name] = nil
					player_sneak[name] = controls.sneak
				end
				if controls.LMB then
					player_set_animation(player, "walk_mine", animation_speed_mod)
				else
					player_set_animation(player, "walk", animation_speed_mod)
				end
			elseif controls.LMB then
				player_set_animation(player, "mine")
			else
				player_set_animation(player, "stand", animation_speed_mod)
			end
		end
	end
end)

minetest.register_on_dieplayer(function(player)
	local name = player:get_player_name()
	minetest.sound_play({name="hades_player_death"}, {to_player=name}, true)
end)

minetest.register_on_respawnplayer(function(player)
	local name = player:get_player_name()
	minetest.sound_play({name="hades_player_respawn"}, {to_player=name}, true)
end)
