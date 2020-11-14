-- Global farming namespace
farming = {}
farming.path = minetest.get_modpath("farming")
local S = minetest.get_translator("farming")

-- Load files
dofile(farming.path .. "/api.lua")
dofile(farming.path .. "/nodes.lua")
dofile(farming.path .. "/hoes.lua")

-- WHEAT
farming.register_plant("farming:wheat", {
	description = S("Wheat Seed"),
	_tt_help = S("Grows on Wet Soil in light"),
	inventory_image = "farming_wheat_seed.png",
	steps = 3,
	minlight = 13,
	maxlight = minetest.LIGHT_MAX,
	fertility = {"grassland"}
})
minetest.register_craftitem("farming:wheat", {
	description = S("Wheat"),
	inventory_image = "farming_wheat.png",
})
minetest.register_craftitem("farming:flour", {
	description = S("Flour"),
	inventory_image = "farming_flour.png",
})

minetest.register_craftitem("farming:bread", {
	description = S("Bread"),
	inventory_image = "farming_bread.png",
	on_use = minetest.item_eat(3),
	groups = { food = 2, eatable = 3 },
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:flour 1",
	recipe = {"farming:seed_wheat", "farming:seed_wheat", "farming:seed_wheat", "farming:seed_wheat", "farming:seed_wheat", "farming:seed_wheat", "farming:seed_wheat", "farming:seed_wheat", "farming:seed_wheat"}
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:seed_wheat 3",
	recipe = {"farming:wheat"}
})

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "farming:bread",
	recipe = "farming:flour"
})

-- Cotton
farming.register_plant("farming:cotton", {
	description = S("Cotton Seed"),
	_tt_help = S("Grows on Wet Soil in light"),
	description_harvest = S("String"),
	inventory_image = "farming_cotton_seed.png",
	steps = 3,
	minlight = 13,
	maxlight = minetest.LIGHT_MAX,
	fertility = {"grassland", "desert"}
})
minetest.register_craftitem("farming:cotton", {
	description = S("String"),
	inventory_image = "farming_cotton.png",
})

minetest.register_alias("farming:string", "farming:cotton")

minetest.register_craft({
	output = "wool:white",
	recipe = {
		{"farming:cotton", "farming:cotton"},
		{"farming:cotton", "farming:cotton"},
	}
})

-- Straw
minetest.register_craft({
    type = "shapeless",
	output = "farming:straw",
	recipe = {"farming:wheat", "farming:wheat", "farming:wheat", "farming:wheat"}
})

minetest.register_craft({
	output = "farming:wheat 4",
	recipe = {
		{"farming:straw"},
	}
})

--
-- hadesfood
--


farming.register_plant("farming:tomato", {
	description = S("Tomato Seed"),
	_tt_help = S("Grows on Wet Soil in light"),
	inventory_image = "farming_tomato_seed.png",
	steps = 3,
	minlight = 8,
	maxlight = 20,
	fertility = {"grassland", "desert"}
})
minetest.register_craftitem("farming:tomato", {
	description = S("Tomato"),
	inventory_image = "farming_tomato.png",
	groups = { food = 2, eatable = 2 },
	on_use = minetest.item_eat(2),
})

farming.register_plant("farming:potato", {
	description = S("Potato Seed"),
	_tt_help = S("Grows on Wet Soil in light"),
	inventory_image = "farming_potato_seed.png",
	steps = 3,
	minlight = 8,
	maxlight = 20,
	fertility = {"grassland", "desert"}
})
minetest.register_craftitem("farming:potato", {
	description = S("Potato"),
	inventory_image = "farming_potato.png",
	groups = { food = 2, },
	on_use = minetest.item_eat(0),
})

farming.register_plant("farming:strawberry", {
	description = S("Strawberry Seed"),
	_tt_help = S("Grows on Wet Soil in light"),
	inventory_image = "farming_strawberry_seed.png",
	steps = 3,
	minlight = 8,
	maxlight = 20,
	fertility = {"grassland", "desert"}
})
minetest.register_craftitem("farming:strawberry", {
	description = S("Strawberry"),
	inventory_image = "farming_strawberry.png",
	groups = { food = 2, eatable = 1 },
	on_use = minetest.item_eat(1),
})

farming.register_plant("farming:spice", {
	description = S("Spice Seed"),
	_tt_help = S("Grows on Wet Soil in light"),
	inventory_image = "farming_spice_seed.png",
	steps = 3,
	minlight = 8,
	maxlight = 20,
	fertility = {"grassland", "desert"}
})
minetest.register_craftitem("farming:spice", {
	description = S("Spice"),
	inventory_image = "farming_spice.png",
})


minetest.register_craft({
	output = 'farming:flowergrass',
	recipe = {
		{'hades_flowers:dandelion_white', 'hades_flowers:dandelion_yellow', 'hades_flowers:geranium'},
		{'hades_flowers:rose', 'hades_flowers:tulip', 'hades_flowers:viola'},
		{'hades_core:grass_1', 'hades_core:dirt', 'hades_core:grass_1'},
	}
})

minetest.register_craft({
	output = 'farming:seed_tomato',
	recipe = {{'farming:tomato'},}
})

minetest.register_craft({
	output = 'farming:seed_strawberry',
	recipe = {{'farming:strawberry'},}
})

minetest.register_craft({
	output = 'farming:seed_potato',
	recipe = {{'farming:potato'},}
})

minetest.register_craft({
	output = 'farming:seed_spice',
	recipe = {{'farming:spice'},}
})


