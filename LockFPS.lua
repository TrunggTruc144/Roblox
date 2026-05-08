-- Cre: Hoith95 --

if _G.LOOKFPS then
	return
end
_G.LOOKFPS = true

-- ⚙️ CONFIG
local DEBUG = false

local FPS = {
	TIME_TRIAL = 7,

	DEFAULT_EARLY = 2,
	DEFAULT_LATE = 3,
}

-- ⏱️ CONSTANT
local THREE_HOURS = 10800

-- 🚀 INIT
task.wait(68)
local startTime = tick()

task.spawn(function()
	local set = setfpscap
	local place = game.PlaceId
	local things = workspace:WaitForChild("__THINGS")
	local container = things:WaitForChild("__INSTANCE_CONTAINER")
	local currentFPS = nil

	-- 🔧 UTIL
	local function log(...)
		if DEBUG then
			print("[FPS]", ...)
		end
	end

	local function setFPS(v, reason)
		if currentFPS ~= v then
			currentFPS = v
			set(v)
			log("Set FPS:", v, "| Reason:", reason)
		end
	end

	local function getActive()
		return container:FindFirstChild("Active")
	end

	-- 🌍 STATE DETECT
	local function isTimeTrial(active)
		return active and active:FindFirstChild("TimeTrial")
	end

	local function isLowFPSPlace(placeId)
		return placeId == 95635359880599
			or placeId == 119454325063278
			or placeId == 8737899170
			or placeId == 16498369169
			or placeId == 17503543197
			or placeId == 15502339080
	end

	-- 🧠 DEFAULT RULE
	local function getDefaultFPS(elapsed)
		if elapsed >= THREE_HOURS then
			return FPS.DEFAULT_LATE, "Default(After3h)"
		else
			return FPS.DEFAULT_EARLY, "Default(Early)"
		end
	end

	-- 🧠 CORE LOGIC
	local function resolveFPS()
		local active = getActive()
		local elapsed = tick() - startTime

		-- 🥇 Priority 1: Time Trial
		if isTimeTrial(active) then
			return FPS.TIME_TRIAL, "TimeTrial"
		end

		-- 🥈 Priority 2: Low FPS Place
		if isLowFPSPlace(place) then
			return FPS.DEFAULT_EARLY, "LowFPSPlace"
		end

		-- 🧠 Default
		return getDefaultFPS(elapsed)
	end

	-- 🔁 LOOP
	while true do
		local active = getActive()

		local isActiveEvent = active and active:FindFirstChild("TimeTrial")
		local waitTime = isActiveEvent and 0.01 or 0.1

		local fps, reason = resolveFPS()
		setFPS(fps, reason)

		task.wait(waitTime)
	end
end)
