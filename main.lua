local PRIVATE_CONFIG = getgenv().PRIVATE_CONFIG or {}

local function ApplyCommonMailConfig()
	getgenv().GKICK_ON_STAFF = true

	getgenv().GWEBHOOK_USERID = PRIVATE_CONFIG.WEBHOOK_USERID or ""
	getgenv().GWEBHOOK_LINK = PRIVATE_CONFIG.WEBHOOK_LINK or ""

	getgenv().GHUGE_COUNT = 0
	getgenv().GMAIL_RECEIVERS = PRIVATE_CONFIG.MAIL_RECEIVERS or {}
	getgenv().GMAX_MAIL_COST = "5m"

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

		["Exclusive Egg 57"] = { Class = "Egg", Id = "Exclusive Egg 57", MinAmount = 1 },
		["Exclusive Egg 58"] = { Class = "Egg", Id = "Exclusive Egg 58", MinAmount = 1 },
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
end

local function LoadEventRNGConfig()
	getgenv().GLOOTBOXES = {
		"Locked Hype Egg 3",
		"Titanic Fantasy Present",
		"X-Large Fantasy Present",
		"Large Fantasy Present",
		"Medium Fantasy Present",
		"Small Fantasy Present",
	}

	getgenv().GZONE_TO = 1
	getgenv().GGFX_MODE = 1
	getgenv().GENCHANTS = {
		"Criticals",
		"Criticals",
		"Strong Pets",
		"Strong Pets",
		"Strong Pets",
		"Strong Pets",
		"Criticals",
	}
	getgenv().GDAYCARE = true

	getgenv().GDO_RNG_INSTANCE = true
	getgenv().GEVENT_UPGRADES = {
		{ Id = "RNGEggLuck", MaxTier = 15 },
		{ Id = "RNGHatchSpeed", MaxTier = 15 },
		{ Id = "RNGBonusLuck", MaxTier = 8 },
		{ Id = "RNGHugeLuck", MaxTier = 13 },
	}
	getgenv().GUSE_BOOSTS = true
	getgenv().GRNG_SELL_PETS = true
	getgenv().GRNG_CRAFT_DICE = true
	getgenv().GRNG_USE_MEGA1 = false

	ApplyCommonMailConfig()
end

if game.PlaceId ~= 8737899170 then
	pcall(function()
		game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("World1Teleport"):InvokeServer()
	end)

	task.wait(20)
	return
end

-- pcall(function()
-- 	loadstring(game:HttpGet("https://raw.githubusercontent.com/TrunggTruc144/Roblox/refs/heads/main/LockFPS.lua"))()
-- end)

task.wait(20)

LoadEventRNGConfig()

loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/ba2dcad2127dcfc04301dfe52ce6c61c.lua"))()
