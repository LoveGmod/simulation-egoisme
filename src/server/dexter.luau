local Dexter = {}
Dexter.__index = Dexter

function Dexter.new(name: string): {Name: string, Points: number}
    local self = setmetatable({}, Dexter)
    self.Name = name
    self.Points = 0
    return self
end

function Dexter:Spawn(position: Vector3)
    local dexter = Instance.new("Part")
    dexter.Size = Vector3.new(5, 5, 5)
    dexter.Position = position
    dexter.Name = self.Name
    dexter.Anchored = true
    dexter.Parent = workspace.Dexters

    self.Character = dexter
end

function Dexter:MoveTo(position: Vector3, tweenTime: number)
    game:GetService("TweenService"):Create(self.Character, TweenInfo.new(tweenTime, Enum.EasingStyle.Linear), {Position = position}):Play()
end

function Dexter:Eat()
    self.Points += 1
end

function Dexter:Destroy()
    if self.Character then
        self.Character:Destroy()
        self.Character = nil
    else
        warn("Character do not exists for dexter "..self)
    end
end

return Dexter