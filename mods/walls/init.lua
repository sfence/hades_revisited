walls = {}

walls.register = function(wall_name, wall_desc, wall_texture, wall_mat, wall_sounds)
	-- inventory node, and pole-type wall start item
	minetest.register_node(wall_name, {
		description = wall_desc,
		drawtype = "nodebox",
		node_box = {
			type = "connected",
			fixed = {{-1/4, -1/2, -1/4, 1/4, 1/2, 1/4}},
			-- connect_bottom =
			connect_front = {{-3/16, -1/2, -1/2,  3/16, 3/8, -1/4}},
			connect_left = {{-1/2, -1/2, -3/16, -1/4, 3/8,  3/16}},
			connect_back = {{-3/16, -1/2,  1/4,  3/16, 3/8,  1/2}},
			connect_right = {{ 1/4, -1/2, -3/16,  1/2, 3/8,  3/16}},
		},
		connects_to = { "group:wall", "group:stone" },
		paramtype = "light",
		is_ground_content = false,
		tiles = { wall_texture, },
		walkable = true,
		groups = { cracky = 3, wall = 1, },
		sounds = wall_sounds,
	})

	-- crafting recipe
	minetest.register_craft({
		output = wall_name .. " 6",
		recipe = {
			{ '', '', '' },
			{ wall_mat, wall_mat, wall_mat},
			{ wall_mat, wall_mat, wall_mat},
		}
	})

end

walls.register("walls:cobble", "Cobblestone Wall", "default_cobble.png",
		"hades_core:cobble", hades_sounds.node_sound_stone_defaults())

walls.register("walls:mossycobble", "Mossy Cobblestone Wall", "default_mossycobble.png",
		"hades_core:mossycobble", hades_sounds.node_sound_stone_defaults())

walls.register("walls:cobble_baked", "Burned Cobblestone Wall", "default_cobble_baked.png",
		"hades_core:cobble_baked", hades_sounds.node_sound_stone_defaults())

walls.register("walls:sandstone", "Sandstone Wall", "default_sandstone.png",
		"hades_core:sandstone", hades_sounds.node_sound_stone_defaults())

