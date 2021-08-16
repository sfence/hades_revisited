local S = minetest.get_translator("hades_food")

-- ITEMS

minetest.register_node("hades_food:plate", {
	description = S("Plate"),
	inventory_image = "default_plate.png",
	wield_image = "default_plate.png",
	tiles = { "default_plate.png" },
	drawtype = "signlike",
	paramtype = "light",
	paramtype2 = "wallmounted",
	is_ground_content = false,
	floodable = true,
	sounds = hades_sounds.node_sound_stone_defaults(),
	groups = {dig_immediate=3, attached_node=1},
	on_rotate = false,
	walkable = false,
	selection_box = {
		type = "wallmounted",
	},
})

minetest.register_craftitem("hades_food:pie_strawberry_raw", {
	description = S("Raw Strawberry Pie"),
	inventory_image = "default_strawberry_pie_raw.png",
	on_use = minetest.item_eat(3),
	groups = { food = 2, eatable = 3 },
})

minetest.register_craftitem("hades_food:pie_strawberry", {
	description = S("Strawberry Pie"),
	inventory_image = "default_strawberry_pie.png",
	on_use = minetest.item_eat(5),
	groups = { food = 2, eatable = 5 },
})

minetest.register_craftitem("hades_food:bottle_olive_oil", {
	description = S("Bottle of Olive Oil"),
	inventory_image = "default_bottle_olive_oil.png",
	on_use = minetest.item_eat(3, "vessels:glass_bottle"),
	groups = { food = 3, eatable = 3 },
})

minetest.register_craftitem("hades_food:tomatosalad", {
	description = S("Tomato Salad"),
	inventory_image = "default_tomatosalad.png",
	on_use = minetest.item_eat(6, "hades_food:plate"),
	groups = { food = 2, eatable = 6 },
})

minetest.register_craftitem("hades_food:tomato_potato_salad", {
	description = S("Tomato-Potato Salad"),
	inventory_image = "default_tpsalad.png",
	on_use = minetest.item_eat(8, "hades_food:plate"),
	groups = { food = 2, eatable = 8 },
})

minetest.register_craftitem("hades_food:spiced_potato", {
	description = S("Spiced Potato"),
	inventory_image = "default_spiced_potato.png",
	on_use = minetest.item_eat(0),
	groups = { food = 2 },
})

minetest.register_craftitem("hades_food:baked_potato", {
	description = S("Baked Potato"),
	inventory_image = "default_baked_potato.png",
	on_use = minetest.item_eat(4),
	groups = { food = 2, eatable = 4 },
})

minetest.register_craftitem("hades_food:pie_apple_raw", {
	description = S("Raw Apple Pie"),
	inventory_image = "default_apple_pie_raw.png",
	on_use = minetest.item_eat(3),
	groups = { food = 2, eatable = 3 },
})

minetest.register_craftitem("hades_food:pie_apple", {
	description = S("Apple Pie"),
	inventory_image = "default_apple_pie.png",
	on_use = minetest.item_eat(5),
	groups = { food = 2, eatable = 5 },
})

-- CRAFTING

minetest.register_craft({
	output = 'hades_food:pie_strawberry_raw',
	recipe = {
		{'', 'hades_core:sugar', ''},
		{'hades_farming:strawberry', 'hades_farming:strawberry', 'hades_farming:strawberry'},
		{'hades_core:sugar', 'hades_farming:flour', 'hades_core:sugar'},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "hades_food:pie_strawberry",
	recipe = "hades_food:pie_strawberry_raw",
	cooktime = 10,
})

minetest.register_craft({
	output = 'hades_food:pie_apple_raw',
	recipe = {
		{'', 'hades_core:sugar', ''},
		{'hades_trees:apple', 'hades_trees:apple', 'hades_trees:apple'},
		{'hades_core:sugar', 'hades_farming:flour', 'hades_core:sugar'},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "hades_food:pie_apple",
	recipe = "hades_food:pie_apple_raw",
	cooktime = 10,
})

minetest.register_craft({
	output = 'hades_food:bottle_olive_oil',
	recipe = {
		{'hades_trees:olive', 'hades_trees:olive', 'hades_trees:olive'},
		{'', 'vessels:glass_bottle', ''},
	}
})

minetest.register_craft({
	output = 'hades_food:tomatosalad 2',
	recipe = {
		{'hades_farming:spice', 'hades_food:bottle_olive_oil', 'hades_farming:spice'},
		{'hades_farming:tomato', 'hades_farming:tomato', 'hades_farming:tomato'},
		{'hades_food:plate', 'hades_farming:bread', 'hades_food:plate'},
	},
	replacements = {
		{'hades_food:bottle_olive_oil', 'vessels:glass_bottle'},
	}
})

minetest.register_craft({
	type = "shapeless",
	output = 'hades_food:tomato_potato_salad',
	recipe = {'hades_food:tomatosalad', 'hades_food:baked_potato'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'hades_food:spiced_potato',
	recipe = {'hades_farming:spice', 'hades_farming:potato'},
})

minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "hades_food:baked_potato",
	recipe = "hades_food:spiced_potato",
})

minetest.register_craft({
	output = 'hades_food:plate 10',
	recipe = {
		{'', 'hades_core:clay', ''},
		{'hades_core:clay', 'hades_core:clay', 'hades_core:clay'},
		{'', 'hades_core:clay', ''},
	}
})


