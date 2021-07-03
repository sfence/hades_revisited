local S = minetest.get_translator("hades_magic_wand")

local cycles = {
	{ "hades_core:dirt", "hades_core:dirt_with_grass" },
	{ "hades_farming:soil", "hades_farming:soil_wet" },
	{ "hades_core:grass_1", "hades_core:grass_2", "hades_core:grass_3", "hades_core:grass_4", "hades_core:grass_5" },
	{ "hades_waterplants:seaweed_4", "hades_waterplants:seaweed_2", "hades_waterplants:seaweed_3", "hades_waterplants:seaweed" },
	{ "hades_waterplants:waterlily", "hades_waterplants:waterlily_225", "hades_waterplants:waterlily_45", "hades_waterplants:waterlily_675", "hades_waterplants:waterlily_s3", "hades_waterplants:waterlily_s1", "hades_waterplants:waterlily_s2", "hades_waterplants:waterlily_s4" },
	{ "vines:willow", "vines:willow_rotten" },
	{ "vines:side", "vines:side_rotten" },
	{ "vines:vine", "vines:vine_rotten" },
	{ "hades_refruit:bud_apple", "hades_refruit:flower_apple", "hades_trees:apple" },
	{ "hades_refruit:bud_olive", "hades_refruit:flower_olive", "hades_trees:olive" },
	{ "hades_refruit:bud_cocoa", "hades_refruit:flower_cocoa", "hades_trees:cocoa_pod" },
	{ "hades_refruit:bud_coconut", "hades_refruit:flower_coconut", "hades_trees:coconut" },
	{ "hades_refruit:bud_banana", "hades_refruit:flower_banana", "hades_trees:banana" },
	{ "hades_refruit:bud_orange", "hades_refruit:flower_orange", "hades_trees:orange" },
}

local seeds_3 = { "cotton", "wheat", "spice", "potato", "strawberry", "tomato" }
for s=1,#seeds_3 do
	local seed = seeds_3[s]
	local seeds = { "hades_farming:seed_"..seed }
	for i=1,3 do
		table.insert(seeds, "hades_farming:"..seed.."_"..i)
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
	groups = { tool = 1, disable_repair = 1 },
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

