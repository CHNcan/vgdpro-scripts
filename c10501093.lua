--可靠的最高年级生 阿莉艾斯
local cm,m,o=GetID()
function cm.initial_effect(c)
    vgf.VgCard(c)
    -- 【永】【G】：你的不存在单位的R有3个以上的话，这个单位的盾护+10000。
    vgd.EffectTypeContinuousChangeAttack(c,EFFECT_TYPE_SINGLE,10000,cm.con,tg,EFFECT_UPDATE_DEFENSE,reset,LOCATION_GZONE)
end

function cm.con(e,tp,eg,ep,ev,re,r,rp)
    local ct1 = bit.ReturnCount(vgf.GetAvailableLocation(tp))
    local ct2 = Duel.GetMatchingGroupCount(vgf.RMonsterFilter,tp,LOCATION_MZONE,0,nil)
    return ct1 - ct2 >= 3
end
