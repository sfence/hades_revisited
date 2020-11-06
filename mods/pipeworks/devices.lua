local S = minetest.get_translator("pipeworks")

-- List of devices that should participate in the autoplace algorithm

local pipereceptor_on = nil
local pipereceptor_off = nil

if mesecon then
	pipereceptor_on = {
		receptor = {
			state = mesecon.state.on,
			rules = pipeworks.mesecons_rules
		}
	}

	pipereceptor_off = {
		receptor = {
			state = mesecon.state.off,
			rules = pipeworks.mesecons_rules
		}
	}
end

local pipes_devicelist = {
	"pump",
	"valve",
	"storage_tank_0",
	"storage_tank_1",
	"storage_tank_2",
	"storage_tank_3",
	"storage_tank_4",
	"storage_tank_5",
	"storage_tank_6",
	"storage_tank_7",
	"storage_tank_8",
	"storage_tank_9",
	"storage_tank_10"
}

-- Now define the nodes.

local states = { "on", "off" }
local dgroups = ""
local pumpboxes = {}

for s in ipairs(states) do

	if states[s] == "off" then
		dgroups = {snappy=3, pipe=1}
	else
		dgroups = {snappy=3, pipe=1, not_in_creative_inventory=1}
	end

	pumpboxes = {}

	pipeworks.add_node_box(pumpboxes, pipeworks.pipe_pumpbody)
	pipeworks.add_node_box(pumpboxes, pipeworks.pipe_topstub)

	minetest.register_node("pipeworks:pump_"..states[s], {
		description = S("Pump/Intake Module"),
		_tt_help = S("Takes in water from below").."\n"..S("Connects with pipe above").."\n"..S("Punch to activate"),
		drawtype = "nodebox",
		tiles = {
			"pipeworks_pump_top.png",
			"pipeworks_pump_bottom.png",
			"pipeworks_pump_sides.png",
			"pipeworks_pump_sides.png",
			"pipeworks_pump_sides.png",
			"pipeworks_pump_"..states[s]..".png"
		},
		paramtype = "light",
		paramtype2 = "facedir",
		selection_box = {
	             	type = "fixed",
			fixed = { -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 }
		},
		node_box = {
			type = "fixed",
			fixed = pumpboxes
		},
		groups = dgroups,
		sounds = hades_sounds.node_sound_metal_defaults(),
		walkable = true,
		after_place_node = function(pos)
			pipeworks.scan_for_pipe_objects(pos)
		end,
		after_dig_node = function(pos)
			pipeworks.scan_for_pipe_objects(pos)
		end,
		drop = "pipeworks:pump_off",
		mesecons = {effector = {
			action_on = function (pos, node)
				minetest.add_node(pos,{name="pipeworks:pump_on", param2 = node.param2}) 
			end,
			action_off = function (pos, node)
				minetest.add_node(pos,{name="pipeworks:pump_off", param2 = node.param2}) 
			end
		}},
		on_punch = function(pos, node, puncher)
			local fdir = minetest.get_node(pos).param2
			minetest.add_node(pos, { name = "pipeworks:pump_"..states[3-s], param2 = fdir })
		end,
		on_rotate = false,
	})
	
	local valveboxes = {}
	pipeworks.add_node_box(valveboxes, pipeworks.pipe_leftstub)
	pipeworks.add_node_box(valveboxes, pipeworks.pipe_valvebody)
	if states[s] == "off" then 
		pipeworks.add_node_box(valveboxes, pipeworks.pipe_valvehandle_off)
	else
		pipeworks.add_node_box(valveboxes, pipeworks.pipe_valvehandle_on)
	end
	pipeworks.add_node_box(valveboxes, pipeworks.pipe_rightstub)
	local tilex = "pipeworks_valvebody_ends.png"
	local tilez = "pipeworks_valvebody_sides.png"

	minetest.register_node("pipeworks:valve_"..states[s].."_empty", {
		description = S("Valve"),
		_tt_help = S("Controls liquid flow between pipes").."\n"..S("Punch to toggle"),
		drawtype = "nodebox",
		tiles = {
			"pipeworks_valvebody_top_"..states[s]..".png",
			"pipeworks_valvebody_bottom.png",
			tilex,
			tilex,
			tilez,
			tilez,
		},
		sunlight_propagates = true,
		paramtype = "light",
		paramtype2 = "facedir",
		selection_box = {
	             	type = "fixed",
			fixed = { -8/16, -4/16, -5/16, 8/16, 5/16, 5/16 }
		},
		node_box = {
			type = "fixed",
			fixed = valveboxes
		},
		groups = dgroups,
		sounds = hades_sounds.node_sound_metal_defaults(),
		walkable = true,
		after_place_node = function(pos)
			pipeworks.scan_for_pipe_objects(pos)
		end,
		after_dig_node = function(pos)
			pipeworks.scan_for_pipe_objects(pos)
		end,
	drop = "pipeworks:valve_off_empty",
		mesecons = {effector = {
			action_on = function (pos, node)
				minetest.add_node(pos,{name="pipeworks:valve_on_empty", param2 = node.param2}) 
			end,
			action_off = function (pos, node)
				minetest.add_node(pos,{name="pipeworks:valve_off_empty", param2 = node.param2}) 
			end
		}},
		on_punch = function(pos, node, puncher)
			local fdir = minetest.get_node(pos).param2
			minetest.add_node(pos, { name = "pipeworks:valve_"..states[3-s].."_empty", param2 = fdir })
		end,
		on_rotate = false,
	})
end

local valveboxes = {}
pipeworks.add_node_box(valveboxes, pipeworks.pipe_leftstub)
pipeworks.add_node_box(valveboxes, pipeworks.pipe_valvebody)
pipeworks.add_node_box(valveboxes, pipeworks.pipe_rightstub)
pipeworks.add_node_box(valveboxes, pipeworks.pipe_valvehandle_on)

minetest.register_node("pipeworks:valve_on_loaded", {
	description = S("Valve (on)"),
	drawtype = "nodebox",
	tiles = {
		"pipeworks_valvebody_top_on.png",
		"pipeworks_valvebody_bottom.png",
		"pipeworks_valvebody_ends.png",
		"pipeworks_valvebody_ends.png",
		"pipeworks_valvebody_sides.png",
		"pipeworks_valvebody_sides.png",
	},
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "facedir",
	selection_box = {
             	type = "fixed",
		fixed = { -8/16, -4/16, -5/16, 8/16, 5/16, 5/16 }
	},
	node_box = {
		type = "fixed",
		fixed = valveboxes
	},
	groups = {snappy=3, pipe=1, not_in_creative_inventory=1},
	sounds = hades_sounds.node_sound_metal_defaults(),
	walkable = true,
	after_place_node = function(pos)
		pipeworks.scan_for_pipe_objects(pos)
	end,
	after_dig_node = function(pos)
		pipeworks.scan_for_pipe_objects(pos)
	end,
	drop = "pipeworks:valve_off_empty",
	mesecons = {effector = {
		action_on = function (pos, node)
			minetest.add_node(pos,{name="pipeworks:valve_on_empty", param2 = node.param2}) 
		end,
		action_off = function (pos, node)
			minetest.add_node(pos,{name="pipeworks:valve_off_empty", param2 = node.param2}) 
		end
	}},
	on_punch = function(pos, node, puncher)
		local fdir = minetest.get_node(pos).param2
		minetest.add_node(pos, { name = "pipeworks:valve_off_empty", param2 = fdir })
	end,
	on_rotate = false,
})

-- grating

minetest.register_node("pipeworks:grating", {
	description = S("Decorative Grating"),
	tiles = {
		"pipeworks_grating_sides.png",
		"pipeworks_grating_sides.png",
		"pipeworks_grating_sides.png",
		"pipeworks_grating_sides.png",
		"pipeworks_grating_sides.png",
		"pipeworks_grating_sides.png"
	},
	paramtype = "light",
	drawtype = "glasslike",
	groups = {snappy=3},
	sounds = hades_sounds.node_sound_metal_defaults(),
	walkable = true,
})

-- outlet spigot

	local spigotboxes = {}
	pipeworks.add_node_box(spigotboxes, pipeworks.pipe_backstub)
	pipeworks.add_node_box(spigotboxes, pipeworks.spigot_bottomstub)
	pipeworks.add_node_box(spigotboxes, pipeworks.pipe_bendsphere)

	local spigotboxes_pouring = {}
	pipeworks.add_node_box(spigotboxes_pouring, pipeworks.spigot_stream)
	pipeworks.add_node_box(spigotboxes_pouring, pipeworks.pipe_backstub)
	pipeworks.add_node_box(spigotboxes_pouring, pipeworks.spigot_bottomstub)
	pipeworks.add_node_box(spigotboxes_pouring, pipeworks.pipe_bendsphere)

minetest.register_node("pipeworks:spigot", {
	description = S("Spigot Outlet"),
	_tt_help = S("Can pour out liquid below").."\n"..S("Connects with pipe sideways"),
	drawtype = "nodebox",
	tiles = {
		"pipeworks_spigot_sides.png",
		"pipeworks_pipe_end_empty.png",
		"pipeworks_spigot_sides.png",
		"pipeworks_spigot_sides.png",
		"pipeworks_pipe_end_empty.png",
		"pipeworks_spigot_sides.png"
	},
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=3, pipe=1},
	sounds = hades_sounds.node_sound_metal_defaults(),
	walkable = true,
	after_place_node = function(pos)
		pipeworks.scan_for_pipe_objects(pos)
	end,
	after_dig_node = function(pos)
		pipeworks.scan_for_pipe_objects(pos)
	end,
	node_box = {
		type = "fixed",
		fixed = spigotboxes,
	},
	on_rotate = false,
	selection_box = {
		type = "fixed",
		fixed = { -2/16, -6/16, -2/16, 2/16, 2/16, 8/16 }
	},
})

minetest.register_node("pipeworks:spigot_pouring", {
	description = S("Spigot Outlet (pouring)"),
	drawtype = "nodebox",
	tiles = {
		"pipeworks_spigot_sides.png",
		"default_water.png^pipeworks_spigot_bottom2.png",
		{ name = "default_water_flowing_animated.png^pipeworks_spigot_sides2.png",
			animation = {
				type = "vertical_frames",
				aspect_w=16,
				aspect_h=16,
				length=0.8
			}
		},
		{ name = "default_water_flowing_animated.png^pipeworks_spigot_sides2.png",
			animation = {
				type = "vertical_frames",
				aspect_w=16,
				aspect_h=16,
				length=0.8
			}
		},
		{ name = "default_water_flowing_animated.png^pipeworks_spigot_sides2.png",
			animation = {
				type = "vertical_frames",
				aspect_w=16,
				aspect_h=16,
				length=0.8
			}
		},
		{ name = "default_water_flowing_animated.png^pipeworks_spigot_sides2.png",
			animation = {
				type = "vertical_frames",
				aspect_w=16,
				aspect_h=16,
				length=0.8
			}
		},
	},
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=3, pipe=1, not_in_creative_inventory=1},
	sounds = hades_sounds.node_sound_metal_defaults(),
	walkable = true,
	after_place_node = function(pos)
		pipeworks.scan_for_pipe_objects(pos)
	end,
	after_dig_node = function(pos)
		pipeworks.scan_for_pipe_objects(pos)
	end,
	on_rotate = false,
	node_box = {
		type = "fixed",
		fixed = spigotboxes_pouring,
	},
	selection_box = {
		type = "fixed",
		fixed = { -2/16, -6/16, -2/16, 2/16, 2/16, 8/16 }
	},
	drop = "pipeworks:spigot",
})

-- sealed pipe entry/exit (horizontal pipe passing through a metal
-- wall, for use in places where walls should look like they're airtight)

local airtightboxes = {}
pipeworks.add_node_box(airtightboxes, pipeworks.pipe_frontstub)
pipeworks.add_node_box(airtightboxes, pipeworks.pipe_backstub)
pipeworks.add_node_box(airtightboxes, pipeworks.entry_panel)

minetest.register_node("pipeworks:entry_panel_empty", {
	description = S("Airtight Pipe Entry/Exit"),
	_tt_help = S("Transports liquids"),
	drawtype = "nodebox",
	tiles = {
		"pipeworks_plain.png",
		"pipeworks_plain.png",
		"pipeworks_plain.png",
		"pipeworks_plain.png",
		"pipeworks_pipe_end_empty.png",
		"pipeworks_pipe_end_empty.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=3, pipe=1},
	sounds = hades_sounds.node_sound_metal_defaults(),
	walkable = true,
	after_place_node = function(pos)
		pipeworks.scan_for_pipe_objects(pos)
	end,
	after_dig_node = function(pos)
		pipeworks.scan_for_pipe_objects(pos)
	end,
	on_rotate = false,
	node_box = {
		type = "fixed",
		fixed = airtightboxes,
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{ -2/16, -2/16, -8/16, 2/16, 2/16, 8/16 },
			{ -8/16, -8/16, -1/16, 8/16, 8/16, 1/16 }
		}
	},
	on_place = function(itemstack, placer, pointed_thing)
		if not pipeworks.node_is_owned(pointed_thing.under, placer) 
		   and not pipeworks.node_is_owned(pointed_thing.above, placer) then
			local node = minetest.get_node(pointed_thing.under)

			if not minetest.registered_nodes[node.name]
			    or not minetest.registered_nodes[node.name].on_rightclick then
				local pitch = placer:get_look_pitch()
				local above = pointed_thing.above
				local under = pointed_thing.under
				local fdir = minetest.dir_to_facedir(placer:get_look_dir())
				local undernode = minetest.get_node(under)
				local abovenode = minetest.get_node(above)
				local uname = undernode.name
				local aname = abovenode.name
				local isabove = (above.x == under.x) and (above.z == under.z) and (pitch > 0)
				local pos1 = above

				if above.x == under.x
				    and above.z == under.z
				    and ( string.find(uname, "pipeworks:pipe_")
					 or string.find(uname, "pipeworks:storage_")
					 or string.find(uname, "pipeworks:expansion_")
					 or ( string.find(uname, "pipeworks:grating") and not isabove )
					 or ( string.find(uname, "pipeworks:pump_") and not isabove )
					 or ( string.find(uname, "pipeworks:entry_panel")
					      and undernode.param2 == 13 )
					 )
				then
					fdir = 13
				end

				if minetest.registered_nodes[uname]["buildable_to"] then
					pos1 = under
				end

				if not minetest.registered_nodes[minetest.get_node(pos1).name]["buildable_to"] then return end

				minetest.add_node(pos1, {name = "pipeworks:entry_panel_empty", param2 = fdir })
				pipeworks.scan_for_pipe_objects(pos1)

				if not minetest.is_creative_enabled(placer:get_player_name()) then
					itemstack:take_item()
				end

			else
				minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, placer, itemstack)
			end
		end
		return itemstack
	end
})

minetest.register_node("pipeworks:entry_panel_loaded", {
	description = S("Airtight Pipe Entry/Exit (loaded)"),
	drawtype = "nodebox",
	tiles = {
		"pipeworks_plain.png",
		"pipeworks_plain.png",
		"pipeworks_plain.png",
		"pipeworks_plain.png",
		"pipeworks_pipe_end_empty.png",
		"pipeworks_pipe_end_empty.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=3, pipe=1, not_in_creative_inventory=1},
	sounds = hades_sounds.node_sound_metal_defaults(),
	walkable = true,
	after_place_node = function(pos)
		pipeworks.scan_for_pipe_objects(pos)
	end,
	after_dig_node = function(pos)
		pipeworks.scan_for_pipe_objects(pos)
	end,
	on_rotate = false,
	node_box = {
		type = "fixed",
		fixed = airtightboxes,
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{ -2/16, -2/16, -8/16, 2/16, 2/16, 8/16 },
			{ -8/16, -8/16, -1/16, 8/16, 8/16, 1/16 }
		}
	},
	drop = "pipeworks:entry_panel_empty"
})

local sensorboxes = {}
pipeworks.add_node_box(sensorboxes, pipeworks.pipe_leftstub)
pipeworks.add_node_box(sensorboxes, pipeworks.pipe_sensorbody)
pipeworks.add_node_box(sensorboxes, pipeworks.pipe_rightstub)

minetest.register_node("pipeworks:flow_sensor_empty", {
	description = S("Flow Sensor"),
	_tt_help = S("Provides mesecon signal when liquid flows through pipe"),
	drawtype = "nodebox",
	tiles = {
		"pipeworks_plain.png",
		"pipeworks_plain.png",
		"pipeworks_plain.png",
		"pipeworks_plain.png",
		"pipeworks_windowed_empty.png",
		"pipeworks_windowed_empty.png"
	},
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=3, pipe=1},
	sounds = hades_sounds.node_sound_metal_defaults(),
	walkable = true,
	after_place_node = function(pos)
		pipeworks.scan_for_pipe_objects(pos)
	end,
	after_dig_node = function(pos)
		pipeworks.scan_for_pipe_objects(pos)
	end,
	on_rotate = false,
	on_construct = function(pos)
		if mesecon then
			mesecon:receptor_off(pos, rules) 
		end
	end,
	node_box = {
		type = "fixed",
		fixed = sensorboxes,
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{ -8/16, -2/16, -2/16, 8/16, 2/16, 2/16 },
		}
	},
	mesecons = pipereceptor_off
})

minetest.register_node("pipeworks:flow_sensor_loaded", {
	description = S("Flow sensor (on)"),
	drawtype = "nodebox",
	tiles = {
		"pipeworks_plain.png",
		"pipeworks_plain.png",
		"pipeworks_plain.png",
		"pipeworks_plain.png",
		"pipeworks_sensor_sides_on.png",
		"pipeworks_sensor_sides_on.png"
	},
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=3, pipe=1, not_in_creative_inventory=1},
	sounds = hades_sounds.node_sound_metal_defaults(),
	walkable = true,
	after_place_node = function(pos)
		pipeworks.scan_for_pipe_objects(pos)
	end,
	after_dig_node = function(pos)
		pipeworks.scan_for_pipe_objects(pos)
	end,
	on_construct = function(pos)
		if mesecon then
			mesecon:receptor_on(pos, rules) 
		end
	end,
	on_rotate = false,
	node_box = {
		type = "fixed",
		fixed = sensorboxes,
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{ -8/16, -2/16, -2/16, 8/16, 2/16, 2/16 },
		}
	},
	drop = "pipeworks:flow_sensor_empty",
	mesecons = pipereceptor_on,
	on_rotate = false,
})

-- tanks

for fill = 0, 10 do
	local filldesc = S("empty")
	local sgroups = {snappy=3, pipe=1, tankfill=fill+1}
	local image = nil

	if fill ~= 0 then
		filldesc = S("@1% full", fill*10)
		sgroups = {snappy=3, pipe=1, tankfill=fill+1, not_in_creative_inventory=1}
		image = "pipeworks_storage_tank_fittings.png"
	end

	minetest.register_node("pipeworks:expansion_tank_"..fill, {
		description = S("Expansion Tank (@1)", filldesc),
		tiles = {
			"pipeworks_storage_tank_fittings.png",
			"pipeworks_storage_tank_fittings.png",
			"pipeworks_storage_tank_back.png",
			"pipeworks_storage_tank_back.png",
			"pipeworks_storage_tank_back.png",
			pipeworks.liquid_texture.."^pipeworks_storage_tank_front_"..fill..".png"
		},
		inventory_image = image,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {snappy=3, pipe=1, tankfill=fill+1, not_in_creative_inventory=1},
		sounds = hades_sounds.node_sound_metal_defaults(),
		walkable = true,
		drop = "pipeworks:storage_tank_"..fill,
		after_place_node = function(pos)
			pipeworks.look_for_stackable_tanks(pos)
			pipeworks.scan_for_pipe_objects(pos)
		end,
		after_dig_node = function(pos)
			pipeworks.scan_for_pipe_objects(pos)
		end,
		on_rotate = false,
	})

	minetest.register_node("pipeworks:storage_tank_"..fill, {
		description = S("Fluid Storage Tank (@1)", filldesc),
		tiles = {
			"pipeworks_storage_tank_fittings.png",
			"pipeworks_storage_tank_fittings.png",
			"pipeworks_storage_tank_back.png",
			"pipeworks_storage_tank_back.png",
			"pipeworks_storage_tank_back.png",
			pipeworks.liquid_texture.."^pipeworks_storage_tank_front_"..fill..".png"
		},
		inventory_image = image,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = sgroups,
		sounds = hades_sounds.node_sound_metal_defaults(),
		walkable = true,
		after_place_node = function(pos)
			pipeworks.look_for_stackable_tanks(pos)
			pipeworks.scan_for_pipe_objects(pos)
		end,
		after_dig_node = function(pos)
			pipeworks.scan_for_pipe_objects(pos)
		end,
		on_rotate = false,
	})
end

-- fountainhead

minetest.register_node("pipeworks:fountainhead", {
	description = S("Fountainhead"),
	_tt_help = S("Can pour out liquid above").."\n"..S("Connects with pipe below"),
	drawtype = "nodebox",
	tiles = {
		"pipeworks_fountainhead_top.png",
		"pipeworks_pipe_end.png",
		"pipeworks_plain.png",
	},
	sunlight_propagates = true,
	paramtype = "light",
	groups = {snappy=3, pipe=1},
	sounds = hades_sounds.node_sound_metal_defaults(),
	walkable = true,
	after_place_node = function(pos)
		pipeworks.scan_for_pipe_objects(pos)
	end,
	after_dig_node = function(pos)
		pipeworks.scan_for_pipe_objects(pos)
	end,
	on_construct = function(pos)
		if mesecon then
			mesecon:receptor_on(pos, rules) 
		end
	end,
	node_box = {
		type = "fixed",
		fixed = pipeworks.fountainhead_model ,
	},
	selection_box = {
		type = "fixed",
		fixed = { -2/16, -8/16, -2/16, 2/16, 8/16, 2/16 }
	},
	on_rotate = false,
})

minetest.register_node("pipeworks:fountainhead_pouring", {
	description = S("Fountainhead (pouring)"),
	drawtype = "nodebox",
	tiles = {
		"pipeworks_fountainhead_top.png",
		"pipeworks_pipe_end.png",
		"pipeworks_plain.png",
	},
	sunlight_propagates = true,
	paramtype = "light",
	groups = {snappy=3, pipe=1, not_in_creative_inventory=1},
	sounds = hades_sounds.node_sound_metal_defaults(),
	walkable = true,
	after_place_node = function(pos)
		pipeworks.scan_for_pipe_objects(pos)
	end,
	after_dig_node = function(pos)
		pipeworks.scan_for_pipe_objects(pos)
	end,
	on_construct = function(pos)
		if mesecon then
			mesecon:receptor_on(pos, rules) 
		end
	end,
	node_box = {
		type = "fixed",
		fixed = pipeworks.fountainhead_model,
	},
	selection_box = {
		type = "fixed",
		fixed = { -2/16, -8/16, -2/16, 2/16, 8/16, 2/16 },
	},
	drop = "pipeworks:fountainhead",
	on_rotate = false,
})

minetest.register_alias("pipeworks:valve_off_loaded", "pipeworks:valve_off_empty")

