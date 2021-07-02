local S = minetest.get_translator("hades_tiles")

-- Tiles

local g_wood = {choppy=3,oddly_breakable_by_hand=2,flammable=3,wood=1}
local g_stone3 = {cracky=3}
local g_stone2 = {cracky=2}
local s_wood = hades_sounds.node_sound_wood_defaults()
local s_stone = hades_sounds.node_sound_stone_defaults()

local tile_groups = {
{
	-- id,    name,           craft source
	{ "pale", S("Pale Wood"), "hades_trees:pale_wood", g_wood, s_wood },
	{ "cream", S("Cream Wood"), "hades_trees:cream_wood" },
	{ "wood", S("Temperate Wood"), "hades_trees:wood" },
	{ "lush", S("Lush Wood"), "hades_trees:lush_wood" },
	{ "jungle", S("Tropical Wood"), "hades_trees:jungle_wood" },
},
{
	{ "stone", S("Stone"), "hades_core:stone", g_stone3, s_stone },
	{ "tuff", S("Tuff"), "hades_core:tuff" },
	{ "stonebaked", S("Burned Stone"), "hades_core:stone_baked" },
	{ "tuffbaked", S("Burned Tuff"), "hades_core:tuff_baked" },
	{ "sandstone", S("Sandstone"), "hades_core:sandstone" },
	{ "chondrite", S("Chondrite"), "hades_core:chondrite" },
},
{
	{ "marble", S("Marble"), "hades_core:marble", g_stone2, s_stone },
	{ "essexite", S("Essexite"), "hades_core:essexite" },
},
{
	{ "essexitegold", S("Golden Essexite"), "hades_core:floor_essexite_gold", g_stone2, s_stone },
}
}


for g=1, #tile_groups do
local tile_nodes = tile_groups[g]

for t=1, #tile_nodes do
	local id1 = tile_nodes[t][1]
	local tilename1 = tile_nodes[t][2]
	for u=1, #tile_nodes do
		local groups = table.copy(tile_nodes[1][4])
		local snd = tile_nodes[1][5]
		local id2 = tile_nodes[u][1]
		local tilename2 = tile_nodes[u][2]
		local tile, desc, on_rotate
		if t~=u then
			tile = "hades_tiles_floor_"..id1..".png^(hades_tiles_floor_"..id2..".png^[mask:hades_tiles_floor_mask.png)"
			desc = S("@1/@2 Tile", tilename1, tilename2)
			on_rotate = function(pos, node, user, mode, new_param2)
				if mode == screwdriver.ROTATE_FACE then
					minetest.swap_node(pos, {name="hades_tiles:floor_"..id2.."_"..id1})
				end
				return false
			end
		else
			tile = "hades_tiles_floor_"..id1..".png"
			desc = S("@1 Tile", tilename1)
		end
		local drop
		if t<u then
			groups.not_in_creative_inventory = 1
			drop = "hades_tiles:floor_"..id2.."_"..id1
		end
		groups.tile = 1
		minetest.register_node("hades_tiles:floor_"..id1.."_"..id2, {
			description = desc,
			tiles = {
				tile, tile, tile, tile,
				"("..tile..")^[transformR90",
			},
			on_rotate = on_rotate,
			drop = drop,
			groups = groups,
			sounds = snd,
			is_ground_content = false,
		})

		if t>=u and tile_nodes[t][3] and tile_nodes[u][3] then
			minetest.register_craft({
				output = 'hades_tiles:floor_'..id1..'_'..id2..' 4',
				recipe = {
					{tile_nodes[t][3], tile_nodes[u][3]},
					{tile_nodes[u][3], tile_nodes[t][3]},
				}
			})
			if t~=u then
				minetest.register_craft({
					output = 'hades_tiles:floor_'..id1..'_'..id2..' 4',
					recipe = {
						{tile_nodes[u][3], tile_nodes[t][3]},
						{tile_nodes[t][3], tile_nodes[u][3]},
					}
				})
			end
		end
	end
end
end
