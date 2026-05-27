if not game:IsLoaded() then
	game.Loaded:Wait()
end

task.wait(10)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Save = require(ReplicatedStorage.Library.Client.Save)

local function getData()
	return Save.Get() or {}
end

local function getRankRebirth()
	local data = getData()
	return data.Rank or 0, data.Rebirths or 0
end

local rank, rebirth = getRankRebirth()

warn("[Selector] PlaceId:", game.PlaceId, "| Rank:", rank, "| Rebirths:", rebirth)

if rank < 11 or rebirth < 9 then
	warn("[Selector] Farm mode")

	getgenv().SCRIPT_MODE = "FARM"

	task.spawn(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/TrunggTruc144/Roblox/refs/heads/main/Rank.lua"))()
	end)

	while true do
		task.wait(60)

		rank, rebirth = getRankRebirth()

		warn("[CHECK]", "Rank:", rank, "| Rebirths:", rebirth, "| PlaceId:", game.PlaceId)

		if rank >= 11 and rebirth >= 9 then
			warn("[Selector] Rank/Rebirth done, kicking to rejoin RNGEvent")
			task.wait(3)
			LocalPlayer:Kick("Rank/Rebirth target reached - rejoin for RNGEvent")
			break
		end
	end
else
	warn("[Selector] RNG Event mode")

	getgenv().SCRIPT_MODE = "RNG"

	task.spawn(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/TrunggTruc144/Roblox/refs/heads/main/RNG_Event.lua"))()
	end)
end
