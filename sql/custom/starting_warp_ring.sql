--Makes the Warp ring usable instantly upon equip and makes the cooldown 60secs.
UPDATE item_usable SET useDelay=0,reuseDelay=60 WHERE name="warp_ring" AND itemid=28540;
