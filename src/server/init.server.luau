local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(player)
    player.DevComputerMovementMode = Enum.DevComputerMovementMode.Scriptable
end)

local Dexter = require(script.dexter)

for i = 1, 5 do
    local dexter = Dexter.new("Dexter"..i)
    dexter:Spawn(Vector3.new(0, 3, 0))
    task.spawn(function()
        while true do
            dexter:MoveTo(Vector3.new(math.random(-20, 20), 3, math.random(-20, 20)), 3)
            task.wait(5)
        end
    end)
end