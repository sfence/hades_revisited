local S = minetest.get_translator("hades_doors")

local config = {}
config.wrench_usage_limit = 200

---------------------------------
-- handle_wrench( )
---------------------------------

local function handle_wrench( itemstack, player, pointed_thing, mode, uses )
	if pointed_thing.type ~= "node" then return end

	local pos = pointed_thing.under
	local player_name = player:get_player_name( )
	local node = minetest.get_node( pos )
	local ndef = minetest.registered_nodes[ node.name ]

	if minetest.is_protected( pos, player_name ) then
		minetest.record_protection_violation( pos, player_name )
		return
	end

	if ndef.on_adjust then
		local has_wear = ndef.on_adjust( vector.new( pos ), { name = node.name, param1 = node.param1, param2 = node.param2 }, player, mode )

		if (mode == hades_doors.ADJUST_LOCKING or mode == hades_doors.ADJUST_CLOSING) and
		(not minetest.is_creative_enabled( player_name )) and has_wear then
			itemstack:add_wear( 65535 / config.wrench_usage_limit - 1 )
		end
	end
end

minetest.register_tool( "hades_doors:wrench", {
	description = S("Wrench"),
	_tt_help = S("Punch to adjust door locking").."\n"..
		S("Place to adjust door closing").."\n"..
		S("Hold Sneak to check state"),
	inventory_image = "doors_wrench.png",
	on_use = function( itemstack, player, pointed_thing )
		local ctrl = player:get_player_control()
		local mode
		if ctrl.sneak then
			mode = hades_doors.CHECK_LOCKING
		else
			mode = hades_doors.ADJUST_LOCKING
		end
		handle_wrench( itemstack, player, pointed_thing, mode )
		return itemstack
	end,
	on_place = function( itemstack, player, pointed_thing)
		local node = minetest.get_node(pointed_thing.under)
		local ndef = minetest.registered_nodes[node.name]
		local is_door = minetest.get_item_group(node.name, "door") ~= 0
		local is_trapdoor = minetest.get_item_group(node.name, "trapdoor") ~= 0
		local is_fence_gate = minetest.get_item_group(node.name, "fence_gate") ~= 0
		if not is_door and not is_trapdoor and not is_fence_gate and
				ndef and ndef.on_rightclick and
				not player:get_player_control().sneak then
			return ndef.on_rightclick(pointed_thing.under,
					node, player, itemstack, pointed_thing)
		end
		local ctrl = player:get_player_control()
		local mode
		if ctrl.sneak then
			mode = hades_doors.CHECK_CLOSING
		else
			mode = hades_doors.ADJUST_CLOSING
		end
		handle_wrench( itemstack, player, pointed_thing, mode )
		return itemstack
	end,
} )

minetest.register_craft( {
	output = "hades_doors:wrench",
	recipe = {
		{ "hades_core:steel_ingot" },
		{ "hades_core:steel_rod" },
	}
} )
