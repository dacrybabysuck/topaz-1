-----------------------------------
-- Area: Rolanberry Fields (110)
--  HNM: Simurgh
-----------------------------------
mixins =
{
    require("scripts/mixins/job_special"),
    require("scripts/mixins/rage")
}
require("scripts/globals/titles")
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 1)
end

entity.onMobSpawn = function(mob)
    mob:addMod(tpz.mod.ACC, 50)
    mob:addMod(tpz.mod.EVA, 50)
    mob:addMod(tpz.mod.ATT, -75)
    mob:addMod(tpz.mod.STATUSRES, -50)
end

entity.onMobDeath = function(mob, player, isKiller)
    player:addTitle(tpz.title.SIMURGH_POACHER)
end

entity.onMobDespawn = function(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(3600, 7200)) -- 1 to 2 hours
end

return entity
