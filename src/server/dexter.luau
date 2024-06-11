local Dexter = {}
Dexter.__index = Dexter

function Dexter.new()
    local self = setmetatable({}, Dexter)

    return self
end

function Dexter:Spawn(position: Vector3)

end

return Dexter