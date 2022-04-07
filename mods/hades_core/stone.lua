local S = minetest.get_translator("hades_core")

local function register_stone(subname, def)
	if not def.texture_base then
		def.texture_base = "hades_core_"..subname..".png"
	end
	if not def.cracky then
		def.cracky = 3
	end
	local groups_base = {cracky=def.cracky, stone=1, porous=1}
	local groups_block = {cracky=def.cracky}
	local groups_brick = {cracky=def.cracky}
	if def.extra_groups then
		for k,v in pairs(def.extra_groups) do
			groups_base[k] = v
			groups_block[k] = v
			groups_brick[k] = v
		end
	end
	local id_base = def.id_base or "hades_core:"..subname
	-- Base stone
	minetest.register_node(id_base, {
		description = def.description_base,
		tiles = {def.texture_base},
		is_ground_content = true,
		groups = groups_base,
		drop = def.drop_base,
		_tt_help = def._tt_help_base,
		sounds = hades_sounds.node_sound_stone_defaults(def.sound_table),
	})
	-- Block
	if not def.no_block then
		local id_block = def.id_block or "hades_core:"..subname.."_block"
		if not def.texture_block then
			def.texture_block = "hades_core_"..subname.."_block.png"
		end
		minetest.register_node(id_block, {
			description = def.description_block,
			tiles = {def.texture_block},
			is_ground_content = false,
			groups = groups_block,
			sounds = hades_sounds.node_sound_stone_defaults(def.sound_table),
		})
		if not def.no_craft then
			minetest.register_craft({
				output = "hades_core:"..subname.."_block",
				recipe = {
					{"hades_core:"..subname, "hades_core:"..subname, "hades_core:"..subname},
					{"hades_core:"..subname, "hades_core:"..subname, "hades_core:"..subname},
					{"hades_core:"..subname, "hades_core:"..subname, "hades_core:"..subname},
				},
			})
			minetest.register_craft({
				output = "hades_core:"..subname.." 9",
				recipe = {
					{"hades_core:"..subname.."_block"},
				},
			})
		end
	end

	-- Brick
	if not def.no_brick then
		local id_brick = def.id_brick or "hades_core:"..subname.."_brick"
		if not def.texture_brick then
			def.texture_brick = "hades_core_"..subname.."_brick.png"
		end
		minetest.register_node(id_brick, {
			description = def.description_brick,
			tiles = {def.texture_brick},
			is_ground_content = false,
			groups = groups_brick,
			sounds = hades_sounds.node_sound_stone_defaults(def.sound_table),
		})
		if not def.no_craft then
			minetest.register_craft({
				output = "hades_core:"..subname.."_brick 4",
				recipe = {
					{"hades_core:"..subname, "hades_core:"..subname, ""},
					{"", "hades_core:"..subname, "hades_core:"..subname},
				},
			})
		end
	end
end

-- Simple nodes (full solid cubes)

-- Basic rocks (and crafted variants)

register_stone("stone", {
	description_base = S("Stone"),
	description_block = S("Stone Block"),
	description_brick = S("Stone Brick"),
	id_brick = "hades_core:stonebrick",
	cracky = 3,
	texture_base = "default_stone.png",
	texture_block= "default_stone_block.png",
	texture_brick = "default_stone_brick.png",
	drop_base = "hades_core:cobble",
})

minetest.register_node("hades_core:mossystone", {
	description = S("Mossy Stone"),
	tiles = {"hades_core_mossystone.png"},
	is_ground_content = true,
	groups = {cracky=3, stone=1, porous=1},
	drop = 'hades_core:mossycobble',
	sounds = hades_sounds.node_sound_stone_defaults(),
})

register_stone("stone_baked", {
	description_base = S("Burned Stone"),
	description_block = S("Burned Stone Block"),
	description_brick = S("Burned Stone Brick"),
	id_brick = "hades_core:stonebrick_baked",
	id_block = "hades_core:stone_block_baked",
	cracky = 3,
	extra_groups = {burned_node=1},
	texture_base = "hades_core_stone_baked.png",
	texture_block = "hades_core_stone_block_baked.png",
	texture_brick = "hades_core_stone_brick_baked.png",
	drop_base = "hades_core:cobble_baked",
})

register_stone("chondrite", {
	description_base = S("Chondrite"),
	description_block = S("Chondrite Block"),
	description_brick = S("Chondrite Brick"),
	_tt_help_base = S("Becomes Marble when close to water and at Y=-500 or below"),
	cracky = 2,
})

register_stone("basalt", {
	description_base = S("Basalt"),
	description_block = S("Basalt Block"),
	description_brick = S("Basalt Brick"),
	cracky = 3,
})

register_stone("tuff", {
	description_base = S("Tuff"),
	description_block = S("Tuff Block"),
	description_brick = S("Tuff Brick"),
	cracky = 3,
})

minetest.register_node("hades_core:mossytuff", {
	description = S("Mossy Tuff"),
	tiles = {"hades_core_mossytuff.png"},
	is_ground_content = true,
	groups = {cracky=3, porous=1, mossy=1},
	drop = 'hades_core:mossytuff',
	sounds = hades_sounds.node_sound_stone_defaults(),
})

register_stone("tuff_baked", {
	description_base = S("Burned Tuff"),
	description_block = S("Burned Tuff Block"),
	description_brick = S("Burned Tuff Brick"),
	cracky = 3,
	texture_base = "hades_core_tuff_baked.png",
	texture_block = "hades_core_tuff_baked_block.png",
	texture_brick = "hades_core_tuff_baked_brick.png",
})

register_stone("marble", {
	description_base = S("Marble"),
	description_block = S("Marble Block"),
	description_brick = S("Marble Brick"),
	cracky = 3,
})

register_stone("essexite", {
	description_base = S("Essexite"),
	description_block = S("Essexite Block"),
	description_brick = S("Essexite Brick"),
	cracky = 1,
})

register_stone("obsidian", {
	description_base = S("Obsidian"),
	description_block = S("Obsidian Block"),
	description_brick = S("Obsidian Brick"),
	id_brick = "hades_core:obsidianbrick",
	cracky = 1,
	extra_groups = {level=2},
	texture_base = "default_obsidian.png",
	texture_block = "default_obsidian_block.png",
	texture_brick = "default_obsidian_brick.png",
})


-- Color stones (stone with a natural vibrant color)
register_stone("olivine", {
	description_base = S("Olivine"),
	description_block = S("Olivine Block"),
	description_brick = S("Olivine Brick"),
})
register_stone("cinnaber", {
	description_base = S("Cinnaber"),
	description_block = S("Cinnaber Block"),
	description_brick = S("Cinnaber Brick"),
})
register_stone("apolline", {
	-- Invented word, based on "Apollon"
	description_base = S("Apolline"),
	description_block = S("Apolline Block"),
	description_brick = S("Apolline Brick"),
})
register_stone("orangite", {
	-- Invented word, based on "orange"
	description_base = S("Orangite"),
	description_block = S("Orangite Block"),
	description_brick = S("Orangite Brick"),
})
register_stone("azurite", {
	-- Invented word, based on "azure"
	description_base = S("Azurite"),
	description_block = S("Azurite Block"),
	description_brick = S("Azurite Brick"),
})
register_stone("lillite", {
	-- Invented word, based on German word "lila" (=vilet)
	description_base = S("Lillite"),
	description_block = S("Lillite Block"),
	description_brick = S("Lillite Brick"),
})
register_stone("turquosite", {
	-- Invented word, based on "turquoise"
	description_base = S("Turquosite"),
	description_block = S("Turquosite Block"),
	description_brick = S("Turquosite Brick"),
})

