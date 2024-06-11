game:GetService("Players").LocalPlayer.CharacterAdded:Wait()

local Camera = game:GetService("Workspace").CurrentCamera
Camera.CameraType = Enum.CameraType.Scriptable

Camera.CFrame = game:GetService("Workspace").Village.Cam.CFrame