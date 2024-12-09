-- Đảm bảo rằng script được chạy trong một LocalScript (chạy từ client)
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- Xác định vị trí dịch chuyển (có thể thay đổi tùy theo yêu cầu)
local teleportPosition = Vector3.new(100, 0, 200)  -- Thay đổi tọa độ này để đặt vị trí dịch chuyển

-- Tạo một item dịch chuyển (có thể là một TextButton hoặc một vật phẩm trong game)
local teleportItem = Instance.new("Tool")
teleportItem.Name = "TeleportItem"
teleportItem.RequiresHandle = false
teleportItem.Parent = player.Backpack  -- Thêm item vào ba lô của người chơi

-- Hàm thực hiện dịch chuyển
local function teleportPlayer()
    -- Kiểm tra nếu vị trí dịch chuyển hợp lệ (không phải vị trí trong không gian không xác định)
    if teleportPosition then
        -- Dịch chuyển người chơi đến vị trí đã định
        humanoidRootPart.CFrame = CFrame.new(teleportPosition)
        print("Player teleported to: " .. tostring(teleportPosition))
    else
        print("Invalid teleport position")
    end
end

-- Thêm sự kiện để người chơi sử dụng item dịch chuyển
teleportItem.Activated:Connect(function()
    teleportPlayer()  -- Khi người chơi nhấn vào item, thực hiện dịch chuyển
end)
