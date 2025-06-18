local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ProfileUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local blurEffect = Instance.new("BlurEffect")
blurEffect.Name = "UIBlur"
blurEffect.Size = 15
blurEffect.Parent = Lighting

-- Function to calculate responsive sizes
local function getResponsiveSize()
    local viewportSize = workspace.CurrentCamera.ViewportSize
    local baseWidth = 1000
    local baseHeight = 750
    
    -- Scale factor based on screen size
    local scaleX = viewportSize.X / 1920 -- Assuming 1920x1080 as base resolution
    local scaleY = viewportSize.Y / 1080
    local scale = math.min(scaleX, scaleY, 1) -- Don't scale larger than original
    
    -- Minimum scale to ensure UI is not too small
    scale = math.max(scale, 0.6)
    
    local width = baseWidth * scale
    local height = baseHeight * scale
    
    return UDim2.new(0, width, 0, height), UDim2.new(0.5, -width/2, 0.5, -height/2)
end

local mainSize, mainPosition = getResponsiveSize()

local mainContainer = Instance.new("Frame")
mainContainer.Name = "MainContainer"
mainContainer.Size = mainSize
mainContainer.Position = mainPosition
mainContainer.BackgroundTransparency = 1
mainContainer.Visible = true
mainContainer.Parent = screenGui

local headerFrame = Instance.new("Frame")
headerFrame.Name = "HeaderFrame"
headerFrame.Size = UDim2.new(1, 0, 0, 110)
headerFrame.Position = UDim2.new(0, 0, 0, 0)
headerFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
headerFrame.BorderSizePixel = 3
headerFrame.BorderColor3 = Color3.fromRGB(255, 255, 255)
headerFrame.Parent = mainContainer

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 15)
headerCorner.Parent = headerFrame

local headerLED = Instance.new("UIStroke")
headerLED.Color = Color3.fromRGB(0, 255, 255)
headerLED.Thickness = 2
headerLED.Transparency = 0.3
headerLED.Parent = headerFrame

local lionLabel = Instance.new("TextLabel")
lionLabel.Name = "LionLabel"
lionLabel.Size = UDim2.new(0.45, 0, 0.5, 0)
lionLabel.Position = UDim2.new(0, 120, 0, 10)
lionLabel.BackgroundTransparency = 1
lionLabel.Text = "LION KAITUN"
lionLabel.TextColor3 = Color3.fromRGB(255, 165, 0)
lionLabel.TextScaled = true
lionLabel.Font = Enum.Font.Cartoon
lionLabel.TextStrokeTransparency = 0
lionLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
lionLabel.Parent = headerFrame

local playerNameLabel = Instance.new("TextLabel")
playerNameLabel.Name = "PlayerName"
playerNameLabel.Size = UDim2.new(0.5, 0, 0.4, 0)
playerNameLabel.Position = UDim2.new(0, 90, 0.5, 5)
playerNameLabel.BackgroundTransparency = 1
playerNameLabel.Text = "Hello " .. player.Name
playerNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
playerNameLabel.TextScaled = true
playerNameLabel.Font = Enum.Font.Cartoon
playerNameLabel.Parent = headerFrame

local avatarFrame = Instance.new("Frame")
avatarFrame.Name = "AvatarFrame"
avatarFrame.Size = UDim2.new(0, 90, 0, 90)
avatarFrame.Position = UDim2.new(1, -110, 0, 10)
avatarFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
avatarFrame.BorderSizePixel = 3
avatarFrame.BorderColor3 = Color3.fromRGB(255, 255, 255)
avatarFrame.Parent = headerFrame

local avatarCorner = Instance.new("UICorner")
avatarCorner.CornerRadius = UDim.new(0, 15)
avatarCorner.Parent = avatarFrame

local avatarLED = Instance.new("UIStroke")
avatarLED.Color = Color3.fromRGB(255, 0, 255)
avatarLED.Thickness = 2
avatarLED.Transparency = 0.3
avatarLED.Parent = avatarFrame

local avatarImage = Instance.new("ImageLabel")
avatarImage.Name = "Avatar"
avatarImage.Size = UDim2.new(1, -6, 1, -6)
avatarImage.Position = UDim2.new(0, 3, 0, 3)
avatarImage.BackgroundTransparency = 1
avatarImage.Image = "https://www.roblox.com/headshot-thumbnail/image?userId="..player.UserId.."&width=150&height=150&format=png"
avatarImage.Parent = avatarFrame

local avatarImageCorner = Instance.new("UICorner")
avatarImageCorner.CornerRadius = UDim.new(0, 12)
avatarImageCorner.Parent = avatarImage

local leftFrame = Instance.new("Frame")
leftFrame.Name = "LeftFrame"
leftFrame.Size = UDim2.new(0.48, 0, 0, 320)
leftFrame.Position = UDim2.new(0, 0, 0, 130)
leftFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
leftFrame.BorderSizePixel = 3
leftFrame.BorderColor3 = Color3.fromRGB(255, 255, 255)
leftFrame.Parent = mainContainer

local leftCorner = Instance.new("UICorner")
leftCorner.CornerRadius = UDim.new(0, 15)
leftCorner.Parent = leftFrame

local leftLED = Instance.new("UIStroke")
leftLED.Color = Color3.fromRGB(50, 150, 250)
leftLED.Thickness = 2
leftLED.Transparency = 0.3
leftLED.Parent = leftFrame

local leftTitle = Instance.new("TextLabel")
leftTitle.Name = "LeftTitle"
leftTitle.Size = UDim2.new(1, -20, 0, 45)
leftTitle.Position = UDim2.new(0, 10, 0, 10)
leftTitle.BackgroundTransparency = 1
leftTitle.Text = "In-game Status"
leftTitle.TextColor3 = Color3.fromRGB(50, 150, 250)
leftTitle.TextScaled = true
leftTitle.Font = Enum.Font.Cartoon
leftTitle.TextStrokeTransparency = 0
leftTitle.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
leftTitle.Parent = leftFrame

local rightFrame = Instance.new("Frame")
rightFrame.Name = "RightFrame"
rightFrame.Size = UDim2.new(0.48, 0, 0, 320)
rightFrame.Position = UDim2.new(0.52, 0, 0, 130)
rightFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
rightFrame.BorderSizePixel = 3
rightFrame.BorderColor3 = Color3.fromRGB(255, 255, 255)
rightFrame.Parent = mainContainer

local rightCorner = Instance.new("UICorner")
rightCorner.CornerRadius = UDim.new(0, 15)
rightCorner.Parent = rightFrame

local rightLED = Instance.new("UIStroke")
rightLED.Color = Color3.fromRGB(250, 100, 100)
rightLED.Thickness = 2
rightLED.Transparency = 0.3
rightLED.Parent = rightFrame

local rightTitle = Instance.new("TextLabel")
rightTitle.Name = "RightTitle"
rightTitle.Size = UDim2.new(1, -20, 0, 45)
rightTitle.Position = UDim2.new(0, 10, 0, 10)
rightTitle.BackgroundTransparency = 1
rightTitle.Text = "Player Status"
rightTitle.TextColor3 = Color3.fromRGB(250, 100, 100)
rightTitle.TextScaled = true
rightTitle.Font = Enum.Font.Cartoon
rightTitle.TextStrokeTransparency = 0
rightTitle.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
rightTitle.Parent = rightFrame

local bottomFrame = Instance.new("Frame")
bottomFrame.Name = "BottomFrame"
bottomFrame.Size = UDim2.new(1, 0, 0, 160)
bottomFrame.Position = UDim2.new(0, 0, 0, 470)
bottomFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
bottomFrame.BorderSizePixel = 3
bottomFrame.BorderColor3 = Color3.fromRGB(255, 255, 255)
bottomFrame.Parent = mainContainer

local bottomCorner = Instance.new("UICorner")
bottomCorner.CornerRadius = UDim.new(0, 15)
bottomCorner.Parent = bottomFrame

local bottomLED = Instance.new("UIStroke")
bottomLED.Color = Color3.fromRGB(100, 250, 100)
bottomLED.Thickness = 2
bottomLED.Transparency = 0.3
bottomLED.Parent = bottomFrame

local bottomTitle = Instance.new("TextLabel")
bottomTitle.Name = "BottomTitle"
bottomTitle.Size = UDim2.new(1, -20, 0, 45)
bottomTitle.Position = UDim2.new(0, 10, 0, 10)
bottomTitle.BackgroundTransparency = 1
bottomTitle.Text = "Script Status"
bottomTitle.TextColor3 = Color3.fromRGB(100, 250, 100)
bottomTitle.TextScaled = true
bottomTitle.Font = Enum.Font.Cartoon
bottomTitle.TextStrokeTransparency = 0
bottomTitle.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
bottomTitle.Parent = bottomFrame

local leftScrollFrame = Instance.new("ScrollingFrame")
leftScrollFrame.Name = "LeftScrollFrame"
leftScrollFrame.Size = UDim2.new(1, -20, 1, -65)
leftScrollFrame.Position = UDim2.new(0, 10, 0, 55)
leftScrollFrame.BackgroundTransparency = 1
leftScrollFrame.BorderSizePixel = 0
leftScrollFrame.ScrollBarThickness = 6
leftScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
leftScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
leftScrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
leftScrollFrame.Parent = leftFrame

local leftGridLayout = Instance.new("UIListLayout")
leftGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
leftGridLayout.Padding = UDim.new(0, 8)
leftGridLayout.Parent = leftScrollFrame

local rightScrollFrame = Instance.new("ScrollingFrame")
rightScrollFrame.Name = "RightScrollFrame"
rightScrollFrame.Size = UDim2.new(1, -20, 1, -65)
rightScrollFrame.Position = UDim2.new(0, 10, 0, 55)
rightScrollFrame.BackgroundTransparency = 1
rightScrollFrame.BorderSizePixel = 0
rightScrollFrame.ScrollBarThickness = 6
rightScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
rightScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
rightScrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
rightScrollFrame.Parent = rightFrame

local rightGridLayout = Instance.new("UIListLayout")
rightGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
rightGridLayout.Padding = UDim.new(0, 8)
rightGridLayout.Parent = rightScrollFrame

local bottomScrollFrame = Instance.new("ScrollingFrame")
bottomScrollFrame.Name = "BottomScrollFrame"
bottomScrollFrame.Size = UDim2.new(1, -20, 1, -65)
bottomScrollFrame.Position = UDim2.new(0, 10, 0, 55)
bottomScrollFrame.BackgroundTransparency = 1
bottomScrollFrame.BorderSizePixel = 0
bottomScrollFrame.ScrollBarThickness = 6
bottomScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
bottomScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
bottomScrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
bottomScrollFrame.Parent = bottomFrame

local bottomGridLayout = Instance.new("UIListLayout")
bottomGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
bottomGridLayout.Padding = UDim.new(0, 10)
bottomGridLayout.Parent = bottomScrollFrame

local function createStatusItem(name, hasItem, parent)
    local statusFrame = Instance.new("Frame")
    statusFrame.Name = name
    statusFrame.Size = UDim2.new(1, -10, 0, 36) 
    statusFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    statusFrame.BorderSizePixel = 1
    statusFrame.BorderColor3 = Color3.fromRGB(80, 80, 80)
    
    local statusCorner = Instance.new("UICorner")
    statusCorner.CornerRadius = UDim.new(0, 8)
    statusCorner.Parent = statusFrame
 
    local statusIcon = Instance.new("TextLabel")
    statusIcon.Size = UDim2.new(0, 24, 0, 24)
    statusIcon.Position = UDim2.new(0, 8, 0.5, -12)
    statusIcon.BackgroundTransparency = 1
    statusIcon.Text = hasItem and "✔" or "❌"
    statusIcon.TextColor3 = hasItem and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    statusIcon.TextScaled = true
    statusIcon.Font = Enum.Font.Cartoon
    statusIcon.Parent = statusFrame

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, -40, 1, 0)
    nameLabel.Position = UDim2.new(0, 36, 0, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = name
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.TextScaled = true
    nameLabel.Font = Enum.Font.Cartoon
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.TextTruncate = Enum.TextTruncate.AtEnd 
    nameLabel.Parent = statusFrame
    
    statusFrame.Parent = parent
    return statusFrame
end

local function createStatusValue(name, value, parent)
    local statusFrame = Instance.new("Frame")
    statusFrame.Name = name
    statusFrame.Size = UDim2.new(1, -10, 0, 36)
    statusFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    statusFrame.BorderSizePixel = 1
    statusFrame.BorderColor3 = Color3.fromRGB(80, 80, 80)
    
    local statusCorner = Instance.new("UICorner")
    statusCorner.CornerRadius = UDim.new(0, 8)
    statusCorner.Parent = statusFrame

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(0.45, 0, 1, 0)
    nameLabel.Position = UDim2.new(0, 12, 0, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = name .. ":"
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.TextScaled = true
    nameLabel.Font = Enum.Font.Cartoon
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.Parent = statusFrame

    local valueLabel = Instance.new("TextLabel")
    valueLabel.Size = UDim2.new(0.5, 0, 1, 0)
    valueLabel.Position = UDim2.new(0.45, 5, 0, 0)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Text = value
    valueLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
    valueLabel.TextScaled = true
    valueLabel.Font = Enum.Font.Cartoon
    valueLabel.TextXAlignment = Enum.TextXAlignment.Left
    valueLabel.Parent = statusFrame
    
    statusFrame.Parent = parent
    return statusFrame
end

local function createStatusText(name, text, parent)
    local statusFrame = Instance.new("Frame")
    statusFrame.Name = name
    statusFrame.Size = UDim2.new(1, -10, 0, 38)
    statusFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    statusFrame.BorderSizePixel = 1
    statusFrame.BorderColor3 = Color3.fromRGB(80, 80, 80)
    
    local statusCorner = Instance.new("UICorner")
    statusCorner.CornerRadius = UDim.new(0, 8)
    statusCorner.Parent = statusFrame

    local statusLabel = Instance.new("TextLabel")
    statusLabel.Size = UDim2.new(0.3, 0, 1, 0)
    statusLabel.Position = UDim2.new(0, 12, 0, 0)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Text = name
    statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    statusLabel.TextScaled = true
    statusLabel.Font = Enum.Font.Cartoon
    statusLabel.TextXAlignment = Enum.TextXAlignment.Left
    statusLabel.Parent = statusFrame

    local statusText = Instance.new("TextLabel")
    statusText.Size = UDim2.new(0.65, 0, 1, 0)
    statusText.Position = UDim2.new(0.35, 0, 0, 0)
    statusText.BackgroundTransparency = 1
    statusText.Text = text
    statusText.TextColor3 = Color3.fromRGB(255, 255, 0)
    statusText.TextScaled = true
    statusText.Font = Enum.Font.Cartoon
    statusText.TextXAlignment = Enum.TextXAlignment.Left
    statusText.Parent = statusFrame
    
    statusFrame.Parent = parent
    return statusFrame
end

createStatusValue("Player Level", "nil", leftScrollFrame).LayoutOrder = 1
createStatusValue("Beli", "nil", leftScrollFrame).LayoutOrder = 2
createStatusValue("Fragment", "nil", leftScrollFrame).LayoutOrder = 3
createStatusItem("Fullmoon", false, leftScrollFrame).LayoutOrder = 4
createStatusItem("Elite Boss", false, leftScrollFrame).LayoutOrder = 5
createStatusItem("Mirage Island", false, leftScrollFrame).LayoutOrder = 6

createStatusItem("Godhuman", false, rightScrollFrame).LayoutOrder = 1
createStatusItem("Cursed Dual Katana", false, rightScrollFrame).LayoutOrder = 2
createStatusItem("Skull Guitar", false, rightScrollFrame).LayoutOrder = 3
createStatusItem("Mirror Fractal", false, rightScrollFrame).LayoutOrder = 4
createStatusItem("Race V3", false, rightScrollFrame).LayoutOrder = 5
createStatusItem("Pull Lever", false, rightScrollFrame).LayoutOrder = 6

createStatusText("Status 1:", "farm", bottomScrollFrame).LayoutOrder = 1
createStatusText("Status 2:", "lấy melee gì(farm melee gì đến mấy mas)", bottomScrollFrame).LayoutOrder = 2

local dynamicMessages = {
    "Hello " .. player.Name,
    "Automation is not the enemy of jobs, but the partner of progress.",
    "Automation doesn't replace humans, it enhances human potential.",
    "The future belongs to those who understand how to work with machines, not against them.",
    "From smart homes to smart factories, automation is reshaping our world."
}

local currentMessageIndex = 1

local function changeDynamicText()
    spawn(function()
        while true do
            wait(15) 
            currentMessageIndex = currentMessageIndex + 1
            if currentMessageIndex > #dynamicMessages then
                currentMessageIndex = 1
            end

            local fadeOut = TweenService:Create(
                playerNameLabel,
                TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextTransparency = 1}
            )
            fadeOut:Play()
            
            fadeOut.Completed:Connect(function()
                playerNameLabel.Text = dynamicMessages[currentMessageIndex]

                local fadeIn = TweenService:Create(
                    playerNameLabel,
                    TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextTransparency = 0}
                )
                fadeIn:Play()
            end)
        end
    end)
end

local function startLEDAnimation()
    local ledElements = {headerLED, avatarLED, leftLED, rightLED, bottomLED}
    local colors = {
        Color3.fromRGB(255, 0, 0),   
        Color3.fromRGB(255, 165, 0), 
        Color3.fromRGB(255, 255, 0), 
        Color3.fromRGB(0, 255, 0),   
        Color3.fromRGB(0, 255, 255), 
        Color3.fromRGB(0, 0, 255),   
        Color3.fromRGB(255, 0, 255)  
    }
    
    local colorIndex = 1
    
    RunService.Heartbeat:Connect(function()
        colorIndex = colorIndex + 1
        if colorIndex > #colors then
            colorIndex = 1
        end
        
        for _, led in pairs(ledElements) do
            local colorTween = TweenService:Create(
                led,
                TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                {Color = colors[colorIndex]}
            )
            colorTween:Play()
        end
        
        wait(1)
    end)
end

-- Handle viewport size changes for responsive design
workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
    local newSize, newPosition = getResponsiveSize()
    local resizeTween = TweenService:Create(
        mainContainer,
        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {
            Size = newSize,
            Position = newPosition
        }
    )
    resizeTween:Play()
end)

-- Start animations
spawn(function()
    startLEDAnimation()
    changeDynamicText()
end)
