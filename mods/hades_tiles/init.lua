local S = minetest.get_translator("hades_tiles")

-- Tiles

local g_wood = {choppy=3,oddly_breakable_by_hand=2,flammable=3}
local g_stone3 = {cracky=3}
local g_stone2 = {cracky=2}
local s_wood = hades_sounds.node_sound_wood_defaults()
local s_stone = hades_sounds.node_sound_stone_defaults()

local tile_groups = {
{
	-- id,    name,           craft source
	{ "pale", S("Pale Wood"), "hades_trees:pale_wood", {wood=1}, g_wood, {}, s_wood },
	{ "cream", S("Cream Wood"), "hades_trees:cream_wood", {wood=1} },
	{ "wood", S("Temperate Wood"), "hades_trees:wood", {wood=1} },
	{ "lush", S("Lush Wood"), "hades_trees:lush_wood", {wood=1} },
	{ "jungle", S("Tropical Wood"), "hades_trees:jungle_wood", {wood=1} },
},
{
	{ "stone", S("Stone"), "hades_core:stone", {stone=1}, g_stone3, s_stone },
	{ "tuff", S("Tuff"), "hades_core:tuff", {stone=1} },
	{ "stonebaked", S("Burned Stone"), "hades_core:stone_baked", {stone=1} },
	{ "tuffbaked", S("Burned Tuff"), "hades_core:tuff_baked", {stone=1} },
	{ "chondrite", S("Chondrite"), "hades_core:chondrite", {stone=1} },
	{ "sandstone", S("Fine Sandstone"), "hades_core:sandstone", {sandstone=1} },
},
{
	{ "sandstonevolcanic", S("Volcanic Sandstone"), "hades_core:sandstone_volcanic", {sandstone=1}, g_stone3, s_stone },
},
{
	{ "marble", S("Marble"), "hades_core:marble", {}, g_stone2, s_stone },
	{ "essexite", S("Essexite"), "hades_core:essexite", {} },
},
{
	{ "essexitegold", S("Golden Essexite"), "hades_core:floor_essexite_gold", {}, g_stone2, s_stone },
}
}


for g=1, #tile_groups do
local tile_nodes = tile_groups[g]

for t=1, #tile_nodes do
	local id1 = tile_nodes[t][1]
	local tilename1 = tile_nodes[t][2]
	local own_groups1 = table.copy(tile_nodes[t][4])
	for u=1, #tile_nodes do
		local groups = table.copy(tile_nodes[1][5])
		local snd = tile_nodes[1][6]
		local id2 = tile_nodes[u][1]
		local tilename2 = tile_nodes[u][2]
		local own_groups2 = table.copy(tile_nodes[u][4])
		local tile, desc, on_rotate

		-- Add groups shared by both tile sources
		for g, r in pairs(own_groups1) do
			if own_groups2[g] and own_groups2[g] == r then
				groups[g] = r
			end
		end
		for g, r in pairs(own_groups2) do
			if own_groups1[g] and own_groups1[g] == r then
				groups[g] = r
			end
		end

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
