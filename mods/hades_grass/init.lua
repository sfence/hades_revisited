local S = minetest.get_translator("hades_grass")

local grass_drop = {
	max_items = 1,
	items = {
		{ items = { "hades_grass:seed_grass 2" }, rarity = 13 },
		{ items = { "hades_grass:grass_1" } },
	}
}

-- Grass grows or withers depending on the block it was placed on
local RATE_GOOD = 2 -- grass grows up to seasonal limit
local RATE_MED = 1 -- grass size limited to 1
local RATE_BAD = 0 -- grass withers and dies
local grass_surfaces = {
	["hades_core:clay"] = RATE_GOOD,
	["hades_core:fertile_sand"] = RATE_GOOD,
	["hades_furniture:plant_pot"] = RATE_GOOD,
	["hades_core:volcanic_sand"] = RATE_MED,
	["hades_core:gravel"] = RATE_MED,
	["hades_core:tuff"] = RATE_MED,
	["hades_core:tuff_baked"] = RATE_MED,
	["hades_core:mossytuff"] = RATE_MED,
}

-- Returns rating of surface level for grass
local get_grass_surface_level = function(nodename)
	if grass_surfaces[nodename] then
		return grass_surfaces[nodename]
	elseif minetest.get_item_group(nodename, "dirt") ~= 0 then
		return RATE_GOOD
	elseif minetest.get_item_group(nodename, "soil") > 1 then
		return RATE_GOOD
	elseif minetest.get_item_group(nodename, "soil") == 1 then
		return RATE_MED
	end
	return RATE_BAD
end

minetest.register_node("hades_grass:grass_1", {
	description = S("Grass Clump"),
	drawtype = "plantlike",
	tiles = {"hades_grass_plant_colorable_1.png"},
	inventory_image = "hades_grass_plant_colorable_1.png",
	wield_image = "hades_grass_plant_colorable_1.png",
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
		-- Pick the correct grass color
		local param2 = hades_core.get_seasonal_grass_color_param2()
		local ret = minetest.item_place(itemstack, placer, pointed_thing, param2)
		return ItemStack("hades_grass:grass_1 "..ret:get_count())
	end,
	_hades_magic_next = "hades_grass:grass_2",
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
		groups = {snappy=3,flammable=3,flora=1,grass=1,grass_clump=i,attached_node=1,not_in_creative_inventory=1},
		sounds = hades_sounds.node_sound_grass_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6/16, -0.5, -6/16, 6/16, -3/16, 6/16},
		},
		on_place = function(itemstack, placer, pointed_thing)
			-- pick the correct grass color
			local param2 = hades_core.get_seasonal_grass_color_param2()
			local ret = minetest.item_place(stack, placer, pointed_thing, param2)
			return ret
		end,
		_hades_magic_next = "hades_grass:grass_"..(i%5+1),
	})
end

hades_seeds.register_seed("hades_grass:seed_grass", {
	description = S("Grass Seed"),
	image = "hades_grass_grass_seed.png",
	surface_check = function(node)
		-- Allow planting on good surface except plant pot
		if node.name == "hades_furniture:plant_pot" then
			return false
		else
			return get_grass_surface_level(node.name) == RATE_GOOD
		end
	end,
	_tt_help = S("Grows on Dirt, Soil, Clay, Fertile Sand in light"),
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
			minetest.set_node(pos, {name = "hades_grass:grass_1", param2 = param2})
		elseif get_grass_surface_level(bnode.name) == RATE_GOOD then
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
	drop = {
		max_items = 1,
		items = {
			{ items = { "hades_grass:junglegrass" } },
		}
	},
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

minetest.register_abm({
	label = "Update grass clump height",
	nodenames = {"group:grass_clump"},
	interval = 20,
	chance = 40,
	action = function(pos, node)
		-- The grass clump height is determined by season, surface
		-- and light.
		-- Seasons determine the max height the grass clump can have.
		-- To grow, the correct surface type and light level is required.
		-- If the grass clump is too big for the current season or
		-- it was placed on a low-quality surface, it loses height.
		-- If the grass was placed on a surface it can't live on at
		-- all, it dies (dead grass).
		local size = minetest.get_item_group(node.name, "grass_clump")
		local oldsize = size
		-- Season-based max height
		local maxsize = 5
		local season = hades_seasons.get_season()
		if season == hades_seasons.SEASON_SPRING then
			maxsize = 3
		elseif season == hades_seasons.SEASON_FALL then
			maxsize = 2
		end
		-- Check light and surface node
		local light = minetest.get_node_light(pos)
		local pos_surface = {x=pos.x,y=pos.y-1,z=pos.z}
		local node_surface = minetest.get_node(pos_surface)
		local rating = get_grass_surface_level(node_surface.name)
		-- Update grass stage depending on surface and light
		if (rating == RATE_BAD) then
			-- Become dead grass
			minetest.set_node(pos, {name="hades_grass:dead_grass_"..size, param2 = 0})
			return
		elseif (size > maxsize or rating == RATE_MED) and size > 1 then
			-- Reduce size
			size = size - 1
		elseif size < maxsize and light >= 8 and rating == RATE_GOOD then
			-- Increase size
			size = size + 1
		end
		if oldsize ~= size then
			minetest.set_node(pos, {name="hades_grass:grass_"..size, param2 = node.param2})
			return
		end
	end
})

minetest.register_node("hades_grass:dead_grass_1", {
	description = S("Dead Grass Clump"),
	drawtype = "plantlike",
	tiles = {"hades_dead_grass_plant_colorable_1.png"},
	inventory_image = "hades_dead_grass_plant_colorable_1.png",
	wield_image = "hades_dead_grass_plant_colorable_1.png",
	paramtype = "light",
	paramtype2 = "color",
	palette = "hades_core_palette_dead_grass.png",
	color = "#FFE770",
	waving = 1,
	walkable = false,
	is_ground_content = true,
	buildable_to = true,
	floodable = true,
	groups = {snappy=3,flammable=3,dead_grass_clump=1,grass=1,attached_node=1},
	sounds = hades_sounds.node_sound_grass_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6/16, -0.5, -6/16, 6/16, -5/16, 6/16},
	},
	_hades_magic_next = "hades_grass:dead_grass_2",
})

for i=2,5 do
	minetest.register_node("hades_grass:dead_grass_"..i, {
		description = S("Dead Grass Clump (Stage @1)", i),
		drawtype = "plantlike",
		tiles = {"hades_dead_grass_plant_colorable_"..i..".png"},
		inventory_image = "hades_dead_grass_plant_colorable_"..i..".png",
		wield_image = "hades_dead_grass_plant_colorable_"..i..".png",
		paramtype = "light",
		paramtype2 = "color",
		palette = "hades_core_palette_dead_grass.png",
		color = "#FFE770",
		waving = 1,
		walkable = false,
		buildable_to = true,
		floodable = true,
		is_ground_content = true,
		drop = "hades_grass:dead_grass_1",
		groups = {snappy=3,flammable=3,grass=1,dead_grass_clump=i,attached_node=1,not_in_creative_inventory=1},
		sounds = hades_sounds.node_sound_grass_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6/16, -0.5, -6/16, 6/16, -3/16, 6/16},
		},
		_hades_magic_next = "hades_grass:dead_grass_"..(i%5+1),
	})
end


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

