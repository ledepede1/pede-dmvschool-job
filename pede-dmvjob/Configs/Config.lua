Config = {}

Config.Notifications = {
    Title = 'Køreskole',

    SpawnedCar = {
        desc = "Spawnede en ",
        type = "successs",
    },
    NoSpaceCar = {
        desc = "Der ikke plads til dette køretøj!",
        type = "error",
    },
    NoPlayersNearby = {
        desc = "Der ikke nogen spillere i nærheden!",
        type = "error",
    },
}

Config.School = {

        JobName = "driveinstructor",

        Targets = {
            bossMenu = { 
                coords = vector3(214.4833,-1400.1876,30.5835),  -- x = 214.4833,  y = -1400.1876,  z = 30.5835
                label = "Administrer",
                icon = "fa-solid fa-book",
            },
            jobTarget = {
                coords = vector3(210.4458,-1381.7926,30.5835),  -- x = 210.4458,  y = -1381.7926,  z = 30.5835
                label = "Job Menu",
                icon = "fa-solid fa-book",
            },
            garageTarget = {
                coords = vector3(213.0045,-1399.3955,30.5835),  -- x = 213.0045,  y = -1399.3955,  z = 30.5835
                label = "Tag bil",
                icon = "fa-solid fa-car",
            }
        }
}

Config.JobMenu = {
    Main = {
        Title = "Job Menu",
    },

    Options = {
        GiveCard = {
            Label = "Giv Kørekort",
        },
        Invoices = {
            Label = "Giv Faktura",
            Dialog = {
                Title = "Send faktura",
                label = "Pris",
                Desc = "Pris på kørekortet",
            }
        },
        -- .......
    }
}

Config.CarSpawnCoords = {-- { 218.7335, -1384.4832, 30.5723, 259.8118 }
    x = 218.7335, 
    y = -1384.4832, 
    z = 30.5723,
    heading = 259.8118,
}

Config.RemoveCar = "[E] - Fjern køretøj"
Config.CarRemoveCoords = {-- x = 217.0133,  y = -1381.3336,  z = 30.5646
    x = 217.0133, 
    y = -1381.3336, 
    z = 30.5646,
}

Config.GarageMenu = {

    Main = {

    },

    Cars = {
        [1] = {
            modelName = "blista",
            title = "Blista",
        },
        [2] = {
            modelName = "blista2",
            title = "Blista 2",
        },
    }
}

