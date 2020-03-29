
local carpet_tab = {
{"black", 	"Black"},
{"blue", 	"Blue"},
{"brown", 	"Brown"},
{"cyan", 	"Cyan"},
{"dark_green", 	"Dark Green"},
{"dark_grey", 	"Dark Grey"},
{"green", 	"Green"},
{"grey", 	"Grey"},
{"magenta", 	"Magenta"},
{"orange",	"Orange"},
{"pink", 	"Pink"},
{"red", 	"Red"},
{"violet", 	"Violet"},
{"white", 	"White"},
{"yellow", 	"Yellow"},
{"blackgold", 	"Black and Gold"},
}

for i in ipairs (carpet_tab) do
local carpetname = carpet_tab[i][1]
local carpetdesc = carpet_tab[i][2]
    
	local underground_tab = {
    {"stone", 	            "Stone",		        "default_stone",		        "hades_core:stone"},
	{"cobble", 	            "Cobblestone",		    "default_cobble",		        "hades_core:cobble"},
	{"stonebrick", 	        "Stone Brick",		    "default_stone_brick",		    "hades_core:stonebrick"},
	{"mossycobble", 	    "Mossy Cobblestone",	"default_mossycobble",		    "hades_core:mossycobble"},
	{"stone_baked", 	    "Burned Stone",		    "default_stone_baked",		    "hades_core:stone_baked"},
	{"stonebrick_baked", 	"Burned Stone Brick",	"default_stone_brick_baked",	"hades_core:stonebrick_baked"},
	{"sandstone", 	        "Sandstone",		    "default_sandstone",		    "hades_core:sandstone"},
	{"sandstonebrick", 	    "Sandstone Brick",		"default_sandstone_brick",		"hades_core:sandstonebrick"},
	{"obsidian", 	        "Obsidian",		        "default_obsidian",		        "hades_core:obsidian"},
	{"obsidianbrick", 	    "Obsidian Brick",		"default_obsidian_brick",		"hades_core:obsidianbrick"},
	{"clay", 	            "Clay",		            "default_clay",		            "hades_core:clay"},
	{"wood", 	            "Common Wood",		"default_wood",		            "hades_trees:wood"},
	{"brick", 	            "Brick Block",		    "default_brick",		        "hades_core:brick"},
	--end of default
	{"cactus_block", 	    "Cactus Block",		    "default_cactus_block",		    "hades_core:cactus_block"},
	{"cactus_brick", 	    "Cactus Brick",		    "default_cactus_brick",		    "hades_core:cactus_brick"},
	-- glunggi stuff
	-- woods
	{"pale_wood", 	        "Pale Wood",		    "hades_trees_pale_wood",		        "hades_trees:pale_wood"},
	{"birch_wood", 	        "Birch Wood",		    "default_birchwood",		        "hades_trees:birch_wood"},
	{"jungle_wood", 	        "Jungle Wood",		    "default_junglewood",		    "hades_trees:jungle_wood"},
	
	-- wooden floors
	{"floor_wood_jungle", 	"Common Wood/Jungle Wood Tile",	"default_floor_wood_jungle",	"hades_core:floor_wood_jungle"},
	{"floor_wood_pale", 	"Common Wood/Pale Wood Tile",		 "default_floor_wood_pale",		"hades_core:floor_wood_pale"},
	{"floor_pale_jungle", "Jungle Wood/Pale Wood Tile",		 "default_floor_pale_jungle",	"hades_core:floor_pale_jungle"},
	-- colored woods
	{"colwood_black", 	    "Black Wood",   "default_colwood_black",		"hades_trees:colwood_black"},
	{"colwood_blue", 	    "Blue Wood",    "default_colwood_blue",		    "hades_trees:colwood_blue"},
	{"colwood_brown", 	    "Brown Wood",   "default_colwood_brown",		"hades_trees:colwood_brown"},
	{"colwood_cyan", 	    "Cyan Wood",    "default_colwood_cyan",		    "hades_trees:colwood_cyan"},
	{"colwood_dark_green", "Dark Green Wood", "default_colwood_dark_green",  "hades_trees:colwood_dark_green"},
	{"colwood_dark_grey",  "Dark Grey Wood", "default_colwood_dark_grey",    "hades_trees:colwood_dark_grey"},
	{"colwood_green",       "Green Wood",   "default_colwood_green",        "hades_trees:colwood_green"},
	{"colwood_grey",        "Grey Wood",    "default_colwood_grey",         "hades_trees:colwood_grey"},
	{"colwood_magenta", 	"Magenta Wood", "default_colwood_magenta",		"hades_trees:colwood_magenta"},
	{"colwood_orange", 	    "Orange Wood",  "default_colwood_orange",		"hades_trees:colwood_orange"},
	{"colwood_pink", 	    "Pink Wood",    "default_colwood_pink",		    "hades_trees:colwood_pink"},
	{"colwood_red", 	    "Red Wood",     "default_colwood_red",		    "hades_trees:colwood_red"},
	{"colwood_violet", 	    "Violet Wood",  "default_colwood_violet",		"hades_trees:colwood_violet"},
	{"colwood_yellow", 	    "Yellow Wood",  "default_colwood_yellow",		"hades_trees:colwood_yellow"},
	{"colwood_white", 	    "White Wood",   "default_colwood_white",		"hades_trees:colwood_white"},
	-- colored bricks
	{"brick_black", 	    "Black Bricks",		"default_brick_black",		"hades_core:brick_black"},
	{"brick_blue", 	        "Blue Bricks",		"default_brick_blue",		"hades_core:brick_blue"},
	{"brick_brown", 	    "Brown Bricks",		"default_brick_brown",		"hades_core:brick_brown"},
	{"brick_cyan", 	        "Cyan Bricks",		"default_brick_cyan",		"hades_core:brick_cyan"},
	{"brick_dark_green", 	"Dark Green Bricks", "default_brick_dark_green",	"hades_core:brick_dark_green"},
	{"brick_dark_grey", 	"Dark Grey Bricks",	"default_brick_dark_grey",  "hades_core:brick_dark_grey"},
	{"brick_green", 	    "Green Bricks",		"default_brick_green",		"hades_core:brick_green"},
	{"brick_grey", 	        "Grey Bricks",		"default_brick_grey",		"hades_core:brick_grey"},
	{"brick_magenta", 	    "Magenta Bricks",   "default_brick_magenta",	"hades_core:brick_magenta"},
	{"brick_orange", 	    "Orange Bricks",    "default_brick_orange",		"hades_core:brick_orange"},
	{"brick_pink", 	        "Pink Bricks",		"default_brick_pink",		"hades_core:brick_pink"},
	{"brick_red", 	        "Red Bricks",		"default_brick_red",		"hades_core:brick_red"},
	{"brick_violet", 	    "Violet Bricks",	"default_brick_violet",		"hades_core:brick_violet"},
	{"brick_white", 	    "White Bricks",		"default_brick_white",		"hades_core:brick_white"},
	{"brick_yellow", 	    "Yellow Bricks",	"default_brick_yellow",		"hades_core:brick_yellow"},
	-- more stones
	{"marble_brick", 	      "Marble Brick",	           "default_marble_brick",		    "hades_core:marble_brick"},
	{"marble", 	              "Marble",	                   "default_marble",		        "hades_core:marble"},
	{"chondrite_brick", 	      "Chondrite Brick",	           "default_chondrite_brick",		"hades_core:chondrite_brick"},
	{"chondrite", 	          "Chondrite",	               "default_chondrite",		        "hades_core:chondrite"},
	{"tuff_brick", 	          "Tuff Brick",	               "default_tuff_brick",		    "hades_core:tuff_brick"},
	{"tuff", 	              "Tuff",	                   "default_tuff",		            "hades_core:tuff"},
	{"tuff_baked_brick", 	  "Burned Tuff Brick",	       "default_tuff_baked_brick",		"hades_core:tuff_baked_brick"},
	{"tuff_baked", 	          "Burned Tuff",	           "default_tuff_baked",		    "hades_core:tuff_baked"},
	{"essexite_brick", 	      "Essexite Brick",	           "default_essexite_brick",		    "hades_core:essexite_brick"},
	{"essexite", 	          "Essexite",	               "default_essexite",		        "hades_core:essexite"},
	{"floor_essexite_gold2",   "Golden Essexite Tile",	   "default_floor_essexite_gold2",   "hades_core:floor_essexite_gold2"},
	{"floor_essexite_gold",   "Golden Essexite Block",	   "default_floor_essexite_gold",    "hades_core:floor_essexite_gold"},
	{"floor_marble_essexite2", "Marble/Essexite Tile",  "default_floor_marble_essexite2", "hades_core:floor_marble_essexite2"},
	{"floor_marble_essexite", "Marble/Essexite Block",  "default_floor_marble_essexite", "hades_core:floor_marble_essexite"},
	{"floor_bstone_sandstone2", "Burned Stone/Sandstone Tile",	"default_floor_bstone_sandstone2", "hades_core:floor_bstone_sandstone2"},
	{"floor_bstone_sandstone", "Burned Stone/Sandstone Block",	"default_floor_bstone_sandstone", "hades_core:floor_bstone_sandstone"},
	{"floor_btuff_tuff",      "Burned Tuff/Tuff Tile",  "default_floor_btuff_tuff",      "hades_core:floor_btuff_tuff"},
	{"floor_bstone_stone",    "Burned Stone/Stone Tile", "default_floor_bstone_stone",   "hades_core:floor_bstone_stone"},
	{"floor_chondrite_stone2", "Chondrite/Stone Tile",  "default_floor_chondrite_stone2", "hades_core:floor_chondrite_stone2"},
	{"floor_chondrite_stone",  "Chondrite/Stone Block",   "default_floor_chondrite_stone",  "hades_core:floor_chondrite_stone"},
	
    }
	
	
    for i in ipairs (underground_tab) do
    local mat = underground_tab[i][1]
    local desc = underground_tab[i][2]
	local image = underground_tab[i][3]



minetest.register_node("gluncarp:"..carpetname, {
         description = carpetdesc.." Carpet",
		 drawtype = "raillike",
		 tiles = {"gluncarp_"..carpetname..".png"},
		 inventory_image = "gluncarp_"..carpetname.."_inv.png",
		 wield_image = "gluncarp_"..carpetname..".png",
		 paramtype = "light",
		 is_ground_content = true,
		 walkable = false,
		 buildable_to = false,
		 selection_box = {
		 type = "fixed",
		 fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
		 },
		 groups = {dig_immediate=2, gluncarp=1, not_in_creative_inventory=1,connect_to_raillike=minetest.raillike_group("carpet")},
		 
		 after_place_node = function(pos, placer, itemstack, pointed_thing)
		
		local nodeu = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name
		if nodeu == "hades_core:stone" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_stone"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:cobble" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_cobble"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:stonebrick" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_stonebrick"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:mossycobble" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_mossycobble"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:stone_baked" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_stone_baked"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:cobble_baked" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_cobble_baked"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:stonebrick_baked" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_stonebrick_baked"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:sandstone" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_sandstone"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:sandstonebrick" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_sandstonebrick"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:obsidian" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_obsidian"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:obsidianbrick" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_obsidianbrick"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:clay" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_clay"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_trees:wood" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_wood"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_trees:jungle_wood" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_jungle_wood"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:brick" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_brick"})
		   minetest.set_node(pos,{name = "air"})
		   --end of default
		elseif  nodeu == "hades_core:cactus_block" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_cactus_block"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:cactus_brick" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_cactus_brick"})
		   minetest.set_node(pos,{name = "air"})
		   --glunggistuff
		   --wood
		elseif  nodeu == "hades_trees:pale_wood" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_pale_wood"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_trees:jungle_wood" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_jungle_wood"})
		   minetest.set_node(pos,{name = "air"})
		
		   --wooden floors
		  elseif  nodeu == "hades_core:floor_wood_jungle" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_floor_wood_jungle"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:floor_wood_pale" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_floor_wood_pale"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:floor_pale_jungle" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_floor_pale_jungle"})
		   minetest.set_node(pos,{name = "air"})
		   
		   --color wood
		elseif  nodeu == "hades_trees:colwood_black" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_colwood_black"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_trees:colwood_blue" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_colwood_blue"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_trees:colwood_brown" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_colwood_brown"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_trees:colwood_cyan" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_colwood_cyan"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_trees:colwood_dark_green" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_colwood_dark_green"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_trees:colwood_dark_grey" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_colwood_dark_grey"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_trees:colwood_green" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_colwood_green"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_trees:colwood_grey" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_colwood_grey"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_trees:colwood_magenta" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_colwood_magenta"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_trees:colwood_orange" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_colwood_orange"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_trees:colwood_pink" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_colwood_pink"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_trees:colwood_red" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_colwood_red"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_trees:colwood_violet" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_colwood_violet"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_trees:colwood_yellow" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_colwood_yellow"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_trees:colwood_white" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_colwood_white"})
		   minetest.set_node(pos,{name = "air"})
		   --color bricks
		elseif  nodeu == "hades_core:brick_black" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_brick_black"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:brick_blue" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_brick_blue"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:brick_brown" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_brick_brown"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:brick_cyan" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_brick_cyan"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:brick_dark_green" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_brick_dark_green"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:brick_dark_grey" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_brick_dark_grey"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:brick_green" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_brick_green"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:brick_grey" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_brick_grey"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:brick_magenta" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_brick_magenta"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:brick_orange" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_brick_orange"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:brick_pink" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_brick_pink"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:brick_red" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_brick_red"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:brick_violet" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_brick_violet"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:brick_white" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_brick_white"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:brick_yellow" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_brick_yellow"})
		   minetest.set_node(pos,{name = "air"})
		   --more stone
		elseif  nodeu == "hades_core:marble_brick" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_marble_brick"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:marble" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_marble"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:chondrite_brick" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_chondrite_brick"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:chondrite" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_chondrite"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:tuff_brick" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_tuff_brick"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:tuff" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_tuff"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:tuff_baked_brick" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_tuff_baked_brick"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:tuff_baked" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_tuff_baked"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:essexite_brick" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_essexite_brick"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:essexite" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_essexite"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:floor_essexite_gold2" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_floor_essexite_gold2"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:floor_essexite_gold" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_floor_essexite_gold"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:floor_marble_essexite2" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_floor_marble_essexite2"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:floor_marble_essexite" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_floor_marble_essexite"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:floor_bstone_sandstone2" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_floor_bstone_sandstone2"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:floor_bstone_sandstone" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_floor_bstone_sandstone"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:floor_btuff_tuff" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_floor_btuff_tuff"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:floor_bstone_stone" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_floor_bstone_stone"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:floor_chondrite_stone2" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_floor_chondrite_stone2"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_core:floor_chondrite_stone" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_floor_chondrite_stone"})
		   minetest.set_node(pos,{name = "air"})
		else 
		   return
		end
	end,
	
})


minetest.register_node("gluncarp:"..carpetname.."_on_"..mat, {
         description = carpetdesc.." Carpet on "..desc,
		 tiles = {
		 "gluncarp_"..carpetname..".png",
		 image..".png",
		 image..".png^gluncarp_side_"..carpetname..".png",
		 },
		 paramtype = "light",
		 is_ground_content = true,
		 walkable = true,
		 buildable_to = false,
		 groups = {dig_immediate=2, gluncarp=1, not_in_creative_inventory=1},
		 drop = "gluncarp:"..carpetname,
		
		 after_dig_node = function(pos, oldnode, oldmetadata, digger)
		    if oldnode.name == "gluncarp:"..carpetname.."_on_stone" then
		       minetest.set_node(pos,{name = "hades_core:stone"})
		    elseif  oldnode.name == "gluncarp:"..carpetname.."_on_cobble" then
		       minetest.set_node(pos,{name = "hades_core:cobble"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_stonebrick" then
		       minetest.set_node(pos,{name = "hades_core:stonebrick"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_mossycobble" then
		       minetest.set_node(pos,{name = "hades_core:mossycobble"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_stone_baked" then
		       minetest.set_node(pos,{name = "hades_core:stone_baked"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_cobble_baked" then
		       minetest.set_node(pos,{name = "hades_core:cobble_baked"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_stonebrick_baked" then
		       minetest.set_node(pos,{name = "hades_core:stonebrick_baked"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_sandstone" then
		       minetest.set_node(pos,{name = "hades_core:sandstone"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_sandstonebrick" then
		       minetest.set_node(pos,{name = "hades_core:sandstonebrick"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_obsidian" then
		       minetest.set_node(pos,{name = "hades_core:obsidian"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_obsidianbrick" then
		       minetest.set_node(pos,{name = "hades_core:obsidianbrick"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_clay" then
		       minetest.set_node(pos,{name = "hades_core:clay"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_wood" then
		       minetest.set_node(pos,{name = "hades_trees:wood"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_jungle_wood" then
		       minetest.set_node(pos,{name = "hades_trees:jungle_wood"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_brick" then
		       minetest.set_node(pos,{name = "hades_core:brick"})
			   --end of default
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_cactus_block" then
		       minetest.set_node(pos,{name = "hades_core:cactus_block"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_cactus_brick" then
		       minetest.set_node(pos,{name = "hades_core:cactus_brick"})
			   -- wood
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_pale_wood" then
		       minetest.set_node(pos,{name = "hades_trees:pale_wood"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_jungle_wood" then
		       minetest.set_node(pos,{name = "hades_trees:jungle_wood"})
			   -- wooden floors
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_floor_wood_jungle" then
		       minetest.set_node(pos,{name = "hades_trees:floor_wood_jungle"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_floor_wood_pale" then
		       minetest.set_node(pos,{name = "hades_trees:floor_wood_pale"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_floor_pale_jungle" then
		       minetest.set_node(pos,{name = "hades_trees:floor_pale_jungle"})
			   -- color wood
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_colwood_black" then
		       minetest.set_node(pos,{name = "hades_trees:colwood_black"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_colwood_blue" then
		       minetest.set_node(pos,{name = "hades_trees:colwood_blue"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_colwood_brown" then
		       minetest.set_node(pos,{name = "hades_trees:colwood_brown"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_colwood_cyan" then
		       minetest.set_node(pos,{name = "hades_trees:colwood_cyan"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_colwood_dark_green" then
		       minetest.set_node(pos,{name = "hades_trees:colwood_dark_green"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_colwood_dark_grey" then
		       minetest.set_node(pos,{name = "hades_trees:colwood_dark_grey"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_colwood_green" then
		       minetest.set_node(pos,{name = "hades_trees:colwood_green"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_colwood_grey" then
		       minetest.set_node(pos,{name = "hades_trees:colwood_grey"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_colwood_magenta" then
		       minetest.set_node(pos,{name = "hades_trees:colwood_magenta"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_colwood_orange" then
		       minetest.set_node(pos,{name = "hades_trees:colwood_orange"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_colwood_pink" then
		       minetest.set_node(pos,{name = "hades_trees:colwood_pink"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_colwood_red" then
		       minetest.set_node(pos,{name = "hades_trees:colwood_red"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_colwood_violet" then
		       minetest.set_node(pos,{name = "hades_trees:colwood_violet"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_colwood_yellow" then
		       minetest.set_node(pos,{name = "hades_trees:colwood_yellow"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_colwood_white" then
		       minetest.set_node(pos,{name = "hades_trees:colwood_white"})
			   -- color brick
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_brick_black" then
		       minetest.set_node(pos,{name = "hades_core:brick_black"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_brick_blue" then
		       minetest.set_node(pos,{name = "hades_core:brick_blue"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_brick_brown" then
		       minetest.set_node(pos,{name = "hades_core:brick_brown"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_brick_cyan" then
		       minetest.set_node(pos,{name = "hades_core:brick_cyan"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_brick_dark_green" then
		       minetest.set_node(pos,{name = "hades_core:brick_dark_green"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_brick_dark_grey" then
		       minetest.set_node(pos,{name = "hades_core:brick_dark_grey"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_brick_green" then
		       minetest.set_node(pos,{name = "hades_core:brick_green"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_brick_grey" then
		       minetest.set_node(pos,{name = "hades_core:brick_grey"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_brick_magenta" then
		       minetest.set_node(pos,{name = "hades_core:brick_magenta"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_brick_orange" then
		       minetest.set_node(pos,{name = "hades_core:brick_orange"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_brick_pink" then
		       minetest.set_node(pos,{name = "hades_core:brick_pink"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_brick_red" then
		       minetest.set_node(pos,{name = "hades_core:brick_red"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_brick_violet" then
		       minetest.set_node(pos,{name = "hades_core:brick_violet"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_brick_white" then
		       minetest.set_node(pos,{name = "hades_core:brick_white"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_brick_yellow" then
		       minetest.set_node(pos,{name = "hades_core:brick_yellow"})
			 -- more stones
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_marble_brick" then
		       minetest.set_node(pos,{name = "hades_core:marble_brick"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_marble" then
		       minetest.set_node(pos,{name = "hades_core:marble"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_chondrite_brick" then
		       minetest.set_node(pos,{name = "hades_core:chondrite_brick"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_chondrite" then
		       minetest.set_node(pos,{name = "hades_core:chondrite"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_tuff_brick" then
		       minetest.set_node(pos,{name = "hades_core:tuff_brick"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_tuff" then
		       minetest.set_node(pos,{name = "hades_core:tuff"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_tuff_baked_brick" then
		       minetest.set_node(pos,{name = "hades_core:tuff_baked_brick"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_tuff_baked" then
		       minetest.set_node(pos,{name = "hades_core:tuff_baked"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_essexite_brick" then
		       minetest.set_node(pos,{name = "hades_core:essexite_brick"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_essexite" then
		       minetest.set_node(pos,{name = "hades_core:essexite"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_floor_essexite_gold2" then
		       minetest.set_node(pos,{name = "hades_core:floor_essexite_gold2"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_floor_essexite_gold" then
		       minetest.set_node(pos,{name = "hades_core:floor_essexite_gold"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_floor_marble_essexite2" then
		       minetest.set_node(pos,{name = "hades_core:floor_marble_essexite2"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_floor_marble_essexite" then
		       minetest.set_node(pos,{name = "hades_core:floor_marble_essexite"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_floor_bstone_sandstone2" then
		       minetest.set_node(pos,{name = "hades_core:floor_bstone_sandstone2"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_floor_bstone_sandstone" then
		       minetest.set_node(pos,{name = "hades_core:floor_bstone_sandstone"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_floor_btuff_tuff" then
		       minetest.set_node(pos,{name = "hades_core:floor_btuff_tuff"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_floor_bstone_stone" then
		       minetest.set_node(pos,{name = "hades_core:floor_bstone_stone"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_floor_chondrite_stone2" then
		       minetest.set_node(pos,{name = "hades_core:floor_chondrite_stone2"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_floor_chondrite_stone" then
		       minetest.set_node(pos,{name = "hades_core:floor_chondrite_stone"})
		    else 
		       return
			end
	     end,
		 
})
end
end

