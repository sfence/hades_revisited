-- Crafting recipes for pipes

minetest.register_craft( {
        output = "pipeworks:pipe_1_empty 12",
        recipe = {
                { "hades_core:steel_ingot", "hades_core:steel_ingot", "hades_core:steel_ingot" },
                { "", "", "" },
                { "hades_core:steel_ingot", "hades_core:steel_ingot", "hades_core:steel_ingot" }
        },
})

minetest.register_craft( {
        output = "pipeworks:straight_pipe_empty 3",
        recipe = {
                { "pipeworks:pipe_1_empty", "pipeworks:pipe_1_empty", "pipeworks:pipe_1_empty" },
        },
})

minetest.register_craft( {
        output = "pipeworks:spigot 3",
        recipe = {
                { "pipeworks:pipe_1_empty", "" },
                { "", "pipeworks:pipe_1_empty" },
        },
})

minetest.register_craft( {
	output = "pipeworks:entry_panel_empty 2",
	recipe = {
		{ "", "hades_core:steel_ingot", "" },
		{ "", "pipeworks:pipe_1_empty", "" },
		{ "", "hades_core:steel_ingot", "" },
	},
})

-- Various ancillary pipe devices

minetest.register_craft( {
        output = "pipeworks:pump_off",
        recipe = {
                { "hades_core:steel_ingot", "mesecons_solarpanel:solar_panel_off", "hades_core:steel_ingot" },
                { "group:stick", "hades_core:emerald", "group:stick" },
                { "hades_core:steel_ingot", "hades_core:steel_ingot", "hades_core:steel_ingot" }
        },
})

minetest.register_craft( {
        output = "pipeworks:valve_off_empty 2",
        recipe = {
                { "", "group:stick", "" },
                { "hades_core:steel_ingot", "hades_core:steel_ingot", "hades_core:steel_ingot" },
                { "", "hades_core:steel_ingot", "" }
        },
})

minetest.register_craft( {
        output = "pipeworks:storage_tank_0 2",
        recipe = {
                { "", "hades_core:steel_ingot", "hades_core:steel_ingot" },
                { "hades_core:steel_ingot", "hades_core:glass", "hades_core:steel_ingot" },
                { "hades_core:steel_ingot", "hades_core:steel_ingot", "" }
        },
})

minetest.register_craft( {
        output = "pipeworks:grating 2",
        recipe = {
                { "hades_core:steel_ingot", "", "hades_core:steel_ingot" },
                { "", "pipeworks:pipe_1_empty", "" },
                { "hades_core:steel_ingot", "", "hades_core:steel_ingot" }
        },
})

minetest.register_craft( {
        output = "pipeworks:flow_sensor_empty 2",
        recipe = {
                { "pipeworks:pipe_1_empty", "mesecons:mesecon", "pipeworks:pipe_1_empty" },
        },
})

minetest.register_craft( {
        output = "pipeworks:fountainhead 2",
        recipe = {
                { "pipeworks:pipe_1_empty" },
				{ "pipeworks:pipe_1_empty" }
        },
})
