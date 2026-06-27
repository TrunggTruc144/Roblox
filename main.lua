local PRIVATE_CONFIG = getgenv().PRIVATE_CONFIG or {}

local function ApplyCommonMailConfig()
	getgenv().GWEBHOOK_USERID = PRIVATE_CONFIG.WEBHOOK_USERID or ""
	getgenv().GWEBHOOK_LINK = PRIVATE_CONFIG.WEBHOOK_LINK or ""

	getgenv().GHUGE_COUNT = 0
	getgenv().GMAIL_RECEIVERS = PRIVATE_CONFIG.MAIL_RECEIVERS or {}
	getgenv().GMAX_MAIL_COST = "5m"

	getgenv().GMAIL_ITEMS = {

		["Send Diamonds"] = { Class = "Currency", Id = "Diamonds", KeepAmount = "5m", MinAmount = "35m" },

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
		["Exclusive Egg 63"] = { Class = "Egg", Id = "Exclusive Egg 63", MinAmount = 1 },
		["Exclusive Egg 64"] = { Class = "Egg", Id = "Exclusive Egg 64", MinAmount = 1 },

		["Mega Potion Chest"] = { Class = "Lootbox", Id = "Mega Potion Chest", MinAmount = 1 },
		["Mega Enchant Chest"] = { Class = "Lootbox", Id = "Mega Enchant Chest", MinAmount = 1 },
		["Mega Loot Chest"] = { Class = "Lootbox", Id = "Mega Loot Chest", MinAmount = 1 },
		["Mega Charm Chest"] = { Class = "Lootbox", Id = "Mega Charm Chest", MinAmount = 1 },

		["Huge Machine Egg 6"] = { Class = "Egg", Id = "Huge Machine Egg 6", MinAmount = 1 },
		["Huge Machine Egg 5"] = { Class = "Egg", Id = "Huge Machine Egg 5", MinAmount = 1 },
		["Huge Machine Egg 4"] = { Class = "Egg", Id = "Huge Machine Egg 4", MinAmount = 1 },
		["Huge Machine Egg 3"] = { Class = "Egg", Id = "Huge Machine Egg 3", MinAmount = 1 },
		["Huge Machine Egg 2"] = { Class = "Egg", Id = "Huge Machine Egg 2", MinAmount = 1 },
		["Huge Machine Egg 1"] = { Class = "Egg", Id = "Huge Machine Egg 1", MinAmount = 1 },

		["MVP Key Upper Half"] = { Class = "Misc", Id = "MVP Key Upper Half", MinAmount = 50 },
		["MVP Key Lower Half"] = { Class = "Misc", Id = "MVP Key Lower Half", MinAmount = 500 },

		["Royalty"] = { Class = "Charm", Id = "Royalty", MinAmount = 2 },
		["Overload"] = { Class = "Charm", Id = "Overload", MinAmount = 2 },

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
	getgenv().GPROGRESS_MODE = "Hybrid"
	-- getgenv().GRANK_FIRST = true
	getgenv().GZONE_TO = 999
	getgenv().GGFX_MODE = 1
	getgenv().GMASTERY_TO_MAX = "Eggs"

	getgenv().GAUTO_UPGRADE_PETS = true
	getgenv().GMAX_EGG_SLOTS = 99
	getgenv().GMAX_EQUIP_SLOTS = 99
	getgenv().GMAX_ZONE_UPGRADE_COST = 999999999

	getgenv().GKICK_ON_STAFF = true

	getgenv().GLOOTBOXES = {
		"Locked Hype Egg 3",
		"Small Fantasy Present",
		"Medium Fantasy Present",
		"Large Fantasy Present",
		"X-Large Fantasy Present",
		"Titanic Fantasy Present",
	}

	getgenv().GENCHANTS = {
		"Huge Hunter",
		"Criticals",
		"Tap Power",
		"Lucky Eggs",
		"Tap Power",
		"Treasure Hunter",
		"Diamonds",
		"Criticals",
	}

	getgenv().GDO_TIME_TRIAL = true
	getgenv().GTIME_TRIAL_MIN_TIME_TO_BOSS3 = 1
	getgenv().GTIME_TRIAL_CHEST_TO_CLAIM = 3
	getgenv().GTIME_TRIAL_HATCH_FIRST_SECONDS = 1
	getgenv().GTIME_TRIAL_ENCHANTS = {
		"Criticals",
		"Tap Power",
		"Tap Power",
		"Strong Pets",
		"Walkspeed",
		"Criticals",
		"Criticals",
		"Criticals",
	}

	getgenv().GCONSUME_CHARMS = true
	getgenv().GCOMBINE_KEYS = true
	getgenv().GHOLD_GIFTS = false
	getgenv().GHOLD_BUNDLES = false
	getgenv().GCONSUME_SEED_BAGS = true
	getgenv().GOPEN_ITEMS_IN_BULK = true
	getgenv().GUSE_ULTIMATES = { "UFO", "Tsunami", "Tornado", "Pet Surge", "Chest Spell", "Ground Pound" }
	getgenv().GFRUITS = { "Watermelon", "Candycane", "Apple", "Rainbow", "Pineapple", "Orange", "Banana" }
	getgenv().GPOTIONS =
		{ "Coins", "Lucky", "The Cocktail", "Huge", "Treasure Hunter", "Walkspeed", "Diamonds", "Damage" }
	getgenv().GUSE_FLAGS = { "Fortune Flag", "Diamonds Flag", "Coins Flag" }
	getgenv().GPOTIONS_MAX_TIER = 99
	getgenv().GIGNORE_ALL_INSTANCES = true

	ApplyCommonMailConfig()
end

-- if game.PlaceId ~= 8737899170 then
-- 	pcall(function()
-- 		game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("World1Teleport"):InvokeServer()
-- 	end)

-- 	task.wait(20)
-- 	return
-- end

LoadEventRNGConfig()

loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/6e75890d2e36b4613270666c4f5ccab3.lua"))()
