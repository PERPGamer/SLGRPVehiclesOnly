------Config-------
DisableBikeWings = true
DisableVehicleRocket = true
DisableVehicleJump = true
DisableVehicleTransform = true
DisableVehicleWeapons = true
----END OF CONFIG---

Citizen.CreateThread(function()
	while true do
		local playerped = GetPlayerPed(-1)		
		if IsPedInAnyVehicle(playerped, false) then	
			if DisableBikeWings then
				DisableControlAction(0, 354, true)
			end
			if DisableVehicleRocket then
				DisableControlAction(0, 351, true)
			end
			if DisableVehicleJump then
				DisableControlAction(0, 350, true)
			end
			if DisableVehicleTransform then
				DisableControlAction(0, 357, true)
			end
			
			local veh = GetVehiclePedIsUsing(playerped)
			if DoesVehicleHaveWeapons(veh) == 1 and DisableVehicleWeapons then
				vehicleweapon, vehicleweaponhash = GetCurrentPedVehicleWeapon(playerped)
				if vehicleweapon == 1 then
					SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey("weapon_unarmed"))
				end
			end	
		end
		Citizen.Wait(0)
	end
end)
