-- Authored for MDPro4 Duel Adventures; current ocgcore rules.
-- This is not an original Master Duel tutorial or loaner-deck scenario.
Debug.SetAIName("Power Through Tribute")
Debug.ReloadFieldBegin(DUEL_ATTACK_FIRST_TURN+DUEL_SIMPLE_AI,4)
Debug.SetPlayerInfo(0,8000,0,0)
Debug.SetPlayerInfo(1,800,0,0)

Debug.AddCard(70781052,0,0,LOCATION_HAND,0,POS_FACEUP_ATTACK) -- Summoned Skull
Debug.AddCard(15025844,0,0,LOCATION_MZONE,0,POS_FACEUP_DEFENSE) -- Mystical Elf
Debug.AddCard(5053103,1,1,LOCATION_MZONE,0,POS_FACEUP_ATTACK) -- Battle Ox

Debug.ReloadFieldEnd()
Debug.ShowHint("Tribute Mystical Elf to summon Summoned Skull. Attack Battle Ox to win this turn.")
aux.BeginPuzzle()

--[[message
Tribute Mystical Elf to summon Summoned Skull. Attack Battle Ox to win this turn.
]]

--[[solution
Tribute the face-up Mystical Elf to Tribute Summon Summoned Skull. Attack Battle Ox: 2500 minus 1700 inflicts the required 800 damage.
]]
