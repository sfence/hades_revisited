local S = minetest.get_translator("hades_trees")

hades_trees.register_sapling("cocoa_sapling", {
	description = S("Cocoa Tree Sapling"),
	image = "hades_trees_cocoa_sapling.png",
	selbox = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3},
})
hades_trees.register_fruit("cocoa_pod", {
	description = S("Cocoa Pod"),
	drawtype = "plantlike",
	-- TODO: Better image needed!
	image = "hades_trees_cocoa_pod.png",
	selbox = {-0.25, -7/16, -0.25, 0.25, 0.5, 0.25},
	-- TODO: Remove when cocoa is ready
	groups = {not_in_craft_guide = 1},
})

minetest.register_craftitem("hades_trees:cocoa_bean", {
	description = S("Cocoa Bean"),
	inventory_image = "hades_trees_cocoa_bean.png",
	wield_image = "hades_trees_cocoa_bean.png",
	-- TODO: Remove when cocoa is ready
	groups = { not_in_craft_guide = 1 },
})

minetest.register_craft({
	output = "hades_trees:cocoa_bean 4",
	recipe = {{"hades_trees:cocoa_pod"}},
})

minetest.register_abm({
	nodenames = {"hades_trees:cocoa_sapling"},
	interval = 60,
	chance = 20,
	action = function(pos, node)
		hades_trees.generate_cocoatree(pos)
	end
})
