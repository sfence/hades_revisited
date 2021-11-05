local S = minetest.get_translator("walls")

walls = {}

walls.register = function(wall_name, wall_desc, wall_texture, wall_mat, wall_sounds, connects_to)
	if connects_to then
		table.insert(connects_to, "group:wall")
		table.insert(connects_to, "group:fence")
		table.insert(connects_to, "group:fence_gate")
	else
		connects_to = {"group:wall", "group:fence", "group:fence_gate"}
	end
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
		connects_to = connects_to,
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

walls.register("walls:cobble", S("Cobblestone Wall"), "default_cobble.png",
		"hades_core:cobble", hades_sounds.node_sound_stone_defaults(),
		{"group:stone", "group:sandstone"})

walls.register("walls:mossycobble", S("Mossy Cobblestone Wall"), "default_mossycobble.png",
		"hades_core:mossycobble", hades_sounds.node_sound_stone_defaults(),
		{"group:stone", "group:sandstone"})

walls.register("walls:cobble_baked", S("Burned Cobblestone Wall"), "hades_core_cobble_baked.png",
		"hades_core:cobble_baked", hades_sounds.node_sound_stone_defaults(),
		{"group:stone", "group:sandstone"})

walls.register("walls:sandstone", S("Fine Sandstone Wall"), "default_sandstone.png",
		"hades_core:sandstone", hades_sounds.node_sound_stone_defaults(),
		{"group:stone", "group:sandstone"})

walls.register("walls:sandstone_volcanic", S("Volcanic Sandstone Wall"), "hades_core_sandstone_volcanic.png",
		"hades_core:sandstone_volcanic", hades_sounds.node_sound_stone_defaults(),
		{"group:stone", "group:sandstone"})

walls.register("walls:cobble_sandstone", S("Cobbled Fine Sandstone Wall"), "hades_core_cobble_sandstone.png",
		"hades_core:cobble_sandstone", hades_sounds.node_sound_stone_defaults(),
		{"group:stone", "group:sandstone"})

walls.register("walls:cobble_sandstone_volcanic", S("Cobbled Volcanic Sandstone Wall"), "hades_core_cobble_sandstone_volcanic.png",
		"hades_core:cobble_sandstone_volcanic", hades_sounds.node_sound_stone_defaults(),
		{"group:stone", "group:sandstone"})
