local Carrot = {}
Carrot.__index = Carrot

function Carrot.new(): {Position: Vector3, Eaten: boolean}
    local self = setmetatable({}, Carrot)

    self.Position = Vector3.new(math.random(-20, 20), 3, math.random(-20, 20))
    self.Eaten = false

    return self
end

function Carrot:Spawn()
    local carrot = Instance.new("Part")
    carrot.BrickColor = BrickColor.new("Deep orange")
    carrot.Size = Vector3.new(5, 5, 5)
    carrot.Position = self.Position
    carrot.Anchored = true
    carrot.Parent = workspace.Carrots

    self.Character = carrot
end

function Carrot:Eat()
    self.Eaten = true

    if self.Character then
        self.Character:Destroy()
        self.Character = nil
    end
end

return Carrot