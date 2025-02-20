-----------------------------------
-- Ability: Spectral jig
-- Allows you to evade enemies by making you undetectable by sight and sound.
-- Obtained: Dancer Level 25
-- TP Required: 0
-- Recast Time: 30 seconds
-- Duration: 3 minutes
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/msg")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
   return 0, 0
end

ability_object.onUseAbility = function(player, target, ability)
    local baseDuration = 180
    local durationMultiplier = 1.0 + utils.clamp(player:getMod(tpz.mod.JIG_DURATION), 0, 50) / 100
    local finalDuration = math.floor(baseDuration * durationMultiplier * SNEAK_INVIS_DURATION_MULTIPLIER)

    if (player:hasStatusEffect(tpz.effect.SNEAK) == false) then
        player:addStatusEffect(tpz.effect.SNEAK, 0, 10, finalDuration)
        player:addStatusEffect(tpz.effect.INVISIBLE, 0, 10, finalDuration)
        ability:setMsg(tpz.msg.basic.SPECTRAL_JIG) -- Gains the effect of sneak and invisible
    else
        ability:setMsg(tpz.msg.basic.NO_EFFECT) -- no effect on player.
    end
    
end

return ability_object
