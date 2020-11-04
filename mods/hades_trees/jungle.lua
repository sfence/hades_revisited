local S = minetest.get_translator("hades_trees")
local pr

hades_trees.register_trunk("jungle_tree", {
	description = S("Jungle Tree Trunk"),
	tiles = {"default_jungletree_top.png", "default_jungletree_top.png", "default_jungletree.png"},
})
hades_trees.register_bark("jungle_bark", {
	description = S("Jungle Bark"),
	image = "default_jungletree.png",
})
hades_trees.register_leaves("jungle_leaves", {
	description = S("Common Jungle Leaves"),
	image = "default_jungleleaves.png",
	ash_fertilizer = 3,
	drop_item = "hades_trees:jungle_sapling",
	drop_rarity = 25,
})
hades_trees.register_sapling("jungle_sapling", {
	description = S("Common Jungle Tree Sapling"),
	image = "default_junglesapling.png",
	selbox = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3},
})

minetest.register_abm({
	label = "Grow jungle sapling to jungle tree",
	nodenames = {"hades_trees:jungle_sapling"},
	interval = 20,
	chance = 50,
	action = function(pos, node)
		hades_trees.generate_jungletree(pos)
	end
})

