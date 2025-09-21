
# StopWatch service

This module is a simple stopwatch for measuring elapsed time in a game. It allows starting, stopping, resetting, and reading the current time.

## 🌟 Features

- ✅ Start, stop, and reset the stopwatch  
- ⏲️ Read elapsed time anytime  
- ⚡ Runs in the background while active  
- 🪶 Lightweight and easy to integrate  
- 📊 Full debug info for developers  

## 📜 License

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)

## 🛠️ Usage
### Create a new stopwatch
```lua
local sw = StopWatch.new()
```
### Start the stopwatch
```lua
sw:Start()
```
### Read the stopwatch
```lua
sw:Read()
```
### Stop the stopwatch
```lua
sw:Stop()
```
### Reset the stopwatch
```lua
sw:Reset()
```
### Get full info for debugging
```lua
sw:GetFullInfo()
```


## 💡 Example

```lua
local StopWatch = require(path.to.stopWatch)

-- Create a new stopwatch
local sw = StopWatch.new()

-- Start the stopwatch
sw:Start()

-- Wait some time
task.wait(2)

-- Read elapsed time
local elapsedTime = sw:Read()
print("Elapsed time:", elapsedTime)

-- Stop the stopwatch
sw:Stop()

-- Reset the stopwatch
sw:Reset()

-- Optional
-- Get full info for debugging
local info = sw:GetFullInfo()
print(info)
```
## 💾 Installation

1. Download or clone this repository.  
2. Place the `StopWatch.lua` module inside `ReplicatedStorage` or your preferred folder in Roblox Studio.  
3. Require it in your scripts.

```lua
local StopWatch = require(path.to.StopWatch)
```
## 👤 Authors

- [@xxcredeadxx](https://github.com/xXcredeadXx) (Discord: xxcredeadxx_)

