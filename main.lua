local function SetWeaponDrops()
    local handle, ped = FindFirstPed()
    local finished = false

    repeat
        if not IsEntityDead(ped) then
            SetPedDropsWeaponsWhenDead(ped, false)
        end
        finished, ped = FindNextPed(handle)
    until not finished

    EndFindPed(handle)
end

Citizen.CreateThread(function()
	for i = 1, 15 do
		Citizen.InvokeNative(0xDC0F817884CDD856, i, false)
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local myCoords = GetEntityCoords(GetPlayerPed(-1))
        ClearAreaOfCops(myCoords.x, myCoords.y, myCoords.z, 1000.0, 0) --Enleve toute les voiture de pnj police

        DisablePlayerVehicleRewards(PlayerId()) --Enleve les armes de toute les vehicule de police

        SetWeaponDrops() --Enleve les armes des PNJ
        
    end
end)

--Train
Citizen.CreateThread(function()
    SwitchTrainTrack(0, true)
    SwitchTrainTrack(3, true)
    N_0x21973bbf8d17edfa(0, 120000)
    SetRandomTrains(true)
end)
--Train

-- barre map
Citizen.CreateThread(function()
    local minimap = RequestScaleformMovie("minimap")

    SetRadarBigmapEnabled(false, false)
        Wait(0)
    SetRadarBigmapEnabled(false, false)

    while true do
        Wait(0)
            BeginScaleformMovieMethod(minimap, "SETUP_HEALTH_ARMOUR")
            ScaleformMovieMethodAddParamInt(3)
            EndScaleformMovieMethod()
    end
end)
-- barre map

-- -- headshot
Citizen.CreateThread(function()

    while true do
    
        SetPedSuffersCriticalHits(GetPlayerPed(-1), false)
    
        Wait(1)
    
    end
end)
-- -- headshot
