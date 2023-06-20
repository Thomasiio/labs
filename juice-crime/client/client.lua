QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('client:juice-crime:purchaseLab', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local playerGang = PlayerData.gang
    for _, v in pairs(QBShared.Gangs) do
        if not playerGang then
            if PlayerData.gang.isboss then
                TriggerServerEvent("juice-crime:server:purchaseLab", playerGang)
            end
        else
            lib.notify({
                id = 'notBoss',
                title = 'Gangs',
                description = 'You ain\'t no boss, on hood.',
                position = 'top',
                style = {
                    backgroundColor = '',
                    color = '',
                },
                icon = 'ban',
                iconColor = ''

            })
        end
    end
end)