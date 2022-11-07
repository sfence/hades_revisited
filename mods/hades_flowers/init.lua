local S = minetest.get_translator("hades_flowers")

-- See README.txt for licensing and other information.

hades_flowers = {}

-- Aliases for original flowers mod
minetest.register_alias("flowers:dandelion_white", "hades_flowers:white")
minetest.register_alias("flowers:dandelion_yellow", "hades_flowers:yellow")
minetest.register_alias("flowers:geranium", "hades_flowers:blue")
minetest.register_alias("flowers:rose", "hades_flowers:red")
minetest.register_alias("flowers:tulip", "hades_flowers:orange")
minetest.register_alias("flowers:viola", "hades_flowers:violet")

minetest.register_node("hades_flowers:white", {
	description = S("White Flower"),
	drawtype = "plantlike",
	tiles = { "hades_flowers_white.png" },
	use_texture_alpha = "clip",
	inventory_image = "hades_flowers_white.png",
	wield_image = "hades_flowers_white.png",
	waving = 1,
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	floodable = true,
	groups = {snappy=3,flammable=2,flower=1,flora=1,attached_node=1,color_white=1},
	sounds = hades_sounds.node_sound_grass_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.15, -0.5, -0.15, 0.15, 0.2, 0.15 },
	},
})

minetest.register_node("hades_flowers:yellow", {
	description = S("Yellow Flower"),
	drawtype = "plantlike",
	tiles = { "hades_flowers_yellow.png" },
	use_texture_alpha = "clip",
	inventory_image = "hades_flowers_yellow.png",
	wield_image = "hades_flowers_yellow.png",
	waving = 1,
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	floodable = true,
	groups = {snappy=3,flammable=2,flower=1,flora=1,attached_node=1,color_yellow=1},
	sounds = hades_sounds.node_sound_grass_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.27, -0.5, -0.27, 0.27, 0.2, 0.27 },
	},
})

minetest.register_node("hades_flowers:blue", {
	description = S("Blue Flower"),
	drawtype = "plantlike",
	tiles = { "hades_flowers_blue.png" },
	use_texture_alpha = "clip",
	inventory_image = "hades_flowers_blue.png",
	wield_image = "hades_flowers_blue.png",
	waving = 1,
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	floodable = true,
	groups = {snappy=3,flammable=2,flower=1,flora=1,attached_node=1,color_blue=1},
	sounds = hades_sounds.node_sound_grass_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.175, -0.5, -0.175, 0.175, 0.35, 0.175 },
	},
})

minetest.register_node("hades_flowers:red", {
	description = S("Red Flower"),
	drawtype = "plantlike",
	tiles = { "hades_flowers_red.png" },
	use_texture_alpha = "clip",
	inventory_image = "hades_flowers_red.png",
	wield_image = "hades_flowers_red.png",
	waving = 1,
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	floodable = true,
	groups = {snappy=3,flammable=2,flower=1,flora=1,attached_node=1,color_red=1},
	sounds = hades_sounds.node_sound_grass_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.15, -0.5, -0.15, 0.15, 0.3, 0.15 },
	},
})

minetest.register_node("hades_flowers:orange", {
	description = S("Orange Flower"),
	drawtype = "plantlike",
	tiles = { "hades_flowers_orange.png" },
	use_texture_alpha = "clip",
	inventory_image = "hades_flowers_orange.png",
	wield_image = "hades_flowers_orange.png",
	waving = 1,
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	floodable = true,
	groups = {snappy=3,flammable=2,flower=1,flora=1,attached_node=1,color_orange=1},
	sounds = hades_sounds.node_sound_grass_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.15, -0.5, -0.15, 0.15, 0.25, 0.15 },
	},
})

minetest.register_node("hades_flowers:violet", {
	description = S("Violet Flower"),
	drawtype = "plantlike",
	tiles = { "hades_flowers_violet.png" },
	use_texture_alpha = "clip",
	inventory_image = "hades_flowers_violet.png",
	wield_image = "hades_flowers_violet.png",
	waving = 1,
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	floodable = true,
	groups = {snappy=3,flammable=2,flower=1,flora=1,attached_node=1,color_violet=1},
	sounds = hades_sounds.node_sound_grass_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.15, -0.5, -0.15, 0.15, 0.2, 0.15 },
	},
})

function hades_flowers.flower_spread_func(pos, node)
	pos.y = pos.y - 1
	local under = minetest.get_node(pos)
	pos.y = pos.y + 1
	if under.name ~= "hades_core:dirt_with_grass" then
		return
	end


	local light = minetest.get_node_light(pos)
	if not light or light < 8 then
		return
	end


	local pos0 = {x=pos.x-4,y=pos.y-4,z=pos.z-4}
	local pos1 = {x=pos.x+4,y=pos.y+4,z=pos.z+4}

	local hades_flowers = minetest.find_nodes_in_area(pos0, pos1, "group:flora")
	if #hades_flowers > 3 then
		return
	end


	local seedling = minetest.find_nodes_in_area(pos0, pos1, "hades_core:dirt_with_grass")
	if #seedling > 0 then
		seedling = seedling[math.random(#seedling)]
		seedling.y = seedling.y + 1
		light = minetest.get_node_light(seedling)
		if not light or light < 8 then
			return
		end
		if minetest.get_node(seedling).name == "air" then
			minetest.set_node(seedling, {name=node.name})
		end
	end
end

minetest.register_abm({
	label = "Flora spread",
	nodenames = {"group:flora"},
	--neighbors = {"hades_core:dirt_with_grass"},
	--neighbors = {"group:flora_soil"},
	interval = 50,
	chance = 30,
	action = function(pos, node)
		local def = minetest.registered_nodes[node.name]
		local flora_spread_func = def._hades_flora_spread_func or hades_flowers.flower_spread_func
		flora_spread_func(pos, node)
	end,
})

minetest.register_craft({
	output = 'hades_flowers:white',
	recipe = {
		{'hades_farming:seed_cotton', 'hades_farming:seed_cotton', 'hades_farming:seed_cotton'},
        {'hades_grass:grass_1', 'hades_grass:grass_1', 'hades_grass:grass_1'},
		{'hades_core:dirt', 'hades_core:dirt', 'hades_core:dirt'},
	}
})
minetest.register_craft({
	output = 'hades_flowers:yellow',
	recipe = {
		{'hades_flowers:white', 'hades_flowers:white', 'hades_flowers:white'},
        {'hades_grass:grass_1', 'hades_core:gold_lump', 'hades_grass:grass_1'},
		{'hades_core:dirt', 'hades_core:dirt', 'hades_core:dirt'},
	}
})
minetest.register_craft({
	output = 'hades_flowers:red',
	recipe = {
		{'hades_flowers:white', 'hades_flowers:white', 'hades_flowers:white'},
        {'hades_grass:grass_1', 'hades_core:ruby', 'hades_grass:grass_1'},
		{'hades_core:dirt', 'hades_core:dirt', 'hades_core:dirt'},
	}
})
minetest.register_craft({
	output = 'hades_flowers:violet',
	recipe = {
		{'hades_flowers:red', 'hades_flowers:red', 'hades_flowers:red'},
        {'hades_flowers:blue', 'hades_flowers:blue', 'hades_flowers:blue'},
		{'hades_core:dirt', 'hades_core:dirt', 'hades_core:dirt'},
	}
})
minetest.register_craft({
	output = 'hades_flowers:blue',
	recipe = {
	    {'hades_flowers:white', 'hades_flowers:white', 'hades_flowers:white'},
        {'hades_grass:grass_1', 'hades_core:sapphire', 'hades_grass:grass_1'},
		{'hades_core:dirt', 'hades_core:dirt', 'hades_core:dirt'},
	}
})
minetest.register_craft({
	output = 'hades_flowers:orange',
	recipe = {
		{'hades_flowers:yellow', 'hades_flowers:yellow', 'hades_flowers:yellow'},
        {'hades_flowers:red', 'hades_flowers:red', 'hades_flowers:red'},
		{'hades_core:dirt', 'hades_core:dirt', 'hades_core:dirt'},
	}
})


