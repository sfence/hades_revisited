local S = minetest.get_translator("hades_doors")

hades_doors = { }

local config = {}
config.autoclose_timeout = 2.5

-- Set this true to enable HIDDEN NODE DEBUG.
-- This makes the hidden nodes visible and diggable.
local HIDDEN_DEBUG = false

hades_doors.LOCKING_MODE_UNDEFINED = 0
hades_doors.LOCKING_MODE_UNLOCKED = 1
hades_doors.LOCKING_MODE_LOCKED = 2
hades_doors.LOCKING_MODE_SHARED = 3
hades_doors.CLOSING_MODE_UNDEFINED = 0
hades_doors.CLOSING_MODE_MANUAL = 1
hades_doors.CLOSING_MODE_AUTOCLOSE = 2
hades_doors.CLOSING_MODE_HOLDOPEN = 3
hades_doors.ADJUST_LOCKING = 1
hades_doors.ADJUST_CLOSING = 2
hades_doors.CHECK_LOCKING = 3
hades_doors.CHECK_CLOSING = 4

local hidden_tiles = { "blank.png" }
local hidden_drawtype = "airlike"
local hidden_pointable = false
local hidden_diggable = false
local hidden_can_dig = function() return false end
local hidden_groups = { not_in_creative_inventory = 1 }
if HIDDEN_DEBUG then
	hidden_tiles = { "default_stone.png" }
	hidden_drawtype = "nodebox"
	hidden_pointable = true
	hidden_diggable = true
	hidden_can_dig = nil
	hidden_groups.dig_immediate = 3
end

local offset_y = function ( pos, y )
        return { x = pos.x, y = pos.y + ( y or 1 ), z = pos.z }
end

--[[ Hidden door segments are used to occupy the other nodes of doors to
make sure no nodes overlap with the door.
All hidden door segments are defined in such a way that they effectively
"block" other nodes from occupying the same space.

The "standard" offset door (open and closed) uses 1 hidden door segment
* hades_doors:hidden for the upper segment.
The closed center door uses 1 hidden door segment:
* hades_doors:hidden_center (1×) for the upper door segment
The open center door uses 3 hidden door segments:
* hades_doors:hidden_center (1×) for the upper door segment
* hades_doors:hidden (2×) for the lower and upper and lower
  door segments of the door's neighbors
The "neighbors" of the center door are the 2 nodes into which the
center door opens. ]]

minetest.register_node( "hades_doors:hidden", {
	-- This node is walkable to stop falling nodes.
	-- The nodebox is chosen in such a way
	-- that it is inside the overlapping nodebox
	-- of the main door node, but it still needs
	-- to be rotated.
	description = S("Shared Hidden Door Segment"),
	inventory_image = "hades_doors_hidden_inv.png",
	wield_image = "hades_doors_hidden_inv.png",
	drawtype = hidden_drawtype,
	tiles = hidden_tiles,
	use_texture_alpha = "clip",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = true,
	pointable = hidden_pointable,
	diggable = hidden_diggable,
	can_dig = hidden_can_dig,
	buildable_to = false,
	floodable = false,
	drop = "",

	groups = hidden_groups,
	on_blast = function( ) end,

	node_box = {
		type = "fixed",
		fixed = { -15/32, 13/32, -15/32, -13/32, 1/2, -13/32 },
	},
} )

minetest.register_node( "hades_doors:hidden_center", {
	-- Basically the same as hades_doors:hidden, but
	-- for center doors instead.
	description = S("Hidden Center Door Segment"),
	inventory_image = "hades_doors_hidden_center_inv.png",
	wield_image = "hades_doors_hidden_center_inv.png",
	drawtype = hidden_drawtype,
	tiles = hidden_tiles,
	use_texture_alpha = "clip",
	drawtype = "airlike",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = true,
	pointable = hidden_pointable,
	diggable = hidden_diggable,
	can_dig = hidden_can_dig,
	buildable_to = false,
	floodable = false,
	drop = "",

	groups = hidden_groups,
	on_blast = function( ) end,
	can_dig = function( ) end,

	node_box = {
		type = "fixed",
		fixed = { -15/32, 13/32, -1/32, -13/32, 1/2, 1/32 },
	},

} )

-- table used to aid door opening/closing
-- tier 1 = hand, tier 2 = face, and tier 3 = is_open

local offset_transform = {
	left = {
		{ [false] = { suffix = "_a", param2 = 3 }, [true] = { suffix = "_b", param2 = 1 } },
		{ [false] = { suffix = "_a", param2 = 0 }, [true] = { suffix = "_b", param2 = 2 } },
		{ [false] = { suffix = "_a", param2 = 1 }, [true] = { suffix = "_b", param2 = 3 } },
		{ [false] = { suffix = "_a", param2 = 2 }, [true] = { suffix = "_b", param2 = 0 } },
	},
	right = {
		{ [false] = { suffix = "_b", param2 = 1 }, [true] = { suffix = "_a", param2 = 3 } },
		{ [false] = { suffix = "_b", param2 = 2 }, [true] = { suffix = "_a", param2 = 0 } },
		{ [false] = { suffix = "_b", param2 = 3 }, [true] = { suffix = "_a", param2 = 1 } },
		{ [false] = { suffix = "_b", param2 = 0 }, [true] = { suffix = "_a", param2 = 2 } },
	},
}

local center_transform = {
	left = {
		{ [false] = { suffix = "_c", param2 = 2 }, [true] = { suffix = "_d", param2 = 2 } },
		{ [false] = { suffix = "_c", param2 = 3 }, [true] = { suffix = "_d", param2 = 3 } },
		{ [false] = { suffix = "_c", param2 = 0 }, [true] = { suffix = "_d", param2 = 0 } },
		{ [false] = { suffix = "_c", param2 = 1 }, [true] = { suffix = "_d", param2 = 1 } },
	},
	right = {
		{ [false] = { suffix = "_c", param2 = 0 }, [true] = { suffix = "_e", param2 = 0 } },
		{ [false] = { suffix = "_c", param2 = 1 }, [true] = { suffix = "_e", param2 = 1 } },
		{ [false] = { suffix = "_c", param2 = 2 }, [true] = { suffix = "_e", param2 = 2 } },
		{ [false] = { suffix = "_c", param2 = 3 }, [true] = { suffix = "_e", param2 = 3 } },
	},
}

local center_neighbor = {
	left = {
		[0] = { x = 0, y = 0, z = 1 },
		[1] = { x = 1, y = 0, z = 0 },
		[2] = { x = 0, y = 0, z = -1 },
		[3] = { x = -1, y = 0, z = 0 },
	},
	right = {
		[0] = { x = 0, y = 0, z = -1 },
		[1] = { x = -1, y = 0, z = 0 },
		[2] = { x = 0, y = 0, z = 1 },
		[3] = { x = 1, y = 0, z = 0 },
	},
}


---------------------------------
-- get_door_properties( )
---------------------------------

local function get_door_properties( state, param2 )
	local is_open = state % 2 == 1
	local type = state < 4 and "offset" or "center"
	local hand = math.floor( state / 2 ) % 2 == 0 and "left" or "right"
	local face = param2 + 1

	return is_open, type, hand, face
end

---------------------------------
-- get_door_transform( )
---------------------------------

local function get_door_transform( state, param2, toggle_open, switch_type, switch_hand, rotate_face )
	local is_open, type, hand, face = get_door_properties( state, param2 )

	-- NB: lots of nightmarish state calculations in order to maintain
	-- backwards compatibility, so venture forward at your own risk :)

	if toggle_open then
		state = is_open and state - 1 or state + 1		-- add 1 for open, subtract 1 for close
		is_open = not is_open
	end
	if switch_type then
		state = type == "offset" and state + 4 or state - 4	-- add 4 for center, substract 4 for offset
		type = type == "offset" and "center" or "offset"

		-- need to rotate for seamless switch (also avoid face index overflow)
		local face_translation = {
			center = { [false] = 1, [true] = 2 },
			offset = { [false] = 0, [true] = 1 },
		}
		face = ( face + face_translation[ type ][ is_open ] ) % 4 + 1
	end

	if switch_hand then
		state = hand == "left" and state + 2 or state - 2	-- add 2 for left, subtract 2 for right
		hand = hand == "left" and "right" or "left"

		-- need to rotate for seamless switch (also avoid face index overflow)
		local face_translation = {
			center = { left = 3, right = 1 },
			offset = { left = 0, right = 2 },
		}
		if is_open and type == "center" then			-- hack to correct open center doors :P
			face = face + 2
		end
		face = ( face + face_translation[ type ][ hand ] ) % 4 + 1
	end
	if rotate_face then
		face = face % 4 + 1
	end

	return is_open, state, type == "offset" and
		offset_transform[ hand ][ face ][ is_open ] or
		center_transform[ hand ][ face ][ is_open ]
end

---------------------------------
-- is_door_protected( )
---------------------------------

local function is_door_protected( pos, ndef, player_name )
	local owner = minetest.get_meta( pos ):get_string( "doors_owner" )

	if minetest.get_player_privs( player_name ).protection_bypass then return false end

	return ndef.protected and player_name ~= owner
end

---------------------------------
-- is_door_locked( )
---------------------------------

local function is_door_locked( pos, ndef, player_name )
	local meta = minetest.get_meta( pos )
	local locking_mode = meta:get_int( "locking_mode" )
	local owner = meta:get_string( "doors_owner" )

	if minetest.get_player_privs( player_name ).protection_bypass then return false end

	if locking_mode == hades_doors.LOCKING_MODE_UNDEFINED then
		if ndef.protected and player_name ~= owner then
			return true
		end
	elseif locking_mode == hades_doors.LOCKING_MODE_LOCKED then
		if ndef.protected and player_name ~= owner or not ndef.protected then
			return true
		end
	elseif locking_mode == hades_doors.LOCKING_MODE_SHARED then
		if minetest.is_protected( pos, player_name ) then
			return true
		end
	end

	return false
end

local is_trapdoor_locked = is_door_locked

---------------------------------
-- toggle_door( )
---------------------------------

local function toggle_door( pos, node, player )
	local meta = minetest.get_meta( pos )
	local ndef = minetest.registered_nodes[ node.name ]
	local closing_mode = meta:get_int( "closing_mode" )

	if player and is_door_locked( pos, ndef, player:get_player_name( ) ) then
		minetest.sound_play( ndef.sound_locked, { pos = pos, gain = 0.3, max_hear_distance = 10 }, true )
		return false
	end

	local state = meta:get_int( "state" )
	local _, statetype, hand = get_door_properties( state, node.param2 )
	local is_open, state, transform = get_door_transform( state, node.param2, true, false, false )
	local new_name = ndef.base_name .. transform.suffix
	local new_param2 = transform.param2

	if not is_open and closing_mode == hades_doors.CLOSING_MODE_HOLDOPEN then
		minetest.sound_play( ndef.sound_held_open, { pos = pos, gain = 0.8, max_hear_distance = 10 }, true )
		return false   -- abort since this door does not close
	end

	if statetype == "center" then
		local nhand = hand
		if not is_open and hand == "left" then
			nhand = "right"
		end
		local neighbor = center_neighbor[nhand][node.param2]
		local neighbor_bottom = vector.add(pos, neighbor)
		local neighbor_top = offset_y(neighbor_bottom, 1)
		local nb1 = minetest.get_node(neighbor_bottom)
		local nb2 = minetest.get_node(neighbor_top)
		local nb1d = minetest.registered_nodes[nb1.name]
		local nb2d = minetest.registered_nodes[nb2.name]
		if is_open then
			-- Open center door, place hidden nodes to prevent node overlap
			if nb1d and nb2d and nb1d.buildable_to and nb2d.buildable_to then
				local np2
				if hand == "left" then
					np2 = node.param2
				else
					np2 = (node.param2 + 1) % 4
				end
				minetest.set_node(neighbor_bottom, {name="hades_doors:hidden", param2=np2})
				minetest.set_node(neighbor_top, {name="hades_doors:hidden", param2=np2})
			else
				-- It's blocked, can't open
				minetest.sound_play( ndef.sound_held_open, { pos = pos, gain = 0.8, max_hear_distance = 10 }, true )
				return false
			end
		else
			-- Close center door, remove place hidden nodes again
			if nb1.name == "hades_doors:hidden" then
				minetest.remove_node(neighbor_bottom)
			end
			if nb2.name == "hades_doors:hidden" then
				minetest.remove_node(neighbor_top)
				minetest.check_for_falling(neighbor_top)
			end
		end
	end
	if is_open and closing_mode == hades_doors.CLOSING_MODE_AUTOCLOSE then
		local timer = minetest.get_node_timer( pos )
		timer:start( config.autoclose_timeout )
	end

	if is_open then
		-- if opened, play open sound
		minetest.sound_play( ndef.sound_open, {
			pos = pos, gain = 0.3, max_hear_distance = 10
		}, true )
	else
		-- if closed, play close sound
		minetest.sound_play( ndef.sound_close, {
			pos = pos, gain = 0.3, max_hear_distance = 10
		}, true )
	end

	minetest.swap_node( pos, { name = new_name, param2 = new_param2 } )
	meta:set_int( "state", state )
end

---------------------------------
-- toggle_trapdoor( )
---------------------------------

function toggle_trapdoor( pos, node, player )
	local meta = minetest.get_meta( pos )
	local ndef = minetest.registered_nodes[ node.name ]
	local closing_mode = meta:get_int( "closing_mode" )

	if player and is_trapdoor_locked( pos, ndef, player:get_player_name( ) ) then
		minetest.sound_play( ndef.sound_locked, { pos = pos, gain = 0.3, max_hear_distance = 10 }, true )
		return false
	end

	if node.name == ndef.base_name then
		local new_name = ndef.base_name .. "_open"

		if closing_mode == hades_doors.CLOSING_MODE_AUTOCLOSE then
			local timer = minetest.get_node_timer( pos )
			timer:start( config.autoclose_timeout )
		end

		minetest.sound_play( ndef.sound_open, { pos = pos, gain = 0.3, max_hear_distance = 10 }, true )
		minetest.swap_node( pos, { name = new_name, param1 = node.param1, param2 = node.param2 } )
	else
		local new_name = ndef.base_name

		if closing_mode == hades_doors.CLOSING_MODE_HOLDOPEN then
			minetest.sound_play( ndef.sound_held_open, { pos = pos, gain = 0.8, max_hear_distance = 10 }, true )
			return false   -- abort since this trapdoor does not close
		end

		minetest.sound_play( ndef.sound_close, { pos = pos, gain = 0.3, max_hear_distance = 10 }, true )
		minetest.swap_node( pos, { name = ndef.base_name, param1 = node.param1, param2 = node.param2 } )
	end
end

---------------------------------
-- on_timer_door( )
---------------------------------

local on_timer_door = function(pos)
	-- Auto-close timeout
	local node = minetest.get_node( pos )
	local meta = minetest.get_meta( pos )
	local state = meta:get_int( "state" )
	local is_open, state, transform = get_door_transform( state, node.param2, true, false, false )
	if not is_open then
		toggle_door(pos, node) --pass nil player, since security doesn't matter
	end
end

---------------------------------
-- on_timer_trapdoor( )
---------------------------------

local on_timer_trapdoor = function(pos)
	local node = minetest.get_node(pos)
	local ndef = minetest.registered_nodes[node.name]
	if node.name == ndef.base_name .. "_open" then
		toggle_trapdoor(pos, node) --pass nil player, since security doesn't matter
	end
end

---------------------------------
-- on_adjust_door( )
---------------------------------

local function on_adjust_door( pos, node, player, mode )
	local meta = minetest.get_meta( pos )
	local ndef = minetest.registered_nodes[ node.name ]
	local locking_mode = meta:get_int( "locking_mode" )
	local closing_mode = meta:get_int( "closing_mode" )
	local player_name = player:get_player_name( )

	if is_door_protected( pos, ndef, player_name ) then return false end

	if mode == hades_doors.ADJUST_LOCKING or mode == hades_doors.CHECK_LOCKING then
		if ndef.is_lockable and locking_mode > 0 then
			local mode_defs = { S("unlocked"), S("locked"), S("shared") }

			if mode == hades_doors.ADJUST_LOCKING then
				locking_mode = locking_mode % 3 + 1
				meta:set_int( "locking_mode", locking_mode )
				local sound
				if locking_mode == hades_doors.LOCKING_MODE_LOCKED then
					sound = ndef.sound_locking
				elseif locking_mode == hades_doors.LOCKING_MODE_SHARED then
					sound = ndef.sound_sharing
				elseif locking_mode == hades_doors.LOCKING_MODE_UNLOCKED then
					sound = ndef.sound_unlocking
				end
				minetest.sound_play( sound, { pos = pos, gain = 0.3, max_hear_distance = 10 }, true )
			end
			minetest.chat_send_player(player_name, minetest.colorize("#00FFFF", S("Locking mode is set to @1.", mode_defs[locking_mode])))

			return true
		else
			minetest.chat_send_player(player_name, minetest.colorize("#FFFF00", S("This block does not provide locking adjustments.")))
			return false
		end
	elseif mode == hades_doors.ADJUST_CLOSING or mode == hades_doors.CHECK_CLOSING then
		if ndef.is_closable and closing_mode > 0 then
			local mode_defs = { S("manual"), S("auto-close"), S("hold-open") }

			if mode == hades_doors.ADJUST_CLOSING then
				closing_mode = closing_mode % 3 + 1
				meta:set_int( "closing_mode", closing_mode )
				minetest.sound_play( ndef.sound_closing_mode, { pos = pos, gain = 0.3, max_hear_distance = 10 }, true )
			end
			minetest.chat_send_player(player_name, minetest.colorize("#00FFFF", S("Closing mode is set to @1.", mode_defs[closing_mode])))

			return true
		else
			minetest.chat_send_player(player_name, minetest.colorize("#FFFF00", S("This block does not provide closing adjustments.")))
			return false
		end
	end

	minetest.log("error", "[doors] Invalid mode argument in on_adjust_door! (mode="..tostring(mode)..")")
	return false
end

local on_adjust_trapdoor = on_adjust_door

local on_adjust_fence_gate = function( pos, node, player, mode )
	local player_name = player:get_player_name()
	minetest.chat_send_player(player_name, minetest.colorize("#FFFF00", S("Fence gates do not provide locking or closing adjustments.")))
	return false
end

---------------------------------
-- on_rotate_door( )
---------------------------------

local function on_rotate_door( pos, node, player, mode )
	local ndef = minetest.registered_nodes[ node.name ]
	local meta = minetest.get_meta( pos )
	local state = meta:get_int( "state" )

	if is_door_protected( pos, ndef, player:get_player_name( ) ) then return false end

	if mode == screwdriver.ROTATE_FACE then
		-- alternate hand between left <-> right
		local is_open, state, transform = get_door_transform( state, node.param2, false, false, true, false )

		minetest.swap_node( pos, { name = ndef.base_name .. transform.suffix, param2 = transform.param2 } )
		local top = offset_y(pos)
		local _, stype, shand = get_door_properties( state, transform.param2 )
		local p2 = transform.param2
		if stype == "center" then
			if is_open and shand == "left" then
				p2 = (p2 + 2) % 4
			end
		elseif (shand == "right" and not is_open) or (shand == "left" and is_open) then
			p2 = (p2 + 3) % 4
		end
		if stype == "center" then
			minetest.set_node( top, { name = "hades_doors:hidden_center", param2 = p2 } )
			if is_open then
				local neighbor = center_neighbor[shand][p2]
				if shand == "right" then
					p2 = (p2 + 1) % 4
				end
				minetest.set_node( vector.add( top, neighbor ), { name = "hades_doors:hidden", param2 = p2 } )
			end
		else
			minetest.set_node( top, { name = "hades_doors:hidden", param2 = p2 } )
		end

		meta:set_int( "state", state )

		return true

	elseif mode == screwdriver.ROTATE_AXIS and ndef.can_center and ndef.can_offset then
		-- alternate type between center <-> offset
		local is_open, state, transform = get_door_transform( state, node.param2, false, true, false, false )

		local top = offset_y(pos)
		local _, stype, shand = get_door_properties( state, transform.param2 )
		local p2 = transform.param2
		if stype == "center" then
			if is_open then
				p2 = (p2 + 2) % 4
			elseif shand == "left" then
				p2 = (p2 + 1) % 4
			end
		elseif (shand == "right" and not is_open) or (shand == "left" and is_open) then
			p2 = (p2 + 3) % 4
		end
		if stype == "center" then
			if is_open then
				if shand == "right" then
					p2 = (p2 + 2) % 4
				end
				local neighbor = center_neighbor[shand][p2]
				local neighbor_top = vector.add(top, neighbor)
				local neighbor_bottom = offset_y(neighbor_top, -1)
				local nnt = minetest.get_node(neighbor_top)
				local nnb = minetest.get_node(neighbor_bottom)
				local nntd = minetest.registered_nodes[nnt.name]
				local nnbd = minetest.registered_nodes[nnb.name]
				if nntd and nnbd and nntd.buildable_to and nnbd.buildable_to then
					minetest.swap_node( pos, { name = ndef.base_name .. transform.suffix, param2 = transform.param2 } )
					minetest.set_node( top, { name = "hades_doors:hidden_center", param2 = p2 } )
					if shand == "right" then
						p2 = (p2 + 1) % 4
					end
					minetest.set_node( neighbor_bottom, { name = "hades_doors:hidden", param2 = p2 })
					minetest.set_node( neighbor_top, { name = "hades_doors:hidden", param2 = p2 })
				else
					return false
				end
			else
				p2 = transform.param2
				minetest.swap_node( pos, { name = ndef.base_name .. transform.suffix, param2 = transform.param2 } )
				minetest.set_node( top, { name = "hades_doors:hidden_center", param2 = p2 } )
			end
		else
			if shand == "right" then
				p2 = (p2 + 3) % 4
			end
			minetest.swap_node( pos, { name = ndef.base_name .. transform.suffix, param2 = transform.param2 } )
			minetest.set_node( top, { name = "hades_doors:hidden", param2 = p2} )
			local neighbor = center_neighbor[shand][p2]
			local neighbor_top = vector.add(top, neighbor)
			local neighbor_bottom = offset_y(neighbor_top, -1)
			local nnt = minetest.get_node(neighbor_top)
			local nnb = minetest.get_node(neighbor_bottom)
			if nnt.name == "hades_doors:hidden" then
				minetest.remove_node(neighbor_top)
				minetest.check_for_falling(neighbor_top)
			end
			if nnb.name == "hades_doors:hidden" then
				minetest.remove_node(neighbor_bottom)
			end
		end
		meta:set_int( "state", state )

		return true
	end

	return false
end

local on_rotate_trapdoor
if minetest.get_modpath("screwdriver") then
	on_rotate_trapdoor = function(pos, node, user, mode, param2)
		-- Flip trapdoor vertically
		if mode == screwdriver.ROTATE_AXIS then
			local minor = node.param2
			if node.param2 >= 20 then
				minor = node.param2 - 20
				if minor == 3 then
					minor = 1
				elseif minor == 1 then
					minor = 3
				end
				node.param2 = minor
			else
				if minor == 3 then
					minor = 1
				elseif minor == 1 then
					minor = 3
				end
				node.param2 = minor
				node.param2 = node.param2 + 20
			end
			minetest.swap_node(pos, node)
			return true
		end
	end
end

---------------------------------
-- hades_doors.get_door_or_nil( )
---------------------------------

hades_doors.get_door_or_nil = function ( pos )
       	local node = minetest.get_node( pos )
	local meta = minetest.get_meta( pos )
	local ndef = minetest.registered_nodes[ node.name ]
	local self = { }

	if ndef.groups.trapdoor then
		return hades_doors.get_trapdoor_or_nil( pos )
	elseif not ndef.groups.door then
		return nil
	end

	self.get_properties = function ( )
	       	local state = meta:get_int( "state" )
		local is_open, type, hand, face = get_door_properties( state, node.param2 )

		return { is_open = is_open, type = type, hand = hand, face = face }
	end
	self.close = function ( )
		local state = meta:get_int( "state" )
		local is_open, state, transform = get_door_transform( state, node.param2, true, false, false )
		local new_name = ndef.base_name .. transform.suffix
		local new_param2 = transform.param2

		if not is_open then
			minetest.sound_play( ndef.sound_close, { pos = pos, gain = 0.3, max_hear_distance = 10 }, true )
			minetest.swap_node( pos, { name = new_name, param2 = new_param2 } )
			meta:set_int( "state", state )
		end
	end
	self.open = function ( )
		local state = meta:get_int( "state" )
		local is_open, state, transform = get_door_transform( state, node.param2, true, false, false )
		local new_name = ndef.base_name .. transform.suffix
		local new_param2 = transform.param2

		if is_open then
			minetest.sound_play( ndef.sound_open, { pos = pos, gain = 0.3, max_hear_distance = 10 }, true )
			minetest.swap_node( pos, { name = new_name, param2 = new_param2 } )
			meta:set_int( "state", state )
		end
	end
	self.state = function ( )  -- for backwards compatibility
		return self.get_properties( ).is_open
	end

	return self
end

hades_doors.get = hades_doors.get_door_or_nil  -- for backwards compatibility

---------------------------------
-- hades_doors.get_trapdoor_or_nil( )
---------------------------------

hades_doors.get_trapdoor_or_nil = function ( pos )
       	local node = minetest.get_node( pos )
	local meta = minetest.get_meta( pos )
	local ndef = minetest.registered_nodes[ node.name ]
	local self = { }

	if not ndef.groups.trapdoor then return end

	self.get_properties = function ( )
		return { is_open = node.name == ndef.base_name .. "_open", face = node.param2 + 1 }
	end
	self.close = function ( )
		if node.name == ndef.base_name .. "_open" then
			local new_name = ndef.base_name

			minetest.sound_play( ndef.sound_close, { pos = pos, gain = 0.3, max_hear_distance = 10 }, true )
			minetest.swap_node( pos, { name = new_name, param2 = node.param2 } )
		end
	end
	self.open = function ( )
		if node.name == ndef.base_name then
			local new_name = ndef.base_name .. "_open"

			minetest.sound_play( ndef.sound_open, { pos = pos, gain = 0.3, max_hear_distance = 10 }, true )
			minetest.swap_node( pos, { name = new_name, param2 = node.param2 } )
		end
	end

	return self
end

----------------------------------
-- notify_on_placenode( )
----------------------------------

local function notify_on_placenode( pos, new_node, player, old_node, itemstack, pointed_thing )

	for _, on_placenode in ipairs( minetest.registered_on_placenodes) do
		-- clone tables since callback can modify them
		local clone = {
			pos = vector.new( pos ),
			new_node = { name = new_node.name, param1 = new_node.param1, param2 = new_node.param2 },
			old_node = { name = old_node.name, param1 = old_node.param1, param2 = old_node.param2 },
			pointed_thing = {
				type  = pointed_thing.type,
				above = vector.new( pointed_thing.above ),
				under = vector.new( pointed_thing.under ),
				ref   = pointed_thing.ref,
			}
		}

		on_placenode( clone.pos, clone.new_node, player, clone.old_node, itemstack, clone.pointed_thing )
	end
end

---------------------------------
-- register_door_craftitem( )
---------------------------------

local function register_door_craftitem( name, def )

	minetest.register_craftitem( ":" .. name, {
		description = def.description,
		inventory_image = def.inventory_image,
		groups = { node = 1 },
		on_place = function( itemstack, player, pointed_thing )
			local pos

			if not pointed_thing.type == "node" then
				return itemstack
			end

			local node = minetest.get_node(pointed_thing.under)
			local ndef = minetest.registered_nodes[node.name]
			if ndef and ndef.on_rightclick and
					not player:get_player_control().sneak then
				return ndef.on_rightclick(pointed_thing.under,
						node, player, itemstack, pointed_thing)
			end

			if ndef and ndef.buildable_to then
				pos = pointed_thing.under
			else
				pos = pointed_thing.above
				node = minetest.get_node( pos )
				ndef = minetest.registered_nodes[ node.name ]
				if not ndef or not ndef.buildable_to then
					return itemstack
				end
			end

			local top_pos = offset_y( pos )
			local top_node = minetest.get_node_or_nil( top_pos )
			local top_ndef = top_node and minetest.registered_nodes[ top_node.name ]

			if not top_ndef or not top_ndef.buildable_to then
				return itemstack
			end

			local player_name = player:get_player_name( )
			if minetest.is_protected( pos, player_name ) or minetest.is_protected( top_pos, player_name ) then
				return itemstack
			end

			local facedir = minetest.dir_to_facedir( player:get_look_dir( ) )
			local facedir_to_pos = {
				[0] = { x = -1, y = 0, z = 0 },
				[1] = { x = 0, y = 0, z = 1 },
				[2] = { x = 1, y = 0, z = 0 },
				[3] = { x = 0, y = 0, z = -1 },
			}
			local look_pos = vector.add( pos, facedir_to_pos[ facedir ] )
			local state = 0

			-- NB: state stores door hand (left vs right) and door type (offset vs center)
			-- and door is_open (true or false), while param2 stores door face (1-4).

			if minetest.get_item_group( minetest.get_node( look_pos ).name, "door" ) == 1 then
				state = state + 2	-- rotate 180
				minetest.set_node( pos, { name = name .. "_b", param2 = facedir } )
				minetest.set_node( top_pos, { name = "hades_doors:hidden", param2 = ( facedir + 3 ) % 4 } )
			else
				minetest.set_node( pos, { name = name .. "_a", param2 = facedir } )
				minetest.set_node( top_pos, { name = "hades_doors:hidden", param2 = facedir } )
			end

			local meta = minetest.get_meta( pos )
			meta:set_int( "state", state )

			if def.protected then
				meta:set_int( "oldtime", os.time( ) )
				meta:set_int( "newtime", os.time( ) )
				meta:set_string( "doors_owner", player_name )
				meta:set_string( "infotext", "Owned by " .. player_name )
			end
			if def.is_lockable then
				meta:set_string( "locking_mode", def.protected and hades_doors.LOCKING_MODE_LOCKED or hades_doors.LOCKING_MODE_UNLOCKED )
			end
			if def.is_closable then
				meta:set_string( "closing_mode", hades_doors.CLOSING_MODE_MANUAL )
			end

			if not minetest.is_creative_enabled(player:get_player_name()) then
				itemstack:take_item( )
			end

			minetest.sound_play( def.sounds.place, { pos = pos }, true )

			notify_on_placenode( pos, minetest.get_node( pos ), player, node, itemstack, pointed_thing )

			return itemstack
		end
	} )
end

---------------------------------
-- hades_doors.register_door( )
---------------------------------

function hades_doors.register_door( name, def )

	register_door_craftitem( name, def )

	-- define the basic properties

	def.base_name = name

	def.drawtype = "mesh"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.walkable = true
	def.is_ground_content = false
	def.buildable_to = false
	def.inventory_image = nil
	def.drop = name
	def.groups.not_in_creative_inventory = 1
	def.groups.door = 1
	def.groups.rotation_takes_precedence = 1

	-- define the crafting recipe

	if def.recipe then
		minetest.register_craft( { output = name, recipe = def.recipe } )
	end
	def.recipe = nil

	-- define the opening/closing sounds

	if not def.sounds then
		def.sounds = hades_sounds.node_sound_wood_defaults( )
	end
	if not def.sound_open then
		def.sound_open = "doors_door_open"
	end
	if not def.sound_close then
		def.sound_close = "doors_door_close"
	end
	if not def.sound_locked then
		def.sound_locked = "doors_door_locked"
	end
	if not def.sound_locking then
		def.sound_locking = "doors_door_locking"
	end
	if not def.sound_unlocking then
		def.sound_unlocking = "doors_door_unlocking"
	end
	if not def.sound_sharing then
		def.sound_sharing = "doors_door_sharing"
	end
	if not def.sound_held_open then
		def.sound_held_open = "doors_door_held_open"
	end
	if not def.sound_closing_mode then
		def.sound_closing_mode = "doors_door_closing_mode"
	end

	-- define the placement types

	if def.can_offset == nil or not def.can_center then
		def.can_offset = true
	end
	if def.can_center == nil then
		def.can_center = true
	end

	if def.is_lockable == nil then
		def.is_lockable = true
	end
	if def.is_closable == nil then
		def.is_closable = true
	end

	-- define the essential callbacks

	def.on_adjust = on_adjust_door
	def.on_rotate = on_rotate_door

	def.on_rightclick = function ( pos, node, player, itemstack, pointed_thing )
		toggle_door( pos, node, player )
		return itemstack
	end
	def.on_destruct = function( pos )
		minetest.remove_node( offset_y( pos ) )		-- hidden node
		minetest.check_for_falling( offset_y( pos ) )
	end
	def.on_timer = on_timer_door

	if def.protected then
		def.can_dig = function ( pos, player )
			local player_name = player:get_player_name( )
			if is_door_protected( pos, def, player_name ) then
				minetest.record_protection_violation( pos, player_name )
				return false
			else
				return true
			end
		end
		def.on_blast = function( ) end
	else
		def.on_blast = function( pos, intensity )
			minetest.remove_node( pos )			-- door node
			minetest.remove_node( offset_y( pos ) )	-- hidden node
			return { name }
		end
	end

	-- register offset door nodes

	-- Prevent steel door crafting recipe from applying to hinge nodes
	-- TODO: Generalize this code
	if def.groups then
		def.groups.steel_door = nil
	end

	if def.can_offset then
		def.selection_box = { type = "fixed", fixed = { -1/2, -1/2, -8/16, 1/2, 3/2, -6/16 } }
		def.collision_box = { type = "fixed", fixed = { -1/2, -1/2, -8/16, 1/2, 3/2, -6/16 } }

		def.mesh = "door_a.obj"
		minetest.register_node( ":" .. name .. "_a", table.copy(def) )
		def.mesh = "door_b.obj"
		minetest.register_node( ":" .. name .. "_b", table.copy(def) )
	end

	-- register center door nodes

	if def.can_center then
		def.on_destruct = function( pos )
			local meta = minetest.get_meta( pos )
			local state = meta:get_int( "state" )
			local oldnode = minetest.get_node(pos)
			local is_open, stype, shand = get_door_properties( state, oldnode.param2 )
			if is_open and stype == "center" then
				local p2 = oldnode.param2
				if shand == "left" then
					p2 = (p2 + 2) % 4
				end
				local neighbor = center_neighbor[shand][p2]
				local neighbor_bottom = vector.add(pos, neighbor)
				local neighbor_top = offset_y(neighbor_bottom)
				-- Remove hidden nodes of open center door
				minetest.remove_node( neighbor_bottom )
				minetest.remove_node( neighbor_top )
				minetest.check_for_falling( neighbor_top )
			end
			-- Remove hidden node (upper door segment)
			minetest.remove_node( offset_y( pos ) )
			minetest.check_for_falling( offset_y( pos ) )
		end

		def.selection_box = { type = "fixed", fixed = { -1/2, -1/2, -1/16, 1/2, 3/2, 1/16 } }
		def.collision_box = { type = "fixed", fixed = { -1/2, -1/2, -1/16, 1/2, 3/2, 1/16 } }

		def.mesh = "door_c.obj"	-- shut
		minetest.register_node( ":" .. name .. "_c", table.copy(def) )

		def.selection_box = { type = "fixed", fixed = { 6/16, -1/2, -15/16, 8/16, 3/2, 1/16 } }
		def.collision_box = { type = "fixed", fixed = { 6/16, -1/2, -15/16, 8/16, 3/2, 1/16 } }

		def.mesh = "door_d.obj"	-- open left-hand
		minetest.register_node( ":" .. name .. "_d", table.copy(def) )

		def.selection_box = { type = "fixed", fixed = { -8/16, -1/2, -15/16, -6/16, 3/2, 1/16 } }
		def.collision_box = { type = "fixed", fixed = { -8/16, -1/2, -15/16, -6/16, 3/2, 1/16 } }

		def.mesh = "door_e.obj"	-- open right-hand
		minetest.register_node( ":" .. name .. "_e", table.copy(def) )
	end
end

hades_doors.register = hades_doors.register_door		-- for backward compatibility

---------------------------------
-- hades_doors.register_trapdoor( )
---------------------------------

function hades_doors.register_trapdoor( name, def )
	
	-- define the basic properties

	def.base_name = name

	def.drawtype = "nodebox"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.is_ground_content = false
	def.drop = name
	if not def.groups then
		def.groups = {}
	end
	def.groups.trapdoor = 1
	def.groups.rotation_takes_precedence = 1

	-- define the opening/closing sounds

	if not def.sounds then
		def.sounds = hades_sounds.node_sound_wood_defaults( )
	end
	if not def.sound_open then
		def.sound_open = "doors_door_open"
	end
	if not def.sound_close then
		def.sound_close = "doors_door_close"
	end
	if not def.sound_locked then
		def.sound_locked = "doors_door_locked"
	end
	if not def.sound_locking then
		def.sound_locking = "doors_door_locking"
	end
	if not def.sound_unlocking then
		def.sound_unlocking = "doors_door_unlocking"
	end
	if not def.sound_sharing then
		def.sound_sharing = "doors_door_sharing"
	end
	if not def.sound_held_open then
		def.sound_held_open = "doors_door_held_open"
	end
	if not def.sound_closing_mode then
		def.sound_closing_mode = "doors_door_closing_mode"
	end

	-- define the placement types

	if def.is_lockable == nil then
		def.is_lockable = true
	end
	if def.is_closable == nil then
		def.is_closable = true
	end

	-- define the essential callbacks

	def.on_adjust = on_adjust_trapdoor

	def.on_rightclick = function ( pos, node, player, itemstack, pointed_thing )
		toggle_trapdoor( pos, node, player )
		return itemstack
	end

	def.on_place = function(itemstack, placer, pointed_thing)
		-- Place trapdoor on upper or lower side depending on where it was pointed
		local p0 = pointed_thing.under
		local p1 = pointed_thing.above
		local param2 = 0

		-- Get correct trapdoor rotation for the trapdoor "hinge"
		local dir = vector.subtract(p0, p1)
		if dir.y == 0 then
			-- Sideways placement: Trapdoor is "hinged"
			-- at this side
			param2 = minetest.dir_to_facedir(dir)
		else
			-- Floor or ceiling placement:
			-- Rotation is based on placer view dir
			local placer_pos = placer:get_pos()
			dir = vector.subtract(p1, placer_pos)
			param2 = minetest.dir_to_facedir(dir)
		end

		-- Decide whether to place up or down (upper or lower half of node
		-- side pointed)
		local finepos = minetest.pointed_thing_to_face_pos(placer, pointed_thing)
		local fpos = finepos.y % 1

		if p0.y - 1 == p1.y or (fpos > 0 and fpos < 0.5)
				or (fpos < -0.5 and fpos > -0.999999999) then
			param2 = param2 + 20
			if param2 == 21 then
					param2 = 23
			elseif param2 == 23 then
				param2 = 21
			end
		end
		return minetest.item_place(itemstack, placer, pointed_thing, param2)
	end

	def.on_rotate = on_rotate_trapdoor

	def.on_timer = on_timer_trapdoor

	if def.protected then
		def.can_dig = function ( pos, player )
			local player_name = player:get_player_name( )
			if is_door_protected( pos, def, player_name ) then
				minetest.record_protection_violation( pos, player_name )
				return false
			else
				return true
			end
		end
		def.after_place_node = function ( pos, player, itemstack, pointed_thing )
			local player_name = player:get_player_name( )
			local meta = minetest.get_meta( pos )

			meta:set_int( "oldtime", os.time( ) )
			meta:set_int( "newtime", os.time( ) )
			meta:set_string( "doors_owner", player_name )
			meta:set_string( "infotext", "Owned by " .. player_name )

			if def.is_lockable then
				meta:set_string( "locking_mode", def.protected and hades_doors.LOCKING_MODE_LOCKED or hades_doors.LOCKING_MODE_UNLOCKED )
			end
			if def.is_closable then
				meta:set_string( "closing_mode", hades_doors.CLOSING_MODE_MANUAL )
			end

			return minetest.is_creative_enabled(player_name)
		end
		def.on_blast = function ( ) end
	else
		def.after_place_node = function ( pos, player, itemstack, pointed_thing )
			local player_name = player:get_player_name( )
			local meta = minetest.get_meta( pos )

			if def.is_lockable then
				meta:set_string( "locking_mode", def.protected and hades_doors.LOCKING_MODE_LOCKED or hades_doors.LOCKING_MODE_UNLOCKED )
			end
			if def.is_closable then
				meta:set_string( "closing_mode", hades_doors.CLOSING_MODE_MANUAL )
			end

			return minetest.is_creative_enabled(player_name)
		end
		def.on_blast = function ( pos, intensity )
			minetest.remove_node( pos )
			return { name }
		end
	end

	-- register trapdoor nodes

	def.node_box = { type = "fixed", fixed = { -0.5, -0.5, -0.5, 0.5, -6/16, 0.5 } }
	def.selection_box = { type = "fixed", fixed = { -0.5, -0.5, -0.5, 0.5, -6/16, 0.5 } }
	def.tiles = { def.tile_front, def.tile_front .. '^[transformFY', def.tile_side, def.tile_side, def.tile_side, def.tile_side }

	minetest.register_node( ":" .. name, table.copy(def) )  -- closed

	local def_open = table.copy(def)
	def_open.groups.not_in_creative_inventory = 1
	def_open.node_box = { type = "fixed", fixed = { -0.5, -0.5, 6/16, 0.5, 0.5, 0.5 } }
	def_open.selection_box = { type = "fixed", fixed = {-0.5, -0.5, 6/16, 0.5, 0.5, 0.5 } }
	def_open.tiles = { def.tile_side, def.tile_side, def.tile_side .. '^[transform3', def.tile_side .. '^[transform1', def.tile_front .. '^[transform46', def.tile_front .. '^[transform6' }

	minetest.register_node( ":" .. name .. "_open", def_open )  -- opened
end

---------------------------------
-- hades_doors.register_fencegate( )
---------------------------------

function hades_doors.register_fencegate( name, def )
	local fence = {
		description = def.description,
		drawtype = "nodebox",
		tiles = {def.texture},
		paramtype = "light",
		paramtype2 = "facedir",
		sunlight_propagates = true,
		is_ground_content = false,
		drop = name .. "_closed",
		connect_sides = {"left", "right"},
		groups = def.groups,
		sounds = def.sounds,
		on_rightclick = function(pos, node, player, itemstack, pointed_thing)
			local node_def = minetest.registered_nodes[node.name]
			minetest.swap_node(pos, {name = node_def.gate, param2 = node.param2})
			minetest.sound_play(node_def.sound, {pos = pos, gain = 0.3,
				max_hear_distance = 8}, true)
			return itemstack
		end,
		on_rotate = "simple",
	}

	if not fence.sounds then
		fence.sounds = hades_sounds.node_sound_wood_defaults()
	end

	fence.groups.fence_gate = 1
	fence.on_adjust = on_adjust_fence_gate

	local fence_closed = table.copy(fence)
	fence_closed.gate = name .. "_open"
	fence_closed.sound = "doors_fencegate_open"
	fence_closed.node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -6/16, -1/16, -6/16, 6/16, 1/16},   -- left end
			{6/16, -6/16, -1/16, 0.5, 6/16, 1/16},   -- right end
			{-2/16, -2/16, -1/16, 2/16, 2/16, 1/16},  -- middle
			{-6/16, 2/16, -1/16, 6/16, 5/16, 1/16},   -- up bar
			{-6/16, -5/16, -1/16, 6/16, -2/16, 1/16}, -- down bar
		}
	}
	fence_closed.collision_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -2/16, 1/2, 1/2, 2/16},
	}
	fence_closed.selection_box = {
		type = "fixed",
		fixed = {-1/2, -6/16, -1/16, 1/2, 6/16, 1/16},
	}


	local fence_open = table.copy(fence)
	fence_open.gate = name .. "_closed"
	fence_open.sound = "doors_fencegate_close"
	fence_open.groups.not_in_creative_inventory = 1
	fence_open.node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -6/16, -1/16, -6/16, 6/16, 1/16},   -- left end
			{6/16, -6/16, -1/16, 0.5, 6/16, 1/16},   -- right end
			{-0.5, 2/16, 1/16, -6/16, 5/16, 6/16},   -- up-left bar x
			{-0.5, -5/16, 1/16, -6/16, -2/16, 6/16}, -- down-left bar x
			{6/16, 2/16, 1/16, 0.5, 5/16, 0.5},   -- up-right bar x
			{6/16, -5/16, 1/16, 0.5, -2/16, 0.5}, -- down-right bar x
			{-0.5, -5/16, 6/16, -6/16, 5/16, 0.5},  -- middle left
			{6/16, -2/16, 0.5, 0.5, 2/16, 6/16},  -- middle right
		},
	}
	fence_open.selection_box = {
		type = "fixed",
		fixed = {
			{-1/2, -6/16, -1/16, 1/2, 6/16, 1/16},
		}
	}
	fence_open.collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -6/16, -1/16, -6/16, 6/16, 1/16},   -- left end
			{6/16, -6/16, -1/16, 0.5, 6/16, 1/16},   -- right end
		}
	}

	minetest.register_node(":" .. name .. "_closed", fence_closed)
	minetest.register_node(":" .. name .. "_open", fence_open)

	minetest.register_craft({
		output = name .. "_closed",
		recipe = {
			{"hades_core:stick", def.material, "hades_core:stick"},
			{"hades_core:stick", def.material, "hades_core:stick"}
		}
	})
end


