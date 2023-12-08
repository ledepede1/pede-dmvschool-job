TriggerEvent('esx_society:registerSociety', Config.School.JobName, "Driving Instructor", 'society_'..Config.School.JobName, 'society_'..Config.School.JobName, 'society_'..Config.School.JobName, {type = 'private'})

local list = MySQL.Sync.fetchAll('SELECT name FROM `addon_account` WHERE `name` = ?', {
    'society_'..Config.School.JobName
})
if not list[1] then
MySQL.insert.await('INSERT INTO `addon_account` (name, label, shared) VALUES (?, ?, ?)', {
    'society_'..Config.School.JobName, "Driving Instructor", 1
})
MySQL.insert.await('INSERT INTO `addon_account_data` (account_name, money) VALUES (?, ?)', {
    'society_'..Config.School.JobName, 0
})
print("Created new Society: "..'society_'..Config.School.JobName)
end

RegisterNetEvent("spawnCar_pede:server")
AddEventHandler("spawnCar_pede:server", function (car)
    TriggerClientEvent("spawnCar_pede:client", -1, car)
end)

RegisterNetEvent("GiveLicense:pede:server")
AddEventHandler("GiveLicense:pede:server", function(id)
    TriggerEvent('esx_license:addLicense', id, "dmv", function()
    end)
end)
