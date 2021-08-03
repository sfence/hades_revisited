local S = minetest.get_translator("hades_farming")

local override_nodes = {
	"hades_core:dirt",
	"hades_core:dirt_with_grass_l1",
	"hades_core:dirt_with_grass_l2",
	"hades_core:dirt_with_grass_l3",
	"hades_core:dirt_with_grass",
}
for n=1, #override_nodes do
	local nodename = override_nodes[n]
	local groups = table.copy(minetest.registered_nodes[nodename].groups)
	groups.soil = 1

	minetest.override_item(nodename, {
		groups = groups,
		soil = {
			base = nodename,
			dry = "hades_farming:soil",
			wet = "hades_farming:soil_wet"
		}
	})
end

minetest.register_node("hades_farming:soil", {
	description = S("Soil"),
	tiles = {"default_dirt.png^hades_farming_soil.png", "default_dirt.png"},
	drop = "hades_core:dirt",
	is_ground_content = true,
	groups = {crumbly=3, not_in_creative_inventory=1, soil=2, porous=1, grassland = 1, field = 1},
	sounds = hades_sounds.node_sound_dirt_defaults(),
	soil = {
		base = "hades_core:dirt",
		dry = "hades_farming:soil",
		wet = "hades_farming:soil_wet"
	}
})

minetest.register_node("hades_farming:soil_wet", {
	description = S("Wet Soil"),
	tiles = {"default_dirt.png^hades_farming_soil_wet.png", "default_dirt.png^hades_farming_soil_wet_side.png"},
	drop = "hades_core:dirt",
	is_ground_content = true,
	groups = {crumbly=3, not_in_creative_inventory=1, soil=3, porous=1, wet = 1, grassland = 1, field = 1},
	sounds = hades_sounds.node_sound_dirt_defaults({
		footstep = { name = "hades_farming_wet_soil_footstep", gain = 1.0 },
	}),
	soil = {
		base = "hades_core:dirt",
		dry = "hades_farming:soil",
		wet = "hades_farming:soil_wet"
	}
})


minetest.register_node("hades_farming:straw", {
	description = S("Straw"),
	tiles = {"hades_farming_straw.png"},
	is_ground_content = false,
	groups = {snappy=3, flammable=4},
	sounds = hades_sounds.node_sound_straw_defaults(),
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
		local pos1 = {x=pos.x-3, y=pos.y, z=pos.z-3}
		local pos2 = {x=pos.x+3, y=pos.y+1, z=pos.z+3}
		local waters = minetest.find_nodes_in_area(pos1, pos2, {"group:water"})
		if #waters > 0 then
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
	local grass_drops = table.copy(minetest.registered_nodes["hades_grass:grass_"..i].drop)
	table.insert(grass_drops.items, 1, {items={"hades_farming:seed_wheat"}, rarity=13})
	table.insert(grass_drops.items, 1, {items={"hades_farming:seed_spice"}, rarity=13})
	table.insert(grass_drops.items, 1, {items={"hades_farming:seed_strawberry"}, rarity=13})
	grass_drops.max_items = 1
	minetest.override_item("hades_grass:grass_"..i, {
		_tt_help = S("Chance to drop random seed when dug"),
		drop = grass_drops,
	})
end

local jgrass_drops
if minetest.registered_nodes["hades_grass:junglegrass"].drop then
	jgrass_drops = table.copy(minetest.registered_nodes["hades_grass:junglegrass"].drop)
else
	jgrass_drops = {items={}}
end
table.insert(jgrass_drops.items, 1, {items={"hades_farming:seed_cotton"}, rarity=10})
table.insert(jgrass_drops.items, 1, {items={"hades_farming:seed_tomato"}, rarity=10})
table.insert(jgrass_drops.items, 1, {items={"hades_farming:seed_potato"}, rarity=10})
jgrass_drops.max_items = 1

minetest.override_item("hades_grass:junglegrass", {
	_tt_help = S("Chance to drop random seed when dug"),
	drop = jgrass_drops,
})

