-------------------------------- configuration options for script

--- Reputation
Config.Reputation = 'criminal' --- name of reputation metadata field to be pulled from the ResetDispatchSpawnBlockingAreas()
Config.lostRep = 0.1 --- amount of rep lost per month when sent to jail
Config.controlContested = (60 * 60 *24) --- time that control of a lab becomes contested when the owner's rep falls below the threshold

--- options
Config.repThresholdMeth = 1 --- reputation threshold to trigger POSSIBLY receiving an email with a mission to complete to give keys to specified lab
Config.repThresholdCoke = 1 --- reputation threshold to trigger POSSIBLY receiving an email with a mission to complete to give keys to specified lab
Cong.repThresholdWeed = 1 --- reputation threshold to trigger POSSIBLY receiving an email with a mission to complete to give keys to specified lab

--- Lab locations
Config.methLab = vector3() --- shell teleport vector 3 location
Config.cokeLab = vector3() --- shell teleport vector 3 location
Config.weedLab = vector3() --- shell teleport vector 3 location

--- Lab doors
Config.methDoor = vector3()
Config.cokeDoor = vector3()
Config.weedDoor = vector3()

--- If an item is required to enter the doors
Config.itemRequired = true --- true or false statement whether an item is required to enter the lab

--- Given Keys to lab
Config.keysToCastle = false --- true or false statement whether an individual is given keys to the lab and does not require a physical item to enter

--- Amount of rep that is lost per cycle
Config.repLost = 1

--- How long is a cycle in minutes 
Config.Cycle = 120

