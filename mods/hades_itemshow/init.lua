local S = minetest.get_translator("hades_itemshow")

local BASE_ITEM_SIZE = 1/3

local ROTATE_SPEED = 1 -- speed at which the entity rotates
local DEFAULT_ROTATE_DIR = -1 -- clockwise
-- Clockwise because dropped item rotate counter-clockwise,
-- so the 'itemshow' entities rotate the other way by
-- default

local FACEDIR = {}
FACEDIR[0] = {x = 0, y = 0, z = 1}
FACEDIR[1] = {x = 1, y = 0, z = 0}
FACEDIR[2] = {x = 0, y = 0, z = -1}
FACEDIR[3] = {x = -1, y = 0, z = 0}

-- functions

local remove_item = function(pos, node, dry_run)
	local objs = nil
	local objects_found = false
	if node.name == "hades_itemshow:frame" or
			minetest.get_item_group(node.name, "item_showcase") == 1 then
		objs = minetest.get_objects_inside_radius(pos, 0.5)
	elseif minetest.get_item_group(node.name, "pedestal") == 1 then
		pos.y = pos.y + 1
		objs = minetest.get_objects_inside_radius(pos, 0.5)
		pos.y = pos.y - 1
	end
	if objs then
		for _, obj in ipairs(objs) do
			if obj and obj:get_luaentity() then
				local ent = obj:get_luaentity()
				local name = ent.name
				local nodename = ent._nodename
				if name == "hades_itemshow:item" and nodename == node.name then
					objects_found = true
					if dry_run then
						return objects_found
					else
						obj:remove()
					end
				end
			end
		end
	end
	return objects_found
end

local update_item = function(pos, node, check_item)
	local objects_found = remove_item(pos, node, check_item)
	if check_item and objects_found then
		return
	end
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local stack = inv:get_stack("main", 1)
	if not stack:is_empty() then
		if node.name == "hades_itemshow:frame" then
			local posad = FACEDIR[node.param2]
			if not posad then return end
			pos.x = pos.x + posad.x * 6.5 / 16
			pos.y = pos.y + posad.y * 6.5 / 16
			pos.z = pos.z + posad.z * 6.5 / 16
		elseif minetest.get_item_group(node.name, "pedestal") == 1 then
			pos.y = pos.y + 12 / 16 + 0.33
		elseif minetest.get_item_group(node.name, "item_showcase") == 1 then
			-- no pos change, put in center of node
		end
		local e = minetest.add_entity(pos,"hades_itemshow:item")
		if e then
			local lua = e:get_luaentity()
			if lua then
				local dir = DEFAULT_ROTATE_DIR
				if node.param2 == 1 then
					dir = -dir
				end
				lua:_configure(stack:get_name(), node.name, dir)
			end
		end
		if e and node.name == "hades_itemshow:frame" then
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
		elseif node.name == "hades_itemshow:frame" or minetest.get_item_group(node.name, "item_showcase") == 1 then
			minetest.add_item(pos, item)
		elseif minetest.get_item_group(node.name, "pedestal") == 1 then
			minetest.add_item({x=pos.x, y=pos.y+1, z=pos.z}, item)
		end
		inv:set_stack("main", 1, "")
	end
	remove_item(pos, node)
end


local on_rightclick = function(pos, node, clicker, itemstack)
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
end

-- This on_rotate event makes the 'displayed item' entity rotate in the other direction
local on_rotate_for_entity = function(pos, node, user, mode, new_param2)
	if mode == screwdriver.ROTATE_FACE then
		local ppos = table.copy(pos)
		if minetest.get_item_group(node.name, "pedestal") == 1 then
			ppos = {x=ppos.x, y=ppos.y+1, z=ppos.z}
		end

		-- Update rotation status in node's param2
		-- param2=0: rotate_dir=-1 (clockwise)
		-- param2=1: rotate_dir= 1 (counter-clockwise)
		node.param2 = 1 - node.param2
		minetest.swap_node(pos, node)

		local objs = minetest.get_objects_inside_radius(ppos, 0.5)
		if objs then
			for _, obj in ipairs(objs) do
				if obj and obj:get_luaentity() then
					local ent = obj:get_luaentity()
					local name = ent.name
					local nodename = ent._nodename
					if name == "hades_itemshow:item" and nodename == node.name then
						-- Update entity rotation and store into _rotate_dir
						-- for persistence
						ent._rotate_dir = -ent._rotate_dir
						local rot = ROTATE_SPEED * ent._rotate_dir
						obj:set_properties({automatic_rotate = rot})

						return false
					end
				end
			end
		end
		-- If no showitem object found, update (respawn) it
		update_item(pos, node, false)
		return false
	end
	return false
end

-- Entity for displayed item

minetest.register_entity("hades_itemshow:item",{
	hp_max = 1,
	visual = "wielditem",
	is_visible = false,
	visual_size = {x = BASE_ITEM_SIZE, y = BASE_ITEM_SIZE },
	pointable = false,
	physical = false,
	-- Extra fields used:
	-- * _nodename: Name of node this displayed item belongs to
	-- * _item: Itemstring of displayed item
	-- * _rotate_dir: Direction of entity rotation (for pedestal/showcase)

	_configure = function(self, item, nodename, rotate_dir)
		local props = { is_visible = true }
		if item then
			self._item = item
			props.wield_item = self._item
		end
		if nodename then
			self._nodename = nodename
		end
		if rotate_dir then
			self._rotate_dir = rotate_dir
		end

		if self._nodename and self._nodename ~= "" then
			if minetest.get_item_group(self._nodename, "pedestal") == 1 or
					minetest.get_item_group(self._nodename, "item_showcase") == 1 then
				if not self._rotate_dir then
					self._rotate_dir = DEFAULT_ROTATE_DIR
				end
				props.automatic_rotate = ROTATE_SPEED * self._rotate_dir
			end
		end

		if self._item then
			local def = minetest.registered_nodes[self._item]
			if def and def.visual_scale then
				props.visual_size = { x = BASE_ITEM_SIZE * def.visual_scale, y = BASE_ITEM_SIZE * def.visual_scale }
			end
		end

		self.object:set_properties(props)
	end,

	on_activate = function(self, staticdata)

		self.object:set_armor_groups({immortal=1})

		local nodename, item, rotate_dir
		if staticdata ~= nil and staticdata ~= "" then
			local data = staticdata:split(';')
			if data and data[1] and data[2] then
				nodename = data[1]
				item = data[2]
			end
			if data and data[3] then
				rotate_dir = tonumber(data[3]) or DEFAULT_ROTATE_DIR
			end

		end

		if item and item ~= "" then
			self:_configure(item, nodename, rotate_dir)
		end
	end,

	get_staticdata = function(self)
		if self._nodename ~= nil and self._item ~= nil then
			local data = self._nodename .. ';' .. self._item
			if self._rotate_dir ~= nil then
				data = data .. ";" .. self._rotate_dir
			end
			return data
		end
		return ""
	end,
})

-- nodes

minetest.register_node("hades_itemshow:frame",{
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
	tiles = {
		"hades_itemshow_frame.png",
		"hades_itemshow_frame.png",
		"hades_itemshow_frame.png",
		"hades_itemshow_frame.png",
		"hades_itemshow_frame_back.png",
		"hades_itemshow_frame.png",
	},
	inventory_image = "hades_itemshow_frame.png",
	wield_image = "hades_itemshow_frame.png",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	groups = {choppy = 2, dig_immediate = 2},
	sounds = hades_sounds.node_sound_defaults(),
	is_ground_content = false,
	on_rotate = function(pos, node, user, mode, new_param2)
		if mode == screwdriver.ROTATE_AXIS then
			return false
		elseif mode == screwdriver.ROTATE_FACE then
			local newnode = table.copy(node)
			newnode.param2 = new_param2
			update_item(pos, newnode)
			return
		end
	end,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", S("Item Frame"))
		local inv = meta:get_inventory()
		inv:set_size("main", 1)
	end,

	on_rightclick = on_rightclick,

	on_destruct = function(pos)
		drop_item(pos, minetest.get_node(pos), minetest.is_creative_enabled(""))
	end,

	on_punch = function(pos, node, puncher)
		update_item(pos, node, true)
	end,
})

-- This is the upper portion of the pedestal.
-- It's invisible, the rendering is done in the main pedestal node.
minetest.register_node("hades_itemshow:pedestal_top", {
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
	inventory_image = "hades_itemshow_pedestal_top_inv.png",
	wield_image = "hades_itemshow_pedestal_top_inv.png",

	sounds = hades_sounds.node_sound_stone_defaults(),

	on_blast = function() end,
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

-- Register a pedestal.
-- * name: itemstring (without mod prefix)
-- * def: table:
--    * description: same as node field
--    * tiles: same as node field
--    * groups: groups to add to node
--    * craftitem: item used for craft recipe (nil = no recipe added)
-- NOTE: This is currently designed for stone/rocky materials only (due to stone sound)

local function register_pedestal(name, def)
local groups = table.copy(def.groups)
groups.pedestal = 1
minetest.register_node("hades_itemshow:"..name,{
	description = def.description,
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
	tiles = def.tiles,
	paramtype = "light",
	groups = groups,
	sounds = hades_sounds.node_sound_stone_defaults(),
	on_rotate = on_rotate_for_entity,

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

		-- Don't build if upper node is blocked, unless it's the pedestal top
		if not topdef or (not topdef.buildable_to and top_node.name ~= "hades_itemshow:pedestal_top") then
			return itemstack
		end

		local pn = placer:get_player_name()
		if minetest.is_protected(pos, pn) or minetest.is_protected(above, pn) then
			return itemstack
		end

		minetest.set_node(pos, {name = "hades_itemshow:"..name})
		minetest.set_node(above, {name = "hades_itemshow:pedestal_top"})

		if not (minetest.is_creative_enabled(pn)) then
			itemstack:take_item()
		end

		on_place_node_callbacks(pos, minetest.get_node(pos),
			placer, node, itemstack, pointed_thing)

		local def = minetest.registered_nodes["hades_itemshow:"..name]
		minetest.sound_play(def.sounds.place, {pos = pos}, true)

		return itemstack
	end,

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", S("Pedestal"))
		local inv = meta:get_inventory()
		inv:set_size("main", 1)
	end,

	on_destruct = function(pos)
		drop_item(pos, minetest.get_node(pos), minetest.is_creative_enabled(""))

		local above = {x=pos.x, y=pos.y+1, z=pos.z}
		local node_above = minetest.get_node(above)
		if node_above.name == "hades_itemshow:pedestal_top" then
			minetest.remove_node(above)
		end
	end,

	on_rightclick = on_rightclick,

	on_punch = function(pos, node, puncher)
		update_item(pos, node, true)
	end,
})

if def.craftitem then
minetest.register_craft({
	output = 'hades_itemshow:'..name,
	recipe = {
		{def.craftitem, def.craftitem, def.craftitem},
		{'', def.craftitem, ''},
		{def.craftitem, def.craftitem, def.craftitem},
	}
})
end
end

register_pedestal("pedestal_stone", {
	description=S("Stone Pedestal"),
	tiles={"hades_itemshow_pedestal_stone_top.png","hades_itemshow_pedestal_stone.png"},
	groups={cracky=3},
	craftitem="hades_core:stone"})
register_pedestal("pedestal_stone_baked", {
	description=S("Burned Stone Pedestal"),
	tiles={"hades_itemshow_pedestal_stone_baked_top.png","hades_itemshow_pedestal_stone_baked.png"},
	groups={cracky=3},
	craftitem="hades_core:stone_baked"})
register_pedestal("pedestal_marble", {
	description=S("Marble Pedestal"),
	tiles={"hades_core_marble.png"},
	groups={cracky=3},
	craftitem="hades_core:marble"})
register_pedestal("pedestal_sandstone", {
	description=S("Fine Sandstone Pedestal"),
	tiles={"default_sandstone.png"},
	groups={cracky=3},
	craftitem="hades_core:sandstone"})
register_pedestal("pedestal_sandstone_volcanic", {
	description=S("Volcanic Sandstone Pedestal"),
	tiles={"hades_core_sandstone_volcanic.png"},
	groups={cracky=3},
	craftitem="hades_core:sandstone_volcanic"})
register_pedestal("pedestal_obsidian", {
	description=S("Obsidian Pedestal"),
	tiles={"hades_itemshow_pedestal_obsidian_top.png","hades_itemshow_pedestal_obsidian.png"},
	groups={cracky=1},
	craftitem="hades_core:obsidian"})
register_pedestal("pedestal_essexite", {
	description=S("Essexite Pedestal"),
	tiles={"hades_itemshow_pedestal_essexite_top.png","hades_itemshow_pedestal_essexite.png"},
	groups={cracky=2},
	craftitem="hades_core:essexite"})
register_pedestal("pedestal_chondrite", {
	description=S("Chondrite Pedestal"),
	tiles={"hades_itemshow_pedestal_chondrite_top.png","hades_itemshow_pedestal_chondrite.png"},
	groups={cracky=2},
	craftitem="hades_core:chondrite"})


-- Item Showcase

minetest.register_node("hades_itemshow:showcase", {
	description = S("Item Showcase"),
	_tt_help = S("You can show off an item here"),
	drawtype = "glasslike",
	tiles = {"hades_itemshow_showcase.png"},
	use_texture_alpha = "clip",
	paramtype = "light",
	groups = { item_showcase = 1, cracky = 3, oddly_breakable_by_hand = 2 },
	sounds = hades_sounds.node_sound_glass_defaults(),
	is_ground_content = false,

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", S("Item Showcase"))
		local inv = meta:get_inventory()
		inv:set_size("main", 1)
	end,

	on_destruct = function(pos)
		drop_item(pos, minetest.get_node(pos), minetest.is_creative_enabled(""))
	end,

	on_rotate = on_rotate_for_entity,

	on_rightclick = on_rightclick,

	on_punch = function(pos, node, puncher)
		update_item(pos, node, true)
	end,
})

-- automatically restore entities lost from frames/pedestals/showcases
-- due to /clearobjects or similar

minetest.register_lbm({
	name = "hades_itemshow:respawn_entities",
	label = "Respawn entities of item frames, pedestals and item showcases",
	nodenames = {"hades_itemshow:frame", "group:pedestal", "group:item_showcase"},
	run_at_every_load = true,
	action = function(pos, node)
		local num
		if node.name == "hades_itemshow:frame" then
			num = #minetest.get_objects_inside_radius(pos, 0.5)
		elseif minetest.get_item_group(node.name, "pedestal") == 1 or
				minetest.get_item_group(node.name, "item_showcase") == 1 then
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
	name = "hades_itemshow:update_items_0_9_0",
	label = "Update items of item frames and pedestals",
	nodenames = {"hades_itemshow:frame", "group:pedestal"},
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
	output = 'hades_itemshow:frame',
	recipe = {
		{'group:stick', 'group:stick', 'group:stick'},
		{'group:stick', 'hades_core:paper', 'group:stick'},
		{'group:stick', 'group:stick', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'hades_itemshow:showcase',
	recipe = {
		{'hades_core:glass', 'group:wood', 'hades_core:glass'},
		{'group:wood', 'hades_core:steel_ingot', 'group:wood'},
		{'hades_core:glass', 'group:wood', 'hades_core:glass'},
	}
})

