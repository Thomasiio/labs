QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('juice-crime:server:jailLostRep', function(playerId, sentence)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if sentence > 0 then
        local repType = Config.Reputation
        local currentRep = Player.PlayerData.metadata.jobrep[repType] or 0
        local newRep = (currentRep - sentence)
        Player.PlayerData.metadata.jobrep[repType] = newRep
        Player.Functions.UpdatePlayerData()
    end
end)