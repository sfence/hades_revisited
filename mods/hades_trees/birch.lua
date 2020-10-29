local S = minetest.get_translator("hades_trees")

minetest.register_node("hades_trees:birch_sapling", {
	description = S("Birch Sapling"),
	_tt_help = S("Needs Dirt and light to grow"),
	drawtype = "plantlike",
	tiles = {"default_sapling_birch.png"},
	inventory_image = "default_sapling_birch.png",
	wield_image = "default_sapling_birch.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {dig_immediate=3,flammable=2,attached_node=1, sapling=1},
	sounds = hades_sounds.node_sound_defaults(),
})

minetest.register_node("hades_trees:birch_tree", {
	description = S("Birch Tree Trunk"),
	paramtype = "light",
	tiles = {"default_tree_birch_top.png", "default_tree_birch_top.png", "default_tree_birch.png"},
	is_ground_content = false,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.35,-0.5,-0.4,0.35,0.5,0.4},
			{-0.4,-0.5,-0.35, 0.4,0.5,0.35},
			{-0.25,-0.5,-0.45,0.25,0.5,0.45},
			{-0.45,-0.5,-0.25, 0.45,0.5,0.25},
			{-0.15,-0.5,-0.5,0.15,0.5,0.5},
			{-0.5,-0.5,-0.15, 0.5,0.5,0.15},
		},
	},
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = hades_sounds.node_sound_wood_defaults(),
})

minetest.register_node("hades_trees:birch_leaves", {
	description = S("Birch Leaves"),
	drawtype = "allfaces_optional",
	tiles = {"default_leaves_birch.png"},
	paramtype = "light",
	waving = 1,
	is_ground_content = false,
	place_param2 = 1,
	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1, porous=1},
 	drop = {
		max_items = 1,
		items = {
			{
				-- player will get sapling with 1/20 chance
				items = {'hades_trees:birch_sapling'},
				rarity = 30,
			},
			{
				-- player will get leaves only if he get no saplings,
				-- this is because max_items is 1
				items = {'hades_trees:birch_leaves'},
			}
		}
	},
	sounds = hades_sounds.node_sound_leaves_defaults(),
})

minetest.register_node("hades_trees:birch_bark", {
	description = S("Birch Bark"),
	paramtype2 = "facedir",
	tiles = { "default_tree_birch.png" },
	is_ground_content = false,
	groups = { choppy = 3, oddly_breakable_by_hand = 1, flammable = 2 },
	sounds = hades_sounds.node_sound_wood_defaults(),
})

minetest.register_abm({
	nodenames = {"hades_trees:birch_sapling"},
	interval = 60,
	chance = 20,
	action = function(pos, node)
		hades_trees:generate_birchtree(pos, "hades_trees:birch_tree", "hades_trees:birch_leaves", {"hades_core:dirt", "hades_core:dirt_with_grass"})
	end
})


