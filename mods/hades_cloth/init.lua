local S = minetest.get_translator("hades_cloth")

local hades_cloth = {}
-- This uses a trick: you can first define the recipes using all of the base
-- colors, and then some recipes using more specific colors for a few non-base
-- colors available. When crafting, the last recipes will be checked first.
hades_cloth.dyes = {
	{"white",      S("White Cloth"),      nil},
	{"grey",       S("Grey Cloth"),       "basecolor_grey"},
	{"black",      S("Black Cloth"),      "basecolor_black"},
	{"red",        S("Red Cloth"),        "basecolor_red"},
	{"yellow",     S("Yellow Cloth"),     "basecolor_yellow"},
	{"green",      S("Green Cloth"),      "basecolor_green"},
	{"cyan",       S("Cyan Cloth"),       "basecolor_cyan"},
	{"blue",       S("Blue Cloth"),       "basecolor_blue"},
	{"magenta",    S("Magenta Cloth"),    "basecolor_magenta"},
	{"orange",     S("Orange Cloth"),     "excolor_orange"},
	{"violet",     S("Violet Cloth"),     "excolor_violet"},
	{"brown",      S("Brown Cloth"),      "unicolor_dark_orange"},
	{"pink",       S("Pink Cloth"),       "unicolor_light_red"},
	{"dark_grey",  S("Dark Grey Cloth"),  "unicolor_darkgrey"},
	{"dark_green", S("Dark Green Cloth"), "unicolor_dark_green"},
}

for _, row in ipairs(hades_cloth.dyes) do
	local name = row[1]
	local desc = row[2]
	local craft_color_group = row[3]
	-- Node Definition
	minetest.register_node("hades_cloth:"..name, {
		description = desc,
		tiles = {"wool_"..name..".png"},
		groups = {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3,cloth=1},
		sounds = hades_sounds.node_sound_cloth_defaults(),
		is_ground_content = false,
	})
	-- Crafting from dye and white hades_cloth
	minetest.register_craft({
		type = "shapeless",
		output = 'hades_cloth:'..name,
		recipe = {'dye:'..name, 'group:cloth'},
	})
end

-- Legacy aliases
minetest.register_alias("wool:white", "hades_cloth:white")
minetest.register_alias("wool:grey", "hades_cloth:grey")
minetest.register_alias("wool:black", "hades_cloth:black")
minetest.register_alias("wool:red", "hades_cloth:red")
minetest.register_alias("wool:yellow", "hades_cloth:yellow")
minetest.register_alias("wool:green", "hades_cloth:green")
minetest.register_alias("wool:cyan", "hades_cloth:cyan")
minetest.register_alias("wool:blue", "hades_cloth:blue")
minetest.register_alias("wool:magenta", "hades_cloth:magenta")
minetest.register_alias("wool:orange", "hades_cloth:orange")
minetest.register_alias("wool:violet", "hades_cloth:violet")
minetest.register_alias("wool:brown", "hades_cloth:brown")
minetest.register_alias("wool:pink", "hades_cloth:pink")
minetest.register_alias("wool:dark_grey", "hades_cloth:dark_grey")
minetest.register_alias("wool:dark_green", "hades_cloth:dark_green")
