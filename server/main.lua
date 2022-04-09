
local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('k_bmx:Store', function(bmxitem, prim, sec, perl, plate)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local bmx = {}
    if bmxitem == "bmx" then
        bmx.prim = prim
        bmx.sec = sec
        bmx.perl = perl
        bmx.plate = plate
    end
    Player.Functions.AddItem(bmxitem, 1, nil, bmx)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[bmxitem], 'add')
end)

QBCore.Functions.CreateUseableItem("bmx", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent('k_bmx:placeBike', source, item.info.prim,item.info.sec,item.info.perl,item.info.plate)
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    print('^6https://kbase.tebex.io/ ^0')
  end)
  