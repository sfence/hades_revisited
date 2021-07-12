local S = minetest.get_translator("hades_trees")

hades_trees.register_trunk("tree", {
	description = S("Temperate Tree Trunk"),
	tiles = {"default_tree_top.png", "default_tree_top.png", "default_tree.png"},
})
hades_trees.register_bark("bark", {
	description = S("Temperate Bark"),
	image = "default_tree.png",
})

hades_trees.register_trunk("lush_tree", {
	description = S("Lush Tree Trunk"),
	tiles = {"hades_trees_lush_tree_top.png", "hades_trees_lush_tree_top.png", "hades_trees_lush_tree.png"},
})
hades_trees.register_bark("lush_bark", {
	description = S("Lush Bark"),
	image = "hades_trees_lush_tree.png",
})
