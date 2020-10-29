local S = minetest.get_translator("flowers")

-- Minetest 0.4 mod: default
-- See README.txt for licensing and other information.

-- Aliases for original flowers mod
minetest.register_alias("flowers:flower_dandelion_white", "flowers:dandelion_white")
minetest.register_alias("flowers:flower_dandelion_yellow", "flowers:dandelion_yellow")
minetest.register_alias("flowers:flower_geranium", "flowers:geranium")
minetest.register_alias("flowers:flower_rose", "flowers:rose")
minetest.register_alias("flowers:flower_tulip", "flowers:tulip")
minetest.register_alias("flowers:flower_viola", "flowers:viola")

minetest.register_node("flowers:dandelion_white", {
	description = S("White Flower"),
	drawtype = "plantlike",
	tiles = { "flowers_dandelion_white.png" },
	inventory_image = "flowers_dandelion_white.png",
	wield_image = "flowers_dandelion_white.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	groups = {snappy=3,flammable=2,flower=1,flora=1,attached_node=1,color_white=1},
	sounds = hades_sounds.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.15, -0.5, -0.15, 0.15, 0.2, 0.15 },
	},
})

minetest.register_node("flowers:dandelion_yellow", {
	description = S("Yellow Flower"),
	drawtype = "plantlike",
	tiles = { "flowers_dandelion_yellow.png" },
	inventory_image = "flowers_dandelion_yellow.png",
	wield_image = "flowers_dandelion_yellow.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	groups = {snappy=3,flammable=2,flower=1,flora=1,attached_node=1,color_yellow=1},
	sounds = hades_sounds.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.27, -0.5, -0.27, 0.27, 0.2, 0.27 },
	},
})

minetest.register_node("flowers:geranium", {
	description = S("Blue Flower"),
	drawtype = "plantlike",
	tiles = { "flowers_geranium.png" },
	inventory_image = "flowers_geranium.png",
	wield_image = "flowers_geranium.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	groups = {snappy=3,flammable=2,flower=1,flora=1,attached_node=1,color_blue=1},
	sounds = hades_sounds.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.175, -0.5, -0.175, 0.175, 0.35, 0.175 },
	},
})

minetest.register_node("flowers:rose", {
	description = S("Red Flower"),
	drawtype = "plantlike",
	tiles = { "flowers_rose.png" },
	inventory_image = "flowers_rose.png",
	wield_image = "flowers_rose.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	groups = {snappy=3,flammable=2,flower=1,flora=1,attached_node=1,color_red=1},
	sounds = hades_sounds.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.15, -0.5, -0.15, 0.15, 0.3, 0.15 },
	},
})

minetest.register_node("flowers:tulip", {
	description = S("Orange Flower"),
	drawtype = "plantlike",
	tiles = { "flowers_tulip.png" },
	inventory_image = "flowers_tulip.png",
	wield_image = "flowers_tulip.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	groups = {snappy=3,flammable=2,flower=1,flora=1,attached_node=1,color_orange=1},
	sounds = hades_sounds.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.15, -0.5, -0.15, 0.15, 0.25, 0.15 },
	},
})

minetest.register_node("flowers:viola", {
	description = S("Violet Flower"),
	drawtype = "plantlike",
	tiles = { "flowers_viola.png" },
	inventory_image = "flowers_viola.png",
	wield_image = "flowers_viola.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	groups = {snappy=3,flammable=2,flower=1,flora=1,attached_node=1,color_violet=1},
	sounds = hades_sounds.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = { -0.15, -0.5, -0.15, 0.15, 0.2, 0.15 },
	},
})


minetest.register_abm({
	label = "Flora spread and wither",
	nodenames = {"group:flora"},
	neighbors = {"hades_core:dirt_with_grass", "hades_core:fertile_sand"},
	interval = 50,
	chance = 30,
	action = function(pos, node)
		pos.y = pos.y - 1
		local under = minetest.get_node(pos)
		pos.y = pos.y + 1
		if under.name == "hades_core:fertile_sand" then
			minetest.set_node(pos, {name="hades_core:dry_shrub"})
		elseif under.name ~= "hades_core:dirt_with_grass" then
			return
		end


		local light = minetest.get_node_light(pos)
		if not light or light < 8 then
			return
		end


		local pos0 = {x=pos.x-4,y=pos.y-4,z=pos.z-4}
		local pos1 = {x=pos.x+4,y=pos.y+4,z=pos.z+4}

		local flowers = minetest.find_nodes_in_area(pos0, pos1, "group:flora")
		if #flowers > 3 then
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
	end,
})

minetest.register_craft({
	output = 'flowers:dandelion_white',
	recipe = {
		{'farming:seed_cotton', 'farming:seed_cotton', 'farming:seed_cotton'},
        {'hades_core:grass_1', 'hades_core:grass_1', 'hades_core:grass_1'},
		{'hades_core:dirt', 'hades_core:dirt', 'hades_core:dirt'},
	}
})
minetest.register_craft({
	output = 'flowers:dandelion_yellow',
	recipe = {
		{'flowers:dandelion_white', 'flowers:dandelion_white', 'flowers:dandelion_white'},
        {'hades_core:grass_1', 'hades_core:gold_lump', 'hades_core:grass_1'},
		{'hades_core:dirt', 'hades_core:dirt', 'hades_core:dirt'},
	}
})
minetest.register_craft({
	output = 'flowers:rose',
	recipe = {
		{'flowers:dandelion_white', 'flowers:dandelion_white', 'flowers:dandelion_white'},
        {'hades_core:grass_1', 'hades_core:ruby', 'hades_core:grass_1'},
		{'hades_core:dirt', 'hades_core:dirt', 'hades_core:dirt'},
	}
})
minetest.register_craft({
	output = 'flowers:viola',
	recipe = {
		{'flowers:rose', 'flowers:rose', 'flowers:rose'},
        {'flowers:geranium', 'flowers:geranium', 'flowers:geranium'},
		{'hades_core:dirt', 'hades_core:dirt', 'hades_core:dirt'},
	}
})
minetest.register_craft({
	output = 'flowers:geranium',
	recipe = {
	    {'flowers:dandelion_white', 'flowers:dandelion_white', 'flowers:dandelion_white'},
        {'hades_core:grass_1', 'hades_core:sapphire', 'hades_core:grass_1'},
		{'hades_core:dirt', 'hades_core:dirt', 'hades_core:dirt'},
	}
})
minetest.register_craft({
	output = 'flowers:tulip',
	recipe = {
		{'flowers:dandelion_yellow', 'flowers:dandelion_yellow', 'flowers:dandelion_yellow'},
        {'flowers:rose', 'flowers:rose', 'flowers:rose'},
		{'hades_core:dirt', 'hades_core:dirt', 'hades_core:dirt'},
	}
})


