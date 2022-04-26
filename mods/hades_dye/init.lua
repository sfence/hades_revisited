local S = minetest.get_translator("hades_dye")

-- To make recipes that will work with any dye ever made by anybody, define
-- them based on groups.
-- You can select any group of groups, based on your need for amount of colors.
-- basecolor: 9, excolor: 17, unicolor: 89
--
-- Example of one shapeless recipe using a color group:
-- Note: As this uses basecolor_*, you'd need 9 of these.
-- minetest.register_craft({
--     type = "shapeless",
--     output = '<mod>:item_yellow',
--     recipe = {'<mod>:item_no_color', 'group:basecolor_yellow'},
-- })

local hades_dye = {}
hades_dye.basecolors = {"white", "grey", "black", "red", "yellow", "green", "cyan", "blue", "magenta"}
hades_dye.excolors = {"white", "lightgrey", "grey", "darkgrey", "black", "red", "orange", "yellow", "lime", "green", "aqua", "cyan", "sky_blue", "blue", "violet", "magenta", "red_violet"}

-- Base color groups:
-- - basecolor_white
-- - basecolor_grey
-- - basecolor_black
-- - basecolor_red
-- - basecolor_yellow
-- - basecolor_green
-- - basecolor_cyan
-- - basecolor_blue
-- - basecolor_magenta

-- Extended color groups (* = equal to a base color):
-- * excolor_white
-- - excolor_lightgrey
-- * excolor_grey
-- - excolor_darkgrey
-- * excolor_black
-- * excolor_red
-- - excolor_orange
-- * excolor_yellow
-- - excolor_lime
-- * excolor_green
-- - excolor_aqua
-- * excolor_cyan
-- - excolor_sky_blue
-- * excolor_blue
-- - excolor_violet
-- * excolor_magenta
-- - excolor_red_violet

-- The whole unifieddyes palette as groups:
-- - unicolor_<excolor>
-- For the following, no white/grey/black is allowed:
-- - unicolor_medium_<excolor>
-- - unicolor_dark_<excolor>
-- - unicolor_light_<excolor>
-- - unicolor_<excolor>_s50
-- - unicolor_medium_<excolor>_s50
-- - unicolor_dark_<excolor>_s50

-- Local stuff
local dyelocal = {}

-- This collection of colors is partly a historic thing, partly something else.
dyelocal.dyes = {
	{"white",      S("White Dye"),     {dye=1, basecolor_white=1,   excolor_white=1,     unicolor_white=1}},
	{"grey",       S("Grey Dye"),      {dye=1, basecolor_grey=1,    excolor_grey=1,      unicolor_grey=1}},
	{"dark_grey",  S("Dark Grey Dye"), {dye=1, basecolor_grey=1,    excolor_darkgrey=1,  unicolor_darkgrey=1}},
	{"black",      S("Black Dye"),     {dye=1, basecolor_black=1,   excolor_black=1,     unicolor_black=1}},
	{"violet",     S("Violet Dye"),    {dye=1, basecolor_magenta=1, excolor_violet=1,    unicolor_violet=1}},
	{"blue",       S("Blue Dye"),      {dye=1, basecolor_blue=1,    excolor_blue=1,      unicolor_blue=1}},
	{"cyan",       S("Cyan Dye"),      {dye=1, basecolor_cyan=1,    excolor_cyan=1,      unicolor_cyan=1}},
	{"dark_green", S("Dark Green Dye"),{dye=1, basecolor_green=1,   excolor_green=1,     unicolor_dark_green=1}},
	{"green",      S("Green Dye"),     {dye=1, basecolor_green=1,   excolor_green=1,     unicolor_green=1}},
	{"yellow",     S("Yellow Dye"),    {dye=1, basecolor_yellow=1,  excolor_yellow=1,    unicolor_yellow=1}},
	{"brown",      S("Brown Dye"),     {dye=1, basecolor_yellow=1,  excolor_orange=1,    unicolor_dark_orange=1}},
	{"orange",     S("Orange Dye"),    {dye=1, basecolor_orange=1,  excolor_orange=1,    unicolor_orange=1}},
	{"red",        S("Red Dye"),       {dye=1, basecolor_red=1,     excolor_red=1,       unicolor_red=1}},
	{"magenta",    S("Magenta Dye"),   {dye=1, basecolor_magenta=1, excolor_red_violet=1,unicolor_red_violet=1}},
	{"pink",       S("Pink Dye"),      {dye=1, basecolor_red=1,     excolor_red=1,       unicolor_light_red=1}},
}

-- Define items
for _, row in ipairs(dyelocal.dyes) do
	local name = row[1]
	local description = row[2]
	local groups = row[3]
	local item_name = "hades_dye:"..name
	local item_image = "dye_"..name..".png"
	minetest.register_craftitem(item_name, {
		inventory_image = item_image,
		description = description,
		groups = groups
	})
end

-- Mix recipes
-- Just mix everything to everything somehow sanely

dyelocal.mixbases = {"magenta", "red", "orange", "brown", "yellow", "green", "dark_green", "cyan", "blue", "violet", "black", "dark_grey", "grey", "white"}

dyelocal.mixes = {
	--       magenta,  red,    orange,   brown,    yellow,  green,  dark_green, cyan,    blue,   violet,   black,  dark_grey,  grey,   white
	white = {"pink",  "pink", "orange", "orange", "yellow", "green", "green",  "grey",  "cyan", "violet",  "grey",  "grey",   "white", "white"},
	grey  = {"pink",  "pink", "orange", "orange", "yellow", "green", "green",  "grey",  "cyan",  "pink",  "dark_grey","grey", "grey"},
	dark_grey={"brown","brown", "brown", "brown", "brown","dark_green","dark_green","blue","blue","violet","black", "black"},
	black = {"black", "black", "black",  "black", "black",  "black", "black",  "black", "black", "black",  "black"},
	violet= {"magenta","magenta","red",  "brown", "red",    "cyan",  "brown",  "blue",  "violet","violet"},
	blue  = {"violet", "magenta","brown","brown","dark_green","cyan","cyan",   "cyan",  "blue"},
	cyan  = {"blue","brown","dark_green","dark_grey","green","cyan","dark_green","cyan"},
	dark_green={"brown","brown","brown", "brown", "green",  "green", "dark_green"},
	green = {"brown", "yellow","yellow","dark_green","green","green"},
	yellow= {"red",  "orange", "yellow","orange", "yellow"},
	brown = {"brown", "brown","orange", "brown"},
	orange= {"red",  "orange","orange"},
	red   = {"magenta","red"},
	magenta={"magenta"},
}

for one,results in pairs(dyelocal.mixes) do
	for i,result in ipairs(results) do
		local another = dyelocal.mixbases[i]
		if one ~= another then
			minetest.register_craft({
				type = "shapeless",
				output = 'hades_dye:'..result..' 2',
				recipe = {'hades_dye:'..one, 'hades_dye:'..another},
			})
		end
	end
end

minetest.register_craft({
	type = "shapeless",
	output = "hades_dye:blue 4",
	recipe = {"hades_flowers:blue"},
})
minetest.register_craft({
	type = "shapeless",
	output = "hades_dye:white 4",
	recipe = {"hades_flowers:white"},
})
minetest.register_craft({
	type = "shapeless",
	output = "hades_dye:red 4",
	recipe = {"hades_flowers:red"},
})
minetest.register_craft({
	type = "shapeless",
	output = "hades_dye:violet 4",
	recipe = {"hades_flowers:violet"},
})
minetest.register_craft({
	type = "shapeless",
	output = "hades_dye:orange 4",
	recipe = {"hades_flowers:orange"},
})
minetest.register_craft({
	type = "shapeless",
	output = "hades_dye:yellow 4",
	recipe = {"hades_flowers:yellow"},
})

minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "hades_dye:red 8",
	recipe = "hades_core:cinnaber",
})
minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "hades_dye:orange 8",
	recipe = "hades_core:orangite",
})
minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "hades_dye:yellow 8",
	recipe = "hades_core:apolline",
})
minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "hades_dye:green 8",
	recipe = "hades_core:olivine",
})
minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "hades_dye:cyan 8",
	recipe = "hades_core:turquosite",
})
minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "hades_dye:violet 8",
	recipe = "hades_core:lillite",
})
minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "hades_dye:blue 8",
	recipe = "hades_core:azurite",
})



minetest.register_craft({
		type = "shapeless",
		output = "hades_dye:black 4",
		recipe = {"hades_core:coal_lump"},
})

minetest.register_craft({
		type = "shapeless",
		output = "hades_dye:green 4",
		recipe = {"hades_core:papyrus"},
})

minetest.register_craft({
		type = "shapeless",
		output = "hades_dye:green 4",
		recipe = {"hades_core:cactus"},
})

minetest.register_craft({
		type = "shapeless",
		output = "hades_dye:brown",
		recipe = {"hades_trees:cocoa_bean"},
})

-- Legacy aliases
minetest.register_alias("dye:black", "hades_dye:black")
minetest.register_alias("dye:blue", "hades_dye:blue")
minetest.register_alias("dye:brown", "hades_dye:brown")
minetest.register_alias("dye:cyan", "hades_dye:cyan")
minetest.register_alias("dye:dark_green", "hades_dye:dark_green")
minetest.register_alias("dye:dark_grey", "hades_dye:dark_grey")
minetest.register_alias("dye:green", "hades_dye:green")
minetest.register_alias("dye:grey", "hades_dye:grey")
minetest.register_alias("dye:magenta", "hades_dye:magenta")
minetest.register_alias("dye:orange", "hades_dye:orange")
minetest.register_alias("dye:pink", "hades_dye:pink")
minetest.register_alias("dye:red", "hades_dye:red")
minetest.register_alias("dye:violet", "hades_dye:violet")
minetest.register_alias("dye:white", "hades_dye:white")
minetest.register_alias("dye:yellow", "hades_dye:yellow")
