function printSmallGuildNames(memberCount)
    -- this method is supposed to print names of all guilds that have less than memberCount max members
    local selectGuildQuery = string.format("SELECT name FROM guilds WHERE max_members < %d", memberCount);
    local resultId = db.storeQuery(selectGuildQuery)
    
    -- Iterate through the results to print all guild names that meet the condition
        repeat
            local guildName = result.getString(resultId, "name")  -- Get guild name from result set
            if guildName then
                print(guildName)
            end
        until not result.next(resultId)  -- Move to the next result; exit loop if no more results
    
        db.freeResult(resultId) --Free database result 
    
    end