local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(player)
    player.DevComputerMovementMode = Enum.DevComputerMovementMode.Scriptable
end)

local DayHandler = require(script.day)

local Day = DayHandler.Init(1, 30)
local DayCount = 0

while true do
    DayCount += 1
    Day:Start()
    task.wait(30)
    Day:Stop()
    print("Données du jour "..tostring(DayCount).." :")
    print("Population : "..Day.TotalDexters)
    print("Carottes mangées : "..Day.EatenCarrots)
    task.wait(8)
end