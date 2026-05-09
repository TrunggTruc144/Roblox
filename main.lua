local PRIVATE_CONFIG = getgenv().PRIVATE_CONFIG or {}

pcall(function()
	game:GetService("RunService"):Set3dRenderingEnabled(false)
end)

task.spawn(function()
	for i = 1, 5 do
		local ok = pcall(function()
			loadstring(
				game:HttpGet("https://raw.githubusercontent.com/TrunggTruc144/Roblox/refs/heads/main/LockFPS.lua")
			)()
		end)

		if ok then
			break
		end

		task.wait(10)
	end
end)

task.wait(30)

task.spawn(function()
	task.wait(300)

	pcall(function()
		for _, v in ipairs(game:GetService("CoreGui"):GetChildren()) do
			if v.Name == "TopBarApp" and v.ClassName == "Folder" then
				v:Destroy()
			end
		end
	end)

	pcall(function()
		local Players = game:GetService("Players")
		local StarterGui = game:GetService("StarterGui")
		local CoreGui = game:GetService("CoreGui")
		local LocalPlayer = Players.LocalPlayer

		if LocalPlayer and LocalPlayer:FindFirstChild("PlayerGui") then
			for _, v in ipairs(LocalPlayer.PlayerGui:GetChildren()) do
				if v:IsA("ScreenGui") then
					v.Enabled = false
				end
			end
		end

		for _, v in ipairs(StarterGui:GetChildren()) do
			if v:IsA("ScreenGui") then
				v.Enabled = false
			end
		end

		for _, v in ipairs(CoreGui:GetChildren()) do
			if v:IsA("ScreenGui") then
				v.Enabled = false
			end
		end
	end)

	pcall(function()
		loadstring(
			game:HttpGet("https://raw.githubusercontent.com/TrunggTruc144/Roblox/refs/heads/main/Info_update.lua")
		)()
	end)

	pcall(function()
		loadstring(
			game:HttpGet("https://raw.githubusercontent.com/TrunggTruc144/Roblox/refs/heads/main/Info_update2.lua")
		)()
	end)
end)

-----------------------

if game.PlaceId ~= 8737899170 then
	spawn(function()
		local Players = game:GetService("Players")
		local LocalPlayer = Players.LocalPlayer

		local function KickIfServerHasPlayers()
			local playerCount = #Players:GetPlayers()

			if playerCount >= 2 then
				LocalPlayer:Kick("Not in private server, rejoining...")
				return true
			end

			return false
		end

		KickIfServerHasPlayers()
	end)
end

-----------------------

getgenv().GDO_TIME_TRIAL = true

getgenv().GTIME_TRIAL_MIN_TIME_TO_BOSS3 = 1

getgenv().GTIME_TRIAL_CHEST_TO_CLAIM = 3

getgenv().GTIME_TRIAL_HATCH_FIRST_SECONDS = 1

getgenv().GENCHANTS = { "Huge Hunter", "Criticals", "Criticals", "Tap Power", "Strong Pets", "Explosive", "Lucky Eggs" }

-----------------------
getgenv().GLOOTBOXES = { "Locked Hype Egg 3", "Titanic Fantasy Present" }

--getgenv().GRANK_FIRST = true
getgenv().GZONE_TO = 999
getgenv().GFOCUS_RANK_TO = 11

getgenv().GPROGRESS_MODE = "Hybrid"
getgenv().GGFX_MODE = 1

getgenv().GCLEAR_FAVORITE_PETS = true

--getgenv().GHATCH_ENCHANTS = {"Huge Hunter", "Lucky Eggs","Lucky Eggs","Lucky Eggs","Lucky Eggs","Lucky Eggs","Lucky Eggs"}
--getgenv().GENCHANTS = {"Criticals","Criticals","Criticals","Tap Power","Strong Pets","Huge Hunter","Lucky Eggs"}
--getgenv().GENCHANTS = {"Huge Hunter","Explosive","Lucky Eggs","Criticals","Tap Power","Criticals","Strong Pets","Lucky Eggs"}

-----------------------
getgenv().GUSE_SPINNY_WHEEL = true
getgenv().GAUTO_UPGRADE_PETS = true
getgenv().GHATCH_BETTER_PETS = true
getgenv().GCOMBINE_KEYS = true
getgenv().GMASTERY_TO_MAX = "Eggs"
getgenv().GCONSUME_CHARMS = true
getgenv().GDAYCARE = true
--------------------------
getgenv().GHATCH_SPEED_MS = 0
getgenv().GMAX_EGG_SLOTS = 89
getgenv().GMAX_EQUIP_SLOTS = 84

getgenv().GHOLD_GIFTS = false
getgenv().GHOLD_BUNDLES = false
getgenv().GCONSUME_SEED_BAGS = true
getgenv().GOPEN_ITEMS_IN_BULK = true
getgenv().GMAX_ZONE_UPGRADE_COST = 30000000

getgenv().GCOLLECT_FREE_ITEMS = true

getgenv().GUSE_SPRINKLERS = true
getgenv().GUSE_ULTIMATES = { "UFO", "Tsunami", "Tornado", "Lightning Storm", "Ground Pound" }

getgenv().GUSE_FLAGS = { "Fortune Flag", "Diamonds Flag", "Coins Flag" }
--getgenv().GEVENT_ITEMS_TO_USE = {"Mini Pinata","Party Box","Mini Lucky Block"}
getgenv().GFRUITS = { "Watermelon", "Candycane", "Apple", "Rainbow", "Pineapple", "Orange", "Banana" }
getgenv().GPOTIONS = { "Coins", "Lucky", "The Cocktail", "Huge", "Treasure Hunter", "Walkspeed", "Diamonds", "Damage" }
getgenv().GPOTIONS_MAX_TIER = 99

getgenv().GKICK_ON_STAFF = true

getgenv().GWEBHOOK_USERID = PRIVATE_CONFIG.WEBHOOK_USERID or ""
getgenv().GWEBHOOK_LINK = PRIVATE_CONFIG.WEBHOOK_LINK or ""

getgenv().GHUGE_COUNT = 0
getgenv().GMAIL_RECEIVERS = PRIVATE_CONFIG.MAIL_RECEIVERS or {}
getgenv().GMAX_MAIL_COST = "5m"

getgenv().GCOMBINE_MACHINE_OUTPUT = "Titanic Fantasy Present"

getgenv().GMAIL_ITEMS = {

	--["Send Diamonds"] = { Class = "Currency", Id = "Diamonds", KeepAmount = "5m", MinAmount = "55m" },

	["All Huges"] = { Class = "Pet", Id = "All Huges", MinAmount = 1 },
	["All Sea Dragons"] = { Class = "Card", Id = "Huge Sea Dragon Card", MinAmount = 1, AllVariants = true },
	["Ghostly Pack"] = { Class = "Lootbox", Id = "Ghostly Pack", MinAmount = 1 },
	["Time Trial Gift 2"] = { Class = "Lootbox", Id = "Time Trial Gift 2", MinAmount = 18 },

	["Hype Egg 3"] = { Class = "Lootbox", Id = "Hype Egg 3", MinAmount = 1 },
	["Hype Egg 2"] = { Class = "Lootbox", Id = "Hype Egg 2", MinAmount = 1 },
	["Hype Egg"] = { Class = "Lootbox", Id = "Hype Egg", MinAmount = 1 },

	["Secret 1"] = { Class = "Pet", Id = "Rainbow Swirl", MinAmount = 1 },
	["Secret 2"] = { Class = "Pet", Id = "Banana", MinAmount = 1 },
	["Secret 3"] = { Class = "Pet", Id = "Coin", MinAmount = 1 },
	["Secret 4"] = { Class = "Pet", Id = "Yellow Lucky Block", MinAmount = 1 },
	["Secret 5"] = { Class = "Pet", Id = "Crown", MinAmount = 1 },
	["Secret 6"] = { Class = "Pet", Id = "Heart", MinAmount = 1 },
	["Secret 7"] = { Class = "Pet", Id = "Lucky Clover", MinAmount = 1 },
	["Secret 8"] = { Class = "Pet", Id = "Mystery", MinAmount = 1 },

	["Exclusive Egg 57"] = { Class = "Egg", Id = "Exclusive Egg 59", MinAmount = 1 },
	["Exclusive Egg 58"] = { Class = "Egg", Id = "Exclusive Egg 59", MinAmount = 1 },
	["Exclusive Egg 59"] = { Class = "Egg", Id = "Exclusive Egg 59", MinAmount = 1 },
	["Exclusive Egg 60"] = { Class = "Egg", Id = "Exclusive Egg 60", MinAmount = 1 },
	["Exclusive Egg 61"] = { Class = "Egg", Id = "Exclusive Egg 61", MinAmount = 1 },
	["Exclusive Egg 62"] = { Class = "Egg", Id = "Exclusive Egg 62", MinAmount = 1 },

	["Mega Potion Chest"] = { Class = "Lootbox", Id = "Mega Potion Chest", MinAmount = 1 },
	["Mega Enchant Chest"] = { Class = "Lootbox", Id = "Mega Enchant Chest", MinAmount = 1 },
	["Mega Loot Chest"] = { Class = "Lootbox", Id = "Mega Loot Chest", MinAmount = 1 },
	["Mega Charm Chest"] = { Class = "Lootbox", Id = "Mega Charm Chest", MinAmount = 1 },

	["Huge Machine Egg 6"] = { Class = "Egg", Id = "Huge Machine Egg 6", MinAmount = 1 },
	["Huge Machine Egg 5"] = { Class = "Egg", Id = "Huge Machine Egg 5", MinAmount = 1 },
	["Huge Machine Egg 4"] = { Class = "Egg", Id = "Huge Machine Egg 4", MinAmount = 1 },
	["Huge Machine Egg 3"] = { Class = "Egg", Id = "Huge Machine Egg 3", MinAmount = 1 },
	["Huge Machine Egg 2"] = { Class = "Egg", Id = "Huge Machine Egg 3", MinAmount = 1 },
	["Huge Machine Egg 1"] = { Class = "Egg", Id = "Huge Machine Egg 1", MinAmount = 1 },

	["MVP Key Upper Half"] = { Class = "Misc", Id = "MVP Key Upper Half", MinAmount = 50 },
	["MVP Key Lower Half"] = { Class = "Misc", Id = "MVP Key Lower Half", MinAmount = 500 },

	["Royalty"] = { Class = "Charm", Id = "Royalty", MinAmount = 1 },
	["Overload"] = { Class = "Charm", Id = "Overload", MinAmount = 1 },

	["Secret Key"] = { Class = "Misc", Id = "Secret Key", MinAmount = 200 },
	["Fantasy Key"] = { Class = "Misc", Id = "Fantasy Key", MinAmount = 100 },
	["Void Key"] = { Class = "Misc", Id = "Void Key", MinAmount = 200 },
	["Tech Key"] = { Class = "Misc", Id = "Tech Key", MinAmount = 400 },
	["Crystal Key"] = { Class = "Misc", Id = "Crystal Key", MinAmount = 600 },
	["Fantasy Spinny Wheel Ticket"] = { Class = "Misc", Id = "Fantasy Spinny Wheel Ticket", MinAmount = 50 },
	["Magic Shard"] = { Class = "Misc", Id = "Magic Shard", MinAmount = 200 },
	["Bucket O' Magic"] = { Class = "Misc", Id = "Bucket O' Magic", MinAmount = 200 },
}

if not game:IsLoaded() then
	game.Loaded:Wait()
end

task.spawn(function()
	while
		not pcall(function()
			loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/ba2dcad2127dcfc04301dfe52ce6c61c.lua"))()
		end)
	do
		task.wait(15)
	end
end)
