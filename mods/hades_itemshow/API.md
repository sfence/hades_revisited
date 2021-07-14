Usually, items are placed properly on the item frame, pedestal, etc. and look correctly.
However, sometimes these might appear too big or are offset too far away from the node.

So there are two optional node fields recognize which you can use to tweak the appearance
of the entity when placed:

* `_hades_itemshow_scale`: Number. Scale the entity in the itemshow node.
                           Use this when the entity visual would be too big.
* `_hades_itemshow_offset`: Vector. Offset the entity sideways and up/down. X and Z MUST be equal.
                            You usually need this if the entity appears "behind" the item frame.
