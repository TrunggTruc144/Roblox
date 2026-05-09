-- Cre: Hoith95 --

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local PlayerSave = require(ReplicatedStorage.Library.Client.Save)

local function getSave()
	local ok, sd = pcall(PlayerSave.Get)
	if ok then
		return sd
	end
end

local function getTimeTrialStats()
	local sd = getSave()
	return sd and sd.TimeTrialStats or { DailyRuns = 0, Points = 0 }
end

local function getRunsLeft()
	local s = getTimeTrialStats()
	return 10 - (s.DailyRuns or 0)
end

local function getTimeTrialPoints()
	local s = getTimeTrialStats()
	return s.Points or 0
end

local function updateLabelSize(label)
	label.Size = UDim2.new(0, label.TextBounds.X + 20, 0, 38)
end

local function startGuiUpdater()
	local old = playerGui:FindFirstChild("GuiUpdater")

	if old then
		old:Destroy()
	end

	local gui = Instance.new("ScreenGui")
	gui.Name = "GuiUpdater"
	gui.ResetOnSpawn = false
	gui.DisplayOrder = 999999
	gui.Parent = playerGui

	local function createRegion(pos, anchor, align)
		local f = Instance.new("Frame")
		f.BackgroundTransparency = 1
		f.Size = UDim2.new(0, 260, 1, 0)
		f.Position = pos
		f.AnchorPoint = anchor
		f.Parent = gui

		local l = Instance.new("UIListLayout")
		l.SortOrder = Enum.SortOrder.LayoutOrder
		l.HorizontalAlignment = align
		l.VerticalAlignment = Enum.VerticalAlignment.Top
		l.Parent = f

		return f
	end

	local function createLabel(name, parent)
		local t = Instance.new("TextLabel")
		t.Name = name
		t.Size = UDim2.new(1, 0, 0, 38)
		t.BackgroundColor3 = Color3.fromRGB(34, 139, 34)
		t.TextColor3 = Color3.new(1, 1, 1)
		t.Font = Enum.Font.GothamBold
		t.TextSize = 29
		t.BorderSizePixel = 0
		t.TextXAlignment = Enum.TextXAlignment.Center
		t.Parent = parent

		return t
	end

	local left = createRegion(UDim2.new(0, 10, 0, 58), Vector2.new(0, 0), Enum.HorizontalAlignment.Left)
	local center = createRegion(UDim2.new(0, 250, 0, 58), Vector2.new(0, 0), Enum.HorizontalAlignment.Left)
	local right = createRegion(UDim2.new(0, 490, 0, 58), Vector2.new(0, 0), Enum.HorizontalAlignment.Left)

	local rankLabel = createLabel("RankLabel", right)
	local timeTrialLabel = createLabel("TimeTrialLabel", left)
	local pointsLabel = createLabel("PointsLabel", center)

	while gui.Parent do
		local sd = getSave()

		if sd then
			rankLabel.Text = tostring(sd.Rank or 0) .. " | RANK"
			updateLabelSize(rankLabel)

			local runsLeft = getRunsLeft()

			timeTrialLabel.Text = "Time Trial: " .. runsLeft .. "/10"

			if runsLeft == 0 then
				timeTrialLabel.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
			else
				timeTrialLabel.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
			end

			updateLabelSize(timeTrialLabel)

			pointsLabel.Text = "Điểm: " .. getTimeTrialPoints()

			if _G.Time_Trial_Var then
				pointsLabel.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
			else
				pointsLabel.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
			end

			updateLabelSize(pointsLabel)
		end

		task.wait(0.1)
	end
end

startGuiUpdater()
