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
    local success, result = pcall(MySQL.scalar.await, 'SELECT 1 FROM `gang_labs`')

    if not success then
        MySQL.query([[CREATE TABLE `gang_labs` (
            `id` INT(11) NOT NULL AUTO_INCREMENT,
            `gang_name` VARCHAR(255) NOT NULL,
            `lab_type` VARCHAR(50) NOT NULL,
            `lab_price` INT(11) NOT NULL,
            `lab_fee` INT(11) NOT NULL,
            `payment_cycles` INT(11) NOT NULL,
            PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
        ]])
        print('^5Gang Labs Table Created^0')
    end
end)

RegisterServerEvent('gangs:purchaseLab')
AddEventHandler('gangs:purchaseLab', function(gangName, labType)
    local labPrice = Config.LabPrice[labType]
    local labFee = Config.LabFee[labType]
    local paymentCycles = Config.GracePeriod

    -- Check if the gang has enough money
    -- Deduct money from the gang's account

    -- Insert the lab data into the database
    local insertQuery = 'INSERT INTO `gang_labs` (gang_name, lab_type, lab_price, lab_fee, payment_cycles) VALUES (@gangName, @labType, @labPrice, @labFee, @paymentCycles)'
    local params = {
        ['@gangName'] = gangName,
        ['@labType'] = labType,
        ['@labPrice'] = labPrice,
        ['@labFee'] = labFee,
        ['@paymentCycles'] = paymentCycles
    }
    MySQL.Async.execute(insertQuery, params, function(rowsChanged)
        -- Handle success or failure
        if rowsChanged > 0 then
            print(labType, "has been added to the database")
        else
            print('Failed to update labs in database')
        end
    end)
end)
