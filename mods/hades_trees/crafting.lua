-- Wood
minetest.register_craft({
	output = 'hades_trees:wood 4',
	recipe = {
		{'hades_trees:tree'},
	}
})
minetest.register_craft({
	output = 'hades_trees:pale_wood 4',
	recipe = {
		{'hades_trees:pale_tree'},
	}
})
minetest.register_craft({
	output = 'hades_trees:cream_wood 4',
	recipe = {
		{'hades_trees:birch_tree'},
	}
})
minetest.register_craft({
	output = 'hades_trees:jungle_wood 4',
	recipe = {
		{'hades_trees:jungle_tree'},
	}
})
minetest.register_craft({
	output = 'hades_trees:lush_wood 4',
	recipe = {
		{'hades_trees:orange_tree'},
	}
})
minetest.register_craft({
	type = "shapeless",
	output = 'hades_trees:colwood_uncolored',
	recipe = {'group:colwood', 'hades_trees:canvas_leaves'},
})
minetest.register_craft({
	output = 'hades_trees:colwood_uncolored 4',
	recipe = {
		{'hades_trees:canvas_tree'},
	}
})

minetest.register_craft({
	output = 'hades_trees:colwood_black',
	recipe = {
		{'group:wood', 'hades_dye:black'},
	}
})

minetest.register_craft({
	output = 'hades_trees:colwood_blue',
	recipe = {
		{'group:wood', 'hades_dye:blue'},
	}
})

minetest.register_craft({
	output = 'hades_trees:colwood_brown',
	recipe = {
		{'group:wood', 'hades_dye:brown'},
	}
})

minetest.register_craft({
	output = 'hades_trees:colwood_cyan',
	recipe = {
		{'group:wood', 'hades_dye:cyan'},
	}
})

minetest.register_craft({
	output = 'hades_trees:colwood_dark_green',
	recipe = {
		{'group:wood', 'hades_dye:dark_green'},
	}
})

minetest.register_craft({
	output = 'hades_trees:colwood_dark_grey',
	recipe = {
		{'group:wood', 'hades_dye:dark_grey'},
	}
})

minetest.register_craft({
	output = 'hades_trees:colwood_green',
	recipe = {
		{'group:wood', 'hades_dye:green'},
	}
})

minetest.register_craft({
	output = 'hades_trees:colwood_grey',
	recipe = {
		{'group:wood', 'hades_dye:grey'},
	}
})

minetest.register_craft({
	output = 'hades_trees:colwood_magenta',
	recipe = {
		{'group:wood', 'hades_dye:magenta'},
	}
})

minetest.register_craft({
	output = 'hades_trees:colwood_orange',
	recipe = {
		{'group:wood', 'hades_dye:orange'},
	}
})

minetest.register_craft({
	output = 'hades_trees:colwood_pink',
	recipe = {
		{'group:wood', 'hades_dye:pink'},
	}
})

minetest.register_craft({
	output = 'hades_trees:colwood_red',
	recipe = {
		{'group:wood', 'hades_dye:red'},
	}
})

minetest.register_craft({
	output = 'hades_trees:colwood_violet',
	recipe = {
		{'group:wood', 'hades_dye:violet'},
	}
})

minetest.register_craft({
	output = 'hades_trees:colwood_white',
	recipe = {
		{'group:wood', 'hades_dye:white'},
	}
})

minetest.register_craft({
	output = 'hades_trees:colwood_yellow',
	recipe = {
		{'group:wood', 'hades_dye:yellow'},
	}
})

-- Bark

minetest.register_craft({
	output = "hades_trees:bark 3",
	recipe = {
		{ "hades_trees:tree", "hades_trees:tree" },
		{ "hades_trees:tree", "hades_trees:tree" },
	}
})
minetest.register_craft({
	output = "hades_trees:birch_bark 3",
	recipe = {
		{ "hades_trees:birch_tree", "hades_trees:birch_tree" },
		{ "hades_trees:birch_tree", "hades_trees:birch_tree" },
	}
})
minetest.register_craft({
	output = "hades_trees:jungle_bark 3",
	recipe = {
		{ "hades_trees:jungle_tree", "hades_trees:jungle_tree" },
		{ "hades_trees:jungle_tree", "hades_trees:jungle_tree" },
	}
})
minetest.register_craft({
	output = "hades_trees:pale_bark 3",
	recipe = {
		{ "hades_trees:pale_tree", "hades_trees:pale_tree" },
		{ "hades_trees:pale_tree", "hades_trees:pale_tree" },
	}
})
minetest.register_craft({
	output = "hades_trees:jungle_bark 3",
	recipe = {
		{ "hades_trees:jungle_tree", "hades_trees:jungle_tree" },
		{ "hades_trees:jungle_tree", "hades_trees:jungle_tree" },
	}
})

-- Sapling crafting
minetest.register_craft({
	output = 'hades_trees:sapling',
	recipe = {
		{'hades_core:cactus', '', ''},
		{'hades_core:dirt', '', ''},
	}
})

minetest.register_craft({
	output = 'hades_trees:sapling',
	recipe = {
		{'hades_trees:apple', '', ''},
		{'hades_core:dirt', '', ''},
	}
})

minetest.register_craft({
	output = 'hades_trees:pale_sapling',
	recipe = {
		{'', 'hades_trees:sapling', ''},
		{'', 'hades_trees:sapling', ''},
		{'hades_core:ash', 'hades_core:dirt', 'hades_core:ash'},
	}
})

minetest.register_craft({
	output = 'hades_trees:cultivated_jungle_sapling',
	recipe = {
		{'hades_trees:jungle_sapling'},
		{'hades_trees:jungle_sapling'},
		{'hades_core:dirt'},
	}
})

minetest.register_craft({
	output = 'hades_trees:jungle_sapling',
	recipe = {
		{'hades_trees:sapling'},
		{'hades_grass:junglegrass'},
		{'hades_core:dirt'},
	}
})

minetest.register_craft({
	output = 'hades_trees:olive_sapling',
	recipe = {
		{'hades_trees:sapling'},
		{'hades_grass:grass_1'},
		{'hades_core:dirt'},
	}
})

minetest.register_craft({
	output = 'hades_trees:birch_sapling',
	recipe = {
		{'hades_trees:sapling'},
		{'hades_trees:pale_sapling'},
		{'hades_core:dirt'},
	}
})

minetest.register_craft({
	output = 'hades_trees:orange_sapling',
	recipe = {
		{'hades_trees:sapling'},
		{'hades_trees:jungle_sapling'},
		{'hades_core:dirt'},
	}
})

minetest.register_craft({
	output = 'hades_trees:banana_sapling',
	recipe = {
		{'hades_trees:jungle_sapling'},
		{'hades_grass:junglegrass'},
		{'hades_core:dirt'},
	}
})

minetest.register_craft({
	output = 'hades_trees:canvas_sapling',
	recipe = {
		{'hades_flowers:white'},
		{'hades_trees:pale_sapling'},
		{'hades_core:dirt'},
	}
})

minetest.register_craft({
	output = 'hades_core:paper',
	recipe = {
		{'hades_trees:canvas_leaves', 'hades_trees:canvas_leaves', 'hades_trees:canvas_leaves'},
		{'hades_trees:canvas_leaves', 'hades_trees:canvas_leaves', 'hades_trees:canvas_leaves'},
		{'hades_trees:canvas_leaves', 'hades_trees:canvas_leaves', 'hades_trees:canvas_leaves'},
	}
})

-- TODO: Cocoa sapling

-- Fuel
minetest.register_craft({
	type = "fuel",
	recipe = "group:tree",
	burntime = 20,
})

minetest.register_craft({
	type = "fuel",
	recipe = "group:leaves",
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "group:sapling",
	burntime = 10,
})

minetest.register_craft({
	type = "fuel",
	recipe = "hades_trees:apple",
	burntime = 3,
})


