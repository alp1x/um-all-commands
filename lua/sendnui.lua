-- The `SetNui` function is a local function that takes a boolean parameter `bool`. It calls the
-- `SetNuiFocus` function with the `bool` parameter passed twice. This function is likely used to set
-- the focus of the NUI (Native UI) in the Lua script.
local function SetNui(bool)
    SetNuiFocus(bool, bool)
end

-- The `RegisterNetEvent('um-all-commands:client:sendNui', function(commandTable)` is registering a
-- network event with the name `'um-all-commands:client:sendNui'`. When this event is triggered, the
-- provided function will be executed.
RegisterNetEvent('um-all-commands:client:sendNui', function(commandTable)
    if not commandTable then return end
    SetNui(true)
    SendNUIMessage({commands = commandTable})
    print('[um-all-commands]: Commands sent to NUI')
end)

-- The `RegisterNUICallback('close', function(_, cb)` is registering a callback function for the NUI
-- (Native UI) with the name `'close'`. When this callback is triggered, the provided function will be
-- executed.
RegisterNUICallback('close', function(_, cb)
    SetNui(false)
    cb(1 or 'ok')
end)
