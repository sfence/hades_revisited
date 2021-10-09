local S = minetest.get_translator("doors")

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

		if not minetest.is_creative_enabled( player_name ) and has_wear then
			itemstack:add_wear( 65535 / config.wrench_usage_limit - 1 )
		end
	end
end

minetest.register_tool( "doors:wrench", {
	description = S("Wrench"),
	_tt_help = S("punching adjusts door locking").."\n"..
		S("placing adjusts door closing"),
	inventory_image = "doors_wrench.png",
	on_use = function( itemstack, player, pointed_thing )
		handle_wrench( itemstack, player, pointed_thing, doors.ADJUST_LOCKING )
		return itemstack
	end,
	on_place = function( itemstack, player, pointed_thing)
		local node = minetest.get_node(pointed_thing.under)
		local ndef = minetest.registered_nodes[node.name]
		local is_door = minetest.get_item_group(node.name, "door") ~= 0
		local is_trapdoor = minetest.get_item_group(node.name, "trapdoor") ~= 0
		if not is_door and not is_trapdoor and
				ndef and ndef.on_rightclick and
				not player:get_player_control().sneak then
			return ndef.on_rightclick(pointed_thing.under,
					node, player, itemstack, pointed_thing)
		end
		handle_wrench( itemstack, player, pointed_thing, doors.ADJUST_CLOSING )
		return itemstack
	end,
} )

minetest.register_craft( {
	output = "doors:wrench",
	recipe = {
		{ "hades_core:steel_ingot" },
		{ "hades_core:steel_rod" },
	}
} )
