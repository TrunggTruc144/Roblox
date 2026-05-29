local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Save = require(ReplicatedStorage.Library.Client.Save)

local function getRebirth()
	local data = Save.Get() or {}
	return tonumber(data.Rebirths)
end

local rebirth = getRebirth()

if rebirth and rebirth < 4 then
	task.spawn(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/TrunggTruc144/Roblox/refs/heads/main/Rank.lua"))()
	end)

	while true do
		task.wait(60)

		rebirth = getRebirth()
		warn("[CHECK] Rebirths:", rebirth, "| PlaceId:", game.PlaceId)

		if rebirth and rebirth >= 4 then
			warn("[Selector] Rebirth target reached, kicking to rejoin RNGEvent")
			task.wait(3)
			LocalPlayer:Kick("Rebirth target reached - rejoin for RNGEvent")
			break
		end
	end
else
	task.spawn(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/TrunggTruc144/Roblox/refs/heads/main/RNG_Event.lua"))()
	end)
end
