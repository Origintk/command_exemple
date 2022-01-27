VORP = exports.vorp_inventory:vorp_inventoryApi()

local data = {}
Citizen.CreateThread(function()
    data = exports.vorp_inventory:vorp_inventoryApi()
end) 
local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)


local characters = {}



RegisterCommand("givejob", function(source, args)  
    if args ~= nil then
	    local _source = source
		local User = VorpCore.getUser(_source)
		local Character = User.getUsedCharacter
		local group = Character.group
		local id =  args[1]
		local job =  args[2]
		local Character = VorpCore.getUser(id).getUsedCharacter
		if group == "admin"then
		Character.setJob(job)
		else return false
		end
	end
end)