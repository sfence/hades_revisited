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
	output = 'hades_trees:birch_wood 4',
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
	output = 'hades_trees:colwood_black',
	recipe = {
		{'group:wood', 'dye:black'},
	}
})

minetest.register_craft({
	output = 'hades_trees:colwood_blue',
	recipe = {
		{'group:wood', 'dye:blue'},
	}
})

minetest.register_craft({
	output = 'hades_trees:colwood_brown',
	recipe = {
		{'group:wood', 'dye:brown'},
	}
})

minetest.register_craft({
	output = 'hades_trees:colwood_cyan',
	recipe = {
		{'group:wood', 'dye:cyan'},
	}
})

minetest.register_craft({
	output = 'hades_trees:colwood_dark_green',
	recipe = {
		{'group:wood', 'dye:dark_green'},
	}
})

minetest.register_craft({
	output = 'hades_trees:colwood_dark_grey',
	recipe = {
		{'group:wood', 'dye:dark_grey'},
	}
})

minetest.register_craft({
	output = 'hades_trees:colwood_green',
	recipe = {
		{'group:wood', 'dye:green'},
	}
})

minetest.register_craft({
	output = 'hades_trees:colwood_grey',
	recipe = {
		{'group:wood', 'dye:grey'},
	}
})

minetest.register_craft({
	output = 'hades_trees:colwood_magenta',
	recipe = {
		{'group:wood', 'dye:magenta'},
	}
})

minetest.register_craft({
	output = 'hades_trees:colwood_orange',
	recipe = {
		{'group:wood', 'dye:orange'},
	}
})

minetest.register_craft({
	output = 'hades_trees:colwood_pink',
	recipe = {
		{'group:wood', 'dye:pink'},
	}
})

minetest.register_craft({
	output = 'hades_trees:colwood_red',
	recipe = {
		{'group:wood', 'dye:red'},
	}
})

minetest.register_craft({
	output = 'hades_trees:colwood_violet',
	recipe = {
		{'group:wood', 'dye:violet'},
	}
})

minetest.register_craft({
	output = 'hades_trees:colwood_white',
	recipe = {
		{'group:wood', 'dye:white'},
	}
})

minetest.register_craft({
	output = 'hades_trees:colwood_yellow',
	recipe = {
		{'group:wood', 'dye:yellow'},
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

-- Tiles

minetest.register_craft({
	output = 'hades_trees:floor_wood_jungle 4',
	recipe = {
		{'hades_trees:wood', 'hades_trees:jungle_wood'},
		{'hades_trees:jungle_wood', 'hades_trees:wood'},
	}
})

minetest.register_craft({
	output = 'hades_trees:floor_wood_pale 4',
	recipe = {
		{'hades_trees:wood', 'hades_trees:pale_wood'},
		{'hades_trees:pale_wood', 'hades_trees:wood'},
	}
})

-- Sapling crafting
minetest.register_craft({
	output = 'hades_trees:floor_pale_jungle 4',
	recipe = {
		{'hades_trees:jungle_wood', 'hades_trees:pale_wood'},
		{'hades_trees:pale_wood', 'hades_trees:jungle_wood'},
	}
})

minetest.register_craft({
	output = 'hades_trees:sapling',
	recipe = {
		{'default:cactus', '', ''},
		{'default:dirt', '', ''},
	}
})

minetest.register_craft({
	output = 'hades_trees:sapling',
	recipe = {
		{'hades_trees:apple', '', ''},
		{'default:dirt', '', ''},
	}
})

minetest.register_craft({
	output = 'hades_trees:pale_sapling',
	recipe = {
		{'', 'hades_trees:sapling', ''},
		{'', 'hades_trees:sapling', ''},
		{'default:ash', 'default:dirt', 'default:ash'},
	}
})

minetest.register_craft({
	output = 'hades_trees:cultivated_jungle_sapling',
	recipe = {
		{'hades_trees:jungle_sapling'},
		{'hades_trees:jungle_sapling'},
		{'default:dirt'},
	}
})

minetest.register_craft({
	output = 'hades_trees:jungle_sapling',
	recipe = {
		{'hades_trees:sapling'},
		{'default:junglegrass'},
		{'default:dirt'},
	}
})

minetest.register_craft({
	output = 'hades_trees:olive_sapling',
	recipe = {
		{'hades_trees:sapling'},
		{'default:grass_1'},
		{'default:dirt'},
	}
})

minetest.register_craft({
	output = 'hades_trees:birch_sapling',
	recipe = {
		{'hades_trees:sapling'},
		{'hades_trees:pale_sapling'},
		{'default:dirt'},
	}
})

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


