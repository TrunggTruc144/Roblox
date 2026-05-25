local Save = require(game:GetService("ReplicatedStorage").Library.Client.Save)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function getData()
	return Save.Get() or {}
end

local rank = getData().Rank or 0
local rebirth = getData().Rebirths or 0

if rank < 11 or rebirth < 9 then
	print("Rank mode")

	task.spawn(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/TrunggTruc144/Roblox/refs/heads/main/Rank.lua"))()
	end)

	while true do
		local data = getData()
		rank = data.Rank or 0
		rebirth = data.Rebirths or 0

		print("[CHECK]", rank, rebirth)

		if rank >= 11 and rebirth >= 9 then
			LocalPlayer:Kick("Rank/Rebirth target reached - rejoin for RNGEvent")
			break
		end

		task.wait(60)
	end
else
	print("RNG mode")

	loadstring(game:HttpGet("https://raw.githubusercontent.com/TrunggTruc144/Roblox/refs/heads/main/RNG_Event.lua"))()
end
