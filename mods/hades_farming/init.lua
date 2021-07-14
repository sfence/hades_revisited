-- Global hades_farming namespace
hades_farming = {}
hades_farming.path = minetest.get_modpath("hades_farming")
local S = minetest.get_translator("hades_farming")
local N = function(s) return s end

-- Load files
dofile(hades_farming.path .. "/api.lua")
dofile(hades_farming.path .. "/nodes.lua")
dofile(hades_farming.path .. "/hoes.lua")

-- WHEAT
hades_farming.register_plant("hades_farming:wheat", {
	description_seed = S("Wheat Seed"),
	description_plant = N("Wheat Plant (@1)"),
	_tt_help = S("Grows on Wet Soil in light"),
	inventory_image = "hades_farming_wheat_seed.png",
	steps = 3,
	fertility = {"grassland"}
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

-- Cotton
hades_farming.register_plant("hades_farming:cotton", {
	description_seed = S("Cotton Seed"),
	description_plant = N("Cotton Plant (@1)"),
	_tt_help = S("Grows on Wet Soil in light"),
	description_harvest = S("String"),
	inventory_image = "hades_farming_cotton_seed.png",
	steps = 3,
	fertility = {"grassland", "desert"}
})
minetest.register_craftitem("hades_farming:cotton", {
	description = S("String"),
	inventory_image = "hades_farming_cotton.png",
})

minetest.register_alias("hades_farming:string", "hades_farming:cotton")

minetest.register_craft({
	output = "wool:white",
	recipe = {
		{"hades_farming:cotton", "hades_farming:cotton"},
		{"hades_farming:cotton", "hades_farming:cotton"},
	}
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

--
-- hadesfood
--


hades_farming.register_plant("hades_farming:tomato", {
	description_seed = S("Tomato Seed"),
	description_plant = N("Tomato Plant (@1)"),
	_tt_help = S("Grows on Wet Soil in light"),
	inventory_image = "hades_farming_tomato_seed.png",
	steps = 3,
	fertility = {"grassland", "desert"}
})
minetest.register_craftitem("hades_farming:tomato", {
	description = S("Tomato"),
	inventory_image = "hades_farming_tomato.png",
	groups = { food = 2, eatable = 2 },
	on_use = minetest.item_eat(2),
})

hades_farming.register_plant("hades_farming:potato", {
	description_seed = S("Sprouting Potato"),
	description_plant = N("Potato Plant (@1)"),
	_tt_help = S("Grows on Wet Soil in light"),
	inventory_image = "hades_farming_potato_seed.png",
	steps = 3,
	fertility = {"grassland", "desert"}
})
minetest.register_craftitem("hades_farming:potato", {
	description = S("Potato"),
	inventory_image = "hades_farming_potato.png",
	groups = { food = 2, },
	on_use = minetest.item_eat(0),
})

hades_farming.register_plant("hades_farming:strawberry", {
	description_seed = S("Strawberry Seed"),
	description_plant = N("Strawberry Bush (@1)"),
	_tt_help = S("Grows on Wet Soil in light"),
	inventory_image = "hades_farming_strawberry_seed.png",
	steps = 3,
	fertility = {"grassland", "desert"}
})
minetest.register_craftitem("hades_farming:strawberry", {
	description = S("Strawberry"),
	inventory_image = "hades_farming_strawberry.png",
	groups = { food = 2, eatable = 1 },
	on_use = minetest.item_eat(1),
})

hades_farming.register_plant("hades_farming:spice", {
	description_seed = S("Spice Seed"),
	description_plant = N("Spice Shrub (@1)"),
	_tt_help = S("Grows on Wet Soil in light"),
	inventory_image = "hades_farming_spice_seed.png",
	steps = 3,
	fertility = {"grassland", "desert"}
})
minetest.register_craftitem("hades_farming:spice", {
	description = S("Spice"),
	inventory_image = "hades_farming_spice.png",
})


minetest.register_craft({
	output = 'hades_farming:seed_tomato',
	recipe = {{'hades_farming:tomato'},}
})

minetest.register_craft({
	output = 'hades_farming:seed_strawberry',
	recipe = {{'hades_farming:strawberry'},}
})

minetest.register_craft({
	output = 'hades_farming:seed_potato',
	recipe = {{'hades_farming:potato'},}
})

minetest.register_craft({
	output = 'hades_farming:seed_spice',
	recipe = {{'hades_farming:spice'},}
})


