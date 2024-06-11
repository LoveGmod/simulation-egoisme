local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(player)
    player.DevComputerMovementMode = Enum.DevComputerMovementMode.Scriptable
end)

local Dexter = require(script.dexter)
local Carrot = require(script.carrot)
local Dexters = {}
local Carrots = {}
local dayEnded = false

task.spawn(function()
    while true do
        print(Dexters)
        task.wait(5)
    end
end)

for i = 1, 15 do
    local carrot = Carrot.new()
    table.insert(Carrots, carrot)
    carrot:Spawn()
end

task.wait(3)

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

            for i, carrot in pairs(Carrots) do
                if (dexter.Character.Position - carrot.Position).Magnitude <= 7 then
                    carrot:Destroy()
                    dexter:Eat()
                end
            end

        end
    end)
end

task.wait(20)

dayEnded = true

for i, dexter in pairs(Dexters) do
    task.spawn(function()
        dexter:MoveTo(Vector3.new(0, 3, 0), 3)
        task.wait(4)
        dexter:Destroy()
    end)
end