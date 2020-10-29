local S = minetest.get_translator("hades_magic_wand")

local cycles = {
	{ "hades_core:dirt", "hades_core:dirt_with_grass" },
	{ "farming:soil", "farming:soil_wet" },
	{ "hades_core:grass_1", "hades_core:grass_2", "hades_core:grass_3", "hades_core:grass_4", "hades_core:grass_5" },
	{ "flowers:seaweed_4", "flowers:seaweed_2", "flowers:seaweed_3", "flowers:seaweed" },
	{ "flowers:waterlily", "flowers:waterlily_225", "flowers:waterlily_45", "flowers:waterlily_675", "flowers:waterlily_s3", "flowers:waterlily_s1", "flowers:waterlily_s2", "flowers:waterlily_s4" },
	{ "vines:willow", "vines:willow_rotten" },
	{ "vines:side", "vines:side_rotten" },
	{ "vines:vine", "vines:vine_rotten" },
	{ "refruit:bud_apple", "refruit:flower_apple", "hades_trees:apple" },
	{ "refruit:bud_olive", "refruit:flower_olive", "hades_trees:olive" },
}

local seeds_3 = { "cotton", "wheat", "spice", "potato", "strawberry", "tomato" }
for s=1,#seeds_3 do
	local seed = seeds_3[s]
	local seeds = { "farming:seed_"..seed }
	for i=1,3 do
		table.insert(seeds, "farming:"..seed.."_"..i)
	end
	table.insert(cycles, seeds)
end

local conversions = {}

for c=1, #cycles do
	for d=1, #cycles[c] do
		local cthis = cycles[c][d]
		local next_num = d+1
		if next_num > #cycles[c] then
			next_num = 1
		end
		local cnext = cycles[c][next_num]
		conversions[cthis] = cnext
	end
end

minetest.register_craftitem("hades_magic_wand:magic_wand", {
	description = S("Magic Wand"),
	_tt_help = S("Changes block state"),
	inventory_image = "default_stick.png^[colorize:#940EFE:127",
	wield_image = "default_stick.png^[colorize:#940EFE:127",
	groups = { tool = 1 },
	on_use = function(itemstack, user, pointed_thing)
		if pointed_thing.type == "node" then
			local pos = pointed_thing.under
			local node = minetest.get_node(pointed_thing.under)
			if conversions[node.name] then
				node.name = conversions[node.name]
				minetest.swap_node(pos, node)
			end
		end
		return itemstack
	end,
})

