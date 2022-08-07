local S = minetest.get_translator("hades_tiles")

-- Tiles

local g_wood = {choppy=3,oddly_breakable_by_hand=2,flammable=3}
local g_stone3 = {cracky=3}
local g_stone2 = {cracky=2}
local s_wood = hades_sounds.node_sound_wood_defaults()
local s_stone = hades_sounds.node_sound_stone_defaults()

local tile_stone = { "stone", S("Stone"), "hades_core:stone", {stone=1}, g_stone3, s_stone }
local tile_sandstone = { "sandstone", S("Fine Sandstone"), "hades_core:sandstone", {sandstone=1} }
local tile_sandstone_volcanic = { "sandstonevolcanic", S("Volcanic Sandstone"), "hades_core:sandstone_volcanic", {sandstone=1}, g_stone3, s_stone }
local tile_marble = { "marble", S("Marble"), "hades_core:marble", {}, g_stone2, s_stone }
local tile_essexite = { "essexite", S("Essexite"), "hades_core:essexite", {} }
local tile_essexitegold = { "essexitegold", S("Golden Essexite"), "hades_core:floor_essexite_gold", {}, g_stone2, s_stone }
local tile_basalt = { "basalt", S("Basalt"), "hades_core:basalt", {}, g_stone2, s_stone }

local tile_groups = {
{
	-- id,    description part, craft source,          shared group, global group, global sound
	{ "pale", S("Pale Wood"), "hades_trees:pale_wood", {wood=1}, g_wood, s_wood },
	{ "cream", S("Cream Wood"), "hades_trees:cream_wood", {wood=1} },
	{ "wood", S("Temperate Wood"), "hades_trees:wood", {wood=1} },
	{ "lush", S("Lush Wood"), "hades_trees:lush_wood", {wood=1} },
	{ "jungle", S("Tropical Wood"), "hades_trees:jungle_wood", {wood=1} },
},
{
	tile_stone,
	{ "tuff", S("Tuff"), "hades_core:tuff", {} },
	{ "stonebaked", S("Burned Stone"), "hades_core:stone_baked", {stone=1} },
	{ "tuffbaked", S("Burned Tuff"), "hades_core:tuff_baked", {} },
	{ "chondrite", S("Chondrite"), "hades_core:chondrite", {stone=1} },
	tile_sandstone,
},
{
	tile_sandstone_volcanic,
},
{
	tile_marble,
	tile_essexite,
},
{
	tile_essexitegold,
},
{
	tile_basalt,
},
}

local function register_tile(tile_node1, tile_node2, tile_groups, tile_snd, is_mirrored, is_same)
	local id1 = tile_node1[1]
	local tilename1 = tile_node1[2]
	local own_groups1 = table.copy(tile_node1[4])

	local groups = table.copy(tile_groups)
	local snd = tile_snd
	local id2 = tile_node2[1]
	local tilename2 = tile_node2[2]
	local own_groups2 = table.copy(tile_node2[4])
	local tile, tile_side, desc, on_rotate

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

	if not is_same then
		tile = "hades_tiles_floor_"..id1..".png^(hades_tiles_floor_"..id2..".png^[mask:hades_tiles_floor_mask.png)"
		tile_side = "hades_tiles_floor_"..id1..".png^(hades_tiles_floor_"..id2..".png^[mask:(hades_tiles_floor_mask.png^[transformR90))"
		desc = S("@1/@2 Tile", tilename1, tilename2)
		on_rotate = function(pos, node, user, mode, new_param2)
			if mode == screwdriver.ROTATE_FACE then
				minetest.swap_node(pos, {name="hades_tiles:floor_"..id2.."_"..id1})
			end
			return false
		end
	else
		tile = "hades_tiles_floor_"..id1..".png"
		tile_side = tile
		desc = S("@1 Tile", tilename1)
	end
	local drop
	if is_mirrored then
		groups.not_in_creative_inventory = 1
		drop = "hades_tiles:floor_"..id2.."_"..id1
	end
	groups.tile = 1
	minetest.register_node("hades_tiles:floor_"..id1.."_"..id2, {
		description = desc,
		tiles = {
			tile, tile, tile, tile,
			tile_side,
		},
		on_rotate = on_rotate,
		drop = drop,
		groups = groups,
		sounds = snd,
		is_ground_content = false,
	})

	if (not is_mirrored) and tile_node1[3] and tile_node2[3] then
		minetest.register_craft({
			output = 'hades_tiles:floor_'..id1..'_'..id2..' 4',
			recipe = {
				{tile_node1[3], tile_node2[3]},
				{tile_node2[3], tile_node1[3]},
			}
		})
		if not is_same then
			minetest.register_craft({
				output = 'hades_tiles:floor_'..id1..'_'..id2..' 4',
				recipe = {
					{tile_node2[3], tile_node1[3]},
					{tile_node1[3], tile_node2[3]},
				}
			})
		end
	end
end

local function register_tile_and_mirror(tile_node1, tile_node2, tile_groups, tile_snd)
	register_tile(tile_node1, tile_node2, tile_groups, tile_snd, false)
	register_tile(tile_node2, tile_node1, tile_groups, tile_snd, true)
end


for g=1, #tile_groups do
	local tile_nodes = tile_groups[g]
	for t=1, #tile_nodes do
		local groups = tile_nodes[1][5]
		local snd = tile_nodes[1][6]
		for u=1, #tile_nodes do
			local tile_node1 = tile_nodes[t]
			local tile_node2 = tile_nodes[u]
			register_tile(tile_node1, tile_node2, groups, snd, t<u, t==u)
		end
	end
end

register_tile_and_mirror(tile_sandstone, tile_sandstone_volcanic, g_stone3, s_stone)
register_tile_and_mirror(tile_sandstone_volcanic, tile_stone, g_stone3, s_stone)
register_tile_and_mirror(tile_essexitegold, tile_essexite, g_stone2, s_stone)
register_tile_and_mirror(tile_basalt, tile_marble, g_stone2, s_stone)
