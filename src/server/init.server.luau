local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(player)
    player.DevComputerMovementMode = Enum.DevComputerMovementMode.Scriptable
end)

local Dexter = require(script.dexter)
local Dexters = {}
local dayEnded = false

for i = 1, 5 do
    local dexter = Dexter.new("Dexter"..i)
    table.insert(Dexters, dexter)
    dexter:Spawn(Vector3.new(0, 3, 0))
    task.spawn(function()
        while true do
            if dayEnded then
                return
            end

            local duration = math.random(3, 7)
            dexter:MoveTo(Vector3.new(math.random(-20, 20), 3, math.random(-20, 20)), duration)
            task.wait(duration + 2)
        end
    end)
end

task.wait(60)

dayEnded = true

for i, dexter in pairs(Dexters) do
    task.spawn(function()
        dexter:MoveTo(Vector3.new(0, 50, 0), 3)
        task.wait(4)
        dexter:Destoy()
    end)
end