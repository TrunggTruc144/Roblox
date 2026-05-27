if not game:IsLoaded() then
	game.Loaded:Wait()
end

task.wait(10)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Save = require(ReplicatedStorage.Library.Client.Save)

local TARGET_RANK = 11
local TARGET_REBIRTHS = 9
local CHECK_DELAY = 60

local RANK_URL = "https://raw.githubusercontent.com/TrunggTruc144/Roblox/refs/heads/main/Rank.lua"
local RNG_URL = "https://raw.githubusercontent.com/TrunggTruc144/Roblox/refs/heads/main/RNG_Event.lua"

local function getData()
	return Save.Get() or {}
end

local function getRankRebirth()
	local data = getData()
	return tonumber(data.Rank), tonumber(data.Rebirths)
end

local function waitRankRebirthReady()
	while true do
		local rank, rebirth = getRankRebirth()

		warn("[WAIT DATA]", "Rank:", rank, "| Rebirths:", rebirth)

		if rank and rank >= 1 and rebirth ~= nil then
			return rank, rebirth
		end

		task.wait(3)
	end
end

local rank, rebirth = waitRankRebirthReady()

warn("[Selector] PlaceId:", game.PlaceId, "| Rank:", rank, "| Rebirths:", rebirth)

if rank < TARGET_RANK or rebirth < TARGET_REBIRTHS then
	warn("[Selector] Farm / Rank mode")

	getgenv().SCRIPT_MODE = "FARM"

	task.spawn(function()
		local ok, err = pcall(function()
			loadstring(game:HttpGet(RANK_URL))()
		end)

		if not ok then
			warn("[Rank.lua] Error:", err)
		end
	end)

	while true do
		task.wait(CHECK_DELAY)

		rank, rebirth = getRankRebirth()

		warn("[CHECK]", "Rank:", rank, "| Rebirths:", rebirth, "| PlaceId:", game.PlaceId)

		if rank and rebirth and rank >= TARGET_RANK and rebirth >= TARGET_REBIRTHS then
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
		local ok, err = pcall(function()
			loadstring(game:HttpGet(RNG_URL))()
		end)

		if not ok then
			warn("[RNG_Event.lua] Error:", err)
		end
	end)
end
