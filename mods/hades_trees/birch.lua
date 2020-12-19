local S = minetest.get_translator("hades_trees")

hades_trees.register_trunk("birch_tree", {
	description = S("Birch Tree Trunk"),
	tiles = {"default_tree_birch_top.png", "default_tree_birch_top.png", "default_tree_birch.png"},
})
hades_trees.register_bark("birch_bark", {
	description = S("Birch Bark"),
	image = "default_tree_birch.png",
})
hades_trees.register_leaves("birch_leaves", {
	description = S("Birch Leaves"),
	image = "default_leaves_birch.png",
	ash_fertilizer = 3,
	drop_item = "hades_trees:birch_sapling",
	drop_rarity = 30,
})
hades_trees.register_sapling("birch_sapling", {
	description = S("Birch Sapling"),
	image = "default_sapling_birch.png",
	selbox = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3},
})

minetest.register_abm({
	nodenames = {"hades_trees:birch_sapling"},
	interval = 60,
	chance = 20,
	action = function(pos, node)
		hades_trees.generate_birchtree(pos)
	end
})


