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

RegisterServerEvent("logdcdcdc123")
AddEventHandler("logdcdcdc123", function(titel, message)
  if titel and message then
  else
    return
  end
  local msg = '**Detection:** \n```' .. titel .. '```**Information:** ```' .. message .. '```'
  local embeds = {{
      ["title"] = "New possible detection",
      ["description"] = msg,
      ["type"] = "rich",
      ["color"] = 0,
      ["footer"] = {
          ["text"] = "DNZ_STOPVOID â¢ " .. os.date('%A, %B %x - %X')
      },
      ["image"] = {
          ["url"] = img
      }
  }}

  if message == nil or message == '' then
      return FALSE
  end
  if dnz_system.Webhook and Config.LogifDetected then
    PerformHttpRequest(dnz_system.Webhook, function(err, text, headers)
    end, 'POST', json.encode({
        username = "Report",
        embeds = embeds,
        avatar_url = "https://cdn.discordapp.com/attachments/875833633502539908/883825278026125373/One_and_Only0.png"
    }), {
        ['Content-Type'] = 'application/json'
    })
  end
end)