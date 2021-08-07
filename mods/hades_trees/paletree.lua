local S = minetest.get_translator("hades_trees")

hades_trees.register_trunk("pale_tree", {
	description = S("Pale Tree Trunk"),
	tiles = {"hades_trees_pale_tree_top.png", "hades_trees_pale_tree_top.png", "hades_trees_pale_tree.png"},
})
hades_trees.register_bark("pale_bark", {
	description = S("Pale Bark"),
	image = "hades_trees_pale_tree.png",
})
hades_trees.register_leaves("pale_leaves", {
	description = S("Pale Leaves"),
	image = "hades_trees_pale_leaves.png",
	drop_item = "hades_trees:pale_sapling",
	drop_rarity = 10,
})
hades_trees.register_sapling("pale_sapling", {
	description = S("Pale Tree Sapling"),
	image = "hades_trees_pale_sapling.png",
	selbox = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3},
	growtype = "ash",
})

minetest.register_abm({
	nodenames = {"hades_trees:pale_sapling"},
	interval = 60,
	chance = 20,
	action = function(pos, node)
		hades_trees.grow_sapling(pos)
	end
})

