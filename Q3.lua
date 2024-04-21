function do_sth_with_PlayerParty(playerId, membername)
    player = Player(playerId)
    --add error handling if player is not found:
    if not player then
        print("Player not found.")
        return
    end

    local party = player:getParty()
    --add error handling if party is not found:
    if not party then
        print("Party not found.")
        return
    end

    local memberToRemove = Player(membername)  -- Create the Player object 
    if not memberToRemove then
        print("Party member not found.")
        return
    end
    
    for k,v in pairs(party:getMembers()) do
    if v.getName() == membername then -- Compare names instead of Player objects
    party:removeMember(memberToRemove) 
    print("Removed member: ", membername)
        return
    end
    end
end
    