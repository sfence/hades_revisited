local S = minetest.get_translator("farming")

minetest.override_item("hades_core:dirt", {
	groups = {crumbly=3,soil=1},
	soil = {
		base = "hades_core:dirt",
		dry = "farming:soil",
		wet = "farming:soil_wet"
	}
})

minetest.override_item("hades_core:dirt_with_grass", {
	groups = {crumbly=3,soil=1},
	soil = {
		base = "hades_core:dirt_with_grass",
		dry = "farming:soil",
		wet = "farming:soil_wet"
	}
})

minetest.register_node("farming:soil", {
	description = S("Soil"),
	tiles = {"default_dirt.png^farming_soil.png", "default_dirt.png"},
	drop = "hades_core:dirt",
	is_ground_content = true,
	groups = {crumbly=3, not_in_creative_inventory=1, soil=2, grassland = 1, field = 1},
	sounds = hades_sounds.node_sound_dirt_defaults(),
	soil = {
		base = "hades_core:dirt",
		dry = "farming:soil",
		wet = "farming:soil_wet"
	}
})

minetest.register_node("farming:soil_wet", {
	description = S("Wet Soil"),
	tiles = {"default_dirt.png^farming_soil_wet.png", "default_dirt.png^farming_soil_wet_side.png"},
	drop = "hades_core:dirt",
	is_ground_content = true,
	groups = {crumbly=3, not_in_creative_inventory=1, soil=3, wet = 1, grassland = 1, field = 1},
	sounds = hades_sounds.node_sound_dirt_defaults(),
	soil = {
		base = "hades_core:dirt",
		dry = "farming:soil",
		wet = "farming:soil_wet"
	}
})


minetest.register_node("farming:straw", {
	description = S("Straw"),
	tiles = {"farming_straw.png"},
	is_ground_content = false,
	groups = {snappy=3, flammable=4},
	sounds = hades_sounds.node_sound_leaves_defaults(),
})

minetest.register_abm({
	label = "Update soil wetness",
	nodenames = {"group:field"},
	interval = 15,
	chance = 4,
	action = function(pos, node)
		local n_def = minetest.registered_nodes[node.name] or nil
		local wet = n_def.soil.wet or nil
		local base = n_def.soil.base or nil
		local dry = n_def.soil.dry or nil
		if not n_def or not n_def.soil or not wet or not base or not dry then
			return
		end

		pos.y = pos.y + 1
		local nn = minetest.get_node_or_nil(pos)
		if not nn or not nn.name then
			return
		end
		local nn_def = minetest.registered_nodes[nn.name] or nil
		pos.y = pos.y - 1
		
		if nn_def and nn_def.walkable and minetest.get_item_group(nn.name, "plant") == 0 then
			minetest.set_node(pos, {name = base})
			return
		end
		-- check if there is water nearby
		local wet_lvl = minetest.get_item_group(node.name, "wet")
		if minetest.find_node_near(pos, 3, {"group:water"}) then
			-- if it is dry soil and not base node, turn it into wet soil
			if wet_lvl == 0 then
				minetest.set_node(pos, {name = wet})
			end
		else
			-- only turn back if there are no unloaded blocks (and therefore
			-- possible water sources) nearby
			if not minetest.find_node_near(pos, 3, {"ignore"}) then
				-- turn it back into base if it is already dry
				if wet_lvl == 0 then
					-- only turn it back if there is no plant/seed on top of it
					if minetest.get_item_group(nn.name, "plant") == 0 and minetest.get_item_group(nn.name, "seed") == 0 then
						minetest.set_node(pos, {name = base})
					end
					
				-- if its wet turn it back into dry soil
				elseif wet_lvl == 1 then
					minetest.set_node(pos, {name = dry})
				end
			end
		end
	end,
})


for i = 1, 5 do		
	minetest.override_item("hades_core:grass_"..i, {drop = {
		max_items = 1,
		items = {
			{items = {'farming:seed_wheat'},rarity = 10},
			{items = {'farming:seed_spice'},rarity = 10},
			{items = {'farming:seed_strawberry'},rarity = 10},
			{items = {'hades_core:grass_1'}},
		}
	}})
end
	
minetest.override_item("hades_core:junglegrass", {drop = {
	max_items = 1,
	items = {
		{items = {'farming:seed_cotton'},rarity = 10},
		{items = {'farming:seed_tomato'},rarity = 10},
		{items = {'farming:seed_potato'},rarity = 10},
		{items = {'hades_core:junglegrass'}},
	}
}})

minetest.register_node("farming:flowergrass", {
		description = S("Flower Grass"),
		drawtype = "plantlike",
		tiles = {"farming_flowergrass.png"},
		inventory_image = "farming_flowergrass.png",
		wield_image = "farming_flowergrass.png",
		paramtype = "light",
		waving = 1,
		walkable = false,
		buildable_to = true,
		is_ground_content = true,
		groups = {snappy=3,flammable=3,flora=1,attached_node=1},
		sounds = hades_sounds.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
	})
