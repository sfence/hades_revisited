# Hades Seeds API

You can register seeds and that's it. Seeds do now grow on their own, you are
supposed to implement that yourselves, e.g. with ABMs.

## `hades_seeds.register_seed(name, def)`
Register a seed node.

* `name`: Full itemstring of seed node
* `def`: Definition table:
    * `description`: Same as for normal node def
    * `inventory_image`: Same as for normal node def
    * `place_param2`: Same as for normal node def
    * `surface_check`: Function that takes the node on which the seed is
                       placed as argument, must return true if seed is allowed
                       to be placed here and false otherwise
    * `_tt_help`: Tooltip extension (for 'tt' mod)
    * `fertilty`: internal argument required for `hades_farming` plants only
                  ignore this otherwise

