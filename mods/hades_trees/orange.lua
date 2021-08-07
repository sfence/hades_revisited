local S = minetest.get_translator("hades_trees")

hades_trees.register_trunk("orange_tree", {
	description = S("Orange Tree Trunk"),
	tiles = {"hades_trees_orange_tree_top.png", "hades_trees_orange_tree_top.png", "hades_trees_orange_tree.png"},
})
hades_trees.register_bark("orange_bark", {
	description = S("Orange Bark"),
	image = "hades_trees_orange_tree.png",
})

hades_trees.register_leaves("orange_leaves", {
	description = S("Orange Leaves"),
	image = "hades_trees_orange_leaves.png",
	ash_fertilizer = 3,
	drop_item = "hades_trees:orange_sapling",
	drop_rarity = 20,
})
hades_trees.register_sapling("orange_sapling", {
	description = S("Orange Tree Sapling"),
	image = "hades_trees_orange_sapling.png",
	selbox = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3},
})
hades_trees.register_fruit("orange", {
	description = S("Orange"),
	drawtype = "plantlike",
	image = "hades_trees_orange.png",
	selbox = {-3/16, -4/16, -3/16, 3/16, 5/16, 3/16},
	satiation = 1,
})

minetest.register_abm({
	nodenames = {"hades_trees:orange_sapling"},
	interval = 60,
	chance = 10,
	action = function(pos, node)
		hades_trees.generate_orangetree(pos)
	end
})
