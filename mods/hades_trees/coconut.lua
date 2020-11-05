local S = minetest.get_translator("hades_trees")

hades_trees.register_sapling("coconut_sapling", {
	description = S("Coconut Palm Sapling"),
	image = "hades_trees_coconut_sapling.png",
	selbox = {-0.25, -0.5, -0.25, 0.25, 0.35, 0.25},
})
hades_trees.register_fruit("coconut", {
	description = S("Coconut"),
	drawtype = "plantlike",
	image = "hades_trees_coconut.png",
	selbox = {-5/16, -7/16, -5/16, 5/16, 7/16, 5/16},
})

minetest.register_abm({
	nodenames = {"hades_trees:coconut_sapling"},
	interval = 60,
	chance = 20,
	action = function(pos, node)
		hades_trees.generate_coconutpalm(pos)
	end
})
