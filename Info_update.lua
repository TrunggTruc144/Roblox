-- Cre: Hoith95 --

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local function Formatint(int)
	local Suffix = { "", "k", "M", "B", "T", "Qd", "Qn", "Sx", "Sp", "Oc", "No", "De", "UDe", "DDe" }
	local Index = 1

	if int < 999 then
		return tostring(int)
	end

	while int >= 1000 and Index < #Suffix do
		int = int / 1000
		Index += 1
	end

	return string.format("%.2f%s", int, Suffix[Index])
end

local function FormatTime(seconds)
	local hours = math.floor(seconds / 3600)
	local minutes = math.floor((seconds % 3600) / 60)
	local remainingSeconds = math.floor(seconds % 60)

	return string.format("%02d:%02d:%02d", hours, minutes, remainingSeconds)
end

local function updateLabelSize(label)
	label.Size = UDim2.new(0, label.TextBounds.X + 20, 0, 38)
end

local function getDiamondsFromLeaderstats()
	local stats = player:FindFirstChild("leaderstats")
	local diamonds = stats and stats:FindFirstChild("💎 Diamonds")

	return diamonds and diamonds.Value or 0
end

local function startGuiDefault()
	local oldGui = playerGui:FindFirstChild("GuiDefault")

	if oldGui then
		oldGui:Destroy()
	end

	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "GuiDefault"
	screenGui.ResetOnSpawn = false
	screenGui.DisplayOrder = 999999
	screenGui.Parent = playerGui

	local function createRegion(position, anchor, alignment)
		local frame = Instance.new("Frame")
		frame.BackgroundTransparency = 1
		frame.Size = UDim2.new(0, 250, 1, 0)
		frame.Position = position
		frame.AnchorPoint = anchor
		frame.Parent = screenGui

		local layout = Instance.new("UIListLayout")
		layout.SortOrder = Enum.SortOrder.LayoutOrder
		layout.Padding = UDim.new(0, 3)
		layout.HorizontalAlignment = alignment
		layout.VerticalAlignment = Enum.VerticalAlignment.Top
		layout.Parent = frame

		return frame
	end

	local function createLabel(name, parent, bgColor)
		local label = Instance.new("TextLabel")
		label.Name = name
		label.Size = UDim2.new(1, 0, 0, 38)
		label.BackgroundColor3 = bgColor
		label.TextColor3 = Color3.new(1, 1, 1)
		label.Font = Enum.Font.GothamBold
		label.TextSize = 32
		label.BackgroundTransparency = 0
		label.BorderSizePixel = 0
		label.TextXAlignment = Enum.TextXAlignment.Center
		label.Text = "..."
		label.AutoLocalize = false
		label.Parent = parent

		return label
	end

	local leftRegion = createRegion(UDim2.new(0, 10, 0, 8), Vector2.new(0, 0), Enum.HorizontalAlignment.Left)
	local centerRegion = createRegion(UDim2.new(0, 250, 0, 8), Vector2.new(0, 0), Enum.HorizontalAlignment.Left)
	local rightRegion = createRegion(UDim2.new(0, 490, 0, 8), Vector2.new(0, 0), Enum.HorizontalAlignment.Left)

	local fpsLabel = createLabel("FPSLabel", rightRegion, Color3.fromRGB(0, 102, 204))
	local timeLabel = createLabel("TimesLabel", centerRegion, Color3.fromRGB(0, 102, 204))
	local gemsLabel = createLabel("GemsLabel", leftRegion, Color3.fromRGB(0, 102, 204))

	local lastUpdate = tick()
	local frameCount = 0
	local startTime = os.time()

	local fpsConnection

	fpsConnection = RunService.RenderStepped:Connect(function()
		if not screenGui.Parent then
			if fpsConnection then
				fpsConnection:Disconnect()
			end
			return
		end

		frameCount += 1

		local now = tick()

		if now - lastUpdate >= 1 then
			local fps = frameCount / (now - lastUpdate)
			fpsLabel.Text = string.format(" %d", fps + 0.5)
			updateLabelSize(fpsLabel)

			frameCount = 0
			lastUpdate = now
		end
	end)

	while screenGui.Parent do
		pcall(function()
			gemsLabel.Text = "GEMS | " .. Formatint(getDiamondsFromLeaderstats())
			updateLabelSize(gemsLabel)

			timeLabel.Text = "TIME | " .. FormatTime(os.time() - startTime)
			updateLabelSize(timeLabel)
		end)

		task.wait(0.1)
	end

	if fpsConnection then
		fpsConnection:Disconnect()
	end
end

startGuiDefault()
