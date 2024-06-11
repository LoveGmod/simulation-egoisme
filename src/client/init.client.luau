repeat task.wait() until game:GetService("Players").LocalPlayer.CharacterAdded

game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.All, false)

local Camera = game:GetService("Workspace").CurrentCamera
Camera.CameraType = Enum.CameraType.Scriptable

Camera.CFrame = game:GetService("Workspace").Village.Cam.CFrame

task.spawn(function()
    task.wait(5)
    game:GetService("StarterGui"):SetCore("ResetButtonCallback", false)
end)