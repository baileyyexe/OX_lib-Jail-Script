local jailLocation = vector3(1690.0, 2565.0, 45.5) -- Bolingbroke Prison Yard
local jailRadius = 50.0
local isJailed = false
local jailTime = 0

-- Command to open jail menu
RegisterCommand('jail', function()
    lib.inputDialog('Enter Jail Command Password', {
        { type = 'input', label = 'Password', password = true, placeholder = 'Enter password' }
    }, function(input)
        if input and input[1] == 'MET123' then
            local inputData = lib.inputDialog('Jail Player', {
                { type = 'number', label = 'Player ID', placeholder = 'e.g., 1' },
                { type = 'number', label = 'Time (minutes)', placeholder = 'e.g., 10' },
                { type = 'input', label = 'Reason', placeholder = 'Reason for jailing' }
            })
            if inputData then
                TriggerServerEvent('ox_jail:jailPlayer', inputData[1], inputData[2], inputData[3])
            end
        else
            lib.notify({ title = 'Error', description = 'Incorrect password', type = 'error' })
        end
    end)
end)

-- Jail player locally
RegisterNetEvent('ox_jail:startJail', function(time)
    isJailed = true
    jailTime = time * 60 -- convert to seconds
    SetEntityCoords(PlayerPedId(), jailLocation.x, jailLocation.y, jailLocation.z)

    lib.notify({ title = 'Jail', description = 'You have been jailed for ' .. time .. ' minutes.', type = 'info' })

    CreateThread(function()
        while isJailed do
            Wait(1000)
            jailTime = jailTime - 1
            local coords = GetEntityCoords(PlayerPedId())
            if #(coords - jailLocation) > jailRadius then
                SetEntityCoords(PlayerPedId(), jailLocation.x, jailLocation.y, jailLocation.z)
                lib.notify({ title = 'Jail', description = 'Escape attempt detected.', type = 'error' })
            end
            if jailTime <= 0 then
                isJailed = false
                lib.notify({ title = 'Jail', description = 'Your sentence is over.', type = 'success' })
            end
        end
    end)
end)
