RegisterNetEvent('ox_jail:jailPlayer', function(targetId, time, reason)
    local src = source
    if targetId and time and reason then
        TriggerClientEvent('ox_jail:startJail', targetId, time)
        print(('[JAIL] Player %s jailed Player %s for %s minutes. Reason: %s'):format(src, targetId, time, reason))
    end
end)
