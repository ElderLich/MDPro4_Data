--[[message
Reproduces a Duel Puzzle from "Yu-Gi-Oh! World Championship 2008"

	
	Your Starting LP: 100
	Opponent's Starting LP: 3400
	Complexity: 5/10.
	Objective: Win this turn.
]]
Debug.SetAIName("WCS 2008")
Debug.ReloadFieldBegin(DUEL_ATTACK_FIRST_TURN+DUEL_SIMPLE_AI)

Debug.SetPlayerInfo(0,100,0,0)
Debug.SetPlayerInfo(1,3400,0,0)

-- Historical effects are local to this puzzle's duel VM. Standard IDs keep
-- the normal artwork/name; these authored solutions require the original rules.
-- Source and exact adaptation receipt: _Provenance/PuzzleChallenges/HistoricalEffects.
-- Fluorohydride source: GNU GPL version 2; see the retained source license.
c77565204={}
setmetatable(c77565204,Card)
c77565204.__index=c77565204
--未来融合－フューチャー・フュージョン
function c77565204.initial_effect(c)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_SPECIAL_SUMMON+CATEGORY_FUSION_SUMMON)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetTarget(c77565204.target)
	e1:SetOperation(c77565204.activate)
	c:RegisterEffect(e1)
	--Destroy
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_CONTINUOUS+EFFECT_TYPE_SINGLE)
	e2:SetCode(EVENT_LEAVE_FIELD)
	e2:SetOperation(c77565204.desop)
	c:RegisterEffect(e2)
	--Destroy2
	local e3=Effect.CreateEffect(c)
	e3:SetType(EFFECT_TYPE_CONTINUOUS+EFFECT_TYPE_FIELD)
	e3:SetRange(LOCATION_SZONE)
	e3:SetCode(EVENT_LEAVE_FIELD)
	e3:SetCondition(c77565204.descon2)
	e3:SetOperation(c77565204.desop2)
	c:RegisterEffect(e3)
end
function c77565204.filter1(c,e)
	return c:IsCanBeFusionMaterial() and c:IsAbleToGrave() and not c:IsImmuneToEffect(e)
end
function c77565204.filter2(c,m)
	return c:IsType(TYPE_FUSION) and c:CheckFusionMaterial(m) and not c:IsForbidden()
end
function c77565204.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then
		local mg=Duel.GetMatchingGroup(c77565204.filter1,tp,LOCATION_DECK,0,nil,e)
		return Duel.IsExistingMatchingCard(c77565204.filter2,tp,LOCATION_EXTRA,0,1,nil,mg)
	end
	e:GetHandler():SetTurnCounter(0)
end
function c77565204.activate(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if not c:IsRelateToEffect(e) then return end
	local mg=Duel.GetMatchingGroup(c77565204.filter1,tp,LOCATION_DECK,0,nil,e)
	local sg=Duel.GetMatchingGroup(c77565204.filter2,tp,LOCATION_EXTRA,0,nil,mg)
	if sg:GetCount()>0 then
		Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
		local tg=sg:Select(tp,1,1,nil)
		local tc=tg:GetFirst()
		Duel.ConfirmCards(1-tp,tc)
		local code=tc:GetCode()
		local mat=Duel.SelectFusionMaterial(tp,tc,mg)
		local fg=Duel.GetMatchingGroup(Card.IsCode,tp,LOCATION_EXTRA,0,nil,code)
		local tc=fg:GetFirst()
		while tc do
			tc:SetMaterial(mat)
			tc=fg:GetNext()
		end
		Duel.SendtoGrave(mat,REASON_EFFECT+REASON_MATERIAL+REASON_FUSION)
		--special summon
		local e1=Effect.CreateEffect(c)
		e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
		e1:SetCode(EVENT_PHASE+PHASE_STANDBY)
		e1:SetCountLimit(1)
		e1:SetReset(RESET_EVENT+0x1ff0000+RESET_PHASE+PHASE_STANDBY+RESET_SELF_TURN,2)
		e1:SetRange(LOCATION_SZONE)
		e1:SetCondition(c77565204.proccon)
		e1:SetOperation(c77565204.procop)
		e1:SetLabel(code)
		e1:SetLabelObject(e)
		c:RegisterEffect(e1)
	end
end
function c77565204.procfilter(c,code,e,tp)
	return c:IsCode(code) and c:IsCanBeSpecialSummoned(e,SUMMON_TYPE_FUSION,tp,false,false)
end
function c77565204.proccon(e,tp,eg,ep,ev,re,r,rp)
	return tp==Duel.GetTurnPlayer()
end
function c77565204.procop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local ct=c:GetTurnCounter()
	ct=ct+1
	c:SetTurnCounter(ct)
	if ct==2 then
		local code=e:GetLabel()
		local tc=Duel.GetFirstMatchingCard(c77565204.procfilter,tp,LOCATION_EXTRA,0,nil,code,e,tp)
		if not tc then return end
		if Duel.GetLocationCount(tp,LOCATION_MZONE)<=0 then
			Duel.SendtoGrave(tc,REASON_EFFECT)
			tc:CompleteProcedure()
		else
			Duel.SpecialSummon(tc,SUMMON_TYPE_FUSION,tp,tp,false,false,POS_FACEUP)
			tc:CompleteProcedure()
			c:SetCardTarget(tc)
		end
	end
end
function c77565204.desop(e,tp,eg,ep,ev,re,r,rp)
	local tc=e:GetHandler():GetFirstCardTarget()
	if tc and tc:IsLocation(LOCATION_MZONE) then
		Duel.Destroy(tc,REASON_EFFECT)
	end
end
function c77565204.descon2(e,tp,eg,ep,ev,re,r,rp)
	local tc=e:GetHandler():GetFirstCardTarget()
	return tc and eg:IsContains(tc) and tc:IsReason(REASON_DESTROY)
end
function c77565204.desop2(e,tp,eg,ep,ev,re,r,rp)
	Duel.Destroy(e:GetHandler(),REASON_EFFECT)
end

Debug.AddCard(89631139,1,1,LOCATION_MZONE,1,POS_FACEUP_ATTACK)
Debug.AddCard(23995346,1,1,LOCATION_MZONE,2,POS_FACEUP_ATTACK)

Debug.AddCard(47297616,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(03954901,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(89631139,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(77625948,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(47754278,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(41230939,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(03019642,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(59464593,0,0,LOCATION_DECK,0,POS_FACEDOWN)

Debug.AddCard(97077563,0,0,LOCATION_SZONE,2,POS_FACEDOWN)

Debug.AddCard(85087012,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(80033124,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(05318639,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(77565204,0,0,LOCATION_HAND,0,POS_FACEDOWN)

Debug.AddCard(40418351,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(99267150,0,0,LOCATION_DECK,0,POS_FACEDOWN)


Debug.ReloadFieldEnd()
Debug.ShowHint("This puzzle uses the original effect of Future Fusion.")
Debug.ShowHint("Win this turn.")
aux.BeginPuzzle()

--[[Solution
- Activate Future Fusion. Select Five-Headed Dragon and Armed Dragon Lv 10, Infernal Dragon, Felgrand Dragon, Blue-Eyes White Dragon, Light and Darkness Dragon as Fusion Materials.
- Summon Card Trooper and activate it's effect to send Cyberdark Keel, Cyberdark Edge and Cyberdark Horn to the graveyard.
- Activate Cyberdark Impact! to summon Cyberdark Dragon and equip it with Felgrand Dragon.
- Battle Phase, attack Blue-Eyes White Dragon with Cyberdark Dragon.
- Activate Mystical Space Typhoon to destroy Felgrand Dragon.
- Activate Call of the Haunted to summon Felgrand Dragon, and select Armed Dragon LV 10 with it's effect.
- Attack Blue-Eyes Ultimate Dragon with Felgrand Dragon.
- Attack directly with Card Trooper.

]]