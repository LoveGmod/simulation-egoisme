local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Wait()
    player.DevComputerMovementMode = Enum.DevComputerMovementMode.Scriptable
end)