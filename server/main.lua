ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--------Prendre un esx_coronergate--------
RegisterServerEvent('esx_coronergate:disp')
AddEventHandler('esx_coronergate:disp', function()
	local xPlayer  = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	
	for i=1, #xPlayers, 1 do
	 local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'ambulance' then
			
		end
	end
			
	xPlayer.addInventoryItem('journal', 1)
end)

-------Utiliser Le esx_coronergate------

-- ESX.RegisterUsableItem('esx_coronergate', function(source)
	-- TriggerClientEvent('esx_coronergate:esx_coronergate', source)
	
		-- local xPlayer  = ESX.GetPlayerFromId(source)

	-- xPlayer.removeInventoryItem('esx_coronergate', 1)
-- end)

----------------------- Hack les esx_coronergate-----------------------
ESX.RegisterUsableItem('journal', function(source)
  local _source = source
  local xPlayer  = ESX.GetPlayerFromId(source)
  local qtehack =xPlayer.getInventoryItem('craking').count
  
  if qtehack > 0 then
      TriggerClientEvent('esx_coronergate:trycrack',_source)
  else
     xPlayer.showNotification('Tu n'a pas de ~r~module de hacking')
  end
end)

RegisterServerEvent('esx_coronergate:fail_esx_coronergate')
AddEventHandler('esx_coronergate:fail_esx_coronergate', function()
  local _source = source
  local xPlayer  = ESX.GetPlayerFromId(source)
  if xPlayer.getInventoryItem('journal').count >= 1 then
    xPlayer.removeInventoryItem('journal', 1)
    xPlayer.showNotification('le journal est détruit')
  end
end)

RegisterServerEvent('esx_coronergate:ouvrir_journal')
AddEventHandler('esx_coronergate:ouvrir_journal', function()
  local _source = source
  local xPlayer  = ESX.GetPlayerFromId(source)
  if xPlayer.getInventoryItem('journal').count >= 1 then
	TriggerClientEvent('esx_coronergate:journal', source)
    xPlayer.showNotification('vous lisez l'archive')
    Wait(5000)
    xPlayer.removeInventoryItem('journal', 1)
	   xPlayer.showNotification('vous avez lu l'archive')
  else
    xPlayer.showNotification('vous devez avoir lu l'archive')
  end
end)

RegisterServerEvent('atleastone')
AddEventHandler('atleastone', function()
  local xPlayers = ESX.GetPlayers()
  local bool = false 
  local source = source

   for i=1, #xPlayers, 1 do
    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
    if xPlayer.job.name == 'ambulance' then
     bool = true
	 --TriggerClientEvent('esx:showNotification', xPlayers[i], 'Alerte: Intrusion salle Archive')
	 xPlayer.showNotification('~r~Intrusion salle Archive.')
    end
   end

   TriggerClientEvent('fouille', source, bool)
end)
