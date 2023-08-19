--[[
    The code is creating a table called `blacklistCommands` with a nested table called `ServerList`. The
 `ServerList` table contains a list of strings that represent commands that are blacklisted or not
  allowed. These commands typically start with specific prefixes such as "sv_", "adhesive_",
  "citizen_", etc.
]]
local blacklistCommands = {
    "sv_",
    "adhesive_",
    "citizen_",
    "con_",
    "endpoint_",
    "fileserver",
    "load_server",
    "mysql_connection",
    "net_tcp",
    "netPort",
    "netlib",
    "onesync",
    "onesync_",
    "rateLimiter_",
    "svgui",
    "web_base",
    "temp_",
}

-- The code snippet is defining a Lua function called "allcommands" that registers a command with the
-- name "allcommands". When this command is executed, it retrieves all the registered commands in the
-- game and filters out any blacklisted commands. The filtered commands are then stored in a table
-- called "commandsTable". Finally, the function triggers a client event called
-- 'um-all-commands:client:sendNui' and passes the "commandsTable" as an argument to the event.
RegisterCommand("allcommands", function(source)
    local commandsTable = {}
    local allCommands = GetRegisteredCommands()
    local addedCommands = {}

    for _, command in ipairs(allCommands) do
        local isBlacklisted = false
        for _, bcommand in ipairs(blacklistCommands) do
            if string.find(command.name, bcommand) == 1 then
                isBlacklisted = true
                break
            end
        end

        if not isBlacklisted and not addedCommands[command.name] then
            commandsTable[#commandsTable + 1] = command.name
            addedCommands[command.name] = true
        end
    end

    TriggerClientEvent('um-all-commands:client:sendNui', source, commandsTable)
end, false)