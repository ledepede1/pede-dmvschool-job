local ox_target = exports.ox_target


        ox_target:addBoxZone({
            coords = Config.School.Targets.bossMenu.coords,
            size = vec3(3, 3, 3),
            rotation = 45,
            drawSprite = true,
            options = {
                {
                    canInteract = function()
                        if HasJob(Config.School.JobName, "boss") then
                            return true
                        end
                        return false
                    end,
                    name = 'bossmenutarget.pede',
                    onSelect = function()
                        TriggerEvent('esx_society:openBossMenu', Config.School.JobName, function (data, menu)
                            --menu.close()
                        end, {wash = false})        
                    end,
                    icon = Config.School.Targets.bossMenu.icon, 
                    label = Config.School.Targets.bossMenu.label
                }
            }
        })

        ox_target:addBoxZone({
            coords = Config.School.Targets.jobTarget.coords,
            size = vec3(3, 3, 3),
            rotation = 45,
            drawSprite = true,
            options = {
                {
                    canInteract = function()
                        if HasJob(Config.School.JobName) then
                            return true
                        end
                        return false
                    end,
                    name = 'jobtarget.pede',
                    onSelect = function()
                        JobMenu()
                    end,
                    icon = Config.School.Targets.jobTarget.icon, 
                    label = Config.School.Targets.jobTarget.label
                }
            }
        })

        ox_target:addBoxZone({
            coords = Config.School.Targets.garageTarget.coords,
            size = vec3(3, 3, 3),
            rotation = 45,
            drawSprite = true,
            options = {
                {
                    canInteract = function()
                        if HasJob(Config.School.JobName) then
                            return true
                        end
                        return false
                    end,
                    name = 'garagetarget.pede',
                    onSelect = function()
                        SpawnCarMenu()
                    end,
                    icon = Config.School.Targets.garageTarget.icon, 
                    label = Config.School.Targets.garageTarget.label
                }
            }
        })



