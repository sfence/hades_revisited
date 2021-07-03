local S = minetest.get_translator("itemframes")

local tmp = {}

-- item entity

minetest.register_entity("itemframes:item",{
	hp_max = 1,
	visual="wielditem",
	visual_size={x = 0.33, y = 0.33},
	collisionbox = {0, 0, 0, 0, 0, 0},
	physical = false,
	textures = {"blank.png"},
	on_activate = function(self, staticdata)

		if minetest.global_exists("mobs") and mobs.entity and mobs.entity == false then
			self.object:remove()
			return
		end

		if tmp.nodename ~= nil and tmp.texture ~= nil then
			self.nodename = tmp.nodename
			tmp.nodename = nil
			self.texture = tmp.texture
			tmp.texture = nil
		else
			if staticdata ~= nil and staticdata ~= "" then
				local data = staticdata:split(';')
				if data and data[1] and data[2] then
					self.nodename = data[1]
					self.texture = data[2]
				end
			end
		end
		if self.texture ~= nil then
			self.object:set_properties({textures = {self.texture}})
		end
		if self.nodename == "itemframes:pedestal" then
			self.object:set_properties({automatic_rotate = 1})
		end
	end,
	get_staticdata = function(self)
		if self.nodename ~= nil and self.texture ~= nil then
			return self.nodename .. ';' .. self.texture
		end
		return ""
	end,
})

local facedir = {}
facedir[0] = {x = 0, y = 0, z = 1}
facedir[1] = {x = 1, y = 0, z = 0}
facedir[2] = {x = 0, y = 0, z = -1}
facedir[3] = {x = -1, y = 0, z = 0}

-- functions

local remove_item = function(pos, node)
	local objs = nil
	if node.name == "itemframes:frame" then
		objs = minetest.get_objects_inside_radius(pos, 0.5)
	elseif node.name == "itemframes:pedestal" then
		pos.y = pos.y + 1
		objs = minetest.get_objects_inside_radius(pos, 0.5)
		pos.y = pos.y - 1
	end
	if objs then
		for _, obj in ipairs(objs) do
			if obj and obj:get_luaentity() then
				local ent = obj:get_luaentity()
				local name = ent.name
				local nodename = ent.nodename
				if name == "itemframes:item" and nodename == node.name then
					obj:remove()
				end
			end
		end
	end
end

local update_item = function(pos, node)
	remove_item(pos, node)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local stack = inv:get_stack("main", 1)
	if not stack:is_empty() then
		if node.name == "itemframes:frame" then
			local posad = facedir[node.param2]
			if not posad then return end
			pos.x = pos.x + posad.x * 6.5 / 16
			pos.y = pos.y + posad.y * 6.5 / 16
			pos.z = pos.z + posad.z * 6.5 / 16
		elseif node.name == "itemframes:pedestal" then
			pos.y = pos.y + 12 / 16 + 0.33
		end
		tmp.nodename = node.name
		tmp.texture = stack:get_name()
		local e = minetest.add_entity(pos,"itemframes:item")
		if node.name == "itemframes:frame" then
			local yaw = math.pi * 2 - node.param2 * math.pi / 2
			e:set_yaw(yaw)
		end
	end
end

local drop_item = function(pos, node, creative)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local item = inv:get_stack("main", 1)
	if item ~= "" then
		if creative then
			-- Don't drop item
		elseif node.name == "itemframes:frame" then
			minetest.add_item(pos, item)
		elseif node.name == "itemframes:pedestal" then
			minetest.add_item({x=pos.x, y=pos.y+1, z=pos.z}, item)
		end
		inv:set_stack("main", 1, "")
	end
	remove_item(pos, node)
end

-- nodes

minetest.register_node("itemframes:frame",{
	description = S("Item Frame"),
	_tt_help = S("You can show off an item here"),
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 7/16, 0.5, 0.5, 0.5}
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 7/16, 0.5, 0.5, 0.5}
	},
	tiles = {"itemframes_frame.png"},
	inventory_image = "itemframes_frame.png",
	wield_image = "itemframes_frame.png",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	groups = {choppy = 2, dig_immediate = 2},
	sounds = hades_sounds.node_sound_defaults(),
	is_ground_content = false,
	-- TODO: Implement rotation
	on_rotate = false,

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", S("Item Frame"))
		local inv = meta:get_inventory()
		inv:set_size("main", 1)
	end,

	on_rightclick = function(pos, node, clicker, itemstack)
		if not itemstack then return end
		if minetest.is_protected(pos, clicker:get_player_name()) then return end
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local creative = minetest.is_creative_enabled(clicker:get_player_name())
		if not inv:get_stack("main", 1):is_empty() then
			drop_item(pos, node, creative)
		else
			inv:set_stack("main", 1, itemstack)
			update_item(pos, node)
			if not creative then
				itemstack:take_item()
			end
			return itemstack
		end
	end,

	on_destruct = function(pos)
		drop_item(pos, minetest.get_node(pos), minetest.is_creative_enabled(""))
	end,

	on_punch = function(pos, node, puncher)
		local num = #minetest.get_objects_inside_radius(pos, 0.5)
		if num > 0 then
			return
		end
		update_item(pos, node)
	end,
})

-- This is the upper portion of the pedestal.
-- It's invisible, the rendering is done in the main pedestal node.
minetest.register_node("itemframes:pedestal_top", {
	description = S("Pedestal Top"),
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	collision_box = {
		type = "fixed",
		fixed = {
			{-7/16, -5/16, -7/16, 7/16, -4/16, 7/16}, -- top plate
			{-0.25, -8/16, -0.25, 0.25, -5/16, 0.25}, -- pillar (top section)
		},
	},

	groups = { not_in_creative_inventory = 1 },
	inventory_image = "itemframes_pedestal_top_inv.png",
	wield_image = "itemframes_pedestal_top_inv.png",

	on_blast = function() end,
	groups = {not_in_creative_inventory=1},
	drop = "",
	diggable = false,
	walkable = true,
	is_ground_content = false,
	pointable = false,
	buildable_to = false,
	floodable = false,
})

local function on_place_node_callbacks(place_to, newnode, placer, oldnode, itemstack, pointed_thing)
	-- Run script hook
	for _, callback in ipairs(minetest.registered_on_placenodes) do
		-- Deepcopy pos, node and pointed_thing because callback can modify them
		local place_to_copy = {x = place_to.x, y = place_to.y, z = place_to.z}
		local newnode_copy =
			{name = newnode.name, param1 = newnode.param1, param2 = newnode.param2}
		local oldnode_copy =
			{name = oldnode.name, param1 = oldnode.param1, param2 = oldnode.param2}
		local pointed_thing_copy = {
			type  = pointed_thing.type,
			above = vector.new(pointed_thing.above),
			under = vector.new(pointed_thing.under),
			ref   = pointed_thing.ref,
		}
		callback(place_to_copy, newnode_copy, placer,
			oldnode_copy, itemstack, pointed_thing_copy)
	end
end

minetest.register_node("itemframes:pedestal",{
	description = S("Pedestal"),
	_tt_help = S("You can show off an item here"),
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-7/16, -8/16, -7/16, 7/16, -7/16, 7/16}, -- bottom plate
			{-6/16, -7/16, -6/16, 6/16, -6/16, 6/16}, -- bottom plate (upper)
			{-0.25, -6/16, -0.25, 0.25, 11/16, 0.25}, -- pillar
			{-7/16, 11/16, -7/16, 7/16, 12/16, 7/16}, -- top plate
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-7/16, -8/16, -7/16, 7/16, -7/16, 7/16}, -- bottom plate
			{-6/16, -7/16, -6/16, 6/16, -6/16, 6/16}, -- bottom plate (upper)
			{-0.25, -6/16, -0.25, 0.25, 8/16, 0.25}, -- pillar (lower part)
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -0.5, -7/16, 7/16, 12/16, 7/16}
	},
	tiles = {"itemframes_pedestal.png"},
	paramtype = "light",
	groups = {cracky = 3},
	sounds = hades_sounds.node_sound_defaults(),
	on_rotate = false,
	is_ground_content = false,

	node_placement_prediction = "",

	on_place = function(itemstack, placer, pointed_thing)
		local pos

		if not pointed_thing.type == "node" then
			return itemstack
		end

		local node = minetest.get_node(pointed_thing.under)
		local pdef = minetest.registered_nodes[node.name]
		if pdef and pdef.on_rightclick and
				not placer:get_player_control().sneak then
			return pdef.on_rightclick(pointed_thing.under,
					node, placer, itemstack, pointed_thing)
		end

		if pdef and pdef.buildable_to then
			pos = pointed_thing.under
		else
			pos = pointed_thing.above
			node = minetest.get_node(pos)
			pdef = minetest.registered_nodes[node.name]
			if not pdef or not pdef.buildable_to then
				return itemstack
			end
		end

		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		local top_node = minetest.get_node_or_nil(above)
		local topdef = top_node and minetest.registered_nodes[top_node.name]

		if not topdef or not topdef.buildable_to then
			return itemstack
		end

		local pn = placer:get_player_name()
		if minetest.is_protected(pos, pn) or minetest.is_protected(above, pn) then
			return itemstack
		end

		minetest.set_node(pos, {name = "itemframes:pedestal"})
		minetest.set_node(above, {name = "itemframes:pedestal_top"})

		if not (minetest.is_creative_enabled(pn)) then
			itemstack:take_item()
		end

		on_place_node_callbacks(pos, minetest.get_node(pos),
			placer, node, itemstack, pointed_thing)

		local def = minetest.registered_nodes["itemframes:pedestal"]
		minetest.sound_play(def.sounds.place, {pos = pos}, true)

		return itemstack
	end,

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", S("Pedestal"))
		local inv = meta:get_inventory()
		inv:set_size("main", 1)
	end,

	on_rightclick = function(pos, node, clicker, itemstack)
		if not itemstack then return end
		if minetest.is_protected(pos, clicker:get_player_name()) then return end
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local creative = minetest.is_creative_enabled(clicker:get_player_name())
		if not inv:get_stack("main", 1):is_empty() then
			drop_item(pos, node, creative)
		else
			inv:set_stack("main", 1, itemstack)
			update_item(pos, node)
			if not creative then
				itemstack:take_item()
			end
			return itemstack
		end
	end,

	on_destruct = function(pos)
		drop_item(pos, minetest.get_node(pos), minetest.is_creative_enabled(""))

		local above = {x=pos.x, y=pos.y+1, z=pos.z}
		local node_above = minetest.get_node(above)
		if node_above.name == "itemframes:pedestal_top" then
			minetest.remove_node(above)
		end
	end,

	on_punch = function(pos, node, puncher)
		local num = #minetest.get_objects_inside_radius({x=pos.x,y=pos.y+1,z=pos.z}, 0.5)
		if num > 0 then
			return
		end
		update_item(pos, node)
	end,
})

-- automatically restore entities lost from frames/pedestals
-- due to /clearobjects or similar

minetest.register_lbm({
	name = "itemframes:respawn_entities",
	label = "Respawn entities of item frames and pedestals",
	nodenames = {"itemframes:frame", "itemframes:pedestal"},
	run_at_every_load = true,
	action = function(pos, node)
		local num
		if node.name == "itemframes:frame" then
			num = #minetest.get_objects_inside_radius(pos, 0.5)
		elseif node.name == "itemframes:pedestal" then
			pos.y = pos.y + 1
			num = #minetest.get_objects_inside_radius(pos, 0.5)
			pos.y = pos.y - 1
		end
		if num > 0 then
			return
		end
		update_item(pos, node)
	end
})

-- update itemframe/pedestal items to new item storing format

minetest.register_lbm({
	name = "itemframes:update_items_0_9_0",
	label = "Update items of item frames and pedestals",
	nodenames = {"itemframes:frame", "itemframes:pedestal"},
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local itemstring_old = meta:get_string("item")
		if itemstring_old ~= "" then
			local inv = meta:get_inventory()
			inv:set_size("main", 1)
			inv:set_stack("main", 1, ItemStack(itemstring_old))
			meta:set_string("item", "")
		end
	end
})


-- crafts

minetest.register_craft({
	output = 'itemframes:frame',
	recipe = {
		{'group:stick', 'group:stick', 'group:stick'},
		{'group:stick', 'hades_core:paper', 'group:stick'},
		{'group:stick', 'group:stick', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'itemframes:pedestal',
	recipe = {
		{'hades_core:stone', 'hades_core:stone', 'hades_core:stone'},
		{'', 'hades_core:stone', ''},
		{'hades_core:stone', 'hades_core:stone', 'hades_core:stone'},
	}
})
