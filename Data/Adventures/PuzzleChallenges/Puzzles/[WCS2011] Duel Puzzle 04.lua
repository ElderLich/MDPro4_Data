--[[message
Reproduces a Duel Puzzle from "Yu-Gi-Oh! 5D's World Championship 2011: Over the Nexus"

Your Starting LP: 2500
Opponent's Starting LP: 9800
Complexity: 4/10.

Objective: Win this turn.
]]
Debug.ReloadFieldBegin(DUEL_ATTACK_FIRST_TURN+DUEL_SIMPLE_AI,3)
Debug.SetAIName("WCS 2011")
Debug.SetPlayerInfo(0,2500,0,0)
Debug.SetPlayerInfo(1,9800,0,0)


-- Historical effects are local to this puzzle's duel VM. Standard IDs keep
-- the normal artwork/name; these authored solutions require the original rules.
-- Source and exact adaptation receipt: _Provenance/PuzzleChallenges/HistoricalEffects.
-- Fluorohydride source: GNU GPL version 2; see the retained source license.
c87910978={}
setmetatable(c87910978,Card)
c87910978.__index=c87910978
--洗脳－ブレインコントロール
function c87910978.initial_effect(c)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_CONTROL)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetCost(c87910978.cost)
	e1:SetTarget(c87910978.target)
	e1:SetOperation(c87910978.activate)
	c:RegisterEffect(e1)
end
function c87910978.cost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.CheckLPCost(tp,800)
	else Duel.PayLPCost(tp,800)	end
end
function c87910978.filter(c)
	return c:IsControlerCanBeChanged() and c:IsFaceup()
end
function c87910978.target(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return chkc:IsLocation(LOCATION_MZONE) and chkc:IsControler(1-tp) and c87910978.filter(chkc) end
	if chk==0 then return Duel.IsExistingTarget(c87910978.filter,tp,0,LOCATION_MZONE,1,nil) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_CONTROL)
	local g=Duel.SelectTarget(tp,c87910978.filter,tp,0,LOCATION_MZONE,1,1,nil)
	Duel.SetOperationInfo(0,CATEGORY_CONTROL,g,1,0,0)
end
function c87910978.activate(e,tp,eg,ep,ev,re,r,rp)
	local tc=Duel.GetFirstTarget()
	if tc:IsRelateToEffect(e) and tc:IsFaceup() then
		Duel.GetControl(tc,tp,PHASE_END,1)
	end
end
c32646477={}
setmetatable(c32646477,Card)
c32646477.__index=c32646477
--ダーク・ダイブ・ボンバー
function c32646477.initial_effect(c)
	--synchro summon
	aux.AddSynchroProcedure(c,nil,aux.NonTuner(nil),1)
	c:EnableReviveLimit()
	--damage
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(32646477,0))
	e1:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
	e1:SetCategory(CATEGORY_DAMAGE)
	e1:SetType(EFFECT_TYPE_IGNITION)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCost(c32646477.cost)
	e1:SetTarget(c32646477.target)
	e1:SetOperation(c32646477.operation)
	c:RegisterEffect(e1)
end
function c32646477.cost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.CheckReleaseGroup(tp,Card.IsLevelAbove,1,nil,1) end
	local g=Duel.SelectReleaseGroup(tp,Card.IsLevelAbove,1,1,nil,1)
	e:SetLabel(g:GetFirst():GetLevel()*200)
	Duel.Release(g,REASON_COST)
end
function c32646477.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return true end
	Duel.SetTargetPlayer(1-tp)
	Duel.SetTargetParam(e:GetLabel())
	Duel.SetOperationInfo(0,CATEGORY_DAMAGE,nil,0,1-tp,e:GetLabel())
	e:SetLabel(0)
end
function c32646477.operation(e,tp,eg,ep,ev,re,r,rp)
	local p,d=Duel.GetChainInfo(0,CHAININFO_TARGET_PLAYER,CHAININFO_TARGET_PARAM)
	Duel.Damage(p,d,REASON_EFFECT)
end

Debug.AddCard(52352005,1,1,LOCATION_MZONE,1,POS_FACEUP_ATTACK)
Debug.AddCard(09012916,1,1,LOCATION_MZONE,2,POS_FACEUP_ATTACK)
  
Debug.AddCard(94081496,1,1,LOCATION_GRAVE,0,POS_FACEUP)

Debug.AddCard(36484016,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(59575539,0,0,LOCATION_DECK,0,POS_FACEDOWN)

Debug.AddCard(83778600,0,0,LOCATION_SZONE,1,POS_FACEDOWN)
Debug.AddCard(71587526,0,0,LOCATION_SZONE,2,POS_FACEDOWN)
Debug.AddCard(23440062,0,0,LOCATION_SZONE,3,POS_FACEDOWN)

Debug.AddCard(87910978,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(97651498,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(67723438,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(15839054,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(23557835,0,0,LOCATION_HAND,0,POS_FACEDOWN)

Debug.AddCard(43385557,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(32646477,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(40101111,0,0,LOCATION_DECK,0,POS_FACEDOWN)

Debug.ReloadFieldEnd()
Debug.ShowHint("This puzzle uses the original effects of Brain Control and Dark Strike Fighter.")
Debug.ShowHint("Win this turn.")
aux.BeginPuzzle()
--[[Solution

M1 (Main Phase 1):

Activate "Brain Control", paying 800 Life Points to select "XX-Saber Gottoms". Keep it in Attack Position so it can attack directly after Ultimate Axon Kicker destroys Black-Winged Dragon.
Activate "Foolish Revival", selecting a "Shiny Black "C"" in your opponent's Graveyard.
Activate "Karma Cut", discarding "Fabled Lurrie" to remove from play "Shiny Black "C"". After "Karma Cut" resolves, the effect of "Fabled Lurrie" will activate, Special Summoning itself.
Normal Summon "Synchro Fusionist".
Activate "Emergency Teleport", Special Summoning "Krebons" from your Deck.
Synchro Summon "Magical Android" using "Krebons", "Fabled Lurrie" and "Synchro Fusionist" as Synchro Material Monsters. When prompted, activate the effect of "Synchro Fusionist", adding "Miracle Synchro Fusion" from your Deck to your hand.
Activate "Miracle Synchro Fusion", removing from play "Magical Android" on your side of the field and "Krebons" from your Graveyard to Fusion Summon "Ultimate Axon Kicker".

BP (Battle Phase):

Attack "Black-Winged Dragon" with "Ultimate Axon Kicker". The effect of "Ultimate Axon Kicker" will activate afterwards, gaining you 2800 Life Points. Then attack directly with "XX-Saber Gottoms" for 3100 damage.
M2 (Main Phase 2):

Activate "Dimension Fusion", paying 2000 Life Points to Special Summon "Magical Android" and "Krebons".
Synchro Summon "Dark Strike Fighter" using "Krebons" and "Magical Android" as Synchro Material Monsters.
Activate the effect of "Dark Strike Fighter" 3 times, Tributing all monsters you control (Tributing "Dark Strike Fighter" last).
Activate "Wicked Rebirth", paying 800 Life Points to Special Summon "Dark Strike Fighter" from your Graveyard.
Activate the effect of "Dark Strike Fighter", Tributing itself for game.
]]