# Hades Seeds API

You can register seeds and that's it. All seeds start with the groups
`seed=1`, `snappy=3`, `attached_node=1`.

Seeds do now grow on their own, you are supposed to implement that yourselves,
e.g. with ABMs.

## `hades_seeds.register_seed(name, def)`
Register a seed node.

* `name`: Full itemstring of seed node. MUST be of the form
         `<your_modname>:seed_<your_identifier>`,
          e.g. `hades_farming:seed_wheat`
* `def`: Definition table:
    * `description`: Same as for normal node def
    * `_tt_help`: Tooltip extension (for 'tt' mod)
    * `image`: Node texture, inventory and wield image
    * `place_param2`: Same as for normal node def
    * `surface_check`: Function that takes the node on which the seed is
                       placed as argument, must return true if seed is allowed
                       to be placed here and false otherwise
    * `extra_groups`: Optional table of groups to add to the default seed node groups
    * `fertilty`: internal argument required for `hades_farming` plants only
                  ignore this otherwise

