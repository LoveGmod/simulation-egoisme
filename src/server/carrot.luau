local Carrot = {}
Carrot.__index = Carrot

function Carrot.new(): {Position: Vector3}
    local self = setmetatable({}, Carrot)

    self.Position = Vector3.new(math.random(-20, 20), 3, math.random(-20, 20))

    return self
end

function Carrot:Spawn()
    local carrot = Instance.new("Part")
    carrot.BrickColor = BrickColor.new("Deep orange")
    carrot.Size = Vector3.new(5, 5, 5)
    carrot.Position = self.Position
    carrot.Anchored = true
    carrot.Parent = workspace

    self.Character = carrot
end

function Carrot:Destroy()
    if self.Character then
        self.Character:Destroy()
        self.Character = nil
    else
        warn("Character do not exists for carrot "..self)
    end
end

return Carrot