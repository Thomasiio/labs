QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('client:juice-crime:purchaseLab', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local playerGang = PlayerData.gang
    for _, v in pairs(QBShared.Gangs) do
        if not playerGang then
            return
        else
            if PlayerData.gang.isboss then
                TriggerServerEvent("juice-crime:server:purchaseLab", playerGang)
            end
        end
    end

end)