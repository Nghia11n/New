-- Hiệu ứng dịch chuyển
local function teleportPlayer()
    -- Tạo hiệu ứng ánh sáng khi dịch chuyển
    local teleportEffect = Instance.new("Part")
    teleportEffect.Size = Vector3.new(10, 1, 10)
    teleportEffect.Position = humanoidRootPart.Position
    teleportEffect.Anchored = true
    teleportEffect.CanCollide = false
    teleportEffect.Material = Enum.Material.Neon
    teleportEffect.Color = Color3.fromRGB(0, 255, 255)
    teleportEffect.Parent = workspace

    -- Sau một khoảng thời gian, xóa hiệu ứng
    game.Debris:AddItem(teleportEffect, 1)

    -- Dịch chuyển người chơi
    humanoidRootPart.CFrame = CFrame.new(teleportPosition)
    print("Player teleported to: " .. tostring(teleportPosition))
end
