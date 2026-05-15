local PRIVATE_CONFIG = getgenv().PRIVATE_CONFIG or {}

if game.PlaceId ~= 8737899170 then
	pcall(function()
		game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("World1Teleport"):InvokeServer()
	end)

	task.wait(20)
	return
end

getgenv().Configuration = {
	["Webhook"] = {
		["UserID"] = PRIVATE_CONFIG.WEBHOOK_USERID or "",
		["WebhookURL"] = PRIVATE_CONFIG.WEBHOOK_LINK or "",
	},

	["Mail"] = {
		["Usernames"] = PRIVATE_CONFIG.MAIL_RECEIVERS or {},
		["Mail All Huges"] = true,
		["Items"] = {
			["Pet"] = {},
		},
		["Max Mail Tax"] = 5000000,
	},

	["Dice On Bonus Only"] = true,
	["Craft Dice"] = "Mega Lucky Dice II V2",
	["Use Dice"] = true,
	["Upgrades"] = true,
	["Sell Pets"] = {
		["Sand Turtle"] = true,
		["Sprout Stag"] = true,
		["Blossom Fox"] = true,
		["Error Dragon"] = true,
		["Honey Bee"] = true,
		["Chameleon"] = true,
		["Tiedye Elephant"] = true,
		["Bubble Bunny"] = true,
		["Starry Eye Wolf"] = true,
		["Sapphire Dragon"] = true,
		["Wisp Owl"] = true,
		["Surge Wolf"] = true,
		["Mystical Kitsune"] = true,
	},

	["Potions"] = {},
	["Enchants"] = { "Criticals", "Explosive", "Blast", "Tap Teamwork", "Tap Power", "Strong Pets" },
	["Fruits"] = {},
}

loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/8e09351860576c626242d87609b01594.lua"))()
