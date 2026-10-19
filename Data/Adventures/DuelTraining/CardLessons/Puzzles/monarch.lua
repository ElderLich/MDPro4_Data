-- Authored for MDPro4 Duel Adventures; current ocgcore rules.
-- This is not an original Master Duel tutorial or loaner-deck scenario.
Debug.SetAIName("A Monarch's Tribute")
Debug.ReloadFieldBegin(DUEL_ATTACK_FIRST_TURN+DUEL_SIMPLE_AI,4)
Debug.SetPlayerInfo(0,8000,0,0)
Debug.SetPlayerInfo(1,1000,0,0)

Debug.AddCard(9748752,0,0,LOCATION_HAND,0,POS_FACEUP_ATTACK) -- Caius the Shadow Monarch
Debug.AddCard(5053103,0,0,LOCATION_MZONE,0,POS_FACEUP_ATTACK) -- Battle Ox
Debug.AddCard(46986414,1,1,LOCATION_MZONE,0,POS_FACEUP_ATTACK) -- Dark Magician

Debug.ReloadFieldEnd()
Debug.ShowHint("Tribute Battle Ox to summon Caius. Use its effect on the opposing DARK monster and win this turn.")
aux.BeginPuzzle()

--[[message
Tribute Battle Ox to summon Caius. Use its effect on the opposing DARK monster and win this turn.
]]

--[[solution
Tribute Battle Ox to Tribute Summon Caius the Shadow Monarch. Target Dark Magician with Caius's mandatory effect. Banish it and inflict 1000 damage.
]]
