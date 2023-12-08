RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
    TriggerServerEvent("playerSpawn:Pede")
end)
    
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

function HasJob(Jobname, Grade)
    if Grade == nil then
        if ESX.PlayerData.job.name == Jobname then
            return true
        end
    else
        if ESX.PlayerData.job.name == Jobname then
            if ESX.PlayerData.job.grade_name == Grade then
                return true
            end
        end
    end
    return false
end

function GetCars()
    local options = {}

    for _,v in pairs(Config.GarageMenu.Cars) do
        local modelName = v.modelName
        local title = v.title

        table.insert(options, {
            title = title,
            onSelect = function()
                if not IsPositionOccupied(Config.CarSpawnCoords.x, Config.CarSpawnCoords.y, Config.CarSpawnCoords.z, 5, false, true, false, false, false, 0, false) then
                    TriggerServerEvent("spawnCar_pede:server", modelName)
                        lib.notify({
                            title = Config.Notifications.Title,
                            description = Config.Notifications.SpawnedCar.desc..title,
                            type = Config.Notifications.SpawnedCar.type
                        })
                    else
                        lib.notify({
                            title = Config.Notifications.Title,
                            description = Config.Notifications.NoSpaceCar.desc,
                            type = Config.Notifications.NoSpaceCar.type
                        })
                end
            end
        })
    end

    return options
end

RegisterNetEvent("spawnCar_pede:client")
AddEventHandler("spawnCar_pede:client", function (car)

    if not IsModelInCdimage(GetHashKey(car)) then return end
    RequestModel(GetHashKey(car)) -- Request the model
    while not HasModelLoaded(GetHashKey(car)) do -- Waits for the model to load
    Wait(0)
    end

    CreateVehicle(GetHashKey(car), Config.CarSpawnCoords.x, Config.CarSpawnCoords.y, Config.CarSpawnCoords.z, Config.CarSpawnCoords.heading, true, false)
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
        local ped = GetPlayerPed(-1 )
        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
        local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Config.CarRemoveCoords.x, Config.CarRemoveCoords.y, Config.CarRemoveCoords.z)
        if (IsPedSittingInAnyVehicle(ped)) then
            DrawMarker(1, Config.CarRemoveCoords.x, Config.CarRemoveCoords.y, Config.CarRemoveCoords.z-1, 0, 0, 0, 0, 0, 0, 2.001, 2.0001, 0.3001, 0, 0, 255, 200, 0, 0, 0, 0)
            if dist <= 3.2 then
                lib.showTextUI(Config.RemoveCar)
                if IsControlJustPressed(0,38) then
                    local vehicle = GetVehiclePedIsIn(ped, false)
                    ESX.Game.DeleteVehicle(vehicle)
                end
                else if dist > 3.2 and lib.isTextUIOpen() then
                    lib.hideTextUI()
                end
            end
            else if lib.isTextUIOpen() then
                lib.hideTextUI()
            end
        end
	end
end)
