QBCore = exports['qb-core']:GetCoreObject()

-- RegisterNetEvent('juice-crime:server:jailLostRep', function(playerId, sentence)
--     local src = source
--     local Player = QBCore.Functions.GetPlayer(src)
--     if sentence > 0 then
--         local repType = Config.Reputation
--         local currentRep = Player.PlayerData.metadata.jobrep[repType] or 0
--         local newRep = (currentRep - sentence)
--         Player.PlayerData.metadata.jobrep[repType] = newRep
--         Player.Functions.UpdatePlayerData()
--     end
-- end)


local Query = {
    DELETE = 'DELETE FROM `gang-lab` WHERE id = ?',
    INSERT = 'INSERT INTO `gang-lab` SET id = ?, owner = ?, data = ?',
    SELECT_ALL = 'SELECT * FROM `gang-lab`',
    UPDATE = 'UPDATE `gang-lab` SET data = ? WHERE id = ?',
}

CreateThread(function()
    local success, result = pcall(MySQL.scalar.await, 'SELECT 1 FROM `gang-lab`')

    if not success then
        MySQL.query([[CREATE TABLE `gang-lab` (
            `id` int(11) DEFAULT NULL,
            `gang_owner` varchar(46) DEFAULT NULL,
            `lab_type` longtext DEFAULT NULL,
            `lab_price` int(11) DEFAULT NULL,
            `lab_fee` int(11) DEFAULT NULL,
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
		]])

        print('^5UNIQ^2 Database installed successfully^0')
    end
end)