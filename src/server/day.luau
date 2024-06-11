local Dexter = require(script.Parent.dexter)
local Carrot = require(script.Parent.carrot)
local Dexters = {}
local Carrots = {}
local Day = {}
Day.__index = Day

local dayEnabled = true

function Day.Init(initialDexter, maxCarrots): {TotalDexters: number, MaxCarrots: number, EatenCarrots: number}
    local self = setmetatable({}, Day)
    self.TotalDexters = initialDexter
    self.MaxCarrots = maxCarrots
    self.EatenCarrots = 0

    return self
end

function Day:Start()
    dayEnabled = true

    for i = 1, self.MaxCarrots do
        local carrot = Carrot.new()
        table.insert(Carrots, carrot)
        carrot:Spawn()
    end

    task.wait(1)

    for i = 1, self.TotalDexters do
        local dexter = Dexter.new("Dexter"..i)
        table.insert(Dexters, dexter)
        dexter:Spawn(Vector3.new(0, 3, 0))

        print(Dexters)

        task.spawn(function()
            task.spawn(function()
                while true do
                    if dayEnabled == false then
                        break
                    end
    
                    for i, carrot in pairs(Carrots) do
                        if (dexter.Character.Position - carrot.Position).Magnitude <= 7 then
                            if not carrot.Eaten then
                                carrot:Eat()
                                dexter:Eat()
                            end
                        end
                    end
    
                    task.wait()
                end
            end)
    
            while true do
                if dayEnabled == false then
                    break
                end
    
                local duration = math.random(3, 7)
                dexter:MoveTo(Vector3.new(math.random(-20, 20), 3, math.random(-20, 20)), duration)
    
                task.wait(duration + 2)
            end
        end)
    end
end

function Day:Stop()
    dayEnabled = false
    for i, dexter in pairs(Dexters) do
        task.spawn(function()
            dexter:MoveTo(Vector3.new(0, 3, 0), 3)
            task.wait(4)
            dexter:Destroy()
        end)
    end

    task.wait(4)

    table.clear(Carrots)
    for i, carrot in pairs(workspace.Carrots:GetChildren()) do
        carrot:Destroy()
    end

    for i, dexter in pairs(Dexters) do
        if dexter.Points < 5 then
            self.TotalDexters -= 1
        end
    end

    for i, dexter in pairs(Dexters) do
        local finalPoints = dexter.Points
        finalPoints -= 5

        finalPoints //= 5

        self.TotalDexters += finalPoints
    end

    self.EatenCarrots = 0
    
    for i, dexter in pairs(Dexters) do
        self.EatenCarrots += dexter.Points
        dexter.Points = 0
    end

    table.clear(Dexters)
end

return Day