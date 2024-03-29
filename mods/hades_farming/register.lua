local S = minetest.get_translator("hades_farming")
local NS = function(s) return s end

-- WHEAT
hades_farming.register_plant("hades_farming:wheat", {
	description_seed = S("Wheat Seed"),
	description_plant = NS("Wheat Plant (@1)"),
	_tt_help = S("Grows on Wet Soil in light"),
	inventory_image = "hades_farming_wheat_seed.png",
	steps = 3,
	fertility = {"grassland"},
	meshoptions = 3,
})
minetest.register_craftitem("hades_farming:wheat", {
	description = S("Wheat"),
	inventory_image = "hades_farming_wheat.png",
})
minetest.register_craftitem("hades_farming:flour", {
	description = S("Flour"),
	inventory_image = "hades_farming_flour.png",
})

minetest.register_craftitem("hades_farming:bread", {
	description = S("Bread"),
	inventory_image = "hades_farming_bread.png",
	on_use = minetest.item_eat(3),
	groups = { food = 2, eatable = 3 },
})

minetest.register_craft({
	type = "shapeless",
	output = "hades_farming:flour 1",
	recipe = {"hades_farming:seed_wheat", "hades_farming:seed_wheat", "hades_farming:seed_wheat", "hades_farming:seed_wheat", "hades_farming:seed_wheat", "hades_farming:seed_wheat", "hades_farming:seed_wheat", "hades_farming:seed_wheat", "hades_farming:seed_wheat"}
})

minetest.register_craft({
	type = "shapeless",
	output = "hades_farming:seed_wheat 3",
	recipe = {"hades_farming:wheat"}
})

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "hades_farming:bread",
	recipe = "hades_farming:flour"
})

-- Straw
minetest.register_craft({
    type = "shapeless",
	output = "hades_farming:straw",
	recipe = {"hades_farming:wheat", "hades_farming:wheat", "hades_farming:wheat", "hades_farming:wheat"}
})

minetest.register_craft({
	output = "hades_farming:wheat 4",
	recipe = {
		{"hades_farming:straw"},
	}
})

-- COTTON
hades_farming.register_plant("hades_farming:cotton", {
	description_seed = S("Cotton Seed"),
	description_plant = NS("Cotton Plant (@1)"),
	_tt_help = S("Grows on Wet Soil in light"),
	description_harvest = S("String"),
	inventory_image = "hades_farming_cotton_seed.png",
	steps = 3,
	fertility = {"grassland", "desert"},
	meshoptions = 0,
})
minetest.register_craftitem("hades_farming:cotton", {
	description = S("String"),
	inventory_image = "hades_farming_cotton.png",
})
minetest.register_craft({
	output = "hades_cloth:white",
	recipe = {
		{"hades_farming:cotton", "hades_farming:cotton"},
		{"hades_farming:cotton", "hades_farming:cotton"},
	}
})

minetest.register_alias("hades_farming:string", "hades_farming:cotton")

-- TOMATO
hades_farming.register_plant("hades_farming:tomato", {
	description_seed = S("Tomato Seed"),
	description_plant = NS("Tomato Plant (@1)"),
	_tt_help = S("Grows on Wet Soil in light"),
	inventory_image = "hades_farming_tomato_seed.png",
	steps = 3,
	fertility = {"grassland", "desert"},
	meshoptions = 0,
})
minetest.register_craftitem("hades_farming:tomato", {
	description = S("Tomato"),
	inventory_image = "hades_farming_tomato.png",
	groups = { food = 2, eatable = 2 },
	on_use = minetest.item_eat(2),
})
minetest.register_craft({
	output = 'hades_farming:seed_tomato',
	recipe = {{'hades_farming:tomato'},}
})

-- POTATO
hades_farming.register_plant("hades_farming:potato", {
	description_seed = S("Sprouting Potato"),
	description_plant = NS("Potato Plant (@1)"),
	_tt_help = S("Grows on Wet Soil in light"),
	inventory_image = "hades_farming_potato_seed.png",
	steps = 3,
	fertility = {"grassland", "desert"},
	meshoptions = 1,
})
minetest.register_craftitem("hades_farming:potato", {
	description = S("Potato"),
	inventory_image = "hades_farming_potato.png",
	groups = { food = 2, },
	on_use = minetest.item_eat(0),
})
minetest.register_craft({
	output = 'hades_farming:seed_potato',
	recipe = {{'hades_farming:potato'},}
})

-- STRAWBERRY
hades_farming.register_plant("hades_farming:strawberry", {
	description_seed = S("Strawberry Seed"),
	description_plant = NS("Strawberry Bush (@1)"),
	_tt_help = S("Grows on Wet Soil in light"),
	inventory_image = "hades_farming_strawberry_seed.png",
	steps = 3,
	fertility = {"grassland", "desert"},
	meshoptions = 2,
})
minetest.register_craftitem("hades_farming:strawberry", {
	description = S("Strawberry"),
	inventory_image = "hades_farming_strawberry.png",
	groups = { food = 2, eatable = 1 },
	on_use = minetest.item_eat(1),
})
minetest.register_craft({
	output = 'hades_farming:seed_strawberry',
	recipe = {{'hades_farming:strawberry'},}
})


-- SPICE
hades_farming.register_plant("hades_farming:spice", {
	description_seed = S("Spice Seed"),
	description_plant = NS("Spice Shrub (@1)"),
	_tt_help = S("Grows on Wet Soil in light"),
	inventory_image = "hades_farming_spice_seed.png",
	steps = 3,
	fertility = {"grassland", "desert"},
	meshoptions = 4,
})
minetest.register_craftitem("hades_farming:spice", {
	description = S("Spice"),
	inventory_image = "hades_farming_spice.png",
})
minetest.register_craft({
	output = 'hades_farming:seed_spice',
	recipe = {{'hades_farming:spice'},}
})
