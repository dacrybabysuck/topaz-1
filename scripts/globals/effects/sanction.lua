-----------------------------------
--
-- tpz.effect.SANCTION
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    -- target:addLatent(tpz.latent.SANCTION_EXP, ?, tpz.mod.EXP_BONUS, ?)
    -- Possibly handle exp bonus in core instead

    local power = effect:getPower()
    if power == 1 then
        target:addLatent(tpz.latent.SANCTION_REGEN_BONUS, 95, tpz.mod.REGEN, 1)
    elseif power == 2 then
        target:addLatent(tpz.latent.SANCTION_REFRESH_BONUS, 75, tpz.mod.REFRESH, 1)
    elseif power == 3 then
        target:addMod(tpz.mod.FOOD_DURATION, 100)
    end

    local power = getPower(target)

    target:setCharVar("SIGNET_REGEN_BONUS", power[1])
    target:setCharVar("SIGNET_REFRESH_BONUS", power[2])

    target:addMod(tpz.mod.REGEN, power[1])
    target:addMod(tpz.mod.REFRESH, power[2])

end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    -- target:delLatent(tpz.latent.SANCTION_EXP, ?, tpz.mod.EXP_BONUS, ?)

    local power = effect:getPower()
    if power == 1 then
        target:delLatent(tpz.latent.SANCTION_REGEN_BONUS, 95, tpz.mod.REGEN, 1)
    elseif power == 2 then
        target:delLatent(tpz.latent.SANCTION_REFRESH_BONUS, 75, tpz.mod.REFRESH, 1)
    elseif power == 3 then
        target:delMod(tpz.mod.FOOD_DURATION, 100)
    end

    local regen_power = target:getCharVar("SIGNET_REGEN_BONUS")
    local refresh_power = target:getCharVar("SIGNET_REFRESH_BONUS")

    target:delMod(tpz.mod.REGEN, regen_power)
    target:delMod(tpz.mod.REFRESH, refresh_power)
end

function getPower(target)

    local player_rank = target:getRank()
    local regen_power = 0
    local refresh_power = 0

    if player_rank == 10 then
        regen_power = 5
        refresh_power = 5
    elseif player_rank >= 8 then
        regen_power = 4
        refresh_power = 4
    elseif player_rank >= 6 then
        regen_power = 3
        refresh_power = 3
    elseif player_rank >= 3 then
        regen_power = 2
        refresh_power = 2
    elseif player_rank == 2 then
        regen_power = 1
        refresh_power = 1
    end

    return {regen_power, refresh_power)

end
