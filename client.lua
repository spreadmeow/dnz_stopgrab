[[
--  _______  _______  _______  _______  _        _______  ______             _________ _______ 
--  (  ____ \(  ____ )(  ___  )(  ____ \| \    /\(  ____ \(  __  \   |\     /|\__   __/(  ____ \
--  | (    \/| (    )|| (   ) || (    \/|  \  / /| (    \/| (  \  )  | )   ( |   ) (   | (    \/
--  | |      | (____)|| (___) || |      |  (_/ / | (__    | |   ) |  | | _ | |   | |   | (__    
--  | |      |     __)|  ___  || |      |   _ (  |  __)   | |   | |  | |( )| |   | |   |  __)   
--  | |      | (\ (   | (   ) || |      |  ( \ \ | (      | |   ) |  | || || |   | |   | (      
--  | (____/\| ) \ \__| )   ( || (____/\|  /  \ \| (____/\| (__/  )_ | () () |   | |   | )      
--  (_______/|/   \__/|/     \|(_______/|_/    \/(_______/(______/(_)(_______)   )_(   |/    
--   
-- Wenn Karma zurückschlägt, sitze ich in der ersten Reihe und applaudiere, Karma hat kein Verfallsdatum.
--
]]
loadedvehicles = {}
        Citizen.CreateThread(function()
          while true do
            Citizen.Wait(500)
            local vehs = GetGamePool('CVehicle')
            for _, vehicle in ipairs(vehs) do
                local owner = NetworkGetEntityOwner(vehicle)
                if not loadedvehicles[vehicle] then
                    table.insert(loadedvehicles, {vehicle = vehicle, owner = owner})
                else
                    for i, k in pairs(loadedvehicles) do
                        if k.vehicle == vehicle then
                            if owner ~= k.owner then
                                TriggerServerEvent('logdcdcdc123', "Vehicle Grab", 'It looks like: ' .. tonumber(GetPlayerServerId(owner)) .. ' is grabbing the Vehicle of '.. tonumber(GetPlayerServerId(k.owner)))
                            end
                        end
                    end
                end
            end
           end
        end)
