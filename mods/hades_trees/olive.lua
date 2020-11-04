local S = minetest.get_translator("hades_trees")

hades_trees.register_leaves("olive_leaves", {
	description = S("Olive Leaves"),
	image = "hades_trees_olive_leaves.png",
	ash_fertilizer = 3,
	drop_item = "hades_trees:olive_sapling",
	drop_rarity = 25,
})
hades_trees.register_sapling("olive_sapling", {
	description = S("Olive Tree Sapling"),
	image = "hades_trees_olive_sapling.png",
	selbox = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3},
})
hades_trees.register_fruit("olive", {
	description = S("Olive"),
	drawtype = "plantlike",
	image = "hades_trees_olive.png",
	selbox = {-0.25, -7/16, -0.25, 0.25, 0.5, 0.25},
	satiation = 1,
})

minetest.register_abm({
	nodenames = {"hades_trees:olive_sapling"},
	interval = 60,
	chance = 20,
	action = function(pos, node)
		hades_trees.generate_olivetree(pos)
	end
})
