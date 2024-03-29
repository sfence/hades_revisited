-- Register legacy aliases

-- This list was created after version 0.14.3,
-- when the 'stairs' mod was renamed to 'hades_stairs'
local legacy_stair_ids = {
	"slab_apolline",
 	"slab_apolline_brick",
 	"slab_azurite",
 	"slab_azurite_brick",
 	"slab_bark",
 	"slab_basalt",
 	"slab_basalt_brick",
 	"slab_birch_bark",
 	"slab_black",
 	"slab_blue",
 	"slab_brick",
 	"slab_brick_black",
 	"slab_brick_blue",
 	"slab_brick_brown",
 	"slab_brick_cyan",
 	"slab_brick_dark_green",
 	"slab_brick_dark_grey",
 	"slab_brick_green",
 	"slab_brick_grey",
 	"slab_brick_magenta",
 	"slab_brick_orange",
 	"slab_brick_pink",
 	"slab_brick_red",
 	"slab_brick_violet",
 	"slab_brick_white",
 	"slab_brick_yellow",
 	"slab_bronzeblock",
 	"slab_brown",
 	"slab_cactus_brick",
 	"slab_canvas_bark",
 	"slab_charred_bark",
 	"slab_charred_wood",
 	"slab_chondrite",
 	"slab_chondrite_brick",
 	"slab_cinnaber",
 	"slab_cinnaber_brick",
 	"slab_cobble",
 	"slab_cobble_baked",
 	"slab_cobble_sandstone",
 	"slab_cobble_sandstone_volcanic",
 	"slab_colwood_black",
 	"slab_colwood_blue",
 	"slab_colwood_brown",
 	"slab_colwood_cyan",
 	"slab_colwood_dark_green",
 	"slab_colwood_dark_grey",
 	"slab_colwood_green",
 	"slab_colwood_grey",
 	"slab_colwood_magenta",
 	"slab_colwood_orange",
 	"slab_colwood_pink",
 	"slab_colwood_red",
 	"slab_colwood_uncolored",
 	"slab_colwood_violet",
 	"slab_colwood_white",
 	"slab_colwood_yellow",
 	"slab_copperblock",
 	"slab_cream_wood",
 	"slab_cyan",
 	"slab_dark_green",
 	"slab_dark_grey",
 	"slab_double_bronzeblock",
 	"slab_double_copperblock",
 	"slab_double_floorblock_bstone_sandstone",
 	"slab_double_floorblock_chondrite_stone",
 	"slab_double_floorblock_essexite_gold_block",
 	"slab_double_floorblock_marble_essexite2",
 	"slab_double_goldblock",
 	"slab_double_steelblock",
 	"slab_double_tinblock",
 	"slab_essexite",
 	"slab_essexite_brick",
 	"slab_floor_chondrite_chondrite",
 	"slab_floor_cream_cream",
 	"slab_floor_essexite_essexite",
 	"slab_floor_essexitegold_essexitegold",
 	"slab_floor_jungle_jungle",
 	"slab_floor_lush_lush",
 	"slab_floor_marble_marble",
 	"slab_floor_pale_pale",
 	"slab_floor_sandstone_sandstone",
 	"slab_floor_sandstonevolcanic_sandstonevolcanic",
 	"slab_floor_stone_stone",
 	"slab_floor_stonebaked_stonebaked",
 	"slab_floor_tuff_tuff",
 	"slab_floor_tuffbaked_tuffbaked",
 	"slab_floor_wood_wood",
 	"slab_floorblock_bstone_sandstone",
 	"slab_floorblock_chondrite_stone",
 	"slab_floorblock_essexite_gold_block",
 	"slab_floorblock_marble_essexite2",
 	"slab_glowcrystal_block",
 	"slab_goldblock",
 	"slab_green",
 	"slab_grey",
 	"slab_jungle_bark",
 	"slab_jungle_wood",
 	"slab_lillite",
 	"slab_lillite_brick",
 	"slab_lush_wood",
 	"slab_magenta",
 	"slab_marble",
 	"slab_marble_brick",
 	"slab_obsidianbrick",
 	"slab_olivine",
 	"slab_olivine_brick",
 	"slab_orange",
 	"slab_orange_bark",
 	"slab_orangite",
 	"slab_orangite_brick",
 	"slab_pale_bark",
 	"slab_pale_wood",
 	"slab_pink",
 	"slab_red",
 	"slab_rusty_block",
 	"slab_sandstone",
 	"slab_sandstone_volcanic",
 	"slab_sandstone_volcanic_brick",
 	"slab_sandstonebrick",
 	"slab_steelblock",
 	"slab_stone",
 	"slab_stone_baked",
 	"slab_stonebrick",
 	"slab_stonebrick_baked",
 	"slab_straw",
 	"slab_tinblock",
 	"slab_tuff",
 	"slab_tuff_baked",
 	"slab_tuff_baked_brick",
 	"slab_tuff_brick",
 	"slab_turquosite",
 	"slab_turquosite_brick",
 	"slab_violet",
 	"slab_white",
 	"slab_wood",
 	"slab_yellow",
 	"stair_apolline",
 	"stair_apolline_brick",
 	"stair_azurite",
 	"stair_azurite_brick",
 	"stair_bark",
 	"stair_basalt",
 	"stair_basalt_brick",
 	"stair_birch_bark",
 	"stair_black",
 	"stair_blue",
 	"stair_brick",
 	"stair_brick_black",
 	"stair_brick_blue",
 	"stair_brick_brown",
 	"stair_brick_cyan",
 	"stair_brick_dark_green",
 	"stair_brick_dark_grey",
 	"stair_brick_green",
 	"stair_brick_grey",
 	"stair_brick_magenta",
 	"stair_brick_orange",
 	"stair_brick_pink",
 	"stair_brick_red",
 	"stair_brick_violet",
 	"stair_brick_white",
 	"stair_brick_yellow",
 	"stair_bronzeblock",
 	"stair_brown",
 	"stair_cactus_brick",
 	"stair_canvas_bark",
 	"stair_charred_bark",
 	"stair_charred_wood",
 	"stair_chondrite",
 	"stair_chondrite_brick",
 	"stair_cinnaber",
 	"stair_cinnaber_brick",
 	"stair_cobble",
 	"stair_cobble_baked",
 	"stair_cobble_sandstone",
 	"stair_cobble_sandstone_volcanic",
 	"stair_colwood_black",
 	"stair_colwood_blue",
 	"stair_colwood_brown",
 	"stair_colwood_cyan",
 	"stair_colwood_dark_green",
 	"stair_colwood_dark_grey",
 	"stair_colwood_green",
 	"stair_colwood_grey",
 	"stair_colwood_magenta",
 	"stair_colwood_orange",
 	"stair_colwood_pink",
 	"stair_colwood_red",
 	"stair_colwood_uncolored",
 	"stair_colwood_violet",
 	"stair_colwood_white",
 	"stair_colwood_yellow",
 	"stair_copperblock",
 	"stair_cream_wood",
 	"stair_cyan",
 	"stair_dark_green",
 	"stair_dark_grey",
 	"stair_essexite",
 	"stair_essexite_brick",
 	"stair_floor_chondrite_chondrite",
 	"stair_floor_cream_cream",
 	"stair_floor_essexite_essexite",
 	"stair_floor_essexitegold_essexitegold",
 	"stair_floor_jungle_jungle",
 	"stair_floor_lush_lush",
 	"stair_floor_marble_marble",
 	"stair_floor_pale_pale",
 	"stair_floor_sandstone_sandstone",
 	"stair_floor_sandstonevolcanic_sandstonevolcanic",
 	"stair_floor_stone_stone",
 	"stair_floor_stonebaked_stonebaked",
 	"stair_floor_tuff_tuff",
 	"stair_floor_tuffbaked_tuffbaked",
 	"stair_floor_wood_wood",
 	"stair_glowcrystal_block",
 	"stair_goldblock",
 	"stair_green",
 	"stair_grey",
 	"stair_in_apolline",
 	"stair_in_apolline_brick",
 	"stair_in_azurite",
 	"stair_in_azurite_brick",
 	"stair_in_bark",
 	"stair_in_basalt",
 	"stair_in_basalt_brick",
 	"stair_in_birch_bark",
 	"stair_in_black",
 	"stair_in_blue",
 	"stair_in_brick",
 	"stair_in_brick_black",
 	"stair_in_brick_blue",
 	"stair_in_brick_brown",
 	"stair_in_brick_cyan",
 	"stair_in_brick_dark_green",
 	"stair_in_brick_dark_grey",
 	"stair_in_brick_green",
 	"stair_in_brick_grey",
 	"stair_in_brick_magenta",
 	"stair_in_brick_orange",
 	"stair_in_brick_pink",
 	"stair_in_brick_red",
 	"stair_in_brick_violet",
 	"stair_in_brick_white",
 	"stair_in_brick_yellow",
 	"stair_in_bronzeblock",
 	"stair_in_brown",
 	"stair_in_cactus_brick",
 	"stair_in_canvas_bark",
 	"stair_in_charred_bark",
 	"stair_in_charred_wood",
 	"stair_in_chondrite",
 	"stair_in_chondrite_brick",
 	"stair_in_cinnaber",
 	"stair_in_cinnaber_brick",
 	"stair_in_cobble",
 	"stair_in_cobble_baked",
 	"stair_in_cobble_sandstone",
 	"stair_in_cobble_sandstone_volcanic",
 	"stair_in_colwood_black",
 	"stair_in_colwood_blue",
 	"stair_in_colwood_brown",
 	"stair_in_colwood_cyan",
 	"stair_in_colwood_dark_green",
 	"stair_in_colwood_dark_grey",
 	"stair_in_colwood_green",
 	"stair_in_colwood_grey",
 	"stair_in_colwood_magenta",
 	"stair_in_colwood_orange",
 	"stair_in_colwood_pink",
 	"stair_in_colwood_red",
 	"stair_in_colwood_uncolored",
 	"stair_in_colwood_violet",
 	"stair_in_colwood_white",
 	"stair_in_colwood_yellow",
 	"stair_in_copperblock",
 	"stair_in_cream_wood",
 	"stair_in_cyan",
 	"stair_in_dark_green",
 	"stair_in_dark_grey",
 	"stair_in_essexite",
 	"stair_in_essexite_brick",
 	"stair_in_floor_chondrite_chondrite",
 	"stair_in_floor_cream_cream",
 	"stair_in_floor_essexite_essexite",
 	"stair_in_floor_essexitegold_essexitegold",
 	"stair_in_floor_jungle_jungle",
 	"stair_in_floor_lush_lush",
 	"stair_in_floor_marble_marble",
 	"stair_in_floor_pale_pale",
 	"stair_in_floor_sandstone_sandstone",
 	"stair_in_floor_sandstonevolcanic_sandstonevolcanic",
 	"stair_in_floor_stone_stone",
 	"stair_in_floor_stonebaked_stonebaked",
 	"stair_in_floor_tuff_tuff",
 	"stair_in_floor_tuffbaked_tuffbaked",
 	"stair_in_floor_wood_wood",
 	"stair_in_glowcrystal_block",
 	"stair_in_goldblock",
 	"stair_in_green",
 	"stair_in_grey",
 	"stair_in_jungle_bark",
 	"stair_in_jungle_wood",
 	"stair_in_lillite",
 	"stair_in_lillite_brick",
 	"stair_in_lush_wood",
 	"stair_in_magenta",
 	"stair_in_marble",
 	"stair_in_marble_brick",
 	"stair_in_obsidianbrick",
 	"stair_in_olivine",
 	"stair_in_olivine_brick",
 	"stair_in_orange",
 	"stair_in_orange_bark",
 	"stair_in_orangite",
 	"stair_in_orangite_brick",
 	"stair_in_pale_bark",
 	"stair_in_pale_wood",
 	"stair_in_pink",
 	"stair_in_red",
 	"stair_in_rusty_block",
 	"stair_in_sandstone",
 	"stair_in_sandstone_volcanic",
 	"stair_in_sandstone_volcanic_brick",
 	"stair_in_sandstonebrick",
 	"stair_in_steelblock",
 	"stair_in_stone",
 	"stair_in_stone_baked",
 	"stair_in_stonebrick",
 	"stair_in_stonebrick_baked",
 	"stair_in_straw",
 	"stair_in_tinblock",
 	"stair_in_tuff",
 	"stair_in_tuff_baked",
 	"stair_in_tuff_baked_brick",
 	"stair_in_tuff_brick",
 	"stair_in_turquosite",
 	"stair_in_turquosite_brick",
 	"stair_in_violet",
 	"stair_in_white",
 	"stair_in_wood",
 	"stair_in_yellow",
 	"stair_jungle_bark",
 	"stair_jungle_wood",
 	"stair_lillite",
 	"stair_lillite_brick",
 	"stair_lush_wood",
 	"stair_magenta",
 	"stair_marble",
 	"stair_marble_brick",
 	"stair_obsidianbrick",
 	"stair_olivine",
 	"stair_olivine_brick",
 	"stair_orange",
 	"stair_orange_bark",
 	"stair_orangite",
 	"stair_orangite_brick",
 	"stair_out_apolline",
 	"stair_out_apolline_brick",
 	"stair_out_azurite",
 	"stair_out_azurite_brick",
 	"stair_out_bark",
 	"stair_out_basalt",
 	"stair_out_basalt_brick",
 	"stair_out_birch_bark",
 	"stair_out_black",
 	"stair_out_blue",
 	"stair_out_brick",
 	"stair_out_brick_black",
 	"stair_out_brick_blue",
 	"stair_out_brick_brown",
 	"stair_out_brick_cyan",
 	"stair_out_brick_dark_green",
 	"stair_out_brick_dark_grey",
 	"stair_out_brick_green",
 	"stair_out_brick_grey",
 	"stair_out_brick_magenta",
 	"stair_out_brick_orange",
 	"stair_out_brick_pink",
 	"stair_out_brick_red",
 	"stair_out_brick_violet",
 	"stair_out_brick_white",
 	"stair_out_brick_yellow",
 	"stair_out_bronzeblock",
 	"stair_out_brown",
 	"stair_out_cactus_brick",
 	"stair_out_canvas_bark",
 	"stair_out_charred_bark",
 	"stair_out_charred_wood",
 	"stair_out_chondrite",
 	"stair_out_chondrite_brick",
 	"stair_out_cinnaber",
 	"stair_out_cinnaber_brick",
 	"stair_out_cobble",
 	"stair_out_cobble_baked",
 	"stair_out_cobble_sandstone",
 	"stair_out_cobble_sandstone_volcanic",
 	"stair_out_colwood_black",
 	"stair_out_colwood_blue",
 	"stair_out_colwood_brown",
 	"stair_out_colwood_cyan",
 	"stair_out_colwood_dark_green",
 	"stair_out_colwood_dark_grey",
 	"stair_out_colwood_green",
 	"stair_out_colwood_grey",
 	"stair_out_colwood_magenta",
 	"stair_out_colwood_orange",
 	"stair_out_colwood_pink",
 	"stair_out_colwood_red",
 	"stair_out_colwood_uncolored",
 	"stair_out_colwood_violet",
 	"stair_out_colwood_white",
 	"stair_out_colwood_yellow",
 	"stair_out_copperblock",
 	"stair_out_cream_wood",
 	"stair_out_cyan",
 	"stair_out_dark_green",
 	"stair_out_dark_grey",
 	"stair_out_essexite",
 	"stair_out_essexite_brick",
 	"stair_out_floor_chondrite_chondrite",
 	"stair_out_floor_cream_cream",
 	"stair_out_floor_essexite_essexite",
 	"stair_out_floor_essexitegold_essexitegold",
 	"stair_out_floor_jungle_jungle",
 	"stair_out_floor_lush_lush",
 	"stair_out_floor_marble_marble",
 	"stair_out_floor_pale_pale",
 	"stair_out_floor_sandstone_sandstone",
 	"stair_out_floor_sandstonevolcanic_sandstonevolcanic",
 	"stair_out_floor_stone_stone",
 	"stair_out_floor_stonebaked_stonebaked",
 	"stair_out_floor_tuff_tuff",
 	"stair_out_floor_tuffbaked_tuffbaked",
 	"stair_out_floor_wood_wood",
 	"stair_out_glowcrystal_block",
 	"stair_out_goldblock",
 	"stair_out_green",
 	"stair_out_grey",
 	"stair_out_jungle_bark",
 	"stair_out_jungle_wood",
 	"stair_out_lillite",
 	"stair_out_lillite_brick",
 	"stair_out_lush_wood",
 	"stair_out_magenta",
 	"stair_out_marble",
 	"stair_out_marble_brick",
 	"stair_out_obsidianbrick",
 	"stair_out_olivine",
 	"stair_out_olivine_brick",
 	"stair_out_orange",
 	"stair_out_orange_bark",
 	"stair_out_orangite",
 	"stair_out_orangite_brick",
 	"stair_out_pale_bark",
 	"stair_out_pale_wood",
 	"stair_out_pink",
 	"stair_out_red",
 	"stair_out_rusty_block",
 	"stair_out_sandstone",
 	"stair_out_sandstone_volcanic",
 	"stair_out_sandstone_volcanic_brick",
 	"stair_out_sandstonebrick",
 	"stair_out_steelblock",
 	"stair_out_stone",
 	"stair_out_stone_baked",
 	"stair_out_stonebrick",
 	"stair_out_stonebrick_baked",
 	"stair_out_straw",
 	"stair_out_tinblock",
 	"stair_out_tuff",
 	"stair_out_tuff_baked",
 	"stair_out_tuff_baked_brick",
 	"stair_out_tuff_brick",
 	"stair_out_turquosite",
 	"stair_out_turquosite_brick",
 	"stair_out_violet",
 	"stair_out_white",
 	"stair_out_wood",
 	"stair_out_yellow",
 	"stair_pale_bark",
 	"stair_pale_wood",
 	"stair_pink",
 	"stair_red",
 	"stair_rusty_block",
 	"stair_sandstone",
 	"stair_sandstone_volcanic",
 	"stair_sandstone_volcanic_brick",
 	"stair_sandstonebrick",
 	"stair_steelblock",
 	"stair_stone",
 	"stair_stone_baked",
 	"stair_stonebrick",
 	"stair_stonebrick_baked",
 	"stair_straw",
 	"stair_tinblock",
 	"stair_tuff",
 	"stair_tuff_baked",
 	"stair_tuff_baked_brick",
 	"stair_tuff_brick",
 	"stair_turquosite",
 	"stair_turquosite_brick",
 	"stair_violet",
 	"stair_white",
 	"stair_wood",
 	"stair_yellow",
 	"step_apolline",
 	"step_apolline_brick",
 	"step_azurite",
 	"step_azurite_brick",
 	"step_bark",
 	"step_basalt",
 	"step_basalt_brick",
 	"step_birch_bark",
 	"step_black",
 	"step_blue",
 	"step_brick",
 	"step_brick_black",
 	"step_brick_blue",
 	"step_brick_brown",
 	"step_brick_cyan",
 	"step_brick_dark_green",
 	"step_brick_dark_grey",
 	"step_brick_green",
 	"step_brick_grey",
 	"step_brick_magenta",
 	"step_brick_orange",
 	"step_brick_pink",
 	"step_brick_red",
 	"step_brick_violet",
 	"step_brick_white",
 	"step_brick_yellow",
 	"step_bronzeblock",
 	"step_brown",
 	"step_cactus_brick",
 	"step_canvas_bark",
 	"step_charred_bark",
 	"step_charred_wood",
 	"step_chondrite",
 	"step_chondrite_brick",
 	"step_cinnaber",
 	"step_cinnaber_brick",
 	"step_cobble",
 	"step_cobble_baked",
 	"step_cobble_sandstone",
 	"step_cobble_sandstone_volcanic",
 	"step_colwood_black",
 	"step_colwood_blue",
 	"step_colwood_brown",
 	"step_colwood_cyan",
 	"step_colwood_dark_green",
 	"step_colwood_dark_grey",
 	"step_colwood_green",
 	"step_colwood_grey",
 	"step_colwood_magenta",
 	"step_colwood_orange",
 	"step_colwood_pink",
 	"step_colwood_red",
 	"step_colwood_uncolored",
 	"step_colwood_violet",
 	"step_colwood_white",
 	"step_colwood_yellow",
 	"step_copperblock",
 	"step_cream_wood",
 	"step_cyan",
 	"step_dark_green",
 	"step_dark_grey",
 	"step_essexite",
 	"step_essexite_brick",
 	"step_floor_chondrite_chondrite",
 	"step_floor_cream_cream",
 	"step_floor_essexite_essexite",
 	"step_floor_essexitegold_essexitegold",
 	"step_floor_jungle_jungle",
 	"step_floor_lush_lush",
 	"step_floor_marble_marble",
 	"step_floor_pale_pale",
 	"step_floor_sandstone_sandstone",
 	"step_floor_sandstonevolcanic_sandstonevolcanic",
 	"step_floor_stone_stone",
 	"step_floor_stonebaked_stonebaked",
 	"step_floor_tuff_tuff",
 	"step_floor_tuffbaked_tuffbaked",
 	"step_floor_wood_wood",
 	"step_glowcrystal_block",
 	"step_goldblock",
 	"step_green",
 	"step_grey",
 	"step_in_apolline",
 	"step_in_apolline_brick",
 	"step_in_azurite",
 	"step_in_azurite_brick",
 	"step_in_bark",
 	"step_in_basalt",
 	"step_in_basalt_brick",
 	"step_in_birch_bark",
 	"step_in_black",
 	"step_in_blue",
 	"step_in_brick",
 	"step_in_brick_black",
 	"step_in_brick_blue",
 	"step_in_brick_brown",
 	"step_in_brick_cyan",
 	"step_in_brick_dark_green",
 	"step_in_brick_dark_grey",
 	"step_in_brick_green",
 	"step_in_brick_grey",
 	"step_in_brick_magenta",
 	"step_in_brick_orange",
 	"step_in_brick_pink",
 	"step_in_brick_red",
 	"step_in_brick_violet",
 	"step_in_brick_white",
 	"step_in_brick_yellow",
 	"step_in_bronzeblock",
 	"step_in_brown",
 	"step_in_cactus_brick",
 	"step_in_canvas_bark",
 	"step_in_charred_bark",
 	"step_in_charred_wood",
 	"step_in_chondrite",
 	"step_in_chondrite_brick",
 	"step_in_cinnaber",
 	"step_in_cinnaber_brick",
 	"step_in_cobble",
 	"step_in_cobble_baked",
 	"step_in_cobble_sandstone",
 	"step_in_cobble_sandstone_volcanic",
 	"step_in_colwood_black",
 	"step_in_colwood_blue",
 	"step_in_colwood_brown",
 	"step_in_colwood_cyan",
 	"step_in_colwood_dark_green",
 	"step_in_colwood_dark_grey",
 	"step_in_colwood_green",
 	"step_in_colwood_grey",
 	"step_in_colwood_magenta",
 	"step_in_colwood_orange",
 	"step_in_colwood_pink",
 	"step_in_colwood_red",
 	"step_in_colwood_uncolored",
 	"step_in_colwood_violet",
 	"step_in_colwood_white",
 	"step_in_colwood_yellow",
 	"step_in_copperblock",
 	"step_in_cream_wood",
 	"step_in_cyan",
 	"step_in_dark_green",
 	"step_in_dark_grey",
 	"step_in_essexite",
 	"step_in_essexite_brick",
 	"step_in_floor_chondrite_chondrite",
 	"step_in_floor_cream_cream",
 	"step_in_floor_essexite_essexite",
 	"step_in_floor_essexitegold_essexitegold",
 	"step_in_floor_jungle_jungle",
 	"step_in_floor_lush_lush",
 	"step_in_floor_marble_marble",
 	"step_in_floor_pale_pale",
 	"step_in_floor_sandstone_sandstone",
 	"step_in_floor_sandstonevolcanic_sandstonevolcanic",
 	"step_in_floor_stone_stone",
 	"step_in_floor_stonebaked_stonebaked",
 	"step_in_floor_tuff_tuff",
 	"step_in_floor_tuffbaked_tuffbaked",
 	"step_in_floor_wood_wood",
 	"step_in_glowcrystal_block",
 	"step_in_goldblock",
 	"step_in_green",
 	"step_in_grey",
 	"step_in_jungle_bark",
 	"step_in_jungle_wood",
 	"step_in_lillite",
 	"step_in_lillite_brick",
 	"step_in_lush_wood",
 	"step_in_magenta",
 	"step_in_marble",
 	"step_in_marble_brick",
 	"step_in_obsidianbrick",
 	"step_in_olivine",
 	"step_in_olivine_brick",
 	"step_in_orange",
 	"step_in_orange_bark",
 	"step_in_orangite",
 	"step_in_orangite_brick",
 	"step_in_pale_bark",
 	"step_in_pale_wood",
 	"step_in_pink",
 	"step_in_red",
 	"step_in_rusty_block",
 	"step_in_sandstone",
 	"step_in_sandstone_volcanic",
 	"step_in_sandstone_volcanic_brick",
 	"step_in_sandstonebrick",
 	"step_in_steelblock",
 	"step_in_stone",
 	"step_in_stone_baked",
 	"step_in_stonebrick",
 	"step_in_stonebrick_baked",
 	"step_in_straw",
 	"step_in_tinblock",
 	"step_in_tuff",
 	"step_in_tuff_baked",
 	"step_in_tuff_baked_brick",
 	"step_in_tuff_brick",
 	"step_in_turquosite",
 	"step_in_turquosite_brick",
 	"step_in_violet",
 	"step_in_white",
 	"step_in_wood",
 	"step_in_yellow",
 	"step_jungle_bark",
 	"step_jungle_wood",
 	"step_lillite",
 	"step_lillite_brick",
 	"step_lush_wood",
 	"step_magenta",
 	"step_marble",
 	"step_marble_brick",
 	"step_obsidianbrick",
 	"step_olivine",
 	"step_olivine_brick",
 	"step_orange",
 	"step_orange_bark",
 	"step_orangite",
 	"step_orangite_brick",
 	"step_out_apolline",
 	"step_out_apolline_brick",
 	"step_out_azurite",
 	"step_out_azurite_brick",
 	"step_out_bark",
 	"step_out_basalt",
 	"step_out_basalt_brick",
 	"step_out_birch_bark",
 	"step_out_black",
 	"step_out_blue",
 	"step_out_brick",
 	"step_out_brick_black",
 	"step_out_brick_blue",
 	"step_out_brick_brown",
 	"step_out_brick_cyan",
 	"step_out_brick_dark_green",
 	"step_out_brick_dark_grey",
 	"step_out_brick_green",
 	"step_out_brick_grey",
 	"step_out_brick_magenta",
 	"step_out_brick_orange",
 	"step_out_brick_pink",
 	"step_out_brick_red",
 	"step_out_brick_violet",
 	"step_out_brick_white",
 	"step_out_brick_yellow",
 	"step_out_bronzeblock",
 	"step_out_brown",
 	"step_out_cactus_brick",
 	"step_out_canvas_bark",
 	"step_out_charred_bark",
 	"step_out_charred_wood",
 	"step_out_chondrite",
 	"step_out_chondrite_brick",
 	"step_out_cinnaber",
 	"step_out_cinnaber_brick",
 	"step_out_cobble",
 	"step_out_cobble_baked",
 	"step_out_cobble_sandstone",
 	"step_out_cobble_sandstone_volcanic",
 	"step_out_colwood_black",
 	"step_out_colwood_blue",
 	"step_out_colwood_brown",
 	"step_out_colwood_cyan",
 	"step_out_colwood_dark_green",
 	"step_out_colwood_dark_grey",
 	"step_out_colwood_green",
 	"step_out_colwood_grey",
 	"step_out_colwood_magenta",
 	"step_out_colwood_orange",
 	"step_out_colwood_pink",
 	"step_out_colwood_red",
 	"step_out_colwood_uncolored",
 	"step_out_colwood_violet",
 	"step_out_colwood_white",
 	"step_out_colwood_yellow",
 	"step_out_copperblock",
 	"step_out_cream_wood",
 	"step_out_cyan",
 	"step_out_dark_green",
 	"step_out_dark_grey",
 	"step_out_essexite",
 	"step_out_essexite_brick",
 	"step_out_floor_chondrite_chondrite",
 	"step_out_floor_cream_cream",
 	"step_out_floor_essexite_essexite",
 	"step_out_floor_essexitegold_essexitegold",
 	"step_out_floor_jungle_jungle",
 	"step_out_floor_lush_lush",
 	"step_out_floor_marble_marble",
 	"step_out_floor_pale_pale",
 	"step_out_floor_sandstone_sandstone",
 	"step_out_floor_sandstonevolcanic_sandstonevolcanic",
 	"step_out_floor_stone_stone",
 	"step_out_floor_stonebaked_stonebaked",
 	"step_out_floor_tuff_tuff",
 	"step_out_floor_tuffbaked_tuffbaked",
 	"step_out_floor_wood_wood",
 	"step_out_glowcrystal_block",
 	"step_out_goldblock",
 	"step_out_green",
 	"step_out_grey",
 	"step_out_jungle_bark",
 	"step_out_jungle_wood",
 	"step_out_lillite",
 	"step_out_lillite_brick",
 	"step_out_lush_wood",
 	"step_out_magenta",
 	"step_out_marble",
 	"step_out_marble_brick",
 	"step_out_obsidianbrick",
 	"step_out_olivine",
 	"step_out_olivine_brick",
 	"step_out_orange",
 	"step_out_orange_bark",
 	"step_out_orangite",
 	"step_out_orangite_brick",
 	"step_out_pale_bark",
 	"step_out_pale_wood",
 	"step_out_pink",
 	"step_out_red",
 	"step_out_rusty_block",
 	"step_out_sandstone",
 	"step_out_sandstone_volcanic",
 	"step_out_sandstone_volcanic_brick",
 	"step_out_sandstonebrick",
 	"step_out_steelblock",
 	"step_out_stone",
 	"step_out_stone_baked",
 	"step_out_stonebrick",
 	"step_out_stonebrick_baked",
 	"step_out_straw",
 	"step_out_tinblock",
 	"step_out_tuff",
 	"step_out_tuff_baked",
 	"step_out_tuff_baked_brick",
 	"step_out_tuff_brick",
 	"step_out_turquosite",
 	"step_out_turquosite_brick",
 	"step_out_violet",
 	"step_out_white",
 	"step_out_wood",
 	"step_out_yellow",
 	"step_pale_bark",
 	"step_pale_wood",
 	"step_pink",
 	"step_red",
 	"step_rusty_block",
 	"step_sandstone",
 	"step_sandstone_volcanic",
 	"step_sandstone_volcanic_brick",
 	"step_sandstonebrick",
 	"step_steelblock",
 	"step_stone",
 	"step_stone_baked",
 	"step_stonebrick",
 	"step_stonebrick_baked",
 	"step_straw",
 	"step_tinblock",
 	"step_tuff",
 	"step_tuff_baked",
 	"step_tuff_baked_brick",
 	"step_tuff_brick",
 	"step_turquosite",
 	"step_turquosite_brick",
 	"step_violet",
 	"step_white",
 	"step_wood",
 	"step_yellow",
}

for i=1, #legacy_stair_ids do
	local subname = legacy_stair_ids[i]
	minetest.register_alias("stairs:"..subname, "hades_stairs:"..subname)
end

-- Other aliases
minetest.register_alias("hades_stairs:stair_cinnaber", "hades_stairs:stair_cinnabar")
minetest.register_alias("hades_stairs:stair_in_cinnaber", "hades_stairs:stair_in_cinnabar")
minetest.register_alias("hades_stairs:stair_out_cinnaber", "hades_stairs:stair_out_cinnabar")
minetest.register_alias("hades_stairs:stair_step_cinnaber", "hades_stairs:step_cinnabar")
minetest.register_alias("hades_stairs:stair_step_in_cinnaber", "hades_stairs:step_in_cinnabar")
minetest.register_alias("hades_stairs:stair_step_out_cinnaber", "hades_stairs:step_out_cinnabar")
minetest.register_alias("hades_stairs:stair_slab_cinnaber", "hades_stairs:slab_cinnabar")
