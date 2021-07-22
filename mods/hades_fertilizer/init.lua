local S = minetest.get_translator("hades_fertilizer")

local farms = { "wheat", "cotton", "spice", "potato", "tomato", "strawberry" }

-- Register tables for all plant variants
local plants_rotate = {}
do
	local t
	-- Growth stages

	for f=1, #farms do
		t = { false }
		table.insert(t, "hades_farming:seed_"..farms[f])
		for i=1,3 do
			table.insert(t, "hades_farming:"..farms[f].."_"..i)
		end
		table.insert(plants_rotate, t)
	end

	t = { true, "hades_grass:seed_grass", "hades_grass:grass_1", "hades_grass:grass_2", "hades_grass:grass_3", "hades_grass:grass_4", "hades_grass:grass_5" }
	table.insert(plants_rotate, t)

	t = { true, "hades_refruit:bud_apple", "hades_refruit:flower_apple", "hades_trees:apple" }
	table.insert(plants_rotate, t)

	t = { true, "hades_refruit:bud_olive", "hades_refruit:flower_olive", "hades_trees:olive" }
	table.insert(plants_rotate, t)

	t = { true, "hades_refruit:bud_orange", "hades_refruit:flower_orange", "hades_trees:orange" }
	table.insert(plants_rotate, t)

	t = { true, "hades_refruit:bud_banana", "hades_refruit:flower_banana", "hades_trees:banana" }
	table.insert(plants_rotate, t)

	t = { true, "hades_refruit:bud_cocoa", "hades_refruit:flower_cocoa", "hades_trees:cocoa_pod" }
	table.insert(plants_rotate, t)

	t = { true, "hades_refruit:bud_coconut", "hades_refruit:flower_coconut", "hades_trees:coconut" }
	table.insert(plants_rotate, t)

	t = { false }
	for i=1,5 do
		table.insert(t, "hades_grass:grass_"..i)
	end
	table.insert(plants_rotate, t)
end

local plant_mappings = {}
for p=1, #plants_rotate do
	local rotate = plants_rotate[p]
	local super = rotate[1]
	for r=2, #rotate-1 do
		local nextr = r+1
		plant_mappings[rotate[r]] = { rotate[nextr], super }
	end
end

-- Returns an on_place function for fertilizer.
-- 'super' parameter is true for Super Fertilizer and false for normal fertilizer
local get_apply_fertilizer = function(super)
	return function(itemstack, placer, pointed_thing)
		if not pointed_thing or pointed_thing.type ~= "node" or not placer then
			return itemstack
		end
		local name = placer:get_player_name()
		local pos = pointed_thing.under
		local nnode = minetest.get_node(pos)
		local nname = nnode.name

		-- Boilerplate to check pointed node's on rightlick function
		local def = minetest.registered_nodes[nname]
		if def and def.on_rightclick and
			((not placer) or (placer and not placer:get_player_control().sneak)) then
			return def.on_rightclick(pos, nnode, placer, itemstack,
				pointed_thing) or itemstack
		end

		if plant_mappings[nname] then
			if (not super) then
				-- Restrict usable plants if not super fertilizer
				if plant_mappings[nname][2] == true then return itemstack end
				if math.random(1,3) == 1 then return itemstack end
			end
			-- Add plant growth stage
			minetest.set_node(pos, {name=plant_mappings[nname][1], param2=nnode.param2})
		elseif minetest.get_item_group(nname, "sapling") ~= 0 then
			if not super and math.random(1,5) ~= 1 then return itemstack end
			-- Grow sapling to tree
			hades_trees.grow_sapling(pos, false)
		elseif nname == "hades_flowerpots:flower_pot" then
			if not super then return itemstack end
			-- [SUPER] Grow random flower in empty flowerpot
			local flowers = {
				"red", "white", "yellow", "orange", "yellow", "violet",
			}
			local flower = flowers[math.random(1, #flowers)]
			minetest.set_node(pos, {name="hades_flowerpots:flower_pot_"..flower})
		elseif minetest.get_item_group(nname, "leaves") == 1 then
			if not super then return itemstack end
			-- [SUPER] Grow leaves
			local posses = {
				{ x=0, y=0, z=1 },
				{ x=0, y=0, z=-1 },
				{ x=0, y=1, z=0 },
				{ x=0, y=-1, z=0 },
				{ x=1, y=0, z=0 },
				{ x=-1, y=0, z=0 },
			}
			for p=1, #posses do
				local ppos = vector.add(pos, posses[p])
				if minetest.get_node(ppos).name == "air" then
					minetest.set_node(ppos, {name=nname, param2=nnode.param2})
				end
			end
		elseif nname == "hades_core:papyrus" or nname == "hades_core:sugarcane" or nname == "hades_core:cactus" or minetest.get_item_group(nname, "tree") == 1 then
			if not super then return itemstack end
			-- [SUPER] Grow reeds and tree trunks upwards
			local above
			for i=1,15 do
				above = {x=pos.x,y=pos.y+i,z=pos.z}
				local node = minetest.get_node(above)
				if node.name == "air" then
					minetest.set_node(above, {name=nname})
					break
				elseif node.name ~= nname then
					break
				end
			end
		elseif minetest.get_item_group(nname, "vines") ~= 0 or nname == "hades_vines:root" then
			if not super then return itemstack end
			-- [SUPER] Grow vines
			local param2 = nnode.param2
			if param2 >= 2 or def.paramtype2 ~= "wallmounted" then
				-- Grow downwards
				local below
				for i=1,15 do
					below = {x=pos.x,y=pos.y-i,z=pos.z}
					local node = minetest.get_node(below)
					if node.name == "air" then
						minetest.set_node(below, {name=nname, param2=param2})
						break
					elseif node.name ~= nname then
						break
					end
				end
			end
		elseif nname == "hades_core:dirt" or minetest.get_item_group(nname, "dirt_with_grass") > 1 or nname == "hades_core:stone" or nname == "hades_core:tuff" or nname == "hades_core:cobble" or nname == "walls:cobble" then
			-- Grow grass cover on dirt
			-- [SUPER] also grow moss
			local posses = {}
			local minmax
			local dwg2 = minetest.get_item_group(nname, "dirt_with_grass")
			local d2 = minetest.get_item_group(nname, "dirt")
			if super then
				minmax=2
			else
				if d2 == 0 and dwg2 == 0 then
					return itemstack
				end
				minmax=1
			end
			local season_color = hades_core.get_seasonal_grass_color_param2()
			for x = pos.x - minmax, pos.x + minmax do
			for y = pos.y, pos.y do
			for z = pos.z - minmax, pos.z + minmax do
				local ppos = {x = x, y = y, z = z}
				if vector.distance(pos, ppos) <= 2.3 then
					local node = minetest.get_node(ppos)
					local above_node = minetest.get_node({x = x, y = y + 1, z = z})
					-- Apply change to same or "compatible" node type as the pointed
					-- node only, e.g. dirt is "compatible" with dirt-with-grass
					local d1 = minetest.get_item_group(node.name, "dirt")
					local dwg1 = minetest.get_item_group(node.name, "dirt_with_grass")
					if ((node.name == nname) or ((dwg1 > 1 or d1 > 0) and (dwg2 > 1 or d2 > 0))) and
							(nname ~= "hades_core:dirt" or
							(minetest.registered_nodes[above_node.name] and
							minetest.registered_nodes[above_node.name].walkable == false)) then
						if nname == "hades_core:dirt" then
							node.name = "hades_core:dirt_with_grass"
							node.param2 = season_color
						elseif dwg2 > 0 then
							node.name = "hades_core:dirt_with_grass"
							node.param2 = season_color
						elseif nname == "hades_core:stone" then
							node.name = "hades_core:mossystone"
						elseif nname == "hades_core:tuff" then
							node.name = "hades_core:mossytuff"
						elseif nname == "hades_core:cobble" then
							node.name = "hades_core:mossycobble"
						elseif nname == "walls:cobble" then
							node.name = "walls:mossycobble"
						end
						minetest.set_node(ppos, node)
					end
				end
			end
			end
			end
		elseif nname == "hades_grass:grass" or nname == "hades_core:dirt_with_grass" or nname == "hades_core:fertile_sand" or nname == "hades_core:ash" or nname == "hades_core:volcanic_sand" or nname == "hades_core:gravel" or nname == "hades_core:gravel_volcanic" or nname == "hades_farming:soil" or nname == "hades_farming:soil_wet" then
			-- Grow grass, flowers and other random plants
			for x = pos.x - 2, pos.x + 2 do
			for y = pos.y, pos.y do
			for z = pos.z - 2, pos.z + 2 do
				local ppos = {x = x, y = y, z = z}
				if vector.distance(pos, ppos) <= 2.3 then
					local node = minetest.get_node(ppos)
					local pos_above = {x = x, y = y + 1, z = z}
					local above_node = minetest.get_node(pos_above)
					if above_node.name == "air" and math.random() < 0.2 and node.name == nname then
						local plants
						local p2season = hades_core.get_seasonal_grass_color_param2()
						if (node.name == "hades_grass:grass" or node.name == "hades_core:dirt_with_grass") then
							if super then
							plants = {
							{"hades_grass:grass_1", p2season},
							{"hades_grass:grass_2", p2season},
							{"hades_grass:grass_3", p2season},
							{"hades_grass:grass_4", p2season},
							{"hades_grass:grass_5", p2season},
							{"hades_grass:grass_1", p2season},
							{"hades_grass:grass_2", p2season},
							{"hades_grass:grass_3", p2season},
							{"hades_grass:grass_4", p2season},
							{"hades_grass:grass_5", p2season},
							{"hades_grass:grass_1", p2season},
							{"hades_grass:grass_2", p2season},
							{"hades_grass:grass_3", p2season},
							{"hades_grass:grass_4", p2season},
							{"hades_grass:grass_5", p2season},
							{"hades_grass:grass_1", p2season},
							{"hades_grass:grass_2", p2season},
							{"hades_grass:grass_3", p2season},
							{"hades_grass:grass_4", p2season},
							{"hades_grass:grass_5", p2season},
							{"hades_grass:junglegrass"},
							{"hades_grass:junglegrass"},
							{"hades_grass:junglegrass"},
							{"hades_grass:junglegrass"},
							{"hades_flowers:flowergrass"},
							{"hades_flowers:red"},
							{"hades_flowers:white"},
							{"hades_flowers:yellow"},
							{"hades_flowers:orange"},
							{"hades_flowers:violet"},
							{"hades_flowers:blue"},
							}
							else
							plants = {
							{"hades_grass:grass_1", p2season},
							{"hades_grass:grass_2", p2season},
							{"hades_grass:grass_3", p2season},
							{"hades_grass:grass_4", p2season},
							{"hades_grass:grass_5", p2season},
							}
							end
						elseif (node.name == "hades_core:ash" or node.name == "hades_core:volcanic_sand" or node.name == "hades_core:gravel" or node.name == "hades_core:gravel_volcanic") then
							if not super then return itemstack end
							plants = {
							{ "hades_core:dry_shrub"},
							}
						elseif (node.name == "hades_core:fertile_sand") then
							if not super then return itemstack end
							plants = {
							{ "hades_core:dry_shrub"},
							}
						elseif (node.name == "hades_farming:soil" or node.name == "hades_farming:soil_wet") then
							if not super then return itemstack end
							plants = {
							{"hades_farming:seed_wheat"},
							{"hades_farming:seed_cotton"},
							{"hades_farming:seed_tomato"},
							{"hades_farming:seed_strawberry"},
							{"hades_farming:seed_spice"},
							{"hades_farming:seed_potato"},
							}
						end
						if plants then
							local rnd = math.random(1, #plants)
							local plant = plants[rnd][1]
							local pdef = minetest.registered_nodes[plant]
							local p2
							if plants[rnd][2] then
								p2 = plants[rnd][2]
							else
								p2 = pdef.place_param2
							end
							local nnode = {name = plant, param2 = p2}
							minetest.set_node(pos_above, nnode)
						end
					end
				end
			end
			end
			end
		elseif minetest.get_item_group(nname, "waterlily") ~= 0 or minetest.get_item_group(nname, "seaweed") ~= 0 then
			if not super then return itemstack end
			-- [SUPER] Spread waterlilies and seaweed on water
			for x = pos.x - 3, pos.x + 3 do
			for y = pos.y, pos.y do
			for z = pos.z - 3, pos.z + 3 do
				local ppos = {x = x, y = y, z = z}
				if vector.distance(pos, ppos) <= 3.0 then
					local node = minetest.get_node(ppos)
					local below_node = minetest.get_node({x = x, y = y - 1, z = z})
					if node.name == "air" and
							math.random() < 0.1 and
							minetest.get_item_group(below_node.name, "water") >= 1 and
							minetest.registered_nodes[below_node.name].liquidtype == "source" then
						node.name = nname
						node.param2 = math.random(0,3)
						minetest.set_node(ppos, node)
					end
				end
			end
			end
			end

		end
		if not super and not minetest.is_creative_enabled(placer:get_player_name()) then
			itemstack:take_item()
		end
		return itemstack
	end
end

-- Fertilizer helps grow a few plants
minetest.register_craftitem("hades_fertilizer:fertilizer", {
	description = S("Fertilizer"),
	_tt_help = S("Makes plants grow"),
	inventory_image = "hades_fertilizer_fertilizer.png",
	on_place = get_apply_fertilizer(false),
	groups = { tool = 1 },
})

-- Super Fertilizer makes almost everything grow; only for Creative Mode
minetest.register_craftitem("hades_fertilizer:super_fertilizer", {
	description = S("Super Fertilizer"),
	_tt_help = S("Makes a lot of plants grow"),
	inventory_image = "hades_fertilizer_super_fertilizer.png",
	on_place = get_apply_fertilizer(true),
	groups = { tool = 1 },
})
