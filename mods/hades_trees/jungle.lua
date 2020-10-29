local S = minetest.get_translator("hades_trees")
local pr

minetest.register_node("hades_trees:jungle_sapling", {
	description = S("Common Jungle Tree Sapling"),
	_tt_help = S("Needs Dirt and light to grow"),
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"default_junglesapling.png"},
	inventory_image = "default_junglesapling.png",
	wield_image = "default_junglesapling.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {snappy=2,dig_immediate=3,flammable=2,attached_node=1, sapling=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
})

minetest.register_node("hades_trees:jungle_tree", {
	description = S("Jungle Tree Trunk"),
	paramtype = "light",
	tiles = {"default_jungletree_top.png", "default_jungletree_top.png", "default_jungletree.png"},
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
	groups = {tree=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
	sounds = hades_sounds.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("hades_trees:jungle_leaves", {
	description = S("Common Jungle Leaves"),
	drawtype = "allfaces_optional",
	tiles = {"default_jungleleaves.png"},
	paramtype = "light",
	waving = 1,
	is_ground_content = true,
	place_param2 = 1,
	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1, porous=1},
	drop = {
		max_items = 1,
		items = {
			{
				-- player will get sapling with 1/20 chance
				items = {'hades_trees:jungle_sapling'},
				rarity = 25,
			},
			{
				-- player will get leaves only if he get no saplings,
				-- this is because max_items is 1
				items = {'hades_trees:jungle_leaves'},
			}
		}
	},
	sounds = hades_sounds.node_sound_leaves_defaults(),
})

minetest.register_node("hades_trees:jungle_bark", {
	description = S("Jungle Bark"),
	paramtype2 = "facedir",
	tiles = { "default_jungletree.png" },
	is_ground_content = false,
	groups = { choppy = 3, oddly_breakable_by_hand = 1, flammable = 2 },
	sounds = hades_sounds.node_sound_wood_defaults(),
})

minetest.register_abm({
	label = "Grow jungle sapling to jungle tree",
	nodenames = {"hades_trees:jungle_sapling"},
	interval = 20,
	chance = 50,
	action = function(pos, node)
		hades_trees.generate_jungletree(pos)
	end
})

