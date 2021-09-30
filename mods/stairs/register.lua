local S = minetest.get_translator("stairs")

local custom_textures = function(block, stair_l, stair_r, outstair, slab)
	return {"!CUSTOM",
		{slab, block, stair_l, stair_r, block, slab},
		{stair_l.."^[transformR180", block, stair_l, block, block, stair_r},
		{stair_l, block, outstair, stair_r, stair_l, outstair},
		{block, block, slab},
	}
end

stairs.register_stair_and_slab_and_step("wood", "hades_trees:wood",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Temperate Wood Stair"),
		S("Outer Temperate Wood Stair"),
		S("Inner Temperate Wood Stair"),
		S("Temperate Wood Slab"),
		S("Temperate Wood Step"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab_and_step("pale_wood", "hades_trees:pale_wood",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Pale Wood Stair"),
		S("Outer Pale Wood Stair"),
		S("Inner Pale Wood Stair"),
		S("Pale Wood Slab"),
		S("Pale Wood Step"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab_and_step("jungle_wood", "hades_trees:jungle_wood",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Tropical Wood Stair"),
		S("Outer Tropical Wood Stair"),
		S("Innter Tropical Wood Stair"),
		S("Tropical Wood Slab"),
		S("Tropical Wood Step"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab_and_step("lush_wood", "hades_trees:lush_wood",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Lush Wood Stair"),
		S("Outer Lush Wood Stair"),
		S("Inner Lush Wood Stair"),
		S("Lush Wood Slab"),
		S("Lush Wood Step"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab_and_step("cream_wood", "hades_trees:cream_wood",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Cream Wood Stair"),
		S("Outer Cream Wood Stair"),
		S("Inner Cream Wood Stair"),
		S("Cream Wood Slab"),
		S("Cream Wood Step"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab_and_step("charred_wood", "hades_trees:charred_wood",
		{choppy=3,oddly_breakable_by_hand=2},
		nil,
		S("Charred Wood Stair"),
		S("Outer Charred Wood Stair"),
		S("Inner Charred Wood Stair"),
		S("Charred Wood Slab"),
		S("Charred Wood Step"),
		hades_sounds.node_sound_wood_defaults({pitch=0.8}))

-- Barks

stairs.register_stair_and_slab_and_step("bark", "hades_trees:bark",
		{choppy=3,oddly_breakable_by_hand=1,flammable=3},
		nil,
		S("Common Bark Stair"),
		S("Outer Common Bark Stair"),
		S("Inner Common Bark Stair"),
		S("Common Bark Slab"),
		S("Common Bark Step"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab_and_step("jungle_bark", "hades_trees:jungle_bark",
		{choppy=3,oddly_breakable_by_hand=1,flammable=3},
		nil,
		S("Tropical Bark Stair"),
		S("Outer Tropical Bark Stair"),
		S("Inner Tropical Bark Stair"),
		S("Tropical Bark Slab"),
		S("Tropical Bark Step"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab_and_step("pale_bark", "hades_trees:pale_bark",
		{choppy=3,oddly_breakable_by_hand=1,flammable=3},
		nil,
		S("Pale Bark Stair"),
		S("Outer Pale Bark Stair"),
		S("Inner Pale Bark Stair"),
		S("Pale Bark Slab"),
		S("Pale Bark Step"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab_and_step("birch_bark", "hades_trees:birch_bark",
		{choppy=3,oddly_breakable_by_hand=1,flammable=3},
		nil,
		S("Birch Bark Stair"),
		S("Outer Birch Bark Stair"),
		S("Inner Birch Bark Stair"),
		S("Birch Bark Slab"),
		S("Birch Bark Step"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab_and_step("orange_bark", "hades_trees:orange_bark",
		{choppy=3,oddly_breakable_by_hand=1,flammable=3},
		nil,
		S("Orange Bark Stair"),
		S("Outer Orange Bark Stair"),
		S("Inner Orange Bark Stair"),
		S("Orange Bark Slab"),
		S("Orange Bark Step"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab_and_step("canvas_bark", "hades_trees:canvas_bark",
		{choppy=3,oddly_breakable_by_hand=1,flammable=3},
		nil,
		S("Canvas Bark Stair"),
		S("Outer Canvas Bark Stair"),
		S("Inner Canvas Bark Stair"),
		S("Canvas Bark Slab"),
		S("Canvas Bark Step"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab_and_step("charred_bark", "hades_trees:charred_bark",
		{choppy=3,oddly_breakable_by_hand=1},
		nil,
		S("Charred Bark Stair"),
		S("Outer Charred Bark Stair"),
		S("Inner Charred Bark Stair"),
		S("Charred Bark Slab"),
		S("Charred Bark Step"),
		hades_sounds.node_sound_wood_defaults({pitch=0.8}))



-- Canvas Wood

stairs.register_stair_and_slab_and_step("colwood_uncolored", "hades_trees:colwood_uncolored",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Uncolored Canvas Wood Stair"),
		S("Outer Uncolored Canvas Wood Stair"),
		S("Inner Uncolored Canvas Wood Stair"),
		S("Uncolored Canvas Wood Slab"),
		S("Uncolored Canvas Wood Step"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab_and_step("colwood_black", "hades_trees:colwood_black",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Black Canvas Wood Stair"),
		S("Outer Black Canvas Wood Stair"),
		S("Inner Black Canvas Wood Stair"),
		S("Black Canvas Wood Slab"),
		S("Black Canvas Wood Step"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab_and_step("colwood_blue", "hades_trees:colwood_blue",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Blue Canvas Wood Stair"),
		S("Outer Blue Canvas Wood Stair"),
		S("Inner Blue Canvas Wood Stair"),
		S("Blue Canvas Wood Slab"),
		S("Blue Canvas Wood Step"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab_and_step("colwood_brown", "hades_trees:colwood_brown",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Brown Canvas Wood Stair"),
		S("Outer Brown Canvas Wood Stair"),
		S("Inner Brown Canvas Wood Stair"),
		S("Brown Canvas Wood Slab"),
		S("Brown Canvas Wood Step"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab_and_step("colwood_cyan", "hades_trees:colwood_cyan",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Cyan Canvas Wood Stair"),
		S("Outer Cyan Canvas Wood Stair"),
		S("Inner Cyan Canvas Wood Stair"),
		S("Cyan Canvas Wood Slab"),
		S("Cyan Canvas Wood Step"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab_and_step("colwood_dark_green", "hades_trees:colwood_dark_green",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Dark Green Canvas Wood Stair"),
		S("Outer Dark Green Canvas Wood Stair"),
		S("Inner Dark Green Canvas Wood Stair"),
		S("Dark Green Canvas Wood Slab"),
		S("Dark Green Canvas Wood Step"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab_and_step("colwood_dark_grey", "hades_trees:colwood_dark_grey",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Dark Grey Canvas Wood Stair"),
		S("Outer Dark Grey Canvas Wood Stair"),
		S("Inner Dark Grey Canvas Wood Stair"),
		S("Dark Grey Canvas Wood Slab"),
		S("Dark Grey Canvas Wood Step"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab_and_step("colwood_green", "hades_trees:colwood_green",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Green Canvas Wood Stair"),
		S("Outer Green Canvas Wood Stair"),
		S("Inner Green Canvas Wood Stair"),
		S("Green Canvas Wood Slab"),
		S("Green Canvas Wood Step"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab_and_step("colwood_grey", "hades_trees:colwood_grey",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Grey Canvas Wood Stair"),
		S("Outer Grey Canvas Wood Stair"),
		S("Inner Grey Canvas Wood Stair"),
		S("Grey Canvas Wood Slab"),
		S("Grey Canvas Wood Step"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab_and_step("colwood_magenta", "hades_trees:colwood_magenta",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Magenta Canvas Wood Stair"),
		S("Outer Magenta Canvas Wood Stair"),
		S("Inner Magenta Canvas Wood Stair"),
		S("Magenta Canvas Wood Slab"),
		S("Magenta Canvas Wood Step"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab_and_step("colwood_orange", "hades_trees:colwood_orange",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Orange Canvas Wood Stair"),
		S("Outer Orange Canvas Wood Stair"),
		S("Inner Orange Canvas Wood Stair"),
		S("Orange Canvas Wood Slab"),
		S("Orange Canvas Wood Step"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab_and_step("colwood_pink", "hades_trees:colwood_pink",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Pink Canvas Wood Stair"),
		S("Outer Pink Canvas Wood Stair"),
		S("Inner Pink Canvas Wood Stair"),
		S("Pink Canvas Wood Slab"),
		S("Pink Canvas Wood Step"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab_and_step("colwood_red", "hades_trees:colwood_red",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Red Canvas Wood Stair"),
		S("Outer Red Canvas Wood Stair"),
		S("Inner Red Canvas Wood Stair"),
		S("Red Canvas Wood Slab"),
		S("Red Canvas Wood Step"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab_and_step("colwood_violet", "hades_trees:colwood_violet",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Violet Canvas Wood Stair"),
		S("Outer Violet Canvas Wood Stair"),
		S("Inner Violet Canvas Wood Stair"),
		S("Violet Canvas Wood Slab"),
		S("Violet Canvas Wood Step"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab_and_step("colwood_white", "hades_trees:colwood_white",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("White Canvas Wood Stair"),
		S("Outer White Canvas Wood Stair"),
		S("Inner White Canvas Wood Stair"),
		S("White Canvas Wood Slab"),
		S("White Canvas Wood Step"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab_and_step("colwood_yellow", "hades_trees:colwood_yellow",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Yellow Canvas Wood Stair"),
		S("Outer Yellow Canvas Wood Stair"),
		S("Inner Yellow Canvas Wood Stair"),
		S("Yellow Canvas Wood Slab"),
		S("Yellow Canvas Wood Step"),
		hades_sounds.node_sound_wood_defaults())

		--

-- TODO: Add metal steps
local metals = {
	{"steel", S("Steel Stair"), S("Outer Steel Stair"), S("Inner Steel Stair"), S("Steel Slab"), S("Double Steel Slab")},
	{"copper", S("Copper Stair"), S("Outer Copper Stair"), S("Inner Copper Stair"), S("Copper Slab"), S("Double Copper Slab")},
	{"bronze", S("Bronze Stair"), S("Outer Bronze Stair"), S("Inner Bronze Stair"), S("Bronze Slab"), S("Double Bronze Slab")},
	{"tin", S("Tin Stair"), S("Outer Tin Stair"), S("Inner Tin Stair"), S("Tin Slab"), S("Double Tin Slab")},
	{"gold", S("Gold Stair"), S("Outer Gold Stair"), S("Inner Gold Stair"), S("Gold Slab"), S("Double Gold Slab")},
}
for m=1, #metals do
	local name = metals[m][1].."block"
	local tex = metals[m][1].."_block"
	stairs.register_stair_and_slab(name, "hades_core:"..name,
		{cracky=1,level=2},
		custom_textures("default_"..tex..".png", "stairs_"..tex.."_stair_l.png", "stairs_"..tex.."_stair_r.png", "stairs_"..tex.."_stair_out.png", "stairs_"..tex.."_slab.png"),
		metals[m][2],
		metals[m][3],
		metals[m][4],
		metals[m][5],
		hades_sounds.node_sound_metal_defaults(),
		metals[m][6]
	)
end

stairs.register_stair_and_slab_and_step("stone", "hades_core:stone",
		{cracky=3},
		nil,
		S("Stone Stair"),
		S("Outer Stone Stair"),
		S("Inner Stone Stair"),
		S("Stone Slab"),
		S("Stone Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("stonebrick_baked", "hades_core:stonebrick_baked",
		{cracky=3},
		nil,
		S("Burned Stone Brick Stair"),
		S("Outer Burned Stone Brick Stair"),
		S("Inner Burned Stone Brick Stair"),
		S("Burned Stone Brick Slab"),
		S("Burned Stone Brick Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("stone_baked", "hades_core:stone_baked",
		{cracky=3},
		nil,
		S("Burned Stone Stair"),
		S("Outer Burned Stone Stair"),
		S("Inner Burned Stone Stair"),
		S("Burned Stone Slab"),
		S("Burned Stone Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("cobble", "hades_core:cobble",
		{cracky=3},
		nil,
		S("Cobblestone Stair"),
		S("Outer Cobblestone Stair"),
		S("Inner Cobblestone Stair"),
		S("Cobblestone Slab"),
		S("Cobblestone Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("cobble_baked", "hades_core:cobble_baked",
		{cracky=3},
		nil,
		S("Burned Cobblestone Stair"),
		S("Outer Burned Cobblestone Stair"),
		S("Inner Burned Cobblestone Stair"),
		S("Burned Cobblestone Slab"),
		S("Burned Cobblestone Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("brick", "hades_core:brick",
		{cracky=3},
		nil,
		S("Uncolored Brick Stair"),
		S("Outer Uncolored Brick Stair"),
		S("Inner Uncolored Brick Stair"),
		S("Uncolored Brick Slab"),
		S("Uncolored Brick Step"),
		hades_sounds.node_sound_stone_defaults())

-- Colors... too mutch ColOrs...  EvErYwhere

stairs.register_stair_and_slab_and_step("brick_black", "hades_core:brick_black",
		{cracky=3},
		nil,
		S("Black Brick Stair"),
		S("Outer Black Brick Stair"),
		S("Inner Black Brick Stair"),
		S("Black Brick Slab"),
		S("Black Brick Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("brick_blue", "hades_core:brick_blue",
		{cracky=3},
		nil,
		S("Blue Brick Stair"),
		S("Outer Blue Brick Stair"),
		S("Inner Blue Brick Stair"),
		S("Blue Brick Slab"),
		S("Blue Brick Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("brick_brown", "hades_core:brick_brown",
		{cracky=3},
		nil,
		S("Brown Brick Stair"),
		S("Outer Brown Brick Stair"),
		S("Inner Brown Brick Stair"),
		S("Brown Brick Slab"),
		S("Brown Brick Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("brick_cyan", "hades_core:brick_cyan",
		{cracky=3},
		nil,
		S("Cyan Brick Stair"),
		S("Outer Cyan Brick Stair"),
		S("Inner Cyan Brick Stair"),
		S("Cyan Brick Slab"),
		S("Cyan Brick Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("brick_dark_green", "hades_core:brick_dark_green",
		{cracky=3},
		nil,
		S("Dark Green Brick Stair"),
		S("Outer Dark Green Brick Stair"),
		S("Inner Dark Green Brick Stair"),
		S("Dark Green Brick Slab"),
		S("Dark Green Brick Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("brick_dark_grey", "hades_core:brick_dark_grey",
		{cracky=3},
		nil,
		S("Dark Grey Brick Stair"),
		S("Outer Dark Grey Brick Stair"),
		S("Inner Dark Grey Brick Stair"),
		S("Dark Grey Brick Slab"),
		S("Dark Grey Brick Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("brick_green", "hades_core:brick_green",
		{cracky=3},
		nil,
		S("Green Brick Stair"),
		S("Outer Green Brick Stair"),
		S("Inner Green Brick Stair"),
		S("Green Brick Slab"),
		S("Green Brick Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("brick_grey", "hades_core:brick_grey",
		{cracky=3},
		nil,
		S("Grey Brick Stair"),
		S("Outer Grey Brick Stair"),
		S("Inner Grey Brick Stair"),
		S("Grey Brick Slab"),
		S("Grey Brick Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("brick_magenta", "hades_core:brick_magenta",
		{cracky=3},
		nil,
		S("Magenta Brick Stair"),
		S("Outer Magenta Brick Stair"),
		S("Inner Magenta Brick Stair"),
		S("Magenta Brick Slab"),
		S("Magenta Brick Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("brick_orange", "hades_core:brick_orange",
		{cracky=3},
		nil,
		S("Orange Brick Stair"),
		S("Outer Orange Brick Stair"),
		S("Inner Orange Brick Stair"),
		S("Orange Brick Slab"),
		S("Orange Brick Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("brick_pink", "hades_core:brick_pink",
		{cracky=3},
		nil,
		S("Pink Brick Stair"),
		S("Outer Pink Brick Stair"),
		S("Inner Pink Brick Stair"),
		S("Pink Brick Slab"),
		S("Pink Brick Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("brick_red", "hades_core:brick_red",
		{cracky=3},
		nil,
		S("Red Brick Stair"),
		S("Outer Red Brick Stair"),
		S("Inner Red Brick Stair"),
		S("Red Brick Slab"),
		S("Red Brick Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("brick_violet", "hades_core:brick_violet",
		{cracky=3},
		nil,
		S("Violet Brick Stair"),
		S("Outer Violet Brick Stair"),
		S("Inner Violet Brick Stair"),
		S("Violet Brick Slab"),
		S("Violet Brick Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("brick_white", "hades_core:brick_white",
		{cracky=3},
		nil,
		S("White Brick Stair"),
		S("Outer White Brick Stair"),
		S("Inner White Brick Stair"),
		S("White Brick Slab"),
		S("White Brick Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("brick_yellow", "hades_core:brick_yellow",
		{cracky=3},
		nil,
		S("Yellow Brick Stair"),
		S("Outer Yellow Brick Stair"),
		S("Inner Yellow Brick Stair"),
		S("Yellow Brick Slab"),
		S("Yellow Brick Step"),
		hades_sounds.node_sound_stone_defaults())


stairs.register_stair_and_slab_and_step("sandstone", "hades_core:sandstone",
		{cracky=3},
		nil,
		S("Fine Sandstone Stair"),
		S("Outer Fine Sandstone Stair"),
		S("Inner Fine Sandstone Stair"),
		S("Fine Sandstone Slab"),
		S("Fine Sandstone Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("sandstonebrick", "hades_core:sandstonebrick",
		{cracky=2},
		nil,
		S("Fine Sandstone Brick Stair"),
		S("Outer Fine Sandstone Brick Stair"),
		S("Inner Fine Sandstone Brick Stair"),
		S("Fine Sandstone Brick Slab"),
		S("Fine Sandstone Brick Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("sandstone_volcanic", "hades_core:sandstone_volcanic",
		{cracky=3},
		nil,
		S("Volcanic Sandstone Stair"),
		S("Outer Volcanic Sandstone Stair"),
		S("Inner Volcanic Sandstone Stair"),
		S("Volcanic Sandstone Slab"),
		S("Volcanic Sandstone Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("sandstone_volcanic_brick", "hades_core:sandstone_volcanic_brick",
		{cracky=2},
		nil,
		S("Volcanic Sandstone Brick Stair"),
		S("Outer Volcanic Sandstone Brick Stair"),
		S("Inner Volcanic Sandstone Brick Stair"),
		S("Volcanic Sandstone Brick Slab"),
		S("Volcanic Sandstone Brick Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("stonebrick", "hades_core:stonebrick",
		{cracky=3},
		nil,
		S("Stone Brick Stair"),
		S("Outer Stone Brick Stair"),
		S("Inner Stone Brick Stair"),
		S("Stone Brick Slab"),
		S("Stone Brick Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("chondrite_brick", "hades_core:chondrite_brick",
		{cracky=2},
		nil,
		S("Chondrite Brick Stair"),
		S("Outer Chondrite Brick Stair"),
		S("Inner Chondrite Brick Stair"),
		S("Chondrite Brick Slab"),
		S("Chondrite Brick Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("chondrite", "hades_core:chondrite",
		{cracky=2},
		nil,
		S("Chondrite Stair"),
		S("Outer Chondrite Stair"),
		S("Inner Chondrite Stair"),
		S("Chondrite Slab"),
		S("Chondrite Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("marble_brick", "hades_core:marble_brick",
		{cracky=3},
		nil,
		S("Marble Brick Stair"),
		S("Outer Marble Brick Stair"),
		S("Inner Marble Brick Stair"),
		S("Marble Brick Slab"),
		S("Marble Brick Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("marble", "hades_core:marble",
		{cracky=3},
		nil,
		S("Marble Stair"),
		S("Outer Marble Stair"),
		S("Inner Marble Stair"),
		S("Marble Slab"),
		S("Marble Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("tuff_brick", "hades_core:tuff_brick",
		{cracky=3},
		nil,
		S("Tuff Brick Stair"),
		S("Outer Tuff Brick Stair"),
		S("Inner Tuff Brick Stair"),
		S("Tuff Brick Slab"),
		S("Tuff Brick Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("tuff", "hades_core:tuff",
		{cracky=3},
		nil,
		S("Tuff Stair"),
		S("Outer Tuff Stair"),
		S("Inner Tuff Stair"),
		S("Tuff Slab"),
		S("Tuff Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("tuff_baked_brick", "hades_core:tuff_baked_brick",
		{cracky=3},
		nil,
		S("Burned Tuff Brick Stair"),
		S("Outer Burned Tuff Brick Stair"),
		S("Inner Burned Tuff Brick Stair"),
		S("Burned Tuff Brick Slab"),
		S("Burned Tuff Brick Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("tuff_baked", "hades_core:tuff_baked",
		{cracky=3},
		nil,
		S("Burned Tuff Stair"),
		S("Outer Burned Tuff Stair"),
		S("Inner Burned Tuff Stair"),
		S("Burned Tuff Slab"),
		S("Burned Tuff Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("essexite_brick", "hades_core:essexite_brick",
		{cracky=1},
		nil,
		S("Essexite Brick Stair"),
		S("Outer Essexite Brick Stair"),
		S("Inner Essexite Brick Stair"),
		S("Essexite Brick Slab"),
		S("Essexite Brick Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("essexite", "hades_core:essexite",
		{cracky=1},
		nil,
		S("Essexite Stair"),
		S("Outer Essexite Stair"),
		S("Inner Essexite Stair"),
		S("Essexite Slab"),
		S("Essexite Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("rusty_block", "columnia:rusty_block",
		{cracky=1},
		nil,
		S("Rusty Stair"),
		S("Outer Rusty Stair"),
		S("Inner Rusty Stair"),
		S("Rusty Slab"),
		S("Rusty Step"),
		hades_sounds.node_sound_metal_defaults())

stairs.register_stair_and_slab_and_step("cactus_brick", "hades_core:cactus_brick",
		{choppy=3,flammable=2},
		nil,
		S("Cactus Brick Stair"),
		S("Outer Cactus Brick Stair"),
		S("Inner Cactus Brick Stair"),
		S("Cactus Brick Slab"),
		S("Cactus Brick Step"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab_and_step("obsidianbrick", "hades_core:obsidianbrick",
		{cracky=1},
		nil,
		S("Obsidian Brick Stair"),
		S("Outer Obsidian Brick Stair"),
		S("Inner Obsidian Brick Stair"),
		S("Obsidian Brick Slab"),
		S("Obsidian Brick Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("straw", "hades_farming:straw",
		{snappy=3,flammable=4},
		nil,
		S("Straw Stair"),
		S("Outer Straw Stair"),
		S("Inner Straw Stair"),
		S("Straw Slab"),
		S("Straw Step"),
		hades_sounds.node_sound_straw_defaults())

-- cloth

stairs.register_stair_and_slab_and_step("white", "wool:white",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("White Cloth Stair"),
		S("Outer White Cloth Stair"),
		S("Inner White Cloth Stair"),
		S("White Cloth Slab"),
		S("White Cloth Step"),
		hades_sounds.node_sound_defaults())

stairs.register_stair_and_slab_and_step("grey", "wool:grey",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Grey Cloth Stair"),
		S("Outer Grey Cloth Stair"),
		S("Inner Grey Cloth Stair"),
		S("Grey Cloth Slab"),
		S("Grey Cloth Step"),
		hades_sounds.node_sound_defaults())

stairs.register_stair_and_slab_and_step("black", "wool:black",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Black Cloth Stair"),
		S("Outer Black Cloth Stair"),
		S("Inner Black Cloth Stair"),
		S("Black Cloth Slab"),
		S("Black Cloth Step"),
		hades_sounds.node_sound_defaults())

stairs.register_stair_and_slab_and_step("red", "wool:red",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Red Cloth Stair"),
		S("Outer Red Cloth Stair"),
		S("Inner Red Cloth Stair"),
		S("Red Cloth Slab"),
		S("Red Cloth Step"),
		hades_sounds.node_sound_defaults())

stairs.register_stair_and_slab_and_step("yellow", "wool:yellow",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Yellow Cloth Stair"),
		S("Outer Yellow Cloth Stair"),
		S("Inner Yellow Cloth Stair"),
		S("Yellow Cloth Slab"),
		S("Yellow Cloth Step"),
		hades_sounds.node_sound_defaults())

stairs.register_stair_and_slab_and_step("green", "wool:green",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Green Cloth Stair"),
		S("Outer Green Cloth Stair"),
		S("Inner Green Cloth Stair"),
		S("Green Cloth Slab"),
		S("Green Cloth Step"),
		hades_sounds.node_sound_defaults())

stairs.register_stair_and_slab_and_step("cyan", "wool:cyan",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Cyan Cloth Stair"),
		S("Outer Cyan Cloth Stair"),
		S("Inner Cyan Cloth Stair"),
		S("Cyan Cloth Slab"),
		S("Cyan Cloth Step"),
		hades_sounds.node_sound_defaults())

stairs.register_stair_and_slab_and_step("blue", "wool:blue",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Blue Cloth Stair"),
		S("Outer Blue Cloth Stair"),
		S("Inner Blue Cloth Stair"),
		S("Blue Cloth Slab"),
		S("Blue Cloth Step"),
		hades_sounds.node_sound_defaults())

stairs.register_stair_and_slab_and_step("magenta", "wool:magenta",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Magenta Cloth Stair"),
		S("Outer Magenta Cloth Stair"),
		S("Inner Magenta Cloth Stair"),
		S("Magenta Cloth Slab"),
		S("Magenta Cloth Step"),
		hades_sounds.node_sound_defaults())

stairs.register_stair_and_slab_and_step("orange", "wool:orange",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Orange Cloth Stair"),
		S("Outer Orange Cloth Stair"),
		S("Inner Orange Cloth Stair"),
		S("Orange Cloth Slab"),
		S("Orange Cloth Step"),
		hades_sounds.node_sound_defaults())

stairs.register_stair_and_slab_and_step("violet", "wool:violet",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Violet Cloth Stair"),
		S("Outer Violet Cloth Stair"),
		S("Inner Violet Cloth Stair"),
		S("Violet Cloth Slab"),
		S("Violet Cloth Step"),
		hades_sounds.node_sound_defaults())

stairs.register_stair_and_slab_and_step("brown", "wool:brown",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Brown Cloth Stair"),
		S("Outer Brown Cloth Stair"),
		S("Inner Brown Cloth Stair"),
		S("Brown Cloth Slab"),
		S("Brown Cloth Step"),
		hades_sounds.node_sound_defaults())

stairs.register_stair_and_slab_and_step("pink", "wool:pink",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Pink Cloth Stair"),
		S("Outer Pink Cloth Stair"),
		S("Inner Pink Cloth Stair"),
		S("Pink Cloth Slab"),
		S("Pink Cloth Step"),
		hades_sounds.node_sound_defaults())

stairs.register_stair_and_slab_and_step("dark_grey", "wool:dark_grey",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Dark Grey Cloth Stair"),
		S("Outer Dark Grey Cloth Stair"),
		S("Inner Dark Grey Cloth Stair"),
		S("Dark Grey Cloth Slab"),
		S("Dark Grey Cloth Step"),
		hades_sounds.node_sound_defaults())

stairs.register_stair_and_slab_and_step("dark_green", "wool:dark_green",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Dark Green Cloth Stair"),
		S("Outer Dark Green Cloth Stair"),
		S("Inner Dark Green Cloth Stair"),
		S("Dark Green Cloth Slab"),
		S("Dark Green Cloth Step"),
		hades_sounds.node_sound_defaults())

stairs.register_stair_and_slab_and_step("glowcrystal_block", "glowcrystals:glowcrystal_block",
		{cracky=3},
		nil,
		S("Glowing Crystal Stair"),
		S("Outer Glowing Crystal Stair"),
		S("Inner Glowing Crystal Stair"),
		S("Glowing Crystal Slab"),
		S("Glowing Crystal Step"),
		hades_sounds.node_sound_stone_defaults())


-- Tiles

stairs.register_stair_and_slab_and_step("floor_wood_wood", "hades_tiles:floor_wood_wood",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Temperate Wood Tile Stair"),
		S("Outer Temperate Wood Tile Stair"),
		S("Inner Temperate Wood Tile Stair"),
		S("Temperate Wood Tile Slab"),
		S("Temperate Wood Tile Step"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab_and_step("floor_lush_lush", "hades_tiles:floor_lush_lush",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Lush Wood Tile Stair"),
		S("Outer Lush Wood Tile Stair"),
		S("Inner Lush Wood Tile Stair"),
		S("Lush Wood Tile Slab"),
		S("Lush Wood Tile Step"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab_and_step("floor_pale_pale", "hades_tiles:floor_pale_pale",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Pale Wood Tile Stair"),
		S("Outer Pale Wood Tile Stair"),
		S("Inner Pale Wood Tile Stair"),
		S("Pale Wood Tile Slab"),
		S("Pale Wood Tile Step"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab_and_step("floor_cream_cream", "hades_tiles:floor_cream_cream",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Cream Wood Tile Stair"),
		S("Outer Cream Wood Tile Stair"),
		S("Inner Cream Wood Tile Stair"),
		S("Cream Wood Tile Slab"),
		S("Cream Wood Tile Step"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab_and_step("floor_jungle_jungle", "hades_tiles:floor_jungle_jungle",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		nil,
		S("Tropical Tile Stair"),
		S("Outer Tropical Wood Tile Stair"),
		S("Inner Tropical Wood Tile Stair"),
		S("Tropical Wood Tile Slab"),
		S("Tropical Wood Tile Step"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab_and_step("floor_stone_stone", "hades_tiles:floor_stone_stone",
		{cracky=3},
		nil,
		S("Stone Tile Stair"),
		S("Outer Stone Tile Stair"),
		S("Inner Stone Tile Stair"),
		S("Stone Tile Slab"),
		S("Stone Tile Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("floor_stonebaked_stonebaked", "hades_tiles:floor_stonebaked_stonebaked",
		{cracky=3},
		nil,
		S("Burned Stone Tile Stair"),
		S("Outer Burned Stone Tile Stair"),
		S("Inner Burned Stone Tile Stair"),
		S("Burned Stone Tile Slab"),
		S("Burned Stone Tile Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("floor_tuff_tuff", "hades_tiles:floor_tuff_tuff",
		{cracky=3},
		nil,
		S("Tuff Tile Stair"),
		S("Outer Tuff Tile Stair"),
		S("Inner Tuff Tile Stair"),
		S("Tuff Tile Slab"),
		S("Tuff Tile Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("floor_tuffbaked_tuffbaked", "hades_tiles:floor_tuffbaked_tuffbaked",
		{cracky=3},
		nil,
		S("Burned Tuff Tile Stair"),
		S("Outer Burned Tuff Tile Stair"),
		S("Inner Burned Tuff Tile Stair"),
		S("Burned Tuff Tile Slab"),
		S("Burned Tuff Tile Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("floor_sandstone_sandstone", "hades_tiles:floor_sandstone_sandstone",
		{cracky=3},
		nil,
		S("Fine Sandstone Tile Stair"),
		S("Outer Fine Sandstone Tile Stair"),
		S("Inner Fine Sandstone Tile Stair"),
		S("Fine Sandstone Tile Slab"),
		S("Fine Sandstone Tile Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("floor_sandstonevolcanic_sandstonevolcanic", "hades_tiles:floor_sandstonevolcanic_sandstonevolcanic",
		{cracky=3},
		nil,
		S("Volcanic Sandstone Tile Stair"),
		S("Outer Volcanic Sandstone Tile Stair"),
		S("Inner Volcanic Sandstone Tile Stair"),
		S("Volcanic Sandstone Tile Slab"),
		S("Volcanic Sandstone Tile Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("floor_chondrite_chondrite", "hades_tiles:floor_chondrite_chondrite",
		{cracky=3},
		nil,
		S("Chondrite Tile Stair"),
		S("Outer Chondrite Tile Stair"),
		S("Inner Chondrite Tile Stair"),
		S("Chondrite Tile Slab"),
		S("Chondrite Tile Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("floor_essexite_essexite", "hades_tiles:floor_essexite_essexite",
		{cracky=2},
		nil,
		S("Essexite Tile Stair"),
		S("Outer Essexite Tile Stair"),
		S("Inner Essexite Tile Stair"),
		S("Essexite Tile Slab"),
		S("Essexite Tile Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("floor_essexitegold_essexitegold", "hades_tiles:floor_essexitegold_essexitegold",
		{cracky=2},
		nil,
		S("Golden Essexite Tile Stair"),
		S("Outer Golden Essexite Tile Stair"),
		S("Inner Golden Essexite Tile Stair"),
		S("Golden Essexite Tile Slab"),
		S("Golden Essexite Tile Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab_and_step("floor_marble_marble", "hades_tiles:floor_marble_marble",
		{cracky=2},
		nil,
		S("Marble Tile Stair"),
		S("Outer Marble Tile Stair"),
		S("Inner Marble Tile Stair"),
		S("Marble Tile Slab"),
		S("Marble Tile Step"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_slab_with_double("floorblock_essexite_gold_block", "hades_core:floor_essexite_gold",
		{cracky=2},
		{"hades_core_floor_essexite_gold.png", "hades_core_floor_essexite_gold.png", "stairs_floorblock_essexite_gold_slab.png"},
		S("Golden Essexite Slab"),
		S("Double Golden Essexite Slab"),
		hades_sounds.node_sound_stone_defaults())
stairs.register_slab_with_double("floorblock_marble_essexite2", "hades_core:floor_marble_essexite2",
		{cracky=2},
		{"hades_core_floor_marble_essexite2.png", "hades_core_floor_marble_essexite2.png", "stairs_floorblock_marble_essexite2_slab.png"},
		S("Marble/Essexite Slab"),
		S("Double Marble/Essexite Slab"),
		hades_sounds.node_sound_stone_defaults())
stairs.register_slab_with_double("floorblock_bstone_sandstone", "hades_core:floor_bstone_sandstone",
		{cracky=3},
		{"hades_core_floor_bstone_sandstone.png", "hades_core_floor_bstone_sandstone.png", "stairs_floorblock_bstone_sandstone_slab.png"},
		S("Baked Stone/Sandstone Slab"),
		S("Double Baked Stone/Sandstone Slab"),
		hades_sounds.node_sound_stone_defaults())
stairs.register_slab_with_double("floorblock_chondrite_stone", "hades_core:floor_chondrite_stone",
		{cracky=2},
		{"hades_core_floor_chondrite_stone.png", "hades_core_floor_chondrite_stone.png", "stairs_floorblock_chondrite_stone_slab.png"},
		S("Chondrite/Stone Slab"),
		S("Double Chondrite/Stone Slab"),
		hades_sounds.node_sound_stone_defaults())
