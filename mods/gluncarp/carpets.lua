local S = minetest.get_translator("gluncarp")

local carpet_tab = {
	{"black", 	S("Black Carpet")},
	{"blue", 	S("Blue Carpet")},
	{"brown", 	S("Brown Carpet")},
	{"cyan", 	S("Cyan Carpet")},
	{"dark_green", 	S("Dark Green Carpet")},
	{"dark_grey", 	S("Dark Grey Carpet")},
	{"green", 	S("Green Carpet")},
	{"grey", 	S("Grey Carpet")},
	{"magenta", 	S("Magenta Carpet")},
	{"orange",	S("Orange Carpet")},
	{"pink", 	S("Pink Carpet")},
	{"red", 	S("Red Carpet")},
	{"violet", 	S("Violet Carpet")},
	{"white", 	S("White Carpet")},
	{"yellow", 	S("Yellow Carpet")},
	{"blackgold", 	S("Black and Gold Carpet")},
}

for i in ipairs(carpet_tab) do
	local carpetname = carpet_tab[i][1]
	local carpetdesc = carpet_tab[i][2]
    
	minetest.register_node("gluncarp:"..carpetname, {
		description = carpetdesc,
		drawtype = "nodebox",
		tiles = {"gluncarp_"..carpetname..".png"},
		inventory_image = "gluncarp_"..carpetname.."_inv.png",
		wield_image = "gluncarp_"..carpetname..".png",
		paramtype = "light",
		is_ground_content = false,
		walkable = false,
		buildable_to = false,
		floodable = true,
		wield_scale= { x=1, y=1, z=0.5 },
		node_box = {
			type = "fixed",
			fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
		},
		groups = {dig_immediate=2, carpet=1, attached_node=1},
		sounds = hades_sounds.node_sound_defaults(),
	})
end
