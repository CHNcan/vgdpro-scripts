--救翼天使 扎雷乌萨耶尔
local cm,m,o=GetID()
function cm.initial_effect(c)
	vgf.VgCard(c)
	--【起】【V】【1回合1次】：通过【费用】[计数爆发1]，从你的牌堆里探寻至多1张与这个单位同名的卡，公开后加入手牌，然后牌堆洗切，这个回合中，这个单位的力量+10000。
	vgd.EffectTypeIgnition(c,m,LOCATION_MZONE,cm.operation,vgf.DamageCost(1),vgf.VMonsterCondition,nil,1)
	--【自】【V】：这个单位攻击先导者时，通过【费用】[能量爆发4]，选择你的弃牌区中的1张等级3以下的普通单位卡，CALL到R上，这个回合中，那个单位的力量+10000。
	vgd.EffectTypeTrigger(c,m,LOCATION_MZONE,EFFECT_TYPE_SINGLE,EVENT_ATTACK_ANNOUNCE,cm.operation2,vgf.EnegyCost(4),cm.condition)
end
function cm.operation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	vgf.SearchCardOP(LOCATION_DECK,cm.fliter,e,tp,eg,ep,ev,re,r,rp)
	vgf.AtkUp(c,c,10000,nil)
end
function cm.fliter(c)
	return c:IsCode(m)
end
function cm.condition(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	return vgf.VMonsterCondition(c) and vgf.VMonsterFilter(Duel.GetAttackTarget())
end
function cm.operation2(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	vgf.SearchCardSpecialSummonOP(LOCATION_DROP,cm.fliter2,e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetOperatedGroup()
	vgf.AtkUp(c,g,10000)
end
function cm.fliter2(c)
	return vgf.IsLevel(c,1,2,3)
end