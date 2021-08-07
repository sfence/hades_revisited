List of groups used in Hades Revisited (info for developers)
------------------------------------------------------------

Note: If no group rating is specified, use 1.

Node identities:
* `tree`: Tree Trunk
* `sapling`: Sapling
* `leaves`: Leaves
* `bark`: Bark
* `seaweed`: Seaweed
* `waterlily`: Waterlily
* `plant`: Farming plant
* `grass`: Grass
* `flower`: Flower
* `vines=1`: Vines (sideways)
    * `vines=2` Vines (centered)
* `vines_rotten=1`: Rotten vines
* `simple_bush`: Bush

* `seed`: Seed
* `seed_farming`: Seed from the `hades_farming` mod
* `wheat`: Wheat plant
* `strawberry` Strawberry plant
* `tomato` Tomato plant
* `cotton`: Cotton plant

* `colwood`: Colored wooden planks
* `claybricks`: Clay bricks
* `wool`: Wool

* `carpet`: Carpet
* `table`: Table
* `chair`: Chair
* `armchair`: Armchair
* `window_wood`: Wooden window

* `chest`: Chest
* `unlocked_chest`: Unlocked chest
* `locked_chest`: Locked chest
* `furnace`: Furnace
* `torch`: Torch
* `door`: Door
* `steel_door`: Steel Door
* `pipe`: Pipe
* `bed`: Bed
* `fence`: Fence
* `fence_gate`: Fence gate
* `fence_metal`: Metal fence
* `fence_wood`: Wooden fence
* `wall`: Wall
* `ladder`: Ladder
* `vessel`: Vessel, like glass bottle

* `mossy`: Block has moss on it
* `burned_node`: Node that was "burned" by lava like Burned Stone
* `ore`: Ore
* `sandstone`: Sandstone
* `ash`: Ash

* `liquid`: Liquid
* `water`: Water
* `lava`: Lava

Digging groups:
* `choppy`: Wood, etc.
* `cracky`: Stone, etc.
* `oddly_breakable_by_hand`: Breakable by hand for ... reasons
* `snappy`: Leaves, plants, etc.

Crafting groups:
* `wood`: Wooden planks
* `sand`: Sand
* `stone`: Stone or stone-like

Items:
* `shears`: Shears
* `shovel`: Shovel
* `axe`: Axe
* `pickaxe`: Pickaxe
* `sword`: Sword
* `tool`: Tool
* `dye`: Dye
* `spawn_egg`: Spawn egg

Action groups:
* `bagslots=X`: Bag with X slots
* `food=1`: Food (unspecified type)
*   `food=2`: Food (eating)
*   `food=3`: Food (drinking)
* `eatable=X`: Item can be eaten or consumed (restoring X food points)
* `leafdecay=X`: Leaves that decay when not near a node specified in `_hades_trees_trunk` field (X=distance from node)
* `leafdecay_any`: In combination with `leafdecay`, will expect a `group:tree` node instead to prevent decay
* `leafdecay_drop`: Node will drop itself when leaf-decaying
* `wet` Considered wet for farming purposes
* `fruit_regrow=3`: Regrowing fruit
*   `fruit_regrow=2`: Regrowing fruit (flower stage)
*   `fruit_regrow=1`: Regrowing fruit (bud stage)
* `ash_fertilizer=X`: Node slowly turns nearby Volcanic Ash to Fertile Sand (distance X, usually 3)
* `porous`: If water is above this node, water droplets might appear below it
* `fake_liquid`: Node is registerd as liquid but it's not actually a liquid
* `flora`: This is a plant that spreads on Dirt with Grass
* `soil`: Usable by hoe
* `not_in_craft_guide`: Item won't appear in craft guide

Legacy groups:
* `flammable`: Considered flammable (Note: This game has no fire)
* `puts_out_fire`: Node is supposed to put out neighboring fire (Note: This game has no fire)
* `desert`: soil category for farming
* `grassland`: soil category for farming
* `field`: soil category for farming
