-- Authored for MDPro4 Duel Adventures; current ocgcore rules.
-- This is not an original Master Duel tutorial or loaner-deck scenario.
Debug.SetAIName("Your First Summon")
Debug.ReloadFieldBegin(DUEL_ATTACK_FIRST_TURN+DUEL_SIMPLE_AI,4)
Debug.SetPlayerInfo(0,8000,0,0)
Debug.SetPlayerInfo(1,1800,0,0)

Debug.AddCard(69140098,0,0,LOCATION_HAND,0,POS_FACEUP_ATTACK) -- Gemini Elf

Debug.ReloadFieldEnd()
Debug.ShowHint("Normal Summon Gemini Elf, enter the Battle Phase, and attack directly to win this turn.")
aux.BeginPuzzle()

--[[message
Normal Summon Gemini Elf, enter the Battle Phase, and attack directly to win this turn.
]]

--[[solution
Normal Summon Gemini Elf in Attack Position. Enter the Battle Phase and attack the opponent directly for 1900 damage.
]]
