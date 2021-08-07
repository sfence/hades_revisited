local S = minetest.get_translator("hades_trees")

hades_trees.register_leaves("cultivated_jungle_leaves", {
	description = S("Cultivated Tropical Leaves"),
	image = "hades_trees_cultivated_jungle_leaves.png",
	ash_fertilizer = 3,
	drop_item = "hades_trees:cultivated_jungle_sapling",
	drop_rarity = 25,
	trunk = "hades_trees:jungle_tree",
})
hades_trees.register_sapling("cultivated_jungle_sapling", {
	description = S("Cultivated Tropical Tree Sapling"),
	image = "hades_trees_cultivated_jungle_sapling.png",
	selbox = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3},
})

minetest.register_abm({
	nodenames = {"hades_trees:cultivated_jungle_sapling"},
	interval = 60,
	chance = 20,
	action = function(pos, node)
		hades_trees.grow_sapling(pos)
	end
})


