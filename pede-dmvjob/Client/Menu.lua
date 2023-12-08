function BossMenu()
  -- ...
end

function JobMenu()
  lib.registerContext({
    id = 'job_menu_pede',
    title = Config.JobMenu.Main.Title,
    menu = 'job_menu_pede',
    options = {
      {
        title = Config.JobMenu.Options.GiveCard.Label,
        onSelect = function()
          local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

          if closestPlayer == -1 or closestDistance > 3.0 then
            lib.notify({
              title = Config.Notifications.Title,
              description = Config.Notifications.NoPlayersNearby.desc,
              type = Config.Notifications.NoPlayersNearby.type
          })
          else
          TriggerServerEvent("GiveLicense:pede:server", closestPlayer)
          end
        end,
      },
      {
        title = Config.JobMenu.Options.Invoices.Label,
        onSelect = function()
          local amount = lib.inputDialog(Config.JobMenu.Options.Invoices.Dialog.Title, {
            {type = 'number', label = Config.JobMenu.Options.Invoices.Dialog.label, description = Config.JobMenu.Options.Invoices.Dialog.desc, icon = 'hashtag'},
          })
        if amount == nil then return end

        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

        if closestPlayer == -1 or closestDistance > 3.0 then
          lib.notify({
            title = Config.Notifications.Title,
            description = Config.Notifications.NoPlayersNearby.desc,
            type = Config.Notifications.NoPlayersNearby.type
        })
        else
          TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_'..Config.School.JobName, 'Driving Instructor', amount[1])
          end
        end,
      }
    }
  })
 
  lib.showContext('job_menu_pede')
end

function SpawnCarMenu()
  local options = GetCars()

    lib.registerContext({
      id = 'spawn_car_menu_pede',
      title = 'Garage',
      menu = 'spawn_car_menu_pede',
      options = options
    })
   
    lib.showContext('spawn_car_menu_pede')
end