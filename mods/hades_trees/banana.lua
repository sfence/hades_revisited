local S = minetest.get_translator("hades_trees")

hades_trees.register_leaves("banana_leaves", {
	description = S("Banana Leaves"),
	image = "hades_trees_banana_leaves.png",
	ash_fertilizer = 3,
	drop_item = "hades_trees:banana_sapling",
	drop_rarity = 10,
})
hades_trees.register_sapling("banana_sapling", {
	description = S("Banana Sapling"),
	image = "hades_trees_banana_sapling.png",
	selbox = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3},
})
hades_trees.register_fruit("banana", {
	description = S("Banana"),
	drawtype = "torchlike",
	image = "hades_trees_banana.png",
	selbox = {-4/16, -7/16, -4/16, 4/16, 6/16, 4/16},
	satiation = 1,
})


minetest.register_abm({
	nodenames = {"hades_trees:banana_sapling"},
	interval = 60,
	chance = 10,
	action = function(pos, node)
		hades_trees.generate_bananatree(pos)
	end
})
