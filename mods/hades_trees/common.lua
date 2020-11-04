local S = minetest.get_translator("hades_trees")

hades_trees.register_trunk("tree", {
	description = S("Common Tree Trunk"),
	tiles = {"default_tree_top.png", "default_tree_top.png", "default_tree.png"},
})
hades_trees.register_bark("bark", {
	description = S("Common Bark"),
	image = "default_tree.png",
})
hades_trees.register_leaves("leaves", {
	description = S("Common Leaves"),
	image = "default_leaves.png",
	ash_fertilizer = 3,
	drop_item = "hades_trees:sapling",
	drop_rarity = 20,
})
hades_trees.register_sapling("sapling", {
	description = S("Common Tree Sapling"),
	image = "default_sapling.png",
	selbox = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3},
})
hades_trees.register_fruit("apple", {
	description = S("Apple"),
	drawtype = "plantlike",
	image = "default_apple.png",
	selbox = {-0.25, -0.375, -0.25, 0.25, 0.375, 0.25},
	satiation = 2,
})

minetest.register_abm({
	label = "Grow sapling to apple tree",
	nodenames = {"hades_trees:sapling"},
	interval = 20,
	chance = 50,
	action = function(pos, node)
		hades_trees.generate_appletree(pos)
	end
})

