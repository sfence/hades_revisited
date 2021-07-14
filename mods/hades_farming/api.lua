local S = minetest.get_translator("hades_farming")

local DEFAULT_MINLIGHT = 8
local DEFAULT_MAXLIGHT = minetest.LIGHT_MAX

-- Wear out hoes, place soil
-- TODO Ignore group:flower
hades_farming.hoe_on_use = function(itemstack, user, pointed_thing, uses)
	local pt = pointed_thing
	-- check if pointing at a node
	if not pt then
		return
	end
	if pt.type ~= "node" then
		return
	end
	
	local under = minetest.get_node(pt.under)
	local p = {x=pt.under.x, y=pt.under.y+1, z=pt.under.z}
	local above = minetest.get_node(p)
	
	-- return if any of the nodes is not registered
	if not minetest.registered_nodes[under.name] then
		return
	end
	if not minetest.registered_nodes[above.name] then
		return
	end
	
	-- check if the node above the pointed thing is air
	if above.name ~= "air" then
		return
	end
	
	-- check if pointing at soil
	if minetest.get_item_group(under.name, "soil") ~= 1 then
		return
	end
	
	-- check if (wet) soil defined
	local regN = minetest.registered_nodes
	if regN[under.name].soil == nil or regN[under.name].soil.wet == nil or regN[under.name].soil.dry == nil then
		return
	end
	
	-- turn the node into soil, wear out item and play sound
	minetest.set_node(pt.under, {name = regN[under.name].soil.dry})
	minetest.sound_play("default_dig_crumbly", {
		pos = pt.under,
		gain = 0.5,
	}, true)
	
	if not minetest.is_creative_enabled(user:get_player_name()) then
		itemstack:add_wear(65535/(uses-1))
	end
	return itemstack
end

-- Register new hoes
hades_farming.register_hoe = function(name, def)
	-- Check for : prefix (register new hoes in your mod's namespace)
	if name:sub(1,1) ~= ":" then
		name = ":" .. name
	end
	-- Check def table
	if def.description == nil then
		def.description = "Hoe"
	end
	if def.inventory_image == nil then
		def.inventory_image = "unknown_item.png"
	end
	if def.recipe == nil then
		def.recipe = {
			{"air","air",""},
			{"","group:stick",""},
			{"","group:stick",""}
		}
	end
	if def.max_uses == nil then
		def.max_uses = 30
	end
	-- Register the tool
	minetest.register_tool(name, {
		description = def.description,
		_tt_help = def._tt_help .. "\n" .. S("Uses: @1", def.max_uses),
		inventory_image = def.inventory_image,
		on_use = function(itemstack, user, pointed_thing)
			return hades_farming.hoe_on_use(itemstack, user, pointed_thing, def.max_uses)
		end
	})
	-- Register its recipe
	if def.material == nil then
		minetest.register_craft({
			output = name:sub(2),
			recipe = def.recipe
		})
	else
		local handle
		if def.material_handle then
			handle = def.material_handle
		else
			handle = "group:stick"
		end
		minetest.register_craft({
			output = name:sub(2),
			recipe = {
				{def.material, def.material, ""},
				{"", handle, ""},
				{"", handle, ""}
			}
		})
	end
end

-- Seed placement
hades_farming.place_seed = function(itemstack, placer, pointed_thing, plantname)
	local pt = pointed_thing
	-- check if pointing at a node
	if not pt then
		return
	end
	if pt.type ~= "node" then
		return
	end
	
	local under = minetest.get_node(pt.under)
	local above = minetest.get_node(pt.above)

	local udef = minetest.registered_nodes[under.name]
	if udef and udef.on_rightclick and
		((not placer) or (placer and not placer:get_player_control().sneak)) then
		return udef.on_rightclick(pt.under, under, placer, itemstack,
			pt) or itemstack
	end
	
	-- return if any of the nodes is not registered
	if not minetest.registered_nodes[under.name] then
		return
	end
	if not minetest.registered_nodes[above.name] then
		return
	end
	
	-- check if pointing at the top of the node
	if pt.above.y ~= pt.under.y+1 then
		return
	end
	
	-- check if you can replace the node above the pointed node
	if not minetest.registered_nodes[above.name].buildable_to then
		return
	end
	
	-- check if pointing at soil
	if minetest.get_item_group(under.name, "soil") < 2 then
		return
	end

	minetest.sound_play({name="default_place_node", gain=1.0}, {pos=pt.under})
	
	-- add the node and remove 1 item from the itemstack
	minetest.add_node(pt.above, {name = plantname, param2 = 1})
	if not minetest.is_creative_enabled(placer:get_player_name()) then
		itemstack:take_item()
	end
	return itemstack
end

-- Register plants
hades_farming.register_plant = function(name, def)
	local mname = name:split(":")[1]
	local pname = name:split(":")[2]

	-- Check def table
	if not def.description_seed then
		def.description_seed = "Seed"
	end
	if not def.inventory_image then
		def.inventory_image = "unknown_item.png"
	end
	if not def.steps then
		return nil
	end
	if not def.minlight then
		def.minlight = DEFAULT_MINLIGHT
	end
	if not def.maxlight then
		def.maxlight = DEFAULT_MAXLIGHT
	end
	if not def.fertility then
		def.fertility = {}
	end

	-- Register seed
	local g = {seed = 1, snappy = 3, attached_node = 1}
	for k, v in pairs(def.fertility) do
		g[v] = 1
	end
	minetest.register_node(":" .. mname .. ":seed_" .. pname, {
		description = def.description_seed,
		_tt_help = def._tt_help,
		tiles = {def.inventory_image, def.inventory_image, "blank.png"},
		use_texture_alpha = "clip",
		inventory_image = def.inventory_image,
		wield_image = def.inventory_image,
		drawtype = "nodebox",
		groups = g,
		paramtype = "light",
		walkable = false,
		floodable = true,
		sunlight_propagates = true,
		node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -31/64, 0.5},
		},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
		fertility = def.fertility,
		on_place = function(itemstack, placer, pointed_thing)
			return hades_farming.place_seed(itemstack, placer, pointed_thing, mname .. ":seed_" .. pname)
		end
	})

	-- Register harvest
	minetest.register_craftitem(":" .. mname .. ":" .. pname, {
		description = def.description_harvest,
		groups = { food = 1, eatable = def.food_points },
		on_use = minetest.item_eat(def.food_points),
		inventory_image = mname .. "_" .. pname .. ".png",
	})

	-- Register growing steps
	for i=1,def.steps do
		local drop = {
			items = {
				{items = {mname .. ":seed_" .. pname}, rarity = 4 - i},
				{items = {mname .. ":seed_" .. pname}, rarity = 8 - i * 2},
				{items = {mname .. ":" .. pname}, rarity = 4 - i},
				{items = {mname .. ":" .. pname}, rarity = 6 - i},
				{items = {mname .. ":" .. pname}, rarity= 8 - i * 2},
				{items = {mname .. ":" .. pname}, rarity= 9 - i * 2},
			}
		}
		local nodegroups = {snappy = 3, flammable = 2, plant = 1, not_in_creative_inventory = 1, attached_node = 1}
		local texture = mname .. "_" .. pname .. "_" .. i .. ".png"
		nodegroups[pname] = i
		local description_plant
		if def.description_plant then
			description_plant = S(def.description_plant, S("Stage @1", i))
		end
		minetest.register_node(mname .. ":" .. pname .. "_" .. i, {
			drawtype = "plantlike",
			description = description_plant,
			inventory_image = texture,
			wield_image = texture,
			tiles = {texture},
			use_texture_alpha = "clip",
			paramtype = "light",
			walkable = false,
			buildable_to = true,
			floodable = true,
			is_ground_content = true,
			drop = drop,
			selection_box = {
				type = "fixed",
				fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
			},
			groups = nodegroups,
			sounds = hades_sounds.node_sound_grass_defaults(),
		})
	end

	-- Growing ABM
	minetest.register_abm({
		label = "Grow seeds",
		nodenames = {"group:" .. pname, "group:seed"},
		neighbors = {"group:soil"},
		interval = 93,
		chance = 12,
		action = function(pos, node)
			local plant_height = minetest.get_item_group(node.name, pname)

			-- return if already full grown
			if plant_height == def.steps then
				return
			end

			local node_def = minetest.registered_items[node.name] or nil

			-- grow seed
			if minetest.get_item_group(node.name, "seed") and node_def.fertility then
				local can_grow = false
				local soil_node = minetest.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
				if not soil_node then
					return
				end
				for _, v in pairs(node_def.fertility) do
					if minetest.get_item_group(soil_node.name, v) ~= 0 then
						can_grow = true
					end
				end
				if can_grow then
					minetest.set_node(pos, {name = node.name:gsub("seed_", "") .. "_1"})
				end
				return
			end

			-- check if on wet soil
			pos.y = pos.y - 1
			local n = minetest.get_node(pos)
			if minetest.get_item_group(n.name, "soil") < 3 then
				return
			end
			pos.y = pos.y + 1

			-- check light
			local ll = minetest.get_node_light(pos)

			if not ll or ll < def.minlight or ll > def.maxlight then
				return
			end

			-- grow
			minetest.set_node(pos, {name = mname .. ":" .. pname .. "_" .. plant_height + 1})
		end
	})

	-- Return
	local r = {
		seed = mname .. ":seed_" .. pname,
		harvest = mname .. ":" .. pname
	}
	return r
end

