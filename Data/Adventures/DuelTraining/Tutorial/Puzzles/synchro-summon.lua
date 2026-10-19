-- Authored for MDPro4 Duel Adventures; current ocgcore rules.
-- This is not an original Master Duel tutorial or loaner-deck scenario.
Debug.SetAIName("A Perfect Synchronization")
Debug.ReloadFieldBegin(DUEL_ATTACK_FIRST_TURN+DUEL_SIMPLE_AI,4)
Debug.SetPlayerInfo(0,8000,0,0)
Debug.SetPlayerInfo(1,2300,0,0)

Debug.AddCard(63977008,0,0,LOCATION_MZONE,0,POS_FACEUP_ATTACK) -- Junk Synchron
Debug.AddCard(9365703,0,0,LOCATION_MZONE,1,POS_FACEUP_ATTACK) -- Speed Warrior
Debug.AddCard(60800381,0,0,LOCATION_EXTRA,0,POS_FACEDOWN) -- Junk Warrior

Debug.ReloadFieldEnd()
Debug.ShowHint("Combine Level 3 Junk Synchron and Level 2 Speed Warrior to Synchro Summon Junk Warrior, then attack directly to win this turn.")
aux.BeginPuzzle()

--[[message
Combine Level 3 Junk Synchron and Level 2 Speed Warrior to Synchro Summon Junk Warrior, then attack directly to win this turn.
]]

--[[solution
Select Junk Warrior in the Extra Deck and Synchro Summon it using Junk Synchron (Level 3 Tuner) and Speed Warrior (Level 2 non-Tuner). Attack directly for 2300 damage.
]]
