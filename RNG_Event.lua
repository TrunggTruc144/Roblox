local PRIVATE_CONFIG = getgenv().PRIVATE_CONFIG or {}

if game.PlaceId ~= 8737899170 then
	task.spawn(function()
		pcall(function()
			game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("World1Teleport"):InvokeServer()
		end)
	end)

	task.wait(20)
end

pcall(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/TrunggTruc144/Roblox/refs/heads/main/LockFPS.lua"))()
end)

getgenv().PetSimulator99 = {
	AutoRankFirst = false,
	Rank = 9,
	Rebirth = 9,
	BuyEggSlots = 99,
	BuyPetSlots = 99,
	MaxUpgradePrice = 1000000,
	MaxZone = 270,
	EquipEnchantsForRankUp = { "Coins", "Coins", "Criticals", "Strong Pets" },

	EquipEnchants = {
		"Tap Power",
		"Tap Power",
		"Criticals",
		"Strong Pets",
		"Tap Power",
		"Tap Power",
		"Criticals",
		"Strong Pets",
	},
	UsePotions = { "Damage", "Coins", "Lucky", "Treasure Hunter" },

	MailConfig = {
		["All Huges"] = { Class = "Pet", MinAmount = 1 },
		["Exclusive Egg 60"] = { Class = "Egg", MinAmount = 1 },
		["Exclusive Egg 61"] = { Class = "Egg", MinAmount = 1 },
		["Exclusive Egg 62"] = { Class = "Egg", MinAmount = 1 },
		["Huge Machine Egg 6"] = { Class = "Egg", MinAmount = 1 },
		["Ghostly Pack"] = { Class = "Lootbox", MinAmount = 1 },
		["Time Trial Gift 2"] = { Class = "Lootbox", MinAmount = 18 },
		["Hype Egg 3"] = { Class = "Lootbox", MinAmount = 1 },
	},
	MaxMailPrice = 5000000,
	MailUser = PRIVATE_CONFIG.MailUser,
	KeepHuges = 0,

	DiscordId = PRIVATE_CONFIG.DiscordId,
	ShowPingInGlobalWebhook = false,
	WebhookUrl = PRIVATE_CONFIG.WebhookUrl,

	World = 1,
	Fps = 2,

	--event
	UseDice = { "Lucky Dice V2", "Lucky Dice II V2", "Mega Lucky Dice V2", "Mega Lucky Dice II V2" },
	RngUpgrades = {
		RNGHugeLuck = { MaxTier = 15 },
		RNGEggLuck = { MaxTier = 15 },
		RNGHatchSpeed = { MaxTier = 8 },
		RNGBonusLuck = { MaxTier = 13 },
	},
	CraftToDice = "Mega Lucky Dice II V2",
	CraftDiceAmount = "Max", -- can 1,2,3...
	KeepPets = 15, --if u have huges u can 1
	WaitBonusRollForUseMegaDice = true, -- wait bonus roll for use Mega Lucky Dice II V2
}

loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/fc4697b9d225539da838fc74ae83aac4.lua"))()
