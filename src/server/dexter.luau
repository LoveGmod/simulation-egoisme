local Dexter = {}
Dexter.__index = Dexter

function Dexter.new()
    local self = setmetatable({}, Dexter)
    self.Points = 0
    return self
end

function Dexter:Spawn(position: Vector3)
    local dexter = Instance.new("Part")
    dexter.Size = Vector3.new(5, 5, 5)
    dexter.Position = position
    dexter.Parent = workspace

    self.Character = dexter
end

function Dexter:MoveTo(position: Vector3, tweenTime: number)
    game:GetService("TweenService"):Create(self.Character, TweenInfo.new(tweenTime), {Position = position}):Play()
end

function Dexter:Destoy()
    if self.Character then
        self.Character:Destoy()
        self.Character = nil
    else
        warn("Character do not exists for dexter "..self)
    end
end

return Dexter