local S = minetest.get_translator("hades_grass")

minetest.register_node("hades_grass:grass_1", {
	description = S("Grass Clump"),
	drawtype = "plantlike",
	tiles = {"hades_grass_plant_colorable_1.png"},
	-- use a bigger inventory image
	inventory_image = "hades_grass_plant_colorable_3.png",
	wield_image = "hades_grass_plant_colorable_3.png",
	paramtype = "light",
	paramtype2 = "color",
	palette = "hades_core_palette_grass.png",
	color = "#AEFF5F",
	waving = 1,
	walkable = false,
	is_ground_content = true,
	buildable_to = true,
	floodable = true,
	groups = {snappy=3,flammable=3,flora=1,grass=1,attached_node=1},
	sounds = hades_sounds.node_sound_grass_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6/16, -0.5, -6/16, 6/16, -5/16, 6/16},
	},
	on_place = function(itemstack, placer, pointed_thing)
		-- place a random grass node
		local stack = ItemStack("hades_grass:grass_"..math.random(1,5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("hades_grass:grass_1 "..itemstack:get_count()-(1-ret:get_count()))
	end,
})

local drop_counts = { 1, 1, 2, 2, 3 }
for i=2,5 do
	minetest.register_node("hades_grass:grass_"..i, {
		description = S("Grass Clump (Stage @1)", i),
		drawtype = "plantlike",
		tiles = {"hades_grass_plant_colorable_"..i..".png"},
		inventory_image = "hades_grass_plant_colorable_"..i..".png",
		wield_image = "hades_grass_plant_colorable_"..i..".png",
		paramtype = "light",
		paramtype2 = "color",
		palette = "hades_core_palette_grass.png",
		color = "#AEFF5F",
		waving = 1,
		walkable = false,
		buildable_to = true,
		floodable = true,
		is_ground_content = true,
		drop = "hades_grass:grass_1 " .. drop_counts[i],
		groups = {snappy=3,flammable=3,flora=1,grass=1,attached_node=1,not_in_creative_inventory=1},
		sounds = hades_sounds.node_sound_grass_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6/16, -0.5, -6/16, 6/16, -3/16, 6/16},
		},
	})
end

minetest.register_node("hades_grass:junglegrass", {
	description = S("Tropical Grass"),
	drawtype = "plantlike",
	tiles = {"default_junglegrass.png"},
	inventory_image = "default_junglegrass.png",
	wield_image = "default_junglegrass.png",
	waving = 1,
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	floodable = true,
	is_ground_content = true,
	groups = {snappy=3,flammable=2,flora=1,grass=1,attached_node=1},
	sounds = hades_sounds.node_sound_grass_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6/16, -0.5, -6/16, 6/16, 0.5, 6/16},
	},
})


minetest.register_craft({
	output = 'hades_grass:grass_1',
	recipe = {
		{'hades_grass:mossycobble', '', ''},
		{'hades_grass:mossycobble', '', ''},
		{'hades_grass:dirt', '', ''},
	}
})
minetest.register_craft({
	output = 'hades_grass:grass_1',
	recipe = {
		{'hades_grass:mossytuff', '', ''},
		{'hades_grass:mossytuff', '', ''},
		{'hades_grass:dirt', '', ''},
	}
})
minetest.register_craft({
	output = 'hades_grass:junglegrass',
	recipe = {
		{'hades_grass:grass_1', '', ''},
		{'hades_grass:dirt', '', ''},
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "hades_grass:grass_1",
	burntime = 2,
})
minetest.register_craft({
	type = "fuel",
	recipe = "hades_grass:junglegrass",
	burntime = 2,
})


minetest.register_alias("hades_core:grass_1", "hades_grass:grass_1")
minetest.register_alias("hades_core:grass_2", "hades_grass:grass_2")
minetest.register_alias("hades_core:grass_3", "hades_grass:grass_3")
minetest.register_alias("hades_core:grass_4", "hades_grass:grass_4")
minetest.register_alias("hades_core:grass_5", "hades_grass:grass_5")
minetest.register_alias("hades_core:junglegrass", "hades_grass:junglegrass")
