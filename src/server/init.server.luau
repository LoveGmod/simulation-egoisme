local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(player)
    player.DevComputerMovementMode = Enum.DevComputerMovementMode.Scriptable
end)

local Dexter = require(script.dexter)

for i = 1, 5 do
    local dexter = Dexter.new("Dexter"..i)
    dexter:Spawn(Vector3.new(i + 4, 3, 0))
end