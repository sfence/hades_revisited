
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
    {"stone", 	            "Stone",		        "default_stone",		        "default:stone"},
	{"cobble", 	            "Cobblestone",		    "default_cobble",		        "default:cobble"},
	{"stonebrick", 	        "Stone Brick",		    "default_stone_brick",		    "default:stonebrick"},
	{"mossycobble", 	    "Mossy Cobblestone",	"default_mossycobble",		    "default:mossycobble"},
	{"stone_baked", 	    "Burned Stone",		    "default_stone_baked",		    "default:stone_baked"},
	{"stonebrick_baked", 	"Burned Stone Brick",	"default_stone_brick_baked",	"default:stonebrick_baked"},
	{"sandstone", 	        "Sandstone",		    "default_sandstone",		    "default:sandstone"},
	{"sandstonebrick", 	    "Sandstone Brick",		"default_sandstone_brick",		"default:sandstonebrick"},
	{"obsidian", 	        "Obsidian",		        "default_obsidian",		        "default:obsidian"},
	{"obsidianbrick", 	    "Obsidian Brick",		"default_obsidian_brick",		"default:obsidianbrick"},
	{"clay", 	            "Clay",		            "default_clay",		            "default:clay"},
	{"wood", 	            "Common Wood",		"default_wood",		            "hades_trees:wood"},
	{"brick", 	            "Brick Block",		    "default_brick",		        "default:brick"},
	--end of default
	{"cactus_block", 	    "Cactus Block",		    "default_cactus_block",		    "default:cactus_block"},
	{"cactus_brick", 	    "Cactus Brick",		    "default_cactus_brick",		    "default:cactus_brick"},
	-- glunggi stuff
	-- woods
	{"pale_wood", 	        "Pale Wood",		    "hades_trees_pale_wood",		        "hades_trees:pale_wood"},
	{"birch_wood", 	        "Birch Wood",		    "default_birchwood",		        "hades_trees:birch_wood"},
	{"jungle_wood", 	        "Jungle Wood",		    "default_junglewood",		    "hades_trees:jungle_wood"},
	
	-- wooden floors
	{"floor_wood_jungle", 	"Common Wood/Jungle Wood Tile",	"default_floor_wood_jungle",	"default:floor_wood_jungle"},
	{"floor_wood_pale", 	"Common Wood/Pale Wood Tile",		 "default_floor_wood_pale",		"default:floor_wood_pale"},
	{"floor_pale_jungle", "Jungle Wood/Pale Wood Tile",		 "default_floor_pale_jungle",	"default:floor_pale_jungle"},
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
	{"brick_black", 	    "Black Bricks",		"default_brick_black",		"default:brick_black"},
	{"brick_blue", 	        "Blue Bricks",		"default_brick_blue",		"default:brick_blue"},
	{"brick_brown", 	    "Brown Bricks",		"default_brick_brown",		"default:brick_brown"},
	{"brick_cyan", 	        "Cyan Bricks",		"default_brick_cyan",		"default:brick_cyan"},
	{"brick_dark_green", 	"Dark Green Bricks", "default_brick_dark_green",	"default:brick_dark_green"},
	{"brick_dark_grey", 	"Dark Grey Bricks",	"default_brick_dark_grey",  "default:brick_dark_grey"},
	{"brick_green", 	    "Green Bricks",		"default_brick_green",		"default:brick_green"},
	{"brick_grey", 	        "Grey Bricks",		"default_brick_grey",		"default:brick_grey"},
	{"brick_magenta", 	    "Magenta Bricks",   "default_brick_magenta",	"default:brick_magenta"},
	{"brick_orange", 	    "Orange Bricks",    "default_brick_orange",		"default:brick_orange"},
	{"brick_pink", 	        "Pink Bricks",		"default_brick_pink",		"default:brick_pink"},
	{"brick_red", 	        "Red Bricks",		"default_brick_red",		"default:brick_red"},
	{"brick_violet", 	    "Violet Bricks",	"default_brick_violet",		"default:brick_violet"},
	{"brick_white", 	    "White Bricks",		"default_brick_white",		"default:brick_white"},
	{"brick_yellow", 	    "Yellow Bricks",	"default_brick_yellow",		"default:brick_yellow"},
	-- more stones
	{"marble_brick", 	      "Marble Brick",	           "default_marble_brick",		    "default:marble_brick"},
	{"marble", 	              "Marble",	                   "default_marble",		        "default:marble"},
	{"chondrite_brick", 	      "Chondrite Brick",	           "default_chondrite_brick",		"default:chondrite_brick"},
	{"chondrite", 	          "Chondrite",	               "default_chondrite",		        "default:chondrite"},
	{"tuff_brick", 	          "Tuff Brick",	               "default_tuff_brick",		    "default:tuff_brick"},
	{"tuff", 	              "Tuff",	                   "default_tuff",		            "default:tuff"},
	{"tuff_baked_brick", 	  "Burned Tuff Brick",	       "default_tuff_baked_brick",		"default:tuff_baked_brick"},
	{"tuff_baked", 	          "Burned Tuff",	           "default_tuff_baked",		    "default:tuff_baked"},
	{"essexite_brick", 	      "Essexite Brick",	           "default_essexite_brick",		    "default:essexite_brick"},
	{"essexite", 	          "Essexite",	               "default_essexite",		        "default:essexite"},
	{"floor_essexite_gold2",   "Golden Essexite Tile",	   "default_floor_essexite_gold2",   "default:floor_essexite_gold2"},
	{"floor_essexite_gold",   "Golden Essexite Block",	   "default_floor_essexite_gold",    "default:floor_essexite_gold"},
	{"floor_marble_essexite2", "Marble/Essexite Tile",  "default_floor_marble_essexite2", "default:floor_marble_essexite2"},
	{"floor_marble_essexite", "Marble/Essexite Block",  "default_floor_marble_essexite", "default:floor_marble_essexite"},
	{"floor_bstone_sandstone2", "Burned Stone/Sandstone Tile",	"default_floor_bstone_sandstone2", "default:floor_bstone_sandstone2"},
	{"floor_bstone_sandstone", "Burned Stone/Sandstone Block",	"default_floor_bstone_sandstone", "default:floor_bstone_sandstone"},
	{"floor_btuff_tuff",      "Burned Tuff/Tuff Tile",  "default_floor_btuff_tuff",      "default:floor_btuff_tuff"},
	{"floor_bstone_stone",    "Burned Stone/Stone Tile", "default_floor_bstone_stone",   "default:floor_bstone_stone"},
	{"floor_chondrite_stone2", "Chondrite/Stone Tile",  "default_floor_chondrite_stone2", "default:floor_chondrite_stone2"},
	{"floor_chondrite_stone",  "Chondrite/Stone Block",   "default_floor_chondrite_stone",  "default:floor_chondrite_stone"},
	
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
		if nodeu == "default:stone" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_stone"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:cobble" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_cobble"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:stonebrick" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_stonebrick"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:mossycobble" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_mossycobble"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:stone_baked" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_stone_baked"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:cobble_baked" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_cobble_baked"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:stonebrick_baked" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_stonebrick_baked"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:sandstone" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_sandstone"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:sandstonebrick" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_sandstonebrick"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:obsidian" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_obsidian"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:obsidianbrick" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_obsidianbrick"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:clay" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_clay"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_trees:wood" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_wood"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "hades_trees:jungle_wood" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_jungle_wood"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:brick" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_brick"})
		   minetest.set_node(pos,{name = "air"})
		   --end of default
		elseif  nodeu == "default:cactus_block" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_cactus_block"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:cactus_brick" then
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
		  elseif  nodeu == "default:floor_wood_jungle" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_floor_wood_jungle"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:floor_wood_pale" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_floor_wood_pale"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:floor_pale_jungle" then
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
		elseif  nodeu == "default:brick_black" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_brick_black"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:brick_blue" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_brick_blue"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:brick_brown" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_brick_brown"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:brick_cyan" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_brick_cyan"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:brick_dark_green" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_brick_dark_green"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:brick_dark_grey" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_brick_dark_grey"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:brick_green" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_brick_green"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:brick_grey" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_brick_grey"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:brick_magenta" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_brick_magenta"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:brick_orange" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_brick_orange"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:brick_pink" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_brick_pink"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:brick_red" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_brick_red"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:brick_violet" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_brick_violet"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:brick_white" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_brick_white"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:brick_yellow" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_brick_yellow"})
		   minetest.set_node(pos,{name = "air"})
		   --more stone
		elseif  nodeu == "default:marble_brick" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_marble_brick"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:marble" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_marble"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:chondrite_brick" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_chondrite_brick"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:chondrite" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_chondrite"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:tuff_brick" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_tuff_brick"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:tuff" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_tuff"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:tuff_baked_brick" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_tuff_baked_brick"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:tuff_baked" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_tuff_baked"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:essexite_brick" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_essexite_brick"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:essexite" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_essexite"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:floor_essexite_gold2" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_floor_essexite_gold2"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:floor_essexite_gold" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_floor_essexite_gold"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:floor_marble_essexite2" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_floor_marble_essexite2"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:floor_marble_essexite" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_floor_marble_essexite"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:floor_bstone_sandstone2" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_floor_bstone_sandstone2"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:floor_bstone_sandstone" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_floor_bstone_sandstone"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:floor_btuff_tuff" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_floor_btuff_tuff"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:floor_bstone_stone" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_floor_bstone_stone"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:floor_chondrite_stone2" then
		   minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z},{name = "gluncarp:"..carpetname.."_on_floor_chondrite_stone2"})
		   minetest.set_node(pos,{name = "air"})
		elseif  nodeu == "default:floor_chondrite_stone" then
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
		       minetest.set_node(pos,{name = "default:stone"})
		    elseif  oldnode.name == "gluncarp:"..carpetname.."_on_cobble" then
		       minetest.set_node(pos,{name = "default:cobble"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_stonebrick" then
		       minetest.set_node(pos,{name = "default:stonebrick"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_mossycobble" then
		       minetest.set_node(pos,{name = "default:mossycobble"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_stone_baked" then
		       minetest.set_node(pos,{name = "default:stone_baked"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_cobble_baked" then
		       minetest.set_node(pos,{name = "default:cobble_baked"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_stonebrick_baked" then
		       minetest.set_node(pos,{name = "default:stonebrick_baked"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_sandstone" then
		       minetest.set_node(pos,{name = "default:sandstone"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_sandstonebrick" then
		       minetest.set_node(pos,{name = "default:sandstonebrick"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_obsidian" then
		       minetest.set_node(pos,{name = "default:obsidian"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_obsidianbrick" then
		       minetest.set_node(pos,{name = "default:obsidianbrick"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_clay" then
		       minetest.set_node(pos,{name = "default:clay"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_wood" then
		       minetest.set_node(pos,{name = "hades_trees:wood"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_jungle_wood" then
		       minetest.set_node(pos,{name = "hades_trees:jungle_wood"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_brick" then
		       minetest.set_node(pos,{name = "default:brick"})
			   --end of default
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_cactus_block" then
		       minetest.set_node(pos,{name = "default:cactus_block"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_cactus_brick" then
		       minetest.set_node(pos,{name = "default:cactus_brick"})
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
		       minetest.set_node(pos,{name = "default:brick_black"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_brick_blue" then
		       minetest.set_node(pos,{name = "default:brick_blue"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_brick_brown" then
		       minetest.set_node(pos,{name = "default:brick_brown"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_brick_cyan" then
		       minetest.set_node(pos,{name = "default:brick_cyan"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_brick_dark_green" then
		       minetest.set_node(pos,{name = "default:brick_dark_green"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_brick_dark_grey" then
		       minetest.set_node(pos,{name = "default:brick_dark_grey"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_brick_green" then
		       minetest.set_node(pos,{name = "default:brick_green"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_brick_grey" then
		       minetest.set_node(pos,{name = "default:brick_grey"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_brick_magenta" then
		       minetest.set_node(pos,{name = "default:brick_magenta"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_brick_orange" then
		       minetest.set_node(pos,{name = "default:brick_orange"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_brick_pink" then
		       minetest.set_node(pos,{name = "default:brick_pink"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_brick_red" then
		       minetest.set_node(pos,{name = "default:brick_red"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_brick_violet" then
		       minetest.set_node(pos,{name = "default:brick_violet"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_brick_white" then
		       minetest.set_node(pos,{name = "default:brick_white"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_brick_yellow" then
		       minetest.set_node(pos,{name = "default:brick_yellow"})
			 -- more stones
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_marble_brick" then
		       minetest.set_node(pos,{name = "default:marble_brick"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_marble" then
		       minetest.set_node(pos,{name = "default:marble"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_chondrite_brick" then
		       minetest.set_node(pos,{name = "default:chondrite_brick"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_chondrite" then
		       minetest.set_node(pos,{name = "default:chondrite"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_tuff_brick" then
		       minetest.set_node(pos,{name = "default:tuff_brick"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_tuff" then
		       minetest.set_node(pos,{name = "default:tuff"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_tuff_baked_brick" then
		       minetest.set_node(pos,{name = "default:tuff_baked_brick"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_tuff_baked" then
		       minetest.set_node(pos,{name = "default:tuff_baked"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_essexite_brick" then
		       minetest.set_node(pos,{name = "default:essexite_brick"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_essexite" then
		       minetest.set_node(pos,{name = "default:essexite"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_floor_essexite_gold2" then
		       minetest.set_node(pos,{name = "default:floor_essexite_gold2"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_floor_essexite_gold" then
		       minetest.set_node(pos,{name = "default:floor_essexite_gold"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_floor_marble_essexite2" then
		       minetest.set_node(pos,{name = "default:floor_marble_essexite2"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_floor_marble_essexite" then
		       minetest.set_node(pos,{name = "default:floor_marble_essexite"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_floor_bstone_sandstone2" then
		       minetest.set_node(pos,{name = "default:floor_bstone_sandstone2"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_floor_bstone_sandstone" then
		       minetest.set_node(pos,{name = "default:floor_bstone_sandstone"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_floor_btuff_tuff" then
		       minetest.set_node(pos,{name = "default:floor_btuff_tuff"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_floor_bstone_stone" then
		       minetest.set_node(pos,{name = "default:floor_bstone_stone"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_floor_chondrite_stone2" then
		       minetest.set_node(pos,{name = "default:floor_chondrite_stone2"})
			elseif  oldnode.name == "gluncarp:"..carpetname.."_on_floor_chondrite_stone" then
		       minetest.set_node(pos,{name = "default:floor_chondrite_stone"})
		    else 
		       return
			end
	     end,
		 
})
end
end

