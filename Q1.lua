local function releaseStorage(player)
    if player then
        player:setStorageValue(1000, -1)  -- Ensure player exists before setting storage
    end
end

-- Function when player logs out
function onLogout(player)
    if player and player:getStorageValue(1000) == 1 then
        -- Schedule the releaseStorage function to run after 1 second (1000 milliseconds)
        addEvent(function() releaseStorage(player) end, 1000)  -- Use inline function for correct context
    end
    return true  -- successful logout
end