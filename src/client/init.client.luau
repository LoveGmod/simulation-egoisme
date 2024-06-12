repeat task.wait() until game:GetService("Players").LocalPlayer.CharacterAdded

game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.All, false)

local Camera = game:GetService("Workspace").CurrentCamera
Camera.CameraType = Enum.CameraType.Scriptable

Camera.CFrame = game:GetService("Workspace").Village.Cam.CFrame

task.spawn(function()
    task.wait(5)
    game:GetService("StarterGui"):SetCore("ResetButtonCallback", false)
end)

local Dexters = {}

game:GetService("Workspace").Dexters.ChildAdded:Connect(function()
    table.clear(Dexters)
    for i, dexter in pairs(game:GetService("Workspace").Dexters:GetChildren()) do
        table.insert(Dexters, dexter)
    end
end)

game:GetService("Workspace").Dexters.ChildRemoved:Connect(function()
    table.clear(Dexters)
    for i, dexter in pairs(game:GetService("Workspace").Dexters:GetChildren()) do
        table.insert(Dexters, dexter)
    end
end)