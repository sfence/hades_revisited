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

minetest.register_node("itemframes:pedestal",{
	description = S("Pedestal"),
	_tt_help = S("You can show off an item here"),
	drawtype = "nodebox",
	node_box = { type = "fixed", fixed = {
		{-7/16, -8/16, -7/16, 7/16, -7/16, 7/16}, -- bottom plate
		{-6/16, -7/16, -6/16, 6/16, -6/16, 6/16}, -- bottom plate (upper)
		{-0.25, -6/16, -0.25, 0.25, 11/16, 0.25}, -- pillar
		{-7/16, 11/16, -7/16, 7/16, 12/16, 7/16}, -- top plate
	} },
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -0.5, -7/16, 7/16, 12/16, 7/16}
	},
	tiles = {"itemframes_pedestal.png"},
	paramtype = "light",
	groups = {cracky = 3},
	sounds = hades_sounds.node_sound_defaults(),
	on_rotate = false,

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
