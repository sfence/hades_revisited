-- mods/default/mapgen.lua

--
-- Aliases for map generator outputs
--
minetest.register_alias("mapgen_air", "air")
minetest.register_alias("mapgen_stone", "default:stone")
minetest.register_alias("mapgen_stone_with_coal", "default:stone_with_coal")
minetest.register_alias("mapgen_stone_with_iron", "default:stone_with_iron")
minetest.register_alias("mapgen_dirt", "default:sand")
minetest.register_alias("mapgen_dirt_with_grass", "default:sand")
minetest.register_alias("mapgen_sand", "default:sand")
minetest.register_alias("mapgen_clay", "default:sand")
minetest.register_alias("mapgen_water_source", "default:lava_source")
minetest.register_alias("mapgen_river_water_source", "default:lava_source")
minetest.register_alias("mapgen_lava_source", "default:lava_source")
minetest.register_alias("mapgen_gravel", "default:lava_source")
minetest.register_alias("mapgen_desert_stone", "default:stone")
minetest.register_alias("mapgen_desert_sand", "default:sand")
minetest.register_alias("mapgen_dirt_with_snow", "default:sand")
minetest.register_alias("mapgen_snowblock", "default:sand")
minetest.register_alias("mapgen_snow", "default:sand")
minetest.register_alias("mapgen_ice", "default:stone")
minetest.register_alias("mapgen_sandstone", "default:tuff")

-- Flora

minetest.register_alias("mapgen_tree", "air")
minetest.register_alias("mapgen_leaves", "air")
minetest.register_alias("mapgen_apple", "air")
minetest.register_alias("mapgen_jungletree", "air")
minetest.register_alias("mapgen_jungleleaves", "air")
minetest.register_alias("mapgen_junglegrass", "air")
minetest.register_alias("mapgen_pine_tree", "air")
minetest.register_alias("mapgen_pine_needles", "air")

-- Dungeons

minetest.register_alias("mapgen_cobble", "default:cobble")
minetest.register_alias("mapgen_stair_cobble", "stairs:stair_cobble")
minetest.register_alias("mapgen_mossycobble", "default:stone")
minetest.register_alias("mapgen_sandstonebrick", "default:stone")
minetest.register_alias("mapgen_stair_sandstonebrick", "stairs:stair_stone")
minetest.register_alias("mapgen_stair_sandstone_block", "stairs:stair_stone")
minetest.register_alias("mapgen_stair_desert_stone", "stairs:stair_stone")

if minetest.get_mapgen_setting("mg_name") ~= "singlenode" then
	minetest.set_mapgen_setting("mg_name", "v6")
	minetest.set_mapgen_setting("mg_flags", "nodungeons, notrees, caves, nodecorations, nobiomes")
	minetest.set_mapgen_setting("mgv6_spflags", "nomudflow, nosnowbiomes, notrees, nojungles")
	minetest.set_mapgen_setting("water_level", "-5")
end

--
-- Ore generation
--

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_emerald",
	wherein        = "default:stone",
	clust_scarcity = 24*24*24,
	clust_num_ores = 1,
	clust_size     = 2,
	y_min     = -31000,
	y_max     = 20,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_emerald",
	wherein        = "default:stone",
	clust_scarcity =16*16*16,
	clust_num_ores = 2,
	clust_size     = 3,
	y_min     = -31000,
	y_max     = -50,
    flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_sapphire",
	wherein        = "default:stone",
	clust_scarcity = 24*24*24,
	clust_num_ores = 1,
	clust_size     = 2,
	y_min     = -31000,
	y_max     = -300,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_sapphire",
	wherein        = "default:stone",
	clust_scarcity =16*16*16,
	clust_num_ores = 2,
	clust_size     = 3,
	y_min     = -31000,
	y_max     = -550,
    flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_diamond",
	wherein        = "default:stone",
	clust_scarcity = 24*24*24,
	clust_num_ores = 1,
	clust_size     = 2,
	y_min     = -31000,
	y_max     = -1200,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_diamond",
	wherein        = "default:stone",
	clust_scarcity =16*16*16,
	clust_num_ores = 2,
	clust_size     = 3,
	y_min     = -31000,
	y_max     = -5000,
    flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_ruby",
	wherein        = "default:stone",
	clust_scarcity = 24*24*24,
	clust_num_ores = 1,
	clust_size     = 2,
	y_min     = -31000,
	y_max     = -900,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_ruby",
	wherein        = "default:stone",
	clust_scarcity =16*16*16,
	clust_num_ores = 2,
	clust_size     = 3,
	y_min     = -31000,
	y_max     = -3000,
    flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_coal",
	wherein        = "default:stone",
	clust_scarcity = 8*8*8,
	clust_num_ores = 8,
	clust_size     = 3,
	y_min     = -31000,
	y_max     = 64,
	flags          = "absheight",
})


minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_coal",
	wherein        = "default:stone",
	clust_scarcity = 12*12*12,
	clust_num_ores = 16,
	clust_size     = 6,
	y_min     = -31000,
	y_max     = 0,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_coal",
	wherein        = "default:stone",
	clust_scarcity = 24*24*24,
	clust_num_ores = 27,
	clust_size     = 6,
	y_min     = -31000,
	y_max     = -3000,
	flags          = "absheight",
})


minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_iron",
	wherein        = "default:stone",
	clust_scarcity = 12*12*12,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min     = -25,
	y_max     = -2,
})


minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_iron",
	wherein        = "default:stone",
	clust_scarcity = 9*9*9,
	clust_num_ores = 3,
	clust_size     = 3,
	y_min     = -63,
	y_max     = -26,
})


minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_iron",
	wherein        = "default:stone",
	clust_scarcity = 7*7*7,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min     = -31000,
	y_max     = -64,
	flags          = "absheight",
})


minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_iron",
	wherein        = "default:stone",
	clust_scarcity = 24*24*24,
	clust_num_ores = 27,
	clust_size     = 6,
	y_min     = -31000,
	y_max     = -800,
	flags          = "absheight",
})


minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_mese",
	wherein        = "default:stone",
	clust_scarcity = 18*18*18,
	clust_num_ores = 2,
	clust_size     = 2,
	y_min     = -355,
	y_max     = -204,
	flags          = "absheight",
})


minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_mese",
	wherein        = "default:stone",
	clust_scarcity = 14*14*14,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min     = -31000,
	y_max     = -356,
	flags          = "absheight",
})


minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:mese",
	wherein        = "default:stone",
	clust_scarcity = 36*36*36,
	clust_num_ores = 5,
	clust_size     = 2,
	y_min     = -31000,
	y_max     = -5000,
	flags          = "absheight",
})


minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_gold",
	wherein        = "default:stone",
	clust_scarcity = 15*15*15,
	clust_num_ores = 1,
	clust_size     = 2,
	y_min     = -666,
	y_max     = -333,
})


minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_gold",
	wherein        = "default:stone",
	clust_scarcity = 13*13*13,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min     = -31000,
	y_max     = -666,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_diamond",
	wherein        = "default:stone",
	clust_scarcity = 15*15*15,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min     = -31000,
	y_max     = -10000,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_emerald",
	wherein        = "default:stone",
	clust_scarcity = 15*15*15,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min     = -31000,
	y_max     = -10000,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_sapphire",
	wherein        = "default:stone",
	clust_scarcity = 15*15*15,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min     = -31000,
	y_max     = -10000,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_ruby",
	wherein        = "default:stone",
	clust_scarcity = 15*15*15,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min     = -31000,
	y_max     = -10000,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_copper",
	wherein        = "default:stone",
	clust_scarcity = 12*12*12,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min     = -163,
	y_max     = -116,
})


minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_copper",
	wherein        = "default:stone",
	clust_scarcity = 9*9*9,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min     = -31000,
	y_max     = -164,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_copper",
	wherein        = "default:stone",
	clust_scarcity = 9*9*9,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min     = -31000,
	y_max     = -1900,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_tin",
	wherein        = "default:stone",
	clust_scarcity = 12*12*12,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min     = -163,
	y_max     = -116,
})


minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_tin",
	wherein        = "default:stone",
	clust_scarcity = 9*9*9,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min     = -31000,
	y_max     = -164,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_tin",
	wherein        = "default:stone",
	clust_scarcity = 9*9*9,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min     = -31000,
	y_max     = -1900,
	flags          = "absheight",
})

-- if minetest.settings:get("mg_name") == "indev" then
	-- Floatlands and high mountains springs

minetest.register_ore({
		ore_type         = "blob",
		ore              = "default:lava_source",
		wherein          = {"default:stone"},
		clust_scarcity   = 25* 25 * 25,
		clust_size       = 5,
		y_min            = -10,
		y_max            = 31000,
		noise_threshold = 0.0,
		noise_params     = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 666,
			octaves = 1,
			persist = 0.0
		},
	})


	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:sand",
		wherein        = "default:stone",
		clust_scarcity = 20*20*20,
		clust_num_ores = 5*5*3,
		clust_size     = 5,
		y_min     = -120,
		y_max     = 31000,
	})

	
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:tuff",
		ore_param2     = 128,
		wherein        = "default:stone",
		clust_scarcity = 25*25*25,
		clust_num_ores = 10000,
		clust_size     = 12,
		y_min     = -100,
		y_max     = 31000,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:chondrit",
		ore_param2     = 128,
		wherein        = "default:stone",
		clust_scarcity = 10*10*10,
		clust_num_ores = 50,
		clust_size     = 10,
		y_min     = -149,
		y_max     = 10,
		flags          = "absheight",
	})
	
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:chondrit",
		ore_param2     = 128,
		wherein        = "default:stone",
		clust_scarcity = 20*20*20,
		clust_num_ores = 550,
		clust_size     = 10,
		y_min     = -31000,
		y_max     = -150,
		flags          = "absheight",
	})
	
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:chondrit",
		ore_param2     = 128,
		wherein        = "default:stone",
		clust_scarcity = 20*20*20,
		clust_num_ores = 650,
		clust_size     = 10,
		y_min     = -31000,
		y_max     = -10000,
		flags          = "absheight",
	})
	
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:essexit",
		ore_param2     = 128,
		wherein        = "default:stone",
		clust_scarcity = 10*10*10,
		clust_num_ores = 50,
		clust_size     = 5,
		y_min     = -350,
		y_max     = -300,
	})

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:essexit",
		ore_param2     = 128,
		wherein        = "default:stone",
		clust_scarcity = 10*10*10,
		clust_num_ores = 500,
		clust_size     = 10,
		y_min     = -31000,
		y_max     = -600,
		flags          = "absheight",
	})		
	
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:essexit",
		ore_param2     = 128,
		wherein        = "default:stone",
		clust_scarcity = 20*10*20,
		clust_num_ores = 950,
		clust_size     = 10,
		y_min     = -31000,
		y_max     = -10000,
		flags          = "absheight",
	})
	
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:gravel",
		ore_param2     = 128,
		wherein        = "default:stone",
		clust_scarcity = 20*5*20,
		clust_num_ores = 150,
		clust_size     = 10,
		y_min     = -10,
		y_max     = 0,
	})
	
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:gravel",
		ore_param2     = 128,
		wherein        = "default:stone",
		clust_scarcity = 20*5*20,
		clust_num_ores = 350,
		clust_size     = 10,
		y_min     = -70,
		y_max     = -50,
	})
	
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:gravel",
		ore_param2     = 128,
		wherein        = "default:stone",
		clust_scarcity = 20*10*20,
		clust_num_ores = 500,
		clust_size     = 10,
		y_min     = -140,
		y_max     = -120,
	})
	
	-- Underground springs
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:water_source",
		ore_param2     = 128,
		wherein        = "default:stone",
		clust_scarcity = 25*25*25,
		clust_num_ores = 8,
		clust_size     = 3,
		y_min     = -10000,
		y_max     = -10,
	})

	minetest.register_ore({
		ore_type         = "blob",
		ore              = "default:lava_source",
		wherein          = {"default:stone"},
		clust_scarcity   = 25* 25 * 25,
		clust_size       = 10,
		y_min            = -30000,
		y_max            = -10,
		noise_threshold = 0.2,
		noise_params     = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 500, y = 500, z = 500},
			seed = 666,
			octaves = 1,
			persist = 0.0
		},
	})

--DECO

minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:stone"},
		sidelen = 16,
		noise_params = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 333,
			octaves = 1,
			persist = 0.0
		},
		y_min = 1,
		y_max = 100,
		decoration = "default:stone",
		height = 3,
	    height_max = 4,
	})

minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:stone"},
		sidelen = 16,
		noise_params = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 555,
			octaves = 1,
			persist = 0.0
		},
		y_min = 1,
		y_max = 100,
		decoration = "default:sand",
	})

function default.make_papyrus(pos, size)
	for y=0,size-1 do
		local p = {x=pos.x, y=pos.y+y, z=pos.z}
		local nn = minetest.get_node(p).name
		if minetest.registered_nodes[nn] and
			minetest.registered_nodes[nn].buildable_to then
			minetest.set_node(p, {name="default:papyrus"})
		else
			return
		end
	end
end


function default.make_cactus(pos, size)
	for y=0,size-1 do
		local p = {x=pos.x, y=pos.y+y, z=pos.z}
		local nn = minetest.get_node(p).name
		if minetest.registered_nodes[nn] and
			minetest.registered_nodes[nn].buildable_to then
			minetest.set_node(p, {name="default:cactus"})
		else
			return
		end
	end
end


