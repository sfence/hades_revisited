local S = minetest.get_translator("hades_trees")

hades_trees.register_sapling("sapling", {
	description = S("Apple Sapling"),
	image = "default_sapling.png",
	selbox = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3},
})
hades_trees.register_leaves("leaves", {
	description = S("Apple Leaves"),
	image = "default_leaves.png",
	ash_fertilizer = 3,
	drop_item = "hades_trees:sapling",
	drop_rarity = 20,
	trunk = "hades_trees:tree",
})
hades_trees.register_fruit("apple", {
	description = S("Apple"),
	drawtype = "plantlike",
	image = "default_apple.png",
	selbox = {-0.25, -0.375, -0.25, 0.25, 0.375, 0.25},
	satiation = 2,
})

minetest.register_abm({
	label = "Grow apple sapling to apple tree",
	nodenames = {"hades_trees:sapling"},
	interval = 20,
	chance = 50,
	action = function(pos, node)
		hades_trees.grow_sapling(pos)
	end
})

