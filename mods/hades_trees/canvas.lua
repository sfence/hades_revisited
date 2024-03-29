local S = minetest.get_translator("hades_trees")

hades_trees.register_trunk("canvas_tree", {
	description = S("Canvas Tree Trunk"),
	tiles = {"hades_trees_canvas_tree_top.png", "hades_trees_canvas_tree_top.png", "hades_trees_canvas_tree.png"},
})
hades_trees.register_leaves("canvas_leaves", {
	description = S("Canvas Leaves"),
	image = "hades_trees_canvas_leaves.png",
	ash_fertilizer = 0,
	drop_item = "hades_trees:canvas_sapling",
	drop_rarity = 20,
	trunk = "hades_trees:canvas_tree",
})

hades_trees.register_bark("canvas_bark", {
	description = S("Canvas Bark"),
	image = "hades_trees_canvas_tree.png",
})
hades_trees.register_sapling("canvas_sapling", {
	description = S("Canvas Tree Sapling"),
	image = "hades_trees_canvas_sapling.png",
	selbox = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3},
})

minetest.register_abm({
	label = "Grow canvas tree sapling to canvas tree",
	nodenames = {"hades_trees:canvas_sapling"},
	interval = 15,
	chance = 40,
	action = function(pos, node)
		hades_trees.grow_sapling(pos)
	end
})

