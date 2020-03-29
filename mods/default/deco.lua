minetest.register_node("default:lamp_wall", {
    description = "Attached Lamp",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "wallmounted",
	tiles = {"default_lamp.png"},
	wield_image = "default_lamp_inv.png",
	inventory_image = "default_lamp_inv.png",
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

minetest.register_node("default:latern", {
	description = "Bronze Floor Lantern",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		"default_latern_top.png",
		"default_latern_top.png", -- bottom
		"default_latern_side.png",
		"default_latern_side.png",
		"default_latern_side.png",
		"default_latern_side.png",
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

minetest.register_node("default:laternrusty", {
	description = "Rusty Floor Lantern",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		"default_laternrusty_top.png",
		"default_laternrusty_top.png", -- bottom
		"default_laternrusty_side.png",
		"default_laternrusty_side.png",
		"default_laternrusty_side.png",
		"default_laternrusty_side.png",
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


