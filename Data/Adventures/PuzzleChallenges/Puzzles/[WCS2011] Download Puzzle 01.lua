--[[message
Reproduces a Duel Puzzle from "Yu-Gi-Oh! 5D's World Championship 2011: Over the Nexus"
	
	
Your Starting LP: 2500
Opponent's Starting LP: 57300
Complexity: 7/10.

Objective: Win this turn.
]]
Debug.SetAIName("WCS 2011")
Debug.ReloadFieldBegin(DUEL_ATTACK_FIRST_TURN+DUEL_SIMPLE_AI,3)
Debug.SetPlayerInfo(0,2500,0,0)
Debug.SetPlayerInfo(1,57300,0,0)
-- Historical effects are local to this puzzle's duel VM. Standard IDs keep
-- the normal artwork/name; these authored solutions require the original rules.
-- Source and exact adaptation receipt: _Provenance/PuzzleChallenges/HistoricalEffects.
-- Fluorohydride source: GNU GPL version 2; see the retained source license.
c50321796={}
setmetatable(c50321796,Card)
c50321796.__index=c50321796
--氷結界の龍 ブリューナク
function c50321796.initial_effect(c)
	--synchro summon
	aux.AddSynchroProcedure(c,nil,aux.NonTuner(nil),1)
	c:EnableReviveLimit()
	--to hand
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(50321796,0))
	e1:SetCategory(CATEGORY_TOHAND)
	e1:SetType(EFFECT_TYPE_IGNITION)
	e1:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCost(c50321796.cost)
	e1:SetTarget(c50321796.target)
	e1:SetOperation(c50321796.operation)
	c:RegisterEffect(e1)
end
function c50321796.costfilter(c)
	return c:IsDiscardable() and c:IsAbleToGraveAsCost()
end
function c50321796.cost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(c50321796.costfilter,tp,LOCATION_HAND,0,1,e:GetHandler()) end
	local rt=Duel.GetTargetCount(Card.IsAbleToHand,tp,LOCATION_ONFIELD,LOCATION_ONFIELD,nil)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_DISCARD)
	local cg=Duel.SelectMatchingCard(tp,c50321796.costfilter,tp,LOCATION_HAND,0,1,rt,nil)
	Duel.SendtoGrave(cg,REASON_COST+REASON_DISCARD)
	e:SetLabel(cg:GetCount())
end
function c50321796.target(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return chkc:IsOnField() and chkc:IsAbleToHand() end
	if chk==0 then return Duel.IsExistingTarget(Card.IsAbleToHand,tp,LOCATION_ONFIELD,LOCATION_ONFIELD,1,nil) end
	local ct=e:GetLabel()
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_RTOHAND)
	local eg=Duel.SelectTarget(tp,Card.IsAbleToHand,tp,LOCATION_ONFIELD,LOCATION_ONFIELD,ct,ct,nil)
	Duel.SetOperationInfo(0,CATEGORY_TOHAND,eg,ct,0,0)
end
function c50321796.operation(e,tp,eg,ep,ev,re,r,rp,chk)
	local tg=Duel.GetChainInfo(0,CHAININFO_TARGET_CARDS)
	local rg=tg:Filter(Card.IsRelateToEffect,nil,e)
	if rg:GetCount()>0 then 
		Duel.SendtoHand(rg,nil,REASON_EFFECT)
	end
end

Debug.AddCard(33396948,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(7902349,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(70903634,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(12600382,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(12600382,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(27770341,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(44519536,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(8124921,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(9433350,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(9433350,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(53129443,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(39701395,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(27770341,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(62154416,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(64034255,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(22624373,0,0,LOCATION_MZONE,1,POS_FACEUP_ATTACK)
Debug.AddCard(50321796,0,0,LOCATION_MZONE,2,POS_FACEUP_ATTACK)
Debug.AddCard(14943837,0,0,LOCATION_MZONE,3,POS_FACEUP_ATTACK)
Debug.AddCard(31924889,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(44508094,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(68140974,1,1,LOCATION_MZONE,1,POS_FACEUP_ATTACK)
Debug.AddCard(68140974,1,1,LOCATION_MZONE,2,POS_FACEUP_ATTACK)
Debug.AddCard(68140974,1,1,LOCATION_MZONE,3,POS_FACEUP_ATTACK)
Debug.AddCard(84970821,1,1,LOCATION_SZONE,2,POS_FACEUP)
Debug.ReloadFieldEnd()
Debug.ShowHint("This puzzle uses the original effect of Brionac, Dragon of the Ice Barrier.")
Debug.ShowHint("Win this turn.")
aux.BeginPuzzle()
--[[
Solution:

Activate the effect of "Lyla, Lightsworn Sorceress", selecting "Curse of Darkness".
Activate the effect of "Genex Ally Birdman", returning "Debris Dragon" to your hand to Special Summon it.
Synchro Summon "Arcanite Magician" using "Lyla, Lightsworn Sorceress" and "Genex Ally Birdman" as Synchro Material Monsters.
Normal Summon "Frequency Magician".
Activate the effect of Arcanite Magician 3 times to destroy all 3 copies of "Meklord Emperor Wisel ∞".
Activate Cards of Consonance, discard "Debris Dragon" to draw 2 cards.
Set "Super Rejuvenation" and "Dark Hole".
Activate the effect of "Brionac, Dragon of the Ice Barrier", discarding both copies of "Malefic Blue-Eyes White Dragon" to return your Set "Super Rejuvenation" and "Dark Hole" to your hand.
Synchro Summon "Stardust Dragon" using "Brionac, Dragon of the Ice Barrier" and "Frequency Magician" as Synchro Material Monsters.
Activate "Dark Hole", then Chain the effect of "Stardust Dragon".
Activate "Super Rejuvenation".
Move to the End Phase
Choose "Yes" when prompted to revive "Stardust Dragon".
The effect of "Super Rejuvenation" resolves. IMPORTANT: Make sure you are holding down the A button at this point! You will draw 4 cards.
Provided you were holding the A button down, you will be asked if you wish to activate a card. Choose "Yes" and activate the "Super Rejuvenation" you just drew. You will draw 4 more cards and win via the effect of "Exodia the Forbidden One".

]]