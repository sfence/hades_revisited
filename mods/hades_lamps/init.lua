minetest.register_node("hades_lamps:lamp_wall", {
	description = "Attached Lamp",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "wallmounted",
	tiles = {"hades_lamps_lamp.png"},
	wield_image = "hades_lamps_lamp_inv.png",
	inventory_image = "hades_lamps_lamp_inv.png",
	sunlight_propagates = true,
	light_source = 13,
	walkable = false,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3,attached_node=1},
	node_box = {
		type = "wallmounted",
		wall_side = {-0.5, -0.1875, -0.1875, -0.375, 0.1875, 0.1875},
		wall_top = {-0.25, 0.375, -0.25, 0.25, 0.5, 0.25},
		wall_bottom = {-0.25, -0.5, -0.25, 0.25, -0.375, 0.25},
	},
	sounds = hades_sounds.node_sound_glass_defaults(),
})

minetest.register_node("hades_lamps:lantern", {
	description = "Bronze Floor Lantern",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		"hades_lamps_lantern_top.png",
		"hades_lamps_lantern_top.png", -- bottom
		"hades_lamps_lantern_side.png",
		"hades_lamps_lantern_side.png",
		"hades_lamps_lantern_side.png",
		"hades_lamps_lantern_side.png",
	},
	sunlight_propagates = true,
	light_source = 13,
	walkable = false,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	node_box = {
		type = "fixed",
		fixed = {
	        {-0.25, -0.1875, -0.25, 0.25, 0.1875, 0.25},
			{-0.1875, -0.25, -0.1875, 0.1875, 0.25, 0.1875},
			{-0.125, -0.3125, -0.125, 0.125, 0.3125, 0.125},
			{-0.0625, -0.5, -0.0625, 0.0625, 0.375, 0.0625},
			{-0.125, -0.5, -0.125, 0.125, -0.4375, 0.125},
		}
	},
	sounds = hades_sounds.node_sound_glass_defaults(),
})

minetest.register_node("hades_lamps:lantern_rusty", {
	description = "Rusty Floor Lantern",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		"hades_lamps_lantern_rusty_top.png",
		"hades_lamps_lantern_rusty_top.png", -- bottom
		"hades_lamps_lantern_rusty_side.png",
		"hades_lamps_lantern_rusty_side.png",
		"hades_lamps_lantern_rusty_side.png",
		"hades_lamps_lantern_rusty_side.png",
	},
	sunlight_propagates = true,
	light_source = 13,
	walkable = false,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	node_box = {
		type = "fixed",
		fixed = {
	        {-0.25, -0.1875, -0.25, 0.25, 0.1875, 0.25},
			{-0.1875, -0.25, -0.1875, 0.1875, 0.25, 0.1875},
			{-0.125, -0.3125, -0.125, 0.125, 0.3125, 0.125},
			{-0.0625, -0.5, -0.0625, 0.0625, 0.375, 0.0625},
			{-0.125, -0.5, -0.125, 0.125, -0.4375, 0.125},
		}
	},
	sounds = hades_sounds.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = 'hades_lamps:lamp_wall 2',
	recipe = {
		{'hades_core:glass', '', ''},
		{'glowcrystals:glowdust', '', ''},
		{'hades_core:glass', '', ''},
	}
})
minetest.register_craft({
	output = 'hades_lamps:lamp_wall 2',
	recipe = {
		{'hades_core:glass', '', ''},
		{'hades_torches:torch', '', ''},
		{'hades_core:glass', '', ''},
	}
})

minetest.register_craft({
	output = 'hades_lamps:lantern 2',
	recipe = {
		{'', 'hades_core:bronze_ingot', ''},
		{'hades_core:glass', 'glowcrystals:glowdust', 'hades_core:glass'},
		{'', 'hades_core:bronze_ingot', ''},
	}
})
minetest.register_craft({
	output = 'hades_lamps:lantern 2',
	recipe = {
		{'', 'hades_core:bronze_ingot', ''},
		{'hades_core:glass', 'hades_torches:torch', 'hades_core:glass'},
		{'', 'hades_core:bronze_ingot', ''},
	}
})

minetest.register_craft({
	output = 'hades_lamps:lantern_rusty 2',
	recipe = {
		{'', 'hades_core:steel_ingot', ''},
		{'hades_core:glass', 'glowcrystals:glowdust', 'hades_core:glass'},
		{'', 'hades_core:steel_ingot', ''},
	}
})
minetest.register_craft({
	output = 'hades_lamps:lantern_rusty 2',
	recipe = {
		{'', 'hades_core:steel_ingot', ''},
		{'hades_core:glass', 'hades_torches:torch', 'hades_core:glass'},
		{'', 'hades_core:steel_ingot', ''},
	}
})

