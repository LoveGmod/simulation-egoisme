local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(player)
    player.DevComputerMovementMode = Enum.DevComputerMovementMode.Scriptable
end)

local DayHandler = require(script.day)

local Day = DayHandler.Init(1, 30)

while true do
    Day:Start()
    task.wait(30)
    Day:Stop()
    print("Population : "..Day.TotalDexters)
    print("Carottes mangées : "..Day.EatenCarrots)
    task.wait(20)
end