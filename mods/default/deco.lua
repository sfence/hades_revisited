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

minetest.register_node("default:plate", {
	description = "Plate",
	inventory_image = "default_plate.png",
	wield_image = "default_plate.png",
	tiles = { "default_plate.png" },
	drawtype = "signlike",
	paramtype = "light",
	paramtype2 = "wallmounted",
	is_ground_content = false,
	sounds = hades_sounds.node_sound_stone_defaults(),
	groups = {dig_immediate=3, attached_node=1},
	on_rotate = false,
	walkable = false,
	selection_box = {
		type = "wallmounted",
	},
})
