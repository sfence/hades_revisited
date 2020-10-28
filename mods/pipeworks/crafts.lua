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


minetest.register_craft( {
	output = "pipeworks:one_way_tube 2",
	recipe = {
	        { "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting" },
	        { "group:stick", "hades_core:mese_crystal", "hades_materials:plastic_sheeting" },
	        { "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting" }
	},
})


minetest.register_craft( {
	output = "pipeworks:tube_1 6",
	recipe = {
	        { "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting" },
	        { "", "", "" },
	        { "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting" }
	},
})

minetest.register_craft( {
	output = "pipeworks:mese_tube_1 2",
	recipe = {
	        { "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting" },
	        { "", "hades_core:mese_crystal", "" },
	        { "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting" }
	},
})

minetest.register_craft( {
	type = "shapeless",
	output = "pipeworks:mese_tube_000000",
	recipe = {
	    "pipeworks:tube_1",
		"hades_core:mese_crystal_fragment",
		"hades_core:mese_crystal_fragment",
		"hades_core:mese_crystal_fragment",
		"hades_core:mese_crystal_fragment"
	},
})

minetest.register_craft( {
	output = "pipeworks:conductor_tube_off_1 6",
	recipe = {
	        { "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting" },
	        { "mesecons:mesecon", "mesecons:mesecon", "mesecons:mesecon" },
	        { "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting" }
	},
})

minetest.register_craft( {
	output = "pipeworks:detector_tube_off_1 2",
	recipe = {
	        { "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting" },
	        { "mesecons:mesecon", "mesecons_materials:silicon", "mesecons:mesecon" },
	        { "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting" }
	},
})

minetest.register_craft( {
	output = "pipeworks:accelerator_tube_1 2",
	recipe = {
	        { "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting" },
	        { "hades_core:mese_crystal_fragment", "hades_core:steel_ingot", "hades_core:mese_crystal_fragment" },
	        { "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting" }
	},
})

minetest.register_craft( {
	output = "pipeworks:teleport_tube_1 2",
	recipe = {
	        { "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting" },
	        { "hades_core:stone_baked", "travelnet:teleporter_device", "hades_core:stone_baked" },
	        { "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting" }
	},
})

minetest.register_craft( {
	output = "pipeworks:sand_tube_1 2",
	recipe = {
	        { "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting" },
	        { "hades_core:ash", "hades_core:ash", "hades_core:ash" },
	        { "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting" }
	},
})

minetest.register_craft( {
	output = "pipeworks:sand_tube_1 2",
	recipe = {
	        { "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting" },
	        { "hades_core:fertile_sand", "hades_core:fertile_sand", "hades_core:fertile_sand" },
	        { "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting" }
	},
})

minetest.register_craft( {
	output = "pipeworks:sand_tube_1",
	recipe = {
	        { "hades_core:fertile_sand", "pipeworks:tube_1", "hades_core:fertile_sand" },
	},
})

minetest.register_craft( {
	output = "pipeworks:mese_sand_tube_1 2",
	recipe = {
	        { "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting" },
	        { "hades_core:ash", "hades_core:mese_crystal", "hades_core:ash" },
	        { "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting" }
	},
})

minetest.register_craft( {
	output = "pipeworks:mese_sand_tube_1 2",
	recipe = {
	        { "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting" },
	        { "hades_core:fertile_sand", "hades_core:mese_crystal", "hades_core:fertile_sand" },
	        { "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting", "hades_materials:plastic_sheeting" }
	},
})

minetest.register_craft( {
	output = "pipeworks:crossing_tube_1 5",
	recipe = {
	        { "", "pipeworks:tube_1", "" },
	        { "pipeworks:tube_1", "pipeworks:tube_1", "pipeworks:tube_1" },
	        { "", "pipeworks:tube_1", "" }
	},
})


minetest.register_craft( {
	type = "shapeless",
	output = "pipeworks:mese_sand_tube_1",
	recipe = {
  "pipeworks:sand_tube_1",
		"hades_core:mese_crystal_fragment",
		"hades_core:mese_crystal_fragment",
		"hades_core:mese_crystal_fragment",
		"hades_core:mese_crystal_fragment"
	},
})

-- Various ancillary tube devices

minetest.register_craft( {
	output = "pipeworks:filter 2",
	recipe = {
	        { "hades_core:steel_ingot", "hades_core:steel_ingot", "hades_materials:plastic_sheeting" },
	        { "group:stick", "hades_core:sapphire", "hades_materials:plastic_sheeting" },
	        { "hades_core:steel_ingot", "hades_core:steel_ingot", "hades_materials:plastic_sheeting" }
	},
})

minetest.register_craft( {
	output = "pipeworks:mese_filter 2",
	recipe = {
	        { "hades_core:steel_ingot", "hades_core:steel_ingot", "hades_materials:plastic_sheeting" },
	        { "group:stick", "hades_core:mese", "hades_materials:plastic_sheeting" },
	        { "hades_core:steel_ingot", "hades_core:steel_ingot", "hades_materials:plastic_sheeting" }
	},
})

minetest.register_craft( {
	output = "pipeworks:autocrafter 2",
	recipe = {
	        { "hades_core:steel_ingot", "hades_core:bronze_ingot", "hades_core:steel_ingot" },
	        { "hades_materials:plastic_sheeting", "hades_core:prismatic_gem", "hades_materials:plastic_sheeting" },
	        { "hades_core:steel_ingot", "hades_core:bronze_ingot", "hades_core:steel_ingot" }
	},
})


