--------------------------------------------------------
-- Minetest :: Doors Redux Mod v1.0 (doors)
--
-- See README.txt for licensing and other information.
-- Copyright (c) 2016-2020, Leslie E. Krause
--
-- ./games/minetest_game/mods/doors/init.lua
--------------------------------------------------------

-- "One of the most essential but often overlooked elements of world design is door selection.
-- Doors set the tone and character and having the wrong style of door can make or break a build."

dofile( minetest.get_modpath( "doors" ) .. "/api.lua" )

------------------------
-- Door Registrations --
------------------------

doors.register_door( "doors:door_wood", {
	tiles = {{ name = "doors_door_wood.png", backface_culling = true }},
	use_texture_alpha = "clip",
	description = "Wooden Door",
	inventory_image = "doors_item_wood.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "group:wood", "group:wood" },
		{ "group:wood", "group:wood" },
		{ "group:wood", "group:wood" },
	},
	can_center = true,
} )

doors.register_door( "doors:door_woodpanel1", {
	-- Colonial Style (6 panel)
	tiles = {{ name = "doors_door_woodpanel1.png", backface_culling = true }},
	description = "Wooden Colonial Door",
	inventory_image = "doors_item_woodpanel1.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "group:wood", "group:wood", "hades_core:stick" },
		{ "group:wood", "group:wood", "hades_core:stick" },
		{ "group:wood", "group:wood", "hades_core:stick" },
	},
	is_lockable = true,
	is_closable = true,
} )

doors.register_door( "doors:door_woodglass1", {
	tiles = {{ name = "doors_door_woodglass1.png", backface_culling = true }},
	use_texture_alpha = "clip",
	description = "Wooden Single-Lite Door",
	inventory_image = "doors_item_woodglass1.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "hades_core:glass", "hades_core:glass", "hades_core:stick" },
		{ "group:wood", "group:wood", "" },
		{ "group:wood", "group:wood", "" },
	},
	is_lockable = true,
	is_closable = true,
} )

doors.register_door( "doors:door_woodglass2", {
	tiles = {{ name = "doors_door_woodglass2.png", backface_culling = true }},
	use_texture_alpha = "clip",
	description = "Wooden Double-Lite Door",
	inventory_image = "doors_item_woodglass2.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
		recipe = {
		{ "hades_core:glass", "hades_core:glass", "hades_core:stick" },
		{ "group:wood", "group:wood", "hades_core:stick" },
		{ "group:wood", "group:wood", "" },
	},
	is_lockable = true,
	is_closable = true,
} )

doors.register_door( "doors:door_japanese", {
	tiles = {{ name = "doors_door_japanese.png", backface_culling = true }},
	description = "Japanese Door",
	inventory_image = "doors_item_japanese.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "hades_core:paper", "group:wood", "hades_core:stick" },
		{ "hades_core:paper", "group:wood", "hades_core:stick" },
		{ "hades_core:paper", "group:wood", "hades_core:stick" },
	},
	is_lockable = true,
	is_closable = true,
} )

doors.register_door( "doors:door_french", {
	tiles = {{ name = "doors_door_french.png", backface_culling = true }},
	use_texture_alpha = "clip",
	description = "French Door",
	inventory_image = "doors_item_french.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "hades_core:glass", "group:wood", "hades_core:stick" },
		{ "hades_core:glass", "group:wood", "hades_core:stick" },
		{ "hades_core:glass", "group:wood", "hades_core:stick" },
	},
	is_lockable = true,
	is_closable = true,
} )

doors.register_door( "doors:door_cottage1", {
	tiles = {{ name = "doors_door_cottage1.png", backface_culling = true }},
	description = "Cottage Interior Door",
	inventory_image = "doors_item_cottage1.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "group:wood", "group:wood" },
		{ "hades_core:stick", "hades_core:stick" },
		{ "group:wood", "group:wood" },
	},
	is_lockable = true,
	is_closable = true,
} )

doors.register_door( "doors:door_cottage2", {
	tiles = {{ name = "doors_door_cottage2.png", backface_culling = true }},
	use_texture_alpha = "clip",
	description = "Cottage Exterior Door",
	inventory_image = "doors_item_cottage2.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "hades_core:glass", "hades_core:glass" },
		{ "hades_core:stick", "hades_core:stick" },
		{ "group:wood", "group:wood" },
	},
	is_lockable = true,
	is_closable = true,
} )

doors.register_door( "doors:door_barn1", {
	tiles = {{ name = "doors_door_barn1.png", backface_culling = true }},
	description = "Barn Interior Door",
	inventory_image = "doors_item_barn1.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "group:wood", "group:wood", "group:wood" },
		{ "hades_core:stick", "hades_core:stick", "hades_core:stick" },
		{ "group:wood", "group:wood", "group:wood" },
	},
	is_lockable = true,
	is_closable = true,
} )

doors.register_door( "doors:door_barn2", {
	tiles = {{ name = "doors_door_barn2.png", backface_culling = true }},
	description = "Barn Exterior Door",
	inventory_image = "doors_item_barn2.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "group:wood", "group:wood", "group:wood" },
		{ "hades_core:steel_rod", "hades_core:steel_rod", "hades_core:steel_rod" },
		{ "group:wood", "group:wood", "group:wood" },
	},
	is_lockable = true,
	is_closable = true,
} )

doors.register_door( "doors:door_castle1", {
	tiles = {{ name = "doors_door_castle1.png", backface_culling = true }},
	description = "Castle Interior Door",
	inventory_image = "doors_item_castle1.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "hades_core:stick", "group:wood", "group:wood" },
		{ "", "group:wood", "group:wood" },
		{ "hades_core:stick", "group:wood", "group:wood" },
	},
	is_lockable = true,
	is_closable = true,
} )

doors.register_door( "doors:door_castle2", {
	tiles = {{ name = "doors_door_castle2.png", backface_culling = true }},
	description = "Castle Exterior Door",
	inventory_image = "doors_item_castle2.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "hades_core:steel_rod", "group:wood", "group:wood" },
		{ "", "group:wood", "group:wood" },
		{ "hades_core:steel_rod", "group:wood", "group:wood" },
	},
	is_lockable = true,
	is_closable = true,
} )

doors.register_door( "doors:door_mansion1", {
	tiles = {{ name = "doors_door_mansion1.png", backface_culling = true }},
	description = "Mansion Interior Door",
	inventory_image = "doors_item_mansion1.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "group:wood", "group:wood", "hades_core:steel_rod" },
		{ "group:wood", "group:wood", "dye:white" },
		{ "group:wood", "group:wood", "hades_core:steel_rod" },
	},
	is_lockable = true,
	is_closable = true,
} )

doors.register_door( "doors:door_mansion2", {
	tiles = {{ name = "doors_door_mansion2.png", backface_culling = true }},
	description = "Mansion Exterior Door ",
	inventory_image = "doors_item_mansion2.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "group:wood", "group:wood", "hades_core:steel_rod" },
		{ "group:wood", "group:wood", "dye:black" },
		{ "group:wood", "group:wood", "hades_core:steel_rod" },
	},
	is_lockable = true,
	is_closable = true,
} )

doors.register_door( "doors:door_steel", {
	tiles = {{ name = "doors_door_steel.png", backface_culling = true}},
	use_texture_alpha = "clip",
	description = "Steel Door",
	inventory_image = "doors_item_steel.png",
	protected = true,
	groups = { cracky = 1, level = 2 },
	sounds = hades_sounds.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	recipe = {
		{ "hades_core:steel_ingot", "hades_core:steel_ingot" },
		{ "hades_core:steel_ingot", "hades_core:steel_ingot" },
		{ "hades_core:steel_ingot", "hades_core:steel_ingot" },
	},
	can_center = true,
	is_lockable = true,
} )

doors.register_door( "doors:door_dungeon1", {
	tiles = {{ name = "doors_door_dungeon1.png", backface_culling = true}},
	description = "Dungeon Interior Door",
	inventory_image = "doors_item_dungeon1.png",
	protected = true,
	groups = { cracky = 1, level = 2 },
	sounds = hades_sounds.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	recipe = {
		{ "hades_core:steel_ingot", "hades_core:steel_rod", "hades_core:steel_ingot" },
		{ "hades_core:steel_rod", "hades_core:steel_rod", "hades_core:steel_rod" },
		{ "hades_core:steel_ingot", "hades_core:steel_rod", "hades_core:steel_ingot" },
	},
	is_lockable = true,
} )

doors.register_door( "doors:door_dungeon2", {
	tiles = {{ name = "doors_door_dungeon2.png", backface_culling = true}},
	use_texture_alpha = "clip",
	description = "Dungeon Exterior Door",
	inventory_image = "doors_item_dungeon2.png",
	protected = true,
	groups = { cracky = 1, level = 2 },
	sounds = hades_sounds.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	recipe = {
		{ "hades_core:steel_rod", "hades_core:steel_rod", "hades_core:steel_rod" },
		{ "hades_core:steel_ingot", "hades_core:steel_ingot", "hades_core:steel_ingot" },
		{ "hades_core:steel_ingot", "hades_core:steel_ingot", "hades_core:steel_ingot" },
	},
	is_lockable = true,
} )

doors.register_door( "doors:door_steelpanel1", {
	tiles = {{ name = "doors_door_steelpanel1.png", backface_culling = true}},
	description = "Steel Colonial Door",
	inventory_image = "doors_item_steelpanel1.png",
	protected = true,
	groups = { cracky = 1, level = 2 },
	sounds = hades_sounds.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	recipe = {
		{ "hades_core:steel_ingot", "hades_core:steel_ingot", "hades_core:steel_rod" },
		{ "hades_core:steel_ingot", "hades_core:steel_ingot", "hades_core:steel_rod" },
		{ "hades_core:steel_ingot", "hades_core:steel_ingot", "hades_core:steel_rod" },
	},
	is_lockable = true,
	is_closable = true,
} )

doors.register_door( "doors:door_steelglass1", {
	tiles = {{ name = "doors_door_steelglass1.png", backface_culling = true}},
	use_texture_alpha = "clip",
	description = "Steel Single-Lite Door",
	inventory_image = "doors_item_steelglass1.png",
	protected = true,
	groups = { cracky = 1, level = 2 },
	sounds = hades_sounds.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	recipe = {
		{ "hades_core:glass", "hades_core:glass", "hades_core:steel_rod" },
		{ "hades_core:steel_ingot", "hades_core:steel_ingot", "" },
		{ "hades_core:steel_ingot", "hades_core:steel_ingot", "" },
	},
	is_lockable = true,
	is_closable = true,
} )

doors.register_door( "doors:door_steelglass2", {
	tiles = {{ name = "doors_door_steelglass2.png", backface_culling = true }},
	use_texture_alpha = "clip",
	description = "Steel Double-Lite Door",
	inventory_image = "doors_item_steelglass2.png",
	protected = true,
	groups = { cracky = 1, level = 2 },
	sounds = hades_sounds.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	recipe = {
		{ "hades_core:glass", "hades_core:glass", "hades_core:steel_rod" },
		{ "hades_core:steel_ingot", "hades_core:steel_ingot", "hades_core:steel_rod" },
		{ "hades_core:steel_ingot", "hades_core:steel_ingot", "" },
	},
	is_lockable = true,
	is_closable = true,
} )

doors.register_door( "doors:door_glass", {
	tiles = { "doors_door_glass.png" },
	use_texture_alpha = "clip",
	description = "Glass Door",
	inventory_image = "doors_item_glass.png",
	groups = { cracky = 3, oddly_breakable_by_hand = 3 },
	sounds = hades_sounds.node_sound_glass_defaults(),
	sound_open = "doors_glass_door_open",
	sound_close = "doors_glass_door_close",
	recipe = {
		{ "hades_core:glass", "hades_core:glass" },
		{ "hades_core:glass", "hades_core:glass" },
		{ "hades_core:glass", "hades_core:glass" },
	},
	can_center = true,
	is_lockable = true,
	is_closable = true,
} )

doors.register_door( "doors:door_obsidian_glass", {
	tiles = { "doors_door_obsidian_glass.png" },
	use_texture_alpha = "clip",
	description = "Obsidian Glass Door",
	inventory_image = "doors_item_obsidian_glass.png",
	groups = { cracky = 3 },
	sounds = hades_sounds.node_sound_glass_defaults(),
	sound_open = "doors_glass_door_open",
	sound_close = "doors_glass_door_close",
	recipe = {
		{ "hades_core:obsidian_glass", "hades_core:obsidian_glass" },
		{ "hades_core:obsidian_glass", "hades_core:obsidian_glass" },
		{ "hades_core:obsidian_glass", "hades_core:obsidian_glass" },
	},
	can_center = true,
	is_lockable = true,
	is_closable = true,
} )

----------------------------
-- Trapdoor Registrations --
----------------------------

doors.register_trapdoor( "doors:trapdoor", {
	description = "Trapdoor",
	inventory_image = "doors_trapdoor.png",
	wield_image = "doors_trapdoor.png",
	tile_front = "doors_trapdoor.png",
	tile_side = "doors_trapdoor_side.png",
	use_texture_alpha = "clip",

	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, door = 1 },

	is_closable = true,
} )

doors.register_trapdoor( "doors:trapdoor_steel", {
	description = "Steel Trapdoor",
	inventory_image = "doors_trapdoor_steel.png",
	wield_image = "doors_trapdoor_steel.png",
	tile_front = "doors_trapdoor_steel.png",
	tile_side = "doors_trapdoor_steel_side.png",
	use_texture_alpha = "clip",
	protected = true,

	sounds = hades_sounds.node_sound_metal_defaults( ),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",

	groups = { cracky = 1, level = 2, door = 1 },

	is_lockable = true,
	is_closable = true,
} )

minetest.register_craft( {
	output = "doors:trapdoor 2",
	recipe = {
		{ "group:wood", "group:wood", "group:wood" },
		{ "group:wood", "group:wood", "group:wood" },
	}
} )

minetest.register_craft( {
	output = "doors:trapdoor_steel",
	recipe = {
		{ "hades_core:steel_ingot", "hades_core:steel_ingot" },
		{ "hades_core:steel_ingot", "hades_core:steel_ingot" },
	}
} )

-----------------------------
-- Fencegate Registrations --
-----------------------------

doors.register_fencegate( "doors:gate_wood", {
	description = "Wooden Fence Gate",
	texture = "default_wood.png",
	material = "hades_core:wood",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 }
} )

doors.register_fencegate( "doors:gate_junglewood", {
	description = "Junglewood Fence Gate",
	texture = "default_junglewood.png",
	material = "hades_core:junglewood",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 }
} )

doors.register_fencegate( "doors:gate_acacia_wood", {
	description = "Acacia Fence Gate",
	texture = "default_acacia_wood.png",
	material = "hades_core:acacia_wood",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 }
} )

doors.register_fencegate( "doors:gate_pine_wood", {
	description = "Pine Fence Gate",
	texture = "default_pine_wood.png",
	material = "hades_core:pine_wood",
	groups = { choppy = 3, oddly_breakable_by_hand = 2, flammable = 3 }
} )

doors.register_fencegate( "doors:gate_aspen_wood", {
	description = "Aspen Fence Gate",
	texture = "default_aspen_wood.png",
	material = "hades_core:aspen_wood",
	groups = { choppy = 3, oddly_breakable_by_hand = 2, flammable = 3 }
} )

------------------------
-- Fuel Registrations --
------------------------

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_wood",
	burntime = 14,
} )

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_woodpanel1",
	burntime = 12,
} )

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_woodglass1",
	burntime = 12,
} )

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_woodglass2",
	burntime = 14,
} )

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_japanese",
	burntime = 10,
} )

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_french",
	burntime = 10,
} )

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_cottage1",
	burntime = 16,
} )

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:door_cottage2",
	burntime = 16,
} )

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:trapdoor",
	burntime = 7,
} )

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:gate_wood_closed",
	burntime = 7,
} )

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:gate_acacia_wood_closed",
	burntime = 8,
} )

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:gate_junglewood_closed",
	burntime = 9,
} )

minetest.register_craft({
	type = "fuel",
	recipe = "doors:gate_pine_wood_closed",
	burntime = 6,
} )

minetest.register_craft( {
	type = "fuel",
	recipe = "doors:gate_aspen_wood_closed",
	burntime = 5,
} )
