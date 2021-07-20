local S = minetest.get_translator("hades_grass")

local grass_drop = {
	max_items = 1,
	items = {
		{ items = { "hades_grass:seed_grass 2" }, rarity = 13 },
		{ items = { "hades_grass:grass_1" } },
	}
}

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
	drop = grass_drop,
	groups = {snappy=3,flammable=3,flora=1,grass_clump=1,grass=1,attached_node=1},
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
		drop = grass_drop,
		groups = {snappy=3,flammable=3,flora=1,grass=1,grass_clump=1,attached_node=1,not_in_creative_inventory=1},
		sounds = hades_sounds.node_sound_grass_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6/16, -0.5, -6/16, 6/16, -3/16, 6/16},
		},
	})
end

hades_seeds.register_seed("hades_grass:seed_grass", {
	description = S("Grass Seed"),
	image = "hades_grass_grass_seed.png",
	surface_check = function(node)
		return minetest.get_item_group(node.name, "dirt") > 0 or minetest.get_item_group(node.name, "soil") > 0
	end,
	_tt_help = S("Grows on Dirt, Dirt with Grass, Soil and Wet Soil in light"),
})

minetest.register_abm({
	label = "Grow grass seeds in light",
	nodenames = {"hades_grass:seed_grass"},
	interval = 10,
	chance = 25,
	action = function(pos, node)
		local light = minetest.get_node_light(pos)
		if light < 8 then
			return
		end
		local param2 = hades_core.get_seasonal_grass_color_param2()
		local below = {x=pos.x, y=pos.y-1, z=pos.z}
		local bnode = minetest.get_node(below)
		-- Growth behavior depends on node below ...
		if bnode.name == "hades_core:dirt_with_grass" then
			-- grow grass clump on (full) dirt with grass
			minetest.set_node(pos, {name = "hades_grass:grass_"..math.random(1,5)})
		elseif minetest.get_item_group(bnode.name, "dirt") >= 1 or minetest.get_item_group(bnode.name, "soil") > 1 then
			-- Turn dirt and soil into dirt-with-grass;
			-- For an intermediate dirt-with-grass stage,
			-- increase grass cover level by 1
			local next_node = hades_core.get_next_grass_cover_level(bnode.name)
			if not next_node then
				next_node = "hades_core:dirt_with_grass_l1"
			end
			minetest.remove_node(pos)
			minetest.set_node(below, {name = next_node, param2 = param2})
		else
			-- Seeds are on wrong node, let's kill them!
			minetest.remove_node(pos)
		end
	end
})



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

minetest.register_abm({
	label = "Update seasonal grass clump color",
	nodenames = {"group:grass_clump"},
	interval = 5,
	chance = 20,
	action = function(pos, node)
		local old_param2 = node.param2
		local new_param2 = hades_core.get_seasonal_grass_color_param2(old_param2)
		if new_param2 ~= old_param2 then
			minetest.set_node(pos, {name = node.name, param2 = new_param2})
		end
	end
})

minetest.register_craft({
	output = 'hades_grass:grass_1',
	recipe = {
		{'hades_core:mossycobble', '', ''},
		{'hades_core:mossycobble', '', ''},
		{'hades_core:dirt', '', ''},
	}
})
minetest.register_craft({
	output = 'hades_grass:grass_1',
	recipe = {
		{'hades_core:mossytuff', '', ''},
		{'hades_core:mossytuff', '', ''},
		{'hades_core:dirt', '', ''},
	}
})
minetest.register_craft({
	output = 'hades_grass:seed_grass 2',
	recipe = {{'hades_grass:grass_1'}},
})


minetest.register_craft({
	output = 'hades_grass:junglegrass',
	recipe = {
		{'hades_grass:grass_1', '', ''},
		{'hades_core:dirt', '', ''},
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

do
	minetest.override_item("hades_core:dirt_with_grass", {
		drop = {
			items = {
				{ items = { "hades_grass:seed_grass" }, rarity = 8 },
				{ items = { "hades_grass:seed_grass" }, rarity = 8 },
				{ items = { "hades_core:dirt" } },
			},
		}
	})
end

minetest.register_alias("hades_core:grass_1", "hades_grass:grass_1")
minetest.register_alias("hades_core:grass_2", "hades_grass:grass_2")
minetest.register_alias("hades_core:grass_3", "hades_grass:grass_3")
minetest.register_alias("hades_core:grass_4", "hades_grass:grass_4")
minetest.register_alias("hades_core:grass_5", "hades_grass:grass_5")
minetest.register_alias("hades_core:junglegrass", "hades_grass:junglegrass")

