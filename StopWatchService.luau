--// Stopwatch Module
--  Author: xxcredeadxx
--  License: MIT
--  Description: Simple stopwatch utility for measuring elapsed time.
--  Usage: Free to use and modify.
--\\

--// Code

local stopWatch = {} :: stopWatch
stopWatch.__index = stopWatch

-- Stopwatch and object type definition
type stopWatch = {
	__index: stopWatch,
	new: () -> object,

	Start: (self: object) -> (),
	Stop: (self: object) -> (),
	Reset: (self: object) -> (),
	Read: (self: object) -> (number),
	GetFullInfo: (self: object) -> (string),
}

type object = typeof(setmetatable({} :: {
	time: number,        -- elapsed time
	startTime: number,   -- when the stopwatch was started
	isRunning: boolean,  -- whether stopwatch is active
	thread: thread,      -- background thread updating elapsed time
}, {} :: stopWatch))

--// Functions

-- Creates a new stopwatch object
function stopWatch.new()
	return setmetatable({
		['time'] = 0,
		['startTime'] = 0,
		['isRunning'] = false,
		['thread'] = nil
	}, stopWatch :: stopWatch) :: object
end

-- Starts the stopwatch (spawns update loop if needed)
function stopWatch:Start()
	if self.isRunning then
		return
	end
	self.isRunning = true
	self.startTime = os.clock()
	self.time = 0

	-- Run update loop in background once
	if self.thread == nil then
		self.thread = task.spawn(function()
			while self.isRunning do
				task.wait()
				local currentTime = os.clock()
				self.time = currentTime - self.startTime
			end
		end)
	end
end

-- Stops the stopwatch (keeps last measured time)
function stopWatch:Stop()
	if self.isRunning then
		self.isRunning = false
	end
end

-- Reads current elapsed time
function stopWatch:Read()
	return self.time
end

-- Resets stopwatch to initial state
function stopWatch:Reset()
	self.isRunning = false
	self.startTime = 0
	self.time = 0
	self.thread = nil
end

-- Returns full object info (mainly for debugging)
function stopWatch:GetFullInfo()
	return self
end

return stopWatch
