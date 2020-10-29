local S = minetest.get_translator("hades_fertilizer")

local farms = { "wheat", "cotton", "spice", "potato", "tomato", "strawberry" }

-- Register tables for all plant variants
local plants_rotate = {}
do
	-- Growth stages

	for f=1, #farms do
		local t = { 0 }
		table.insert(t, "farming:seed_"..farms[f])
		for i=1,3 do
			table.insert(t, "farming:"..farms[f].."_"..i)
		end
		table.insert(plants_rotate, t)
	end

	local t = { 0, "refruit:bud_apple", "refruit:flower_apple", "hades_trees:apple" }
	table.insert(plants_rotate, t)

	local t = { 0, "refruit:bud_olive", "refruit:flower_olive", "hades_trees:olive" }
	table.insert(plants_rotate, t)

	t = { 0 }
	for i=1,5 do
		table.insert(t, "hades_core:grass_"..i)
	end
	table.insert(plants_rotate, t)
end

local plant_mappings = {}
for p=1, #plants_rotate do
	local rotate = plants_rotate[p]
	local param2 = rotate[1]
	for r=2, #rotate-1 do
		local nextr = r+1
		plant_mappings[rotate[r]] = { rotate[nextr], param2 }
	end
end

-- Super Fertilizer makes almost everything grow; only for Creative Mode
minetest.register_tool("hades_fertilizer:super_fertilizer", {
	description = S("Super Fertilizer"),
	_tt_help = S("Makes a lot of plants grow"),
	inventory_image = "hades_fertilizer_super_fertilizer.png",
	groups = { disable_repair = 1 },
	on_place = function(itemstack, placer, pointed_thing)
		if not pointed_thing or not pointed_thing.under or not placer then
			return
		end
		local name = placer:get_player_name()
		if not minetest.check_player_privs(placer, "server") then
			return
		end
		local box = {
			minp = { x = -32768, y = -32768, z = -32768 },
			maxp = { x =  32768, y =  32768, z =  32768 },
		}
		local pos = pointed_thing.under
		local nnode = minetest.get_node(pos)
		local nname = nnode.name
		local def = minetest.registered_nodes[nname]
		if plant_mappings[nname] then
			-- Cycle through plant growth stages and plant variants
			minetest.set_node(pos, {name=plant_mappings[nname][1], param2=plant_mappings[nname][2]})
		elseif nname == "flowerpots:flower_pot" then
			-- Grow random flower in empty flowerpot
			local flowers = {
				"rose", "dandelion_white", "dandelion_yellow", "tulip", "geranium", "viola",
			}
			local flower = flowers[math.random(1, #flowers)]
			minetest.set_node(pos, {name="flowerpots:flower_pot_"..flower})
		elseif minetest.get_item_group(nname, "leaves") == 1 then
			-- Grow leaves
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
			-- Grow reeds and tree trunks upwards
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
		elseif minetest.get_item_group(nname, "vines") ~= 0 or nname == "vines:root" then
			-- Grow vines
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
		elseif nname == "hades_core:dirt" or nname == "hades_core:stone" or nname == "hades_core:tuff" or nname == "hades_core:cobble" or nname == "walls:cobble" then
			local posses = {}
			-- Grow grass cover on dirt, or grow moss
			for x = pos.x - 2, pos.x + 2 do
			for y = pos.y, pos.y do
			for z = pos.z - 2, pos.z + 2 do
				local ppos = {x = x, y = y, z = z}
				if vector.distance(pos, ppos) <= 2.3 then
					local node = minetest.get_node(ppos)
					local above_node = minetest.get_node({x = x, y = y + 1, z = z})
					if node.name == nname and
							(nname ~= "hades_core:dirt" or
							(minetest.registered_nodes[above_node.name] and
							minetest.registered_nodes[above_node.name].walkable == false)) then
						if nname == "hades_core:dirt" then
							node.name = "hades_core:dirt_with_grass"
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
		elseif nname == "hades_core:grass" or nname == "hades_core:dirt_with_grass" or nname == "hades_core:fertile_sand" or nname == "hades_core:ash" or nname == "hades_core:gravel" or nname == "hades_core:gravel_volcanic" or nname == "farming:soil" or nname == "farming:soil_wet" then
			-- Grow grass, flowers and other random plants
			for x = math.max(box.minp.x + 1, pos.x - 2), math.min(box.maxp.x - 1, pos.x + 2) do
			for y = math.max(box.minp.y + 1, pos.y), math.min(box.maxp.y - 1, pos.y) do
			for z = math.max(box.minp.z + 1, pos.z - 2), math.min(box.maxp.z - 1, pos.z + 2) do
				local ppos = {x = x, y = y, z = z}
				if vector.distance(pos, ppos) <= 2.3 then
					local node = minetest.get_node(ppos)
					local pos_above = {x = x, y = y + 1, z = z}
					local above_node = minetest.get_node(pos_above)
					if above_node.name == "air" and math.random() < 0.2 and node.name == nname then
						local plants
						if (node.name == "hades_core:grass" or node.name == "hades_core:dirt_with_grass") then
							plants = {
							{"hades_core:grass_1", 0},
							{"hades_core:grass_2", 0},
							{"hades_core:grass_3", 0},
							{"hades_core:grass_4", 0},
							{"hades_core:grass_5", 0},
							{"hades_core:grass_1", 0},
							{"hades_core:grass_2", 0},
							{"hades_core:grass_3", 0},
							{"hades_core:grass_4", 0},
							{"hades_core:grass_5", 0},
							{"hades_core:grass_1", 0},
							{"hades_core:grass_2", 0},
							{"hades_core:grass_3", 0},
							{"hades_core:grass_4", 0},
							{"hades_core:grass_5", 0},
							{"hades_core:grass_1", 0},
							{"hades_core:grass_2", 0},
							{"hades_core:grass_3", 0},
							{"hades_core:grass_4", 0},
							{"hades_core:grass_5", 0},
							{"hades_core:junglegrass", 0},
							{"hades_core:junglegrass", 0},
							{"hades_core:junglegrass", 0},
							{"hades_core:junglegrass", 0},
							{"farming:flowergrass", 0},
							{"flowers:rose", 0},
							{"flowers:dandelion_white", 0},
							{"flowers:dandelion_yellow", 0},
							{"flowers:tulip", 0},
							{"flowers:viola", 0},
							{"flowers:geranium", 0},
							}
						elseif (node.name == "hades_core:ash" or node.name == "hades_core:gravel" or node.name == "hades_core:gravel_volcanic") then
							plants = {
							{ "hades_core:dry_shrub", 0 },
							}
						elseif (node.name == "hades_core:fertile_sand") then
							plants = {
							{ "hades_core:dry_shrub", 0 },
							}
						elseif (node.name == "farming:soil" or node.name == "farming:soil_wet") then
							plants = {
							{"farming:seed_wheat", 0},
							{"farming:seed_cotton", 0},
							{"farming:seed_tomato", 0},
							{"farming:seed_strawberry", 0},
							{"farming:seed_spice", 0},
							{"farming:seed_potato", 0},
							}
						end
						if plants then
							local p = plants[math.random(1, #plants)]
							local nnode = {name = p[1], param2 = p[2]}
							minetest.set_node(pos_above, nnode)
						end
					end
				end
			end
			end
			end
		elseif minetest.get_item_group(nname, "waterlily") ~= 0 or minetest.get_item_group(nname, "seaweed") ~= 0 then
			-- Spread waterlilies and seaweed on water
			for x = math.max(box.minp.x + 1, pos.x - 3), math.min(box.maxp.x - 1, pos.x + 3) do
			for y = math.max(box.minp.y + 1, pos.y), math.min(box.maxp.y - 1, pos.y) do
			for z = math.max(box.minp.z + 1, pos.z - 3), math.min(box.maxp.z - 1, pos.z + 3) do
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
		return itemstack
	end,
})
