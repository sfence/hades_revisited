local S = minetest.get_translator("hades_tiles")

-- Tiles

local tile_woods = {
	-- id,    name,           craft source
	{ "pale", S("Pale Wood"), "hades_trees:pale_wood" },
	{ "cream", S("Cream Wood"), "hades_trees:cream_wood" },
	{ "wood", S("Temperate Wood"), "hades_trees:wood" },
	{ "lush", S("Lush Wood"), "hades_trees:lush_wood" },
	{ "jungle", S("Tropical Wood"), "hades_trees:jungle_wood" },
}

for t=1, #tile_woods do
	local id1 = tile_woods[t][1]
	local woodname1 = tile_woods[t][2]
	for u=1, #tile_woods do
		local id2 = tile_woods[u][1]
		local woodname2 = tile_woods[u][2]
		local tile, desc, on_rotate
		if t~=u then
			tile = "hades_tiles_floor_"..id1..".png^(hades_tiles_floor_"..id2..".png^[mask:hades_tiles_floor_mask.png)"
			desc = S("@1/@2 Tile", woodname1, woodname2)
			on_rotate = function(pos, node, user, mode, new_param2)
				if mode == 1 then
					minetest.swap_node(pos, {name="hades_tiles:floor_"..id2.."_"..id1})
				end
				return false
			end
		else
			tile = "hades_tiles_floor_"..id1..".png"
			desc = S("@1 Tile", woodname1)
		end
		local no_creative, drop
		if t<u then
			no_creative = 1
			drop = "hades_tiles:floor_"..id2.."_"..id1
		end
		minetest.register_node("hades_tiles:floor_"..id1.."_"..id2, {
			description = desc,
			tiles = {
				tile, tile, tile, tile,
				"("..tile..")^[transformR90",
			},
			on_rotate = on_rotate,
			drop = drop,
			groups = {choppy=3,oddly_breakable_by_hand=2,flammable=3,wood=1,tile=1,not_in_creative_inventory=no_creative},
			sounds = hades_sounds.node_sound_wood_defaults(),
		})

		if t>=u then
			minetest.register_craft({
				output = 'hades_tiles:floor_'..id1..'_'..id2..' 4',
				recipe = {
					{tile_woods[t][3], tile_woods[u][3]},
					{tile_woods[u][3], tile_woods[t][3]},
				}
			})
			if t~=u then
				minetest.register_craft({
					output = 'hades_tiles:floor_'..id1..'_'..id2..' 4',
					recipe = {
						{tile_woods[u][3], tile_woods[t][3]},
						{tile_woods[t][3], tile_woods[u][3]},
					}
				})
			end
		end
	end
end
