Debug.ReloadFieldBegin(DUEL_ATTACK_FIRST_TURN+DUEL_SIMPLE_AI,5)
Debug.SetPlayerInfo(0,100,0,0)
Debug.SetPlayerInfo(1,2500,0,0)

--[[message
Yu-Gi-Oh! World Championship Tournament 2006
Roll Out!
]]

Debug.AddCard(10209545,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(8964854,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(47693640,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(91597389,0,0,LOCATION_SZONE,2,POS_FACEDOWN)
Debug.AddCard(26931058,0,0,LOCATION_SZONE,3,POS_FACEDOWN)
Debug.AddCard(97623219,1,1,LOCATION_MZONE,2,POS_FACEUP_ATTACK,true)

Debug.ReloadFieldEnd()
Debug.ShowHint("Win this turn.")
aux.BeginPuzzle()