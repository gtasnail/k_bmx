-- out of respect for me releasing this for free, please keep the name of the resource as k_bmx :)
-- please checkout my scripts here! https://kbase.tebex.io/
-- please read the readme.lua
local QBCore = exports['qb-core']:GetCoreObject()

local bmxID = 1131912276
local models = {
    'bmx',
}



exports['qb-target']:AddTargetModel(models, {
	options = {
		{
			event = 'k_bmx:fetchBMX',
            type = 'client',
			icon = "fa fa-bicycle",
			label = "Pickup BMX",
		},
	},
	distance = 1.5,
})


function LoadThaAnim(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
    end
    return true
end
local OnBack = false
local TempDisable = false
local lastbike = nil
RegisterNetEvent('k_bmx:fetchBMX', function()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local bmxEntity, closestDistance = QBCore.Functions.GetClosestVehicle(playerCoords)

    if bmxEntity ~= nil then
        local bmxModel = GetEntityModel(bmxEntity)
        local hasItem = QBCore.Functions.HasItem('bmx')
        if not hasItem then
            if bmxModel == bmxID then 
                local colorPrimary, colorSecondary = GetVehicleColours(bmxEntity)
                local perl, wheel = GetVehicleExtraColours(bmxEntity)
                local plate = GetVehicleNumberPlateText(bmxEntity)
                NetworkRequestControlOfEntity(bmxEntity)
                LoadThaAnim('anim@mp_snowball')
                TaskPlayAnim(playerPed, 'anim@mp_snowball', 'pickup_snowball', 8.0, 8.0, -1, 48, 1, false, false, false)
                Wait(1000)
                --DeleteEntity(bmxEntity)
                AttachEntityToEntity(bmxEntity, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 24818), 0.08, -0.25, 0.0, 10.0, 10.0, 90.0, false, false, false, false, 2, true)
                TriggerServerEvent('k_bmx:Store', 'bmx', colorPrimary, colorSecondary, perl, plate)
                OnBack = true
                while OnBack do
                    Wait(10)
                    local hasItem = QBCore.Functions.HasItem('bmx')
                    if not hasItem then
                        OnBack = false
                    end
                end
                lastbike = bmxEntity
                DeleteEntity(bmxEntity)
            end
        else
            QBCore.Functions.Notify('You already have a bike on you.', 'error', 5000)
        end
    end
end)

RegisterNetEvent('k_bmx:placeBike', function(prim,sec,perl,plate)
    local playerPed = PlayerPedId()
    local forward = GetEntityForwardVector(playerPed)
    local coords = GetEntityCoords(playerPed) + forward * 1
    LoadThaAnim('anim@mp_snowball')
    TaskPlayAnim(playerPed, 'anim@mp_snowball', 'pickup_snowball', 8.0, 8.0, -1, 48, 1, false, false, false)
    Wait(1000)
    while not HasModelLoaded(bmxID) do
        RequestModel(bmxID)
        Citizen.Wait(10)
    end
  
    if HasModelLoaded(bmxID) then
        local createdbmx = CreateVehicle(bmxID, coords, 1.0, true, true)
        if createdbmx ~= 0 then
            SetVehicleColours(createdbmx, prim, sec)
            SetVehicleExtraColours(createdbmx, perl, 0)
            SetVehicleNumberPlateText(createdbmx, plate)
            SetEntityHeading(createdbmx, GetEntityHeading(playerPed))
            OnBack = false
            lastbike = nil
        end
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    print('^2Kypo^0: ^4Thank you for using my script if you like it please check out my website for more like it :)')
    print('^6https://kbase.tebex.io/')
  end)

