local S = minetest.get_translator("hades_trees")

minetest.register_node("hades_trees:pale_sapling", {
	description = S("Pale Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"hades_trees_pale_sapling.png"},
	inventory_image = "hades_trees_pale_sapling.png",
	wield_image = "hades_trees_pale_sapling.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {dig_immediate=3,flammable=2, sapling=1},
	sounds = hades_sounds.node_sound_defaults(),
})

minetest.register_node("hades_trees:pale_tree", {
	description = S("Pale Tree Trunk"),
	paramtype = "light",
	tiles = {"hades_trees_pale_tree_top.png", "hades_trees_pale_tree_top.png", "hades_trees_pale_tree.png"},
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

minetest.register_node("hades_trees:pale_bark", {
	description = S("Pale Bark"),
	paramtype2 = "facedir",
	tiles = { "hades_trees_pale_tree.png" },
	is_ground_content = false,
	groups = { choppy = 3, oddly_breakable_by_hand = 1, flammable = 2 },
	sounds = hades_sounds.node_sound_wood_defaults(),
})

minetest.register_node("hades_trees:pale_leaves", {
    description = S("Pale Leaves"),
	drawtype = "allfaces_optional",
	tiles = {"hades_trees_pale_leaves.png"},
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
				items = {'hades_trees:pale_sapling'},
				rarity = 10,
			},
			{
				-- player will get leaves only if he get no saplings,
				-- this is because max_items is 1
				items = {'hades_trees:pale_leaves'},
			}
		}
	},
	sounds = hades_sounds.node_sound_leaves_defaults(),
})

minetest.register_abm({
	nodenames = {"hades_trees:pale_sapling"},
	interval = 60,
	chance = 20,
	action = function(pos, node)
		hades_trees:generate_paletree(pos, "hades_trees:pale_tree", "hades_trees:pale_leaves", {"hades_core:dirt", "hades_core:dirt_with_grass", "hades_core:ash", "hades_core:fertile_sand"})
	end
})

