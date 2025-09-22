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
}, {} :: stopWatch))

--// Functions

-- Creates a new stopwatch object
function stopWatch.new()
	return setmetatable({
		time = 0,           -- elapsed time
		startTime = 0,      -- start time
		isRunning = false,  -- running state
	}, stopWatch) :: object
end

-- Starts the stopwatch
function stopWatch:Start()
	if not self.isRunning then
		self.isRunning = true
		self.startTime = os.clock()
	end
end

-- Stops the stopwatch (keeps last measured time)
function stopWatch:Stop()
	if self.isRunning then
		self.time += os.clock() - self.startTime
		self.isRunning = false
	end
end

-- Reads current elapsed time
function stopWatch:Read()
	if self.isRunning then
		return self.time + (os.clock() - self.startTime)
	else
		return self.time
	end
end

-- Resets stopwatch to initial state
function stopWatch:Reset()
	self.isRunning = false
	self.startTime = 0
	self.time = 0
end

-- Returns full object info (mainly for debugging)
function stopWatch:GetFullInfo()
	return self
end

return stopWatch
