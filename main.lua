if not game:IsLoaded() then
	game.Loaded:Wait()
end

for i = 1, 10 do
	local ok = pcall(function()
		local Save = require(game:GetService("ReplicatedStorage").Library.Client.Save)
		local rank = Save.Get().Rank or 0

		if rank >= 20 then
			loadstring(
				game:HttpGet("https://raw.githubusercontent.com/TrunggTruc144/Roblox/refs/heads/main/LastAreaFarm.lua")
			)()
		else
			loadstring(
				game:HttpGet("https://raw.githubusercontent.com/TrunggTruc144/Roblox/refs/heads/main/EventRNG.lua")
			)()
		end
	end)

	if ok then
		break
	end

	task.wait(3)
end
