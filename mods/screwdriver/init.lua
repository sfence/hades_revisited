-- screwdriver/init.lua

screwdriver = {}

-- Load support for MT game translation.
local S = minetest.get_translator("screwdriver")

local USES_DEFAULT = 200

screwdriver.ROTATE_FACE = 1
screwdriver.ROTATE_AXIS = 2
screwdriver.disallow = function(pos, node, user, mode, new_param2)
	return false
end
screwdriver.rotate_simple = function(pos, node, user, mode, new_param2)
	if mode ~= screwdriver.ROTATE_FACE then
		return false
	end
end

-- For attached wallmounted nodes: returns true if rotation is valid
-- simplified version of minetest:builtin/game/falling.lua#L148.
local function check_attached_node(pos, rotation)
	local d = minetest.wallmounted_to_dir(rotation)
	local p2 = vector.add(pos, d)
	local n = minetest.get_node(p2).name
	local def2 = minetest.registered_nodes[n]
	if def2 and not def2.walkable then
		return false
	end
	return true
end

screwdriver.rotate = {}

local facedir_tbl = {
	[screwdriver.ROTATE_FACE] = {
		[0] = 1, [1] = 2, [2] = 3, [3] = 0,
		[4] = 5, [5] = 6, [6] = 7, [7] = 4,
		[8] = 9, [9] = 10, [10] = 11, [11] = 8,
		[12] = 13, [13] = 14, [14] = 15, [15] = 12,
		[16] = 17, [17] = 18, [18] = 19, [19] = 16,
		[20] = 21, [21] = 22, [22] = 23, [23] = 20,
	},
	[screwdriver.ROTATE_AXIS] = {
		[0] = 4, [1] = 4, [2] = 4, [3] = 4,
		[4] = 8, [5] = 8, [6] = 8, [7] = 8,
		[8] = 12, [9] = 12, [10] = 12, [11] = 12,
		[12] = 16, [13] = 16, [14] = 16, [15] = 16,
		[16] = 20, [17] = 20, [18] = 20, [19] = 20,
		[20] = 0, [21] = 0, [22] = 0, [23] = 0,
	},
}

screwdriver.rotate.facedir = function(pos, node, mode)
	local rotation = node.param2 % 32 -- get first 5 bits
	local other = node.param2 - rotation
	rotation = facedir_tbl[mode][rotation] or 0
	return rotation + other
end

screwdriver.rotate.colorfacedir = screwdriver.rotate.facedir

local wallmounted_tbl = {
	[screwdriver.ROTATE_FACE] = {[2] = 5, [3] = 4, [4] = 2, [5] = 3, [1] = 0, [0] = 1},
	[screwdriver.ROTATE_AXIS] = {[2] = 1, [3] = 0, [4] = 1, [5] = 0, [1] = 3, [0] = 2}
}

screwdriver.rotate.wallmounted = function(pos, node, mode)
	local rotation = node.param2 % 8 -- get first 3 bits
	local other = node.param2 - rotation
	rotation = wallmounted_tbl[mode][rotation] or 0
	if minetest.get_item_group(node.name, "attached_node") ~= 0 then
		-- find an acceptable orientation
		for i = 1, 5 do
			if not check_attached_node(pos, rotation) then
				rotation = wallmounted_tbl[mode][rotation] or 0
			else
				break
			end
		end
	end
	return rotation + other
end

screwdriver.rotate.colorwallmounted = screwdriver.rotate.wallmounted

-- Handles rotation
screwdriver.handler = function(itemstack, user, pointed_thing, mode, uses)
	if pointed_thing.type ~= "node" then
		return
	end

	local pos = pointed_thing.under
	local player_name = user and user:get_player_name() or ""

	if minetest.is_protected(pos, player_name) and not minetest.check_player_privs(player_name, "protection_bypass") then
		minetest.record_protection_violation(pos, player_name)
		return
	end

	local node = minetest.get_node(pos)
	local ndef = minetest.registered_nodes[node.name]
	if not ndef then
		return itemstack
	end

	-- Execute `on_rightclick` of node if present and player did not press Sneak,
	-- otherwise, the rotation action is executed.
	-- If `rotation_takes_precedence=1` group is present, this behavior is flipped:
	-- `on_rightclick` executed if sneak pressed, rotation action executed if sneak
	-- not pressed.
	local prec = minetest.get_item_group(node.name, "rotation_takes_precedence") == 1
	local sneak = false
	if user then
		sneak = user:get_player_control().sneak
		if prec then
			sneak = not sneak
		end
	end
	if mode == screwdriver.ROTATE_AXIS and ndef and ndef.on_rightclick and
			((not user) or (not sneak)) then
		return ndef.on_rightclick(pos, node, user, itemstack,
				pointed_thing) or itemstack
	end

	-- can we rotate this paramtype2?
	local fn = screwdriver.rotate[ndef.paramtype2]
	if not fn and not ndef.on_rotate then
		return itemstack
	end

	local should_rotate = true
	local new_param2
	if fn then
		new_param2 = fn(pos, node, mode)
	else
		new_param2 = node.param2
	end

	-- Node provides a handler, so let the handler decide instead if the node can be rotated
	if ndef.on_rotate == false then
		return
	elseif ndef.on_rotate == "simple" then
		if mode ~= screwdriver.ROTATE_FACE then
			return
		end
	elseif ndef.on_rotate then
		-- Copy pos and node because callback can modify it
		local result = ndef.on_rotate(vector.new(pos),
				{name = node.name, param1 = node.param1, param2 = node.param2},
				user, mode, new_param2)
		minetest.sound_play({name="screwdriver_use", gain=0.5}, {pos=pos, max_hear_distance=16}, true)
		if result == false then -- Disallow rotation
			return itemstack
		elseif result == true then
			should_rotate = false
		end
	elseif ndef.on_rotate == false then
		return itemstack
	elseif ndef.can_dig and not ndef.can_dig(pos, user) then
		return itemstack
	end

	if should_rotate and new_param2 ~= node.param2 then
		node.param2 = new_param2
		minetest.swap_node(pos, node)
		minetest.check_for_falling(pos)
		minetest.sound_play({name="screwdriver_use", gain=0.5}, {pos=pos, max_hear_distance=16}, true)
	end

	if not minetest.is_creative_enabled(player_name) then
		itemstack:add_wear(65535 / ((uses or USES) - 1))
	end

	return itemstack
end

-- Screwdriver
minetest.register_tool("screwdriver:screwdriver", {
	description = S("Screwdriver"),
	_tt_help = S("Punch to rotate face, place to rotates axis"),
	inventory_image = "screwdriver.png",
	groups = {tool = 1},
	on_use = function(itemstack, user, pointed_thing)
		screwdriver.handler(itemstack, user, pointed_thing, screwdriver.ROTATE_FACE, USES_DEFAULT)
		return itemstack
	end,
	on_place = function(itemstack, user, pointed_thing)
		screwdriver.handler(itemstack, user, pointed_thing, screwdriver.ROTATE_AXIS, USES_DEFAULT)
		return itemstack
	end,
})


minetest.register_craft({
	output = "screwdriver:screwdriver",
	recipe = {
		{"hades_core:steel_ingot"},
		{"group:stick"}
	}
})

minetest.register_alias("screwdriver:screwdriver1", "screwdriver:screwdriver")
minetest.register_alias("screwdriver:screwdriver2", "screwdriver:screwdriver")
minetest.register_alias("screwdriver:screwdriver3", "screwdriver:screwdriver")
minetest.register_alias("screwdriver:screwdriver4", "screwdriver:screwdriver")
