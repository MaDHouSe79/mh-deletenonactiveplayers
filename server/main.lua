
local playertables = { -- Add tables as needed
    { table = 'players' },
    { table = 'apartments' },
    { table = 'bank_accounts' },
    { table = 'crypto_transactions' },
    { table = 'phone_invoices' },
    { table = 'phone_messages' },
    { table = 'playerskins' },
    { table = 'player_contacts' },
    { table = 'player_houses' },
    { table = 'player_mails' },
    { table = 'player_outfits' },
    { table = 'player_vehicles' }
}

local function CheckIfPlayerIsActive()
    local count = 0
    MySQL.Async.fetchAll("SELECT * FROM players", {}, function(rs)
        for k, data in pairs(rs) do
            local result = MySQL.scalar.await("SELECT DATEDIFF(NOW(), `last_updated`) FROM `players` WHERE id = ?",{data.id})
            if result >= Config.nonactivedays then
                count = count + 1
                local query = "DELETE FROM %s WHERE citizenid = ?"
                local tableCount = #playertables
                local queries = table.create(tableCount, 0)
                for i = 1, tableCount do
                    local v = playertables[i]
                    queries[i] = {query = query:format(v.table), values = { data.citizenid }}
                end
                MySQL.transaction(queries, function(result2)
                    if result2 then end
                end)
            end
        end
        print("Total "..count.." non active accounts has been founded and deleted..")
    end)
end

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        CheckIfPlayerIsActive()
    end
end)
