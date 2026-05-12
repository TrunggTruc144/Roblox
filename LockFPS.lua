-- Cấu hình FPS
local FPS_CONFIG = {
	DEFAULT = {
		fps = 2,
		allowed = { 1, 2, 3, 4 },
	},

	TIME_TRIAL = {
		fps = 5,
		allowed = { 4, 5, 6 },
	},
}

task.spawn(function()
	local things = workspace:WaitForChild("__THINGS")
	local container = things:WaitForChild("__INSTANCE_CONTAINER")

	local currentMode = nil

	local function isTimeTrial()
		local active = container:FindFirstChild("Active")
		return active and active:FindFirstChild("TimeTrial")
	end

	local function getConfig()
		if isTimeTrial() then
			return "TimeTrial", FPS_CONFIG.TIME_TRIAL
		end

		return "Default", FPS_CONFIG.DEFAULT
	end

	while true do
		task.wait(1)

		local mode, config = getConfig()

		_G.fpsSettings = {
			default = config.fps,
			allowedFps = config.allowed,
		}

		local currentFpsCap = getfpscap()

		if currentMode ~= mode then
			currentMode = mode
			setfpscap(config.fps)
			print("Đã set fpscap thành", config.fps, "| Mode:", mode)
		end

		if not table.find(config.allowed, currentFpsCap) then
			setfpscap(config.fps)
			print("FPS bị thay đổi ngoài mức hợp lệ, đã đặt lại thành", config.fps, "| Mode:", mode)
		end
	end
end)
