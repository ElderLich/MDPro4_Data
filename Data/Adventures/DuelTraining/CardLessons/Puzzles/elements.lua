-- Authored for MDPro4 Duel Adventures; current ocgcore rules.
-- This is not an original Master Duel tutorial or loaner-deck scenario.
Debug.SetAIName("The Elements Reunited")
Debug.ReloadFieldBegin(DUEL_ATTACK_FIRST_TURN+DUEL_SIMPLE_AI,4)
Debug.SetPlayerInfo(0,8000,0,0)
Debug.SetPlayerInfo(1,2500,0,0)

Debug.AddCard(83032858,0,0,LOCATION_MZONE,0,POS_FACEUP_ATTACK) -- Elementsaber Aina
Debug.AddCard(19036557,0,0,LOCATION_HAND,0,POS_FACEUP_ATTACK) -- Elementsaber Makani
Debug.AddCard(45702014,0,0,LOCATION_GRAVE,0,POS_FACEUP_ATTACK) -- Elementsaber Molehu

Debug.ReloadFieldEnd()
Debug.ShowHint("Use Aina to send Makani from your hand to the GY and revive Molehu in Attack Position. Attack with both monsters to win this turn.")
aux.BeginPuzzle()

--[[message
Use Aina to send Makani from your hand to the GY and revive Molehu in Attack Position. Attack with both monsters to win this turn.
]]

--[[solution
Activate Elementsaber Aina: send Makani from the hand to the GY as cost, target Molehu, and Special Summon it in Attack Position. In the Battle Phase, attack directly with Aina (900) and Molehu (1900). Makani's GY effect may also change its Attribute this turn; that optional action does not replace the duel's win condition.
]]
