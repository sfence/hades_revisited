local S = minetest.get_translator("hades_refruit")

-- hades_refruit for Minetest.
-- Makes fruit regrow on the trees.
hades_refruit = {}

function hades_refruit.add_hades_refruit(id, def)
	local ndef = minetest.registered_nodes[def.fruit_itemstring]
	local groups = ndef.groups
	if not groups then
		groups = {}
	else
		groups = table.copy(ndef.groups)
	end
	local groups_fruit
	groups_fruit = table.copy(groups)
	groups_fruit.fruit_regrow = 3

	minetest.override_item(def.fruit_itemstring, {
		groups = groups_fruit,
		place_param2 = 1,
		after_dig_node = function(pos, oldnode, oldmetadta, digger)
			if oldnode.name == def.fruit_itemstring then
				if oldnode.param2 ~= 0 then
					return
				end
				minetest.set_node(pos, {name = "hades_refruit:bud_"..id})
			else 
				return
			end
		end,
		node_dig_prediction = "hades_refruit:bud_"..id,
	})

	local bud_itemstring = "hades_refruit:bud_"..id
	local flower_itemstring = "hades_refruit:flower_"..id

	minetest.register_node(bud_itemstring, {
		description = def.bud_description,
		_tt_help = def.bud_tt,
		drawtype = ndef.drawtype,
		tiles = {"hades_refruit_bud_"..id..".png"},
		inventory_image = "hades_refruit_bud_"..id..".png",
		wield_image = "hades_refruit_bud_"..id..".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		floodable = true,
		selection_box = {
			type = "fixed",
			fixed = def.bud_selbox,
		},
		groups = {fruit_regrow=1, snappy=2,oddly_breakable_by_hand=3,flammable=2,leafdecay=3,leafdecay_drop=1},
		drop = def.bud_drop or {},
		sounds = hades_sounds.node_sound_leaves_defaults(),
	})
	minetest.register_node(flower_itemstring, {
		description = def.flower_description,
		_tt_help = def.flower_tt,
		drawtype = ndef.drawtype,
		tiles = {"hades_refruit_flower_"..id..".png"},
		inventory_image = "hades_refruit_flower_"..id..".png",
		wield_image = "hades_refruit_flower_"..id..".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		floodable = true,
		selection_box = {
			type = "fixed",
			fixed = def.flower_selbox,
		},
		groups = {fruit_regrow=2, snappy=2,oddly_breakable_by_hand=3,flammable=2,leafdecay=3,leafdecay_drop=1},
		drop = def.flower_drop or {},
		sounds = hades_sounds.node_sound_leaves_defaults(),
	})

	minetest.register_abm({
		label = "Grow "..bud_itemstring.." to "..flower_itemstring,
		nodenames = {"hades_refruit:bud_"..id},
		neighbors = def.neighbors,
		interval = def.bud_interval,
		chance = def.bud_chance,
		action = function(pos, node)
			minetest.set_node(pos, {name="hades_refruit:flower_"..id})
		end,
	})

	minetest.register_abm({
		label = "Grow "..flower_itemstring.." to "..def.fruit_itemstring,
		nodenames = {"hades_refruit:flower_"..id},
		neighbors = def.neighbors,
		interval = def.flower_interval,
		chance = def.flower_chance,
		action = function(pos, node)
			minetest.set_node(pos, {name=def.fruit_itemstring})
		end,
	})

end


local stick_drop = function(rarity)
	return {
		max_items = 1,
		items = {
			{
				items = {'hades_core:stick'},
				rarity = rarity,
			},
			{
				items = {'hades_core:stick'},
				rarity = rarity
			}
		}
	}
end

local surv = S("Needs a tree trunk to survive")

hades_refruit.add_hades_refruit("apple", {
	fruit_itemstring = "hades_trees:apple",
	bud_description = S("Apple Bud"),
	bud_tt = S("Grows to an Apple Flower").."\n"..surv.."\n"..S("Needs Common Leaves to grow"),
	flower_description = S("Apple Flower"),
	flower_tt = S("Grows to an Apple").."\n"..surv.."\n"..S("Needs Common Leaves to grow"),
	bud_drop = stick_drop(99),
	flower_drop = stick_drop(99),
	bud_interval = 34,
	bud_chance = 10,
	flower_interval = 33,
	flower_chance = 60,
	neighbors = {"hades_trees:leaves"},
	bud_selbox = {-0.1875, -0.3125, -0.1875, 0.1875, 0.3125, 0.1875},
	flower_selbox = {-0.1875, -0.3125, -0.1875, 0.1875, 0.3125, 0.1875},
})

hades_refruit.add_hades_refruit("olive", {
	fruit_itemstring = "hades_trees:olive",
	bud_description = S("Olive Bud"),
	bud_tt = S("Grows to an Olive Flower").."\n"..surv.."\n"..S("Needs Olive Leaves to grow"),
	flower_description = S("Olive Flower"),
	flower_tt = S("Grows to an Olive").."\n"..surv.."\n"..S("Needs Olive Leaves to grow"),
	bud_drop = stick_drop(99),
	flower_drop = stick_drop(76),
	bud_interval = 35,
	bud_chance = 10,
	flower_interval = 34,
	flower_chance = 60,
	neighbors = {"hades_trees:olive_leaves"},
	bud_selbox = {-2/16, 1/16, -2/16, 2/16, 0.5, 2/16},
	flower_selbox = {-4/16, -1/16, -4/16, 4/16, 0.5, 4/16},
})

hades_refruit.add_hades_refruit("orange", {
	fruit_itemstring = "hades_trees:orange",
	bud_description = S("Orange Bud"),
	bud_tt = S("Grows to an Orange Flower").."\n"..surv.."\n"..S("Needs Orange Leaves to grow"),
	flower_description = S("Orange Flower"),
	flower_tt = S("Grows to an Orange").."\n"..surv.."\n"..S("Needs Orange Leaves to grow"),
	bud_interval = 34,
	bud_chance = 10,
	flower_interval = 33,
	flower_chance = 60,
	neighbors = {"hades_trees:orange_leaves"},
	bud_selbox = {-0.1875, -0.4375, -0.1875, 0.1875, 0.25, 0.1875},
	flower_selbox = {-0.1875, -0.4375, -0.1875, 0.1875, 0.25, 0.1875},
})

hades_refruit.add_hades_refruit("banana", {
	fruit_itemstring = "hades_trees:banana",
	bud_description = S("Banana Bud"),
	bud_tt = S("Grows to a Banana Flower").."\n"..surv.."\n"..S("Needs Banana Leaves to grow"),
	flower_description = S("Banana Flower"),
	flower_tt = S("Grows to an Banana").."\n"..surv.."\n"..S("Needs Banana Leaves to grow"),
	bud_interval = 35,
	bud_chance = 10,
	flower_interval = 34,
	flower_chance = 60,
	neighbors = {"hades_trees:banana_leaves"},
	bud_selbox = {-0.1875, -0.4375, -0.1875, 0.1875, 0.25, 0.1875},
	flower_selbox = {-0.1875, -0.4375, -0.1875, 0.1875, 0.25, 0.1875},
})

hades_refruit.add_hades_refruit("cocoa", {
	fruit_itemstring = "hades_trees:cocoa_pod",
	bud_description = S("Cocoa Bud"),
	bud_tt = S("Grows to a Cocoa Flower").."\n"..surv.."\n"..S("Needs Common Tropical Leaves to grow"),
	flower_description = S("Cocoa Flower"),
	flower_tt = S("Grows to Cocoa").."\n"..surv.."\n"..S("Needs Common Tropical Leaves to grow"),
	bud_interval = 35,
	bud_chance = 10,
	flower_interval = 34,
	flower_chance = 60,
	neighbors = {"hades_trees:jungle_leaves"},
	bud_selbox = {-0.1875, -0.25, -0.1875, 0.1875, 0.375, 0.1875},
	flower_selbox = {-0.1875, -0.1875, -0.1875, 0.1875, 0.5, 0.1875},
})

hades_refruit.add_hades_refruit("coconut", {
	fruit_itemstring = "hades_trees:coconut",
	bud_description = S("Coconut Bud"),
	bud_tt = S("Grows to a Coconut Flower").."\n"..surv.."\n"..S("Needs Common Tropical Leaves to grow"),
	flower_description = S("Coconut Flower"),
	flower_tt = S("Grows to a Coconut").."\n"..surv.."\n"..S("Needs Common Tropical Leaves to grow"),
	bud_interval = 35,
	bud_chance = 10,
	flower_interval = 34,
	flower_chance = 60,
	neighbors = {"hades_trees:jungle_leaves"},
	bud_selbox = {-2/16, -6/16, -2/16, 2/16, 3/16, 2/16},
	flower_selbox = {-5/16, -7/16, -5/16, 5/16, 7/16, 5/16},
})

