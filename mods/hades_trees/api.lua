local S = minetest.get_translator("hades_trees")

hades_trees.register_trunk = function(id, def)
	minetest.register_node("hades_trees:"..id, {
		description = def.description,
		tiles = def.tiles,
		paramtype = "light",
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5,-0.5,-3/16, 0.5,0.5,3/16},
				{-7/16,-0.5,-5/16, 7/16,0.5,5/16},
				{-6/16,-0.5,-6/16, 6/16,0.5,6/16},
				{-5/16,-0.5,-7/16, 5/16,0.5,7/16},
				{-3/16,-0.5,-0.5, 3/16,0.5,0.5},
			},
		},
		is_ground_content = false,
		groups = {tree=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
		sounds = hades_sounds.node_sound_wood_defaults(),
	})
end

hades_trees.register_bark = function(id, def)
	minetest.register_node("hades_trees:"..id, {
		description = def.description,
		paramtype2 = "facedir",
		tiles = {{ name = def.image, align_style = "node" }},
		is_ground_content = false,
		groups = { bark=1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 2 },
		sounds = hades_sounds.node_sound_wood_defaults(),
	})
end

hades_trees.register_sapling = function(id, def)
	local tth
	if def.growtype == "ash" then
		tth = S("Needs Dirt, Fertile Sand, Volcanic Sand or Volcanic Ash to grow, and light")
	else
		tth = S("Needs Dirt and light to grow")
	end
	minetest.register_node("hades_trees:"..id, {
		description = def.description,
		_tt_help = tth,
		drawtype = "plantlike",
		tiles = {def.image},
		inventory_image = def.image,
		wield_image = def.image,
		paramtype = "light",
		walkable = false,
		is_ground_content = false,
		floodable = true,
		selection_box = {
			type = "fixed",
			fixed = def.selbox,
		},
		groups = {snappy=2,dig_immediate=3,flammable=2,attached_node=1, sapling=1},
		sounds = hades_sounds.node_sound_bush_defaults(),
	})
end

hades_trees.register_leaves = function(id, def)
	local drop = {
		max_items = 1,
		items = {
		{
				-- player will get sapling with chance of (1/def.drop_rarity)
				items = {def.drop_item},
				rarity = def.drop_rarity,
			},
			{
				-- player will get leaves only if they get no def.drop_item,
				-- this is because max_items is 1
				items = {"hades_trees:"..id},
			}
		}
	}
	minetest.register_node("hades_trees:"..id, {
		description = def.description,
		drawtype = "allfaces_optional",
		tiles = {def.image},
		paramtype = "light",
		waving = 1,
		is_ground_content = false,
		place_param2 = 1,
		groups = {snappy=3, leafdecay=3, flammable=2, leaves=1, ash_fertilizer=def.ash_fertilizer, porous=1},
		drop = drop,
		sounds = hades_sounds.node_sound_leaves_defaults(),
	})
end

hades_trees.register_fruit = function(id, def)
	local sat = def.satiation
	local on_use, food
	if def.satiation then
		food = 2
		on_use = minetest.item_eat(sat)
	end
	local groups = {dig_immediate=3,flammable=2,leafdecay=3,leafdecay_drop=1,food=food,eatable=sat}
	if def.groups then
		for k,v in pairs(def.groups) do
			if v == 0 then
				v = nil
			end
			groups[k] = v
		end
	end
	minetest.register_node("hades_trees:"..id, {
		description = def.description,
		drawtype = def.drawtype,
		tiles = {def.image},
		inventory_image = def.image,
		wield_image = def.image,
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		is_ground_content = false,
		floodable = true,
		selection_box = {
			type = "fixed",
			fixed = def.selbox,
		},
		groups = groups,
		on_use = on_use,
		sounds = hades_sounds.node_sound_leaves_defaults(),
		place_param2 = 1,
	})
end

