-- Tạo GUI và Frame
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Tạo một Frame làm nền cho ô đồ
local inventoryFrame = Instance.new("Frame")
inventoryFrame.Size = UDim2.new(0, 400, 0, 400)  -- Kích thước của ô đồ
inventoryFrame.Position = UDim2.new(0.5, -200, 0.5, -200)  -- Vị trí giữa màn hình
inventoryFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
inventoryFrame.BackgroundTransparency = 0.5
inventoryFrame.Parent = screenGui

-- Tạo các ô vật phẩm trong ô đồ
local itemButtons = {}
local numRows = 4  -- Số hàng
local numCols = 4  -- Số cột
local buttonSize = UDim2.new(0, 80, 0, 80)  -- Kích thước mỗi ô
local padding = 10  -- Khoảng cách giữa các ô

-- Hàm tạo các ô trong ô đồ
for row = 1, numRows do
    for col = 1, numCols do
        local button = Instance.new("TextButton")
        button.Size = buttonSize
        button.Position = UDim2.new(0, (col - 1) * (buttonSize.X.Offset + padding), 0, (row - 1) * (buttonSize.Y.Offset + padding))
        button.Text = "Item " .. ((row - 1) * numCols + col)  -- Đặt tên cho các ô
        button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        button.Parent = inventoryFrame
        table.insert(itemButtons, button)
    end
end

-- Danh sách vật phẩm giả lập
local inventoryItems = {
    "Sword", "Gun", "Fruit", "Armor", "Boots", "Shield", "Ring", "Potion",
    "Map", "Key", "Gem", "Treasure", "Coin", "Scroll", "Helmet", "Chest"
}

-- Hàm cập nhật nội dung các ô vật phẩm
function updateInventory()
    for i, button in ipairs(itemButtons) do
        if inventoryItems[i] then
            button.Text = inventoryItems[i]  -- Cập nhật tên vật phẩm
        else
            button.Text = ""  -- Nếu không có vật phẩm, để trống ô
        end
    end
end

-- Cập nhật ô đồ ban đầu
updateInventory()

-- Hàm mở hoặc đóng ô đồ
local function toggleInventory()
    if inventoryFrame.Visible then
        inventoryFrame.Visible = false
    else
        inventoryFrame.Visible = true
    end
end

-- Thêm sự kiện để mở hoặc đóng ô đồ (ví dụ: nhấn phím "I")
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end
    if input.KeyCode == Enum.KeyCode.I then
        toggleInventory()
    end
end)
