local S = minetest.get_translator("hades_trees")

hades_trees.register_trunk("tree", {
	description = S("Temperate Tree Trunk"),
	tiles = {"default_tree_top.png", "default_tree_top.png", "default_tree.png"},
})
hades_trees.register_bark("bark", {
	description = S("Temperate Bark"),
	image = "default_tree.png",
})


