spawn(function()
    pcall(function()
        local MouseCheckReq = game.Players.LocalPlayer:GetMouse()
        local Particle = require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework")
            :WaitForChild("Particle"))

        local old = Particle.play
        Particle.play = function(...)
        end
        spawn(function()
            for i, v in pairs(game:GetService("ReplicatedStorage").Effect.Container.Death:GetChildren()) do
                if v:IsA("ParticleEmitter") then
                    v.Texture = 0
                end
            end
            for i, v in pairs(game:GetService("ReplicatedStorage").Effect.Container.Death.eff:GetChildren()) do
                v:Destroy()
            end
        end)
		local StopCameraShaker = require(game:GetService("ReplicatedStorage").Util.CameraShaker)
		StopCameraShaker:Stop()
    end)
end)

if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Death") then
    --game:GetService("ReplicatedStorage").Effect.Container.Death:Destroy()
end
if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Respawn") then
    --game:GetService("ReplicatedStorage").Effect.Container.Respawn:Destroy()
end
for i,v in pairs(game.ReplicatedStorage.Assets.GUI:GetChildren()) do 
	v.Enabled = false 
end

local NotificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/lobox920/Notification-Library/Main/Library.lua"))()

NotificationLibrary:SendNotification("Warning", "Chờ xíu...", 10)
NotificationLibrary:SendNotification("Warning", "cảm ơn vì dùng Lion Hub", 10)
NotificationLibrary:SendNotification("Warning", "https://discord.gg/rhPpspJSpz", 10)
-- join team
if game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam") then
    repeat task.wait()
        if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main").ChooseTeam.Visible == true then
            if getgenv().Team == "Marines" then
                for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container["Marines"].Frame.TextButton.Activated)) do
                    for a, b in pairs(getconnections(game:GetService("UserInputService").TouchTapInWorld)) do
                        b:Fire() 
                    end
                    v.Function()
                end 
            else
                for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container["Pirates"].Frame.TextButton.Activated)) do
                    for a, b in pairs(getconnections(game:GetService("UserInputService").TouchTapInWorld)) do
                        b:Fire() 
                    end
                    v.Function()
                end 
            end
        end
    until game.Players.LocalPlayer.Team ~= nil and game:IsLoaded()
end

if not game:IsLoaded() then game.Loaded:Wait() end
local fask = task 

ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local TweenService = game:GetService("TweenService")

local soundId = "rbxassetid://130785805" 
local sound = Instance.new("Sound")
sound.Name = "ButtonClickSound"
sound.SoundId = soundId
sound.Parent = ReplicatedStorage

local MainScreenGui = Instance.new("ScreenGui")
local ButtonScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")

MainScreenGui.Name = "MainScreenGui"
MainScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

ButtonScreenGui.Name = "ButtonScreenGui"
ButtonScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

ImageButton.Parent = ButtonScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.5, 10, 0, 10) 
ImageButton.AnchorPoint = Vector2.new(0.5, 0) 
ImageButton.Size = UDim2.new(0, 40, 0, 40)
ImageButton.Image = "rbxassetid://73482960622063"

UICorner.CornerRadius = UDim.new(1, 0) 
UICorner.Parent = ImageButton

UIStroke.Color = Color3.fromRGB(75, 0, 130)
UIStroke.Parent = ImageButton

local colors = {   
    Color3.fromRGB(3, 252, 40),
}

ImageButton.MouseButton1Down:connect(function()
  game.CoreGui:FindFirstChild("RippleHUBLIB").Enabled = not game.CoreGui:FindFirstChild("RippleHUBLIB").Enabled
end)

_G.Color = Color3.fromRGB(68, 202, 186)
_G.ColorButton = Color3.fromRGB(25, 25, 25)
IKAI = true
if IKAI then
	do
		local ui = game.CoreGui:FindFirstChild("RippleHUBLIB")
		if ui then
			ui:Destroy()
		end
	end
	
	local UserInputService = game:GetService("UserInputService")
	local TweenService = game:GetService("TweenService")
	local RunService = game:GetService("RunService")
	local LocalPlayer = game:GetService("Players").LocalPlayer
	local Mouse = LocalPlayer:GetMouse()
	local tween = game:GetService("TweenService")
	local Red = {RainbowColorValue = 0, HueSelectionPosition = 0}
	local LogoButton = [[7040391851]]
	
	
	local function Tween(instance, properties,style,wa)
		if style == nil or "" then
			return Back
		end
		tween:Create(instance,TweenInfo.new(wa,Enum.EasingStyle[style]),{properties}):Play()
	end
	
	local ActualTypes = {
		RoundFrame = "ImageLabel",
		Shadow = "ImageLabel",
		Circle = "ImageLabel",
		CircleButton = "ImageButton",
		Frame = "Frame",
		Label = "TextLabel",
		Button = "TextButton",
		SmoothButton = "ImageButton",
		Box = "TextBox",
		ScrollingFrame = "ScrollingFrame",
		Menu = "ImageButton",
		NavBar = "ImageButton"
	}
	
	local Properties = {
		RoundFrame = {
			BackgroundTransparency = 1,
			Image = "http://www.roblox.com/asset/?id=5554237731",
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(3,3,297,297)
		},
		SmoothButton = {
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			Image = "http://www.roblox.com/asset/?id=5554237731",
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(3,3,297,297)
		},
		Shadow = {
			Name = "Shadow",
			BackgroundTransparency = 1,
			Image = "http://www.roblox.com/asset/?id=5554236805",
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(23,23,277,277),
			Size = UDim2.fromScale(1,1) + UDim2.fromOffset(30,30),
			Position = UDim2.fromOffset(-15,-15)
		},
		Circle = {
			BackgroundTransparency = 1,
			Image = "http://www.roblox.com/asset/?id=5554831670"
		},
		CircleButton = {
			BackgroundTransparency = 1,
			AutoButtonColor = false,
			Image = "http://www.roblox.com/asset/?id=5554831670"
		},
		Frame = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1,1)
		},
		Label = {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(5,0),
			Size = UDim2.fromScale(1,1) - UDim2.fromOffset(5,0),
			TextSize = 14,
			TextXAlignment = Enum.TextXAlignment.Left
		},
		Button = {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(5,0),
			Size = UDim2.fromScale(1,1) - UDim2.fromOffset(5,0),
			TextSize = 14,
			TextXAlignment = Enum.TextXAlignment.Left
		},
		Box = {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(5,0),
			Size = UDim2.fromScale(1,1) - UDim2.fromOffset(5,0),
			TextSize = 14,
			TextXAlignment = Enum.TextXAlignment.Left
		},
		ScrollingFrame = {
			BackgroundTransparency = 1,
			ScrollBarThickness = 0,
			CanvasSize = UDim2.fromScale(0,0),
			Size = UDim2.fromScale(1,1)
		},
		Menu = {
			Name = "More",
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			Image = "http://www.roblox.com/asset/?id=5555108481",
			Size = UDim2.fromOffset(20,20),
			Position = UDim2.fromScale(1,0.5) - UDim2.fromOffset(25,10)
		},
		NavBar = {
			Name = "SheetToggle",
			Image = "http://www.roblox.com/asset/?id=5576439039",
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(20,20),
			Position = UDim2.fromOffset(5,5),
			AutoButtonColor = false
		}
	}
	
	local Types = {
		"RoundFrame",
		"Shadow",
		"Circle",
		"CircleButton",
		"Frame",
		"Label",
		"Button",
		"SmoothButton",
		"Box",
		"ScrollingFrame",
		"Menu",
		"NavBar"
	}
	
	function FindType(String)
		for _, Type in next, Types do
			if Type:sub(1, #String):lower() == String:lower() then
				return Type
			end
		end
		return false
	end
	
	local Objects = {}
	
	function Objects.new(Type)
		local TargetType = FindType(Type)
		if TargetType then
			local NewImage = Instance.new(ActualTypes[TargetType])
			if Properties[TargetType] then
				for Property, Value in next, Properties[TargetType] do
					NewImage[Property] = Value
				end
			end
			return NewImage
		else
			return Instance.new(Type)
		end
	end
	
	local function GetXY(GuiObject)
		local Max, May = GuiObject.AbsoluteSize.X, GuiObject.AbsoluteSize.Y
		local Px, Py = math.clamp(Mouse.X - GuiObject.AbsolutePosition.X, 0, Max), math.clamp(Mouse.Y - GuiObject.AbsolutePosition.Y, 0, May)
		return Px/Max, Py/May
	end
	
	local function CircleAnim(GuiObject, EndColour, StartColour)
		local PX, PY = GetXY(GuiObject)
		local Circle = Objects.new("Circle")
		Circle.Size = UDim2.fromScale(0,0)
		Circle.Position = UDim2.fromScale(PX,PY)
		Circle.ImageColor3 = StartColour or GuiObject.ImageColor3
		Circle.ZIndex = 200
		Circle.Parent = GuiObject
		local Size = GuiObject.AbsoluteSize.X
		TweenService:Create(Circle, TweenInfo.new(0.5), {Position = UDim2.fromScale(PX,PY) - UDim2.fromOffset(Size/2,Size/2), ImageTransparency = 1, ImageColor3 = EndColour, Size = UDim2.fromOffset(Size,Size)}):Play()
		spawn(function()
			wait(0.5)
			Circle:Destroy()
		end)
	end
	
	
	local function MakeDraggable(topbarobject, object)
		local Dragging = nil
		local DragInput = nil
		local DragStart = nil
		local StartPosition = nil
	
		local function Update(input)
			local Delta = input.Position - DragStart
			local pos =
				UDim2.new(
					StartPosition.X.Scale,
					StartPosition.X.Offset + Delta.X,
					StartPosition.Y.Scale,
					StartPosition.Y.Offset + Delta.Y
				)
			local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
			Tween:Play()
		end
	
		topbarobject.InputBegan:Connect(
			function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					Dragging = true
					DragStart = input.Position
					StartPosition = object.Position
	
					input.Changed:Connect(
						function()
							if input.UserInputState == Enum.UserInputState.End then
								Dragging = false
							end
						end
					)
				end
			end
		)
	
		topbarobject.InputChanged:Connect(
			function(input)
				if
					input.UserInputType == Enum.UserInputType.MouseMovement or
					input.UserInputType == Enum.UserInputType.Touch
				then
					DragInput = input
				end
			end
		)
	
		UserInputService.InputChanged:Connect(
			function(input)
				if input == DragInput and Dragging then
					Update(input)
				end
			end
		)
	end
	
	library = {}
	
	function library:Window(text,text2,text3,logo,keybind)
		local uihide = false
		local abc = false
		local logo = logo or 0
		local currentpage = ""
		local keybind = keybind or Enum.KeyCode.RightControl
		local yoo = string.gsub(tostring(keybind),"Enum.KeyCode.","")
		
		local RippleHUBLIB = Instance.new("ScreenGui")
		RippleHUBLIB.Name = "RippleHUBLIB"
		RippleHUBLIB.Parent = game.CoreGui
		RippleHUBLIB.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	
		local Main = Instance.new("Frame")
		Main.Name = "Main"
		Main.Parent = RippleHUBLIB
		Main.ClipsDescendants = true
		Main.AnchorPoint = Vector2.new(0.5,0.5)
		Main.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		Main.Position = UDim2.new(0.5, 0, 0.5, 0)
		Main.Size = UDim2.new(0, 0, 0, 0)
		
		Main:TweenSize(UDim2.new(0, 656, 0, 300),"Out","Quad",0.4,true)
	
		local MCNR = Instance.new("UICorner")
		MCNR.Name = "MCNR"
		MCNR.Parent = Main
	
	
		local Top = Instance.new("Frame")
		Top.Name = "Top"
		Top.Parent = Main
		Top.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		Top.Size = UDim2.new(0, 656, 0, 27)
	
		local TCNR = Instance.new("UICorner")
		TCNR.Name = "TCNR"
		TCNR.Parent = Top
	
		local Logo = Instance.new("ImageLabel")
		Logo.Name = "Logo"
		Logo.Parent = Top
		Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Logo.BackgroundTransparency = 1.000
		Logo.Position = UDim2.new(0, 14, 0, 2)
		Logo.Size = UDim2.new(0, 23, 0, 23)
		Logo.Image = "rbxassetid://"..tostring(logo)
	
		local Name = Instance.new("TextLabel")
		Name.Name = "Name"
		Name.Parent = Top
		Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Name.BackgroundTransparency = 1.000
		Name.Position = UDim2.new(0.0609756112, 5, 0, 0.5)
		Name.Size = UDim2.new(0, 61, 0, 27)
		Name.Font = Enum.Font.GothamSemibold
		Name.Text = text
		Name.TextColor3 = Color3.fromRGB(225, 225, 225)
		Name.TextSize = 16.000
	
		local Hub = Instance.new("TextLabel")
		Hub.Name = "Gaming"
		Hub.Parent = Top
		Hub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Hub.BackgroundTransparency = 1.000
		Hub.Position = UDim2.new(0, 105, 0, 0.5)
		Hub.Size = UDim2.new(0, 81, 0, 27)
		Hub.Font = Enum.Font.GothamSemibold
		Hub.Text = text2
		Hub.TextColor3 = _G.Color
		Hub.TextSize = 16.000
		Hub.TextXAlignment = Enum.TextXAlignment.Left
	
		local Ver = Instance.new("TextLabel")
		Ver.Name = "Ver"
		Ver.Parent = Top
		Ver.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Ver.BackgroundTransparency = 1.000
		Ver.Position = UDim2.new(0.847561002, 0, 0, 1)
		Ver.Size = UDim2.new(0, 47, 0, 27)
		Ver.Font = Enum.Font.GothamSemibold
		Ver.Text = text3
		Ver.TextColor3 = _G.Color
		Ver.TextSize = 15.000
	
	
		local BindButton = Instance.new("TextButton")
		BindButton.Name = "BindButton"
		BindButton.Parent = Top
		BindButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		BindButton.BackgroundTransparency = 1.000
		BindButton.Position = UDim2.new(0.227561002, 0, 0, 1)
		BindButton.Size = UDim2.new(0, 100, 0, 27)
		BindButton.Font = Enum.Font.GothamSemibold
		BindButton.Text = "[ "..string.gsub(tostring(keybind),"Enum.KeyCode.","").." ]"
		BindButton.TextColor3 = Color3.fromRGB(100, 100, 100)
		BindButton.TextSize = 11.000
		
		BindButton.MouseButton1Click:Connect(function ()
			BindButton.Text = "[ ... ]"
			local inputwait = game:GetService("UserInputService").InputBegan:wait()
			local shiba = inputwait.KeyCode == Enum.KeyCode.Unknown and inputwait.UserInputType or inputwait.KeyCode
	
			if shiba.Name ~= "Focus" and shiba.Name ~= "MouseMovement" then
				BindButton.Text = "[ "..shiba.Name.." ]"
				yoo = shiba.Name
			end
		end)
	
		do  local ui =  game:GetService("CoreGui"):FindFirstChild("Ripple")  if ui then ui:Destroy() end end
	
	
		local Luna = Instance.new("ScreenGui")
		local ToggleFrameUi = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local ToggleImgUi = Instance.new("ImageLabel")
		local Uitoggle = Instance.new("TextLabel")
		local Yedhee = Instance.new("TextLabel")
		local SearchStroke = Instance.new("UIStroke")
	
	

	
		MakeDraggable(ToggleFrameUi,ToggleFrameUi)
	
	
	
	
	
		local Tab = Instance.new("Frame")
		Tab.Name = "Tab"
		Tab.Parent = Main
		Tab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		Tab.Position = UDim2.new(0, 5, 0, 30)
		Tab.Size = UDim2.new(0, 150, 0, 265)
	
		local TCNR = Instance.new("UICorner")
		TCNR.Name = "TCNR"
		TCNR.Parent = Tab
	
		local ScrollTab = Instance.new("ScrollingFrame")
		ScrollTab.Name = "ScrollTab"
		ScrollTab.Parent = Tab
		ScrollTab.Active = true
		ScrollTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ScrollTab.BackgroundTransparency = 1.000
		ScrollTab.Size = UDim2.new(0, 150, 0, 265)
		ScrollTab.CanvasSize = UDim2.new(0, 0, 0, 0)
		ScrollTab.ScrollBarThickness = 0
	
		local PLL = Instance.new("UIListLayout")
		PLL.Name = "PLL"
		PLL.Parent = ScrollTab
		PLL.SortOrder = Enum.SortOrder.LayoutOrder
		PLL.Padding = UDim.new(0, 15)
	
		local PPD = Instance.new("UIPadding")
		PPD.Name = "PPD"
		PPD.Parent = ScrollTab
		PPD.PaddingLeft = UDim.new(0, 10)
		PPD.PaddingTop = UDim.new(0, 10)
	
		local Page = Instance.new("Frame")
		Page.Name = "Page"
		Page.Parent = Main
		Page.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		Page.Position = UDim2.new(0.245426834, 0, 0, 30)
		Page.Size = UDim2.new(0, 490, 0, 265)
	
		local PCNR = Instance.new("UICorner")
		PCNR.Name = "PCNR"
		PCNR.Parent = Page
	
		local MainPage = Instance.new("Frame")
		MainPage.Name = "MainPage"
		MainPage.Parent = Page
		MainPage.ClipsDescendants = true
		MainPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		MainPage.BackgroundTransparency = 1.000
		MainPage.Size = UDim2.new(0, 490, 0, 365)
	
		local PageList = Instance.new("Folder")
		PageList.Name = "PageList"
		PageList.Parent = MainPage
	
		local UIPageLayout = Instance.new("UIPageLayout")
	
		UIPageLayout.Parent = PageList
		UIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIPageLayout.EasingDirection = Enum.EasingDirection.InOut
		UIPageLayout.EasingStyle = Enum.EasingStyle.Quad
		UIPageLayout.FillDirection = Enum.FillDirection.Vertical
		UIPageLayout.Padding = UDim.new(0, 15)
		UIPageLayout.TweenTime = 0.400
		UIPageLayout.GamepadInputEnabled = false
		UIPageLayout.ScrollWheelInputEnabled = false
		UIPageLayout.TouchInputEnabled = false
		
		MakeDraggable(Top,Main)
	
		
		local uitab = {}
		
		function uitab:T(text,logo1)
			local TabButton = Instance.new("TextButton")
			TabButton.Parent = ScrollTab
			TabButton.Name = text.."Server"
			TabButton.Text = text
			TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TabButton.BackgroundTransparency = 1.000
			TabButton.Size = UDim2.new(0, 130, 0, 23)
			TabButton.Font = Enum.Font.GothamSemibold
			TabButton.TextColor3 = Color3.fromRGB(225, 225, 225)
			TabButton.TextSize = 15.000
			TabButton.TextTransparency = 0.500
	
			local IDK = Instance.new("ImageLabel")
			IDK.Name = "LogoIDK"
			IDK.Parent = TabButton
			IDK.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			IDK.BackgroundTransparency = 1.000
			IDK.Position = UDim2.new(0, 0, 0, 1)
			IDK.Size = UDim2.new(0, 20, 0, 20)
			IDK.Image = "rbxassetid://"..tostring(logo1)
	
	
			local MainFramePage = Instance.new("ScrollingFrame")
			MainFramePage.Name = text.."_Page"
			MainFramePage.Parent = PageList
			MainFramePage.Active = true
			MainFramePage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			MainFramePage.BackgroundTransparency = 1.000
			MainFramePage.BorderSizePixel = 0
			MainFramePage.Size = UDim2.new(0, 490, 0, 265)
			MainFramePage.CanvasSize = UDim2.new(0, 0, 0, 0)
			MainFramePage.ScrollBarThickness = 0
			
			local UIPadding = Instance.new("UIPadding")
			local UIListLayout = Instance.new("UIListLayout")
			
			UIPadding.Parent = MainFramePage
			UIPadding.PaddingLeft = UDim.new(0, 10)
			UIPadding.PaddingTop = UDim.new(0, 10)
	
			UIListLayout.Padding = UDim.new(0,15)
			UIListLayout.Parent = MainFramePage
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			
			TabButton.MouseButton1Click:Connect(function()
				for i,v in next, ScrollTab:GetChildren() do
					if v:IsA("TextButton") then
						TweenService:Create(
							v,
							TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
							{TextTransparency = 0.5}
						):Play()
					end
					TweenService:Create(
						TabButton,
						TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
				end
				for i,v in next, PageList:GetChildren() do
					currentpage = string.gsub(TabButton.Name,"Server","").."_Page"
					if v.Name == currentpage then
						UIPageLayout:JumpTo(v)
					end
				end
			end)
	
			if abc == false then
				for i,v in next, ScrollTab:GetChildren() do
					if v:IsA("TextButton") then
						TweenService:Create(
							v,
							TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
							{TextTransparency = 0.5}
						):Play()
					end
					TweenService:Create(
						TabButton,
						TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
				end
				UIPageLayout:JumpToIndex(1)
				abc = true
			end
			
			game:GetService("RunService").Stepped:Connect(function()
				pcall(function()
					MainFramePage.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 20)
					ScrollTab.CanvasSize = UDim2.new(0,0,0,PLL.AbsoluteContentSize.Y + 20)
				end)
			end)
	
			
			local main = {}
			function main:Button(text,callback)
				local Button = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local TextBtn = Instance.new("TextButton")
				local UICorner_2 = Instance.new("UICorner")
				local Black = Instance.new("Frame")
				local UICorner_3 = Instance.new("UICorner")
				local IMGBUTTON = Instance.new("ImageLabel")
				
				Button.Name = "Button"
				Button.Parent = MainFramePage
				Button.BackgroundColor3 = _G.Color
				Button.Size = UDim2.new(0, 470, 0, 31)
				
				UICorner.CornerRadius = UDim.new(0, 5)
				UICorner.Parent = Button
				
	
				
				TextBtn.Name = "TextBtn"
				TextBtn.Parent = Button
				TextBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
				TextBtn.Position = UDim2.new(0, 1, 0, 1)
				TextBtn.Size = UDim2.new(0, 468, 0, 29)
				TextBtn.AutoButtonColor = false
				TextBtn.Font = Enum.Font.GothamSemibold
				TextBtn.Text = text
				TextBtn.TextColor3 = Color3.fromRGB(225, 225, 225)
				TextBtn.TextSize = 15.000
				TextBtn.ClipsDescendants = true
	
				UICorner_2.CornerRadius = UDim.new(0, 5)
				UICorner_2.Parent = TextBtn
	
				IMGBUTTON.Name = "IconB"
				IMGBUTTON.Parent = TextBtn
				IMGBUTTON.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				IMGBUTTON.BackgroundTransparency = 1.000
				IMGBUTTON.Position = UDim2.new(0, 10, 0, 5)
				IMGBUTTON.Size = UDim2.new(0, 20, 0, 20)
				IMGBUTTON.Image = "http://www.roblox.com/asset/?id=73482960622063"
	
	
				Black.Name = "Black"
				Black.Parent = Button
				Black.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				Black.BackgroundTransparency = 1.000
				Black.BorderSizePixel = 0
				Black.Position = UDim2.new(0, 1, 0, 1)
				Black.Size = UDim2.new(0, 468, 0, 29)
				
				UICorner_3.CornerRadius = UDim.new(0, 5)
				UICorner_3.Parent = Black
	
				TextBtn.MouseEnter:Connect(function()
					TweenService:Create(
						Black,
						TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{BackgroundTransparency = 0.7}
					):Play()
				end)
				TextBtn.MouseLeave:Connect(function()
					TweenService:Create(
						Black,
						TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{BackgroundTransparency = 1}
					):Play()
				end)
				TextBtn.MouseButton1Click:Connect(function()
					CircleAnim(TextBtn, Color3.fromRGB(255,255,255), Color3.fromRGB(255,255,255))
					TextBtn.TextSize = 1
					TweenService:Create(
						TextBtn,
						TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextSize = 15}
					):Play()
					callback()
				end)
			end
			function main:Toggle(text,config,callback)
				config = config or false
				local toggled = config
				local Toggle = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local Button = Instance.new("TextButton")
				local UICorner_2 = Instance.new("UICorner")
				local Label = Instance.new("TextLabel")
				local ToggleImage = Instance.new("Frame")
				local UICorner_3 = Instance.new("UICorner")
				local Circle = Instance.new("Frame")
				local UICorner_4 = Instance.new("UICorner")
				local imgLabelIcon = Instance.new("ImageLabel")
	
	
				Toggle.Name = "Toggle"
				Toggle.Parent = MainFramePage
				Toggle.BackgroundColor3 = Color3.fromRGB(255, 46, 46)
				Toggle.Size = UDim2.new(0, 470, 0, 31)
	
				UICorner.CornerRadius = UDim.new(0, 5)
				UICorner.Parent = Toggle
	
				Button.Name = "Button"
				Button.Parent = Toggle
				Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
				Button.Position = UDim2.new(0, 1, 0, 1)
				Button.Size = UDim2.new(0, 468, 0, 29)
				Button.AutoButtonColor = false
				Button.Font = Enum.Font.SourceSans
				Button.Text = ""
				Button.TextColor3 = Color3.fromRGB(0, 0, 0)
				Button.TextSize = 11.000
	
				UICorner_2.CornerRadius = UDim.new(0, 5)
				UICorner_2.Parent = Button
	
				Label.Name = "Label"
				Label.Parent = Toggle
				Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Label.BackgroundTransparency = 1.000
				Label.Position = UDim2.new(0, 1, 0, 1)
				Label.Size = UDim2.new(0, 468, 0, 29)
				Label.Font = Enum.Font.GothamSemibold
				Label.Text = text
				Label.TextColor3 = Color3.fromRGB(225, 225, 225)
				Label.TextSize = 15.000
	
				ToggleImage.Name = "ToggleImage"
				ToggleImage.Parent = Toggle
				ToggleImage.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
				ToggleImage.Position = UDim2.new(0, 415, 0, 5)
				ToggleImage.Size = UDim2.new(0, 45, 0, 20)
	
				UICorner_3.CornerRadius = UDim.new(0, 10)
				UICorner_3.Parent = ToggleImage
	
				Circle.Name = "Circle"
				Circle.Parent = ToggleImage
				Circle.BackgroundColor3 = Color3.fromRGB(255, 46, 46)
				Circle.Position = UDim2.new(0, 2, 0, 2)
				Circle.Size = UDim2.new(0, 16, 0, 16)
	
				UICorner_4.CornerRadius = UDim.new(0, 10)
				UICorner_4.Parent = Circle
	
				imgLabelIcon.Name = "Icon"
				imgLabelIcon.Parent = Toggle
				imgLabelIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				imgLabelIcon.BackgroundTransparency = 1.000
				imgLabelIcon.Position = UDim2.new(0, 10, 0, 5)
				imgLabelIcon.Size = UDim2.new(0, 20, 0, 20)
	
				Button.MouseButton1Click:Connect(function()
					if toggled == false then
						toggled = true
						Circle:TweenPosition(UDim2.new(0,27,0,2),"Out","Sine",0.2,true)
						TweenService:Create(
							Toggle,
							TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
							{BackgroundColor3 = _G.Color}
						):Play()
						TweenService:Create(
							Circle,
							TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
							{BackgroundColor3 = _G.Color}
						):Play()
					else
						toggled = false
						Circle:TweenPosition(UDim2.new(0,2,0,2),"Out","Sine",0.2,true)
						TweenService:Create(
							Toggle,
							TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(255, 46, 46)}
						):Play()
						TweenService:Create(
							Circle,
							TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(255, 46, 46)}
						):Play()
					end
					pcall(callback,toggled)
				end)
	
				if config == true then
					toggled = true
					Circle:TweenPosition(UDim2.new(0,27,0,2),"Out","Sine",0.4,true)
					TweenService:Create(
						Toggle,
						TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{BackgroundColor3 = _G.Color}
					):Play()
					TweenService:Create(
						Circle,
						TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{BackgroundColor3 = _G.Color}
					):Play()
					pcall(callback,toggled)
				end
			end
		function main:Dropdown(text,option,callback)
			local isdropping = false
			local Dropdown = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local DropTitle = Instance.new("TextLabel")
			local DropScroll = Instance.new("ScrollingFrame")
			local UIListLayout = Instance.new("UIListLayout")
			local UIPadding = Instance.new("UIPadding")
			local DropButton = Instance.new("TextButton")
			local DropImage = Instance.new("ImageLabel")

			Dropdown.Name = "Dropdown"
			Dropdown.Parent = MainFramePage
			Dropdown.BackgroundColor3 = _G.ColorButton
			Dropdown.ClipsDescendants = true
			Dropdown.Size = UDim2.new(0, 470, 0, 31)

			UICorner.CornerRadius = UDim.new(0, 5)
			UICorner.Parent = Dropdown

			DropTitle.Name = "DropTitle"
			DropTitle.Parent = Dropdown
			DropTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropTitle.BackgroundTransparency = 1.000
			DropTitle.Size = UDim2.new(0, 470, 0, 31)
			DropTitle.Font = Enum.Font.GothamSemibold
			DropTitle.Text = text.. " : "
			DropTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
			DropTitle.TextSize = 15.000

			DropScroll.Name = "DropScroll"
			DropScroll.Parent = DropTitle
			DropScroll.Active = true
			DropScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropScroll.BackgroundTransparency = 1.000
			DropScroll.BorderSizePixel = 0
			DropScroll.Position = UDim2.new(0, 0, 0, 31)
			DropScroll.Size = UDim2.new(0, 470, 0, 100)
			DropScroll.CanvasSize = UDim2.new(0, 0, 0, 2)
			DropScroll.ScrollBarThickness = 3

			UIListLayout.Parent = DropScroll
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 5)

			UIPadding.Parent = DropScroll
			UIPadding.PaddingLeft = UDim.new(0, 5)
			UIPadding.PaddingTop = UDim.new(0, 5)

			DropImage.Name = "DropImage"
			DropImage.Parent = Dropdown
			DropImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropImage.BackgroundTransparency = 1.000
			DropImage.Position = UDim2.new(0, 445, 0, 6)
			DropImage.Rotation = -90
			DropImage.Size = UDim2.new(0, 20, 0, 20)
			DropImage.Image = "rbxassetid://73482960622063"

			DropButton.Name = "DropButton"
			DropButton.Parent = Dropdown
			DropButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropButton.BackgroundTransparency = 1.000
			DropButton.Size = UDim2.new(0, 470, 0, 31)
			DropButton.Font = Enum.Font.SourceSans
			DropButton.Text = ""
			DropButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			DropButton.TextSize = 14.000

			for i,v in next,option do
				local Item = Instance.new("TextButton")

				Item.Name = "Item"
				Item.Parent = DropScroll
				Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Item.BackgroundTransparency = 1.000
				Item.Size = UDim2.new(0, 460, 0, 26)
				Item.Font = Enum.Font.GothamSemibold
				Item.Text = tostring(v)
				Item.TextColor3 = Color3.fromRGB(225, 225, 225)
				Item.TextSize = 13.000
				Item.TextTransparency = 0.500
				Item.ClipsDescendants = true


				Item.MouseEnter:Connect(function()
					TweenService:Create(
						Item,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
				end)

				Item.MouseLeave:Connect(function()
					TweenService:Create(
						Item,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0.5}
					):Play()
				end)

				Item.MouseButton1Click:Connect(function()
					CircleAnim(Item, Color3.fromRGB(255,255,255), Color3.fromRGB(255,255,255))
					isdropping = false
					Dropdown:TweenSize(UDim2.new(0,470,0,31),"Out","Quad",0.3,true)
					TweenService:Create(
						DropImage,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{Rotation = -90}
					):Play()
					DropScroll.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)
					callback(Item.Text)
					DropTitle.Text = text.." : "..Item.Text
				end)
			end

			DropScroll.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)

			DropButton.MouseButton1Click:Connect(function()
				if isdropping == false then
					isdropping = true
					Dropdown:TweenSize(UDim2.new(0,470,0,131),"Out","Quad",0.3,true)
					TweenService:Create(
						DropImage,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{Rotation = 180}
					):Play()
					DropScroll.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)
				else
					isdropping = false
					Dropdown:TweenSize(UDim2.new(0,470,0,31),"Out","Quad",0.3,true)
					TweenService:Create(
						DropImage,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{Rotation = -90}
					):Play()
					DropScroll.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)
				end
			end)

			local dropfunc = {}
			function dropfunc:Add(t)
				local Item = Instance.new("TextButton")
				Item.Name = "Item"
				Item.Parent = DropScroll
				Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Item.BackgroundTransparency = 1.000
				Item.Size = UDim2.new(0, 470, 0, 26)
				Item.Font = Enum.Font.GothamSemibold
				Item.Text = tostring(t)
				Item.TextColor3 = Color3.fromRGB(225, 225, 225)
				Item.TextSize = 13.000
				Item.TextTransparency = 0.500
				Item.ClipsDescendants = true

				Item.MouseEnter:Connect(function()
					TweenService:Create(
						Item,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
				end)

				Item.MouseLeave:Connect(function()
					TweenService:Create(
						Item,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0.5}
					):Play()
				end)

				Item.MouseButton1Click:Connect(function()
					isdropping = false
					CircleAnim(Item, Color3.fromRGB(255,255,255), Color3.fromRGB(255,255,255))
					Dropdown:TweenSize(UDim2.new(0,470,0,31),"Out","Quad",0.3,true)
					TweenService:Create(
						DropImage,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{Rotation = -90}
					):Play()
					DropScroll.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)
					callback(Item.Text)
					DropTitle.Text = text.." : "..Item.Text
				end)
			end

			function dropfunc:Clear()
				DropTitle.Text = tostring(text).." : "
				isdropping = false
				Dropdown:TweenSize(UDim2.new(0,470,0,31),"Out","Quad",0.3,true)
				TweenService:Create(
					DropImage,
					TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					{Rotation = -90}
				):Play()
				for i,v in next, DropScroll:GetChildren() do
					if v:IsA("TextButton") then
						v:Destroy()
					end
				end
			end
			return dropfunc
		end
	
			function main:Slider(text,min,max,set,callback)
				local Slider = Instance.new("Frame")
				local slidercorner = Instance.new("UICorner")
				local sliderr = Instance.new("Frame")
				local sliderrcorner = Instance.new("UICorner")
				local SliderLabel = Instance.new("TextLabel")
				local HAHA = Instance.new("Frame")
				local AHEHE = Instance.new("TextButton")
				local bar = Instance.new("Frame")
				local bar1 = Instance.new("Frame")
				local bar1corner = Instance.new("UICorner")
				local barcorner = Instance.new("UICorner")
				local circlebar = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local slidervalue = Instance.new("Frame")
				local valuecorner = Instance.new("UICorner")
				local TextBox = Instance.new("TextBox")
				local UICorner_2 = Instance.new("UICorner")
	
				Slider.Name = "Slider"
				Slider.Parent = MainFramePage
				Slider.BackgroundColor3 = _G.Color
				Slider.BackgroundTransparency = 0
				Slider.Size = UDim2.new(0, 470, 0, 51)
	
				slidercorner.CornerRadius = UDim.new(0, 5)
				slidercorner.Name = "slidercorner"
				slidercorner.Parent = Slider
	
				sliderr.Name = "sliderr"
				sliderr.Parent = Slider
				sliderr.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
				sliderr.Position = UDim2.new(0, 1, 0, 1)
				sliderr.Size = UDim2.new(0, 468, 0, 49)
	
				sliderrcorner.CornerRadius = UDim.new(0, 5)
				sliderrcorner.Name = "sliderrcorner"
				sliderrcorner.Parent = sliderr
	
				SliderLabel.Name = "SliderLabel"
				SliderLabel.Parent = sliderr
				SliderLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SliderLabel.BackgroundTransparency = 1.000
				SliderLabel.Position = UDim2.new(0, 15, 0, 0)
				SliderLabel.Size = UDim2.new(0, 180, 0, 26)
				SliderLabel.Font = Enum.Font.GothamSemibold
				SliderLabel.Text = text
				SliderLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
				SliderLabel.TextSize = 16.000
				SliderLabel.TextTransparency = 0
				SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
	
				HAHA.Name = "HAHA"
				HAHA.Parent = sliderr
				HAHA.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				HAHA.BackgroundTransparency = 1.000
				HAHA.Size = UDim2.new(0, 468, 0, 29)
	
				AHEHE.Name = "AHEHE"
				AHEHE.Parent = sliderr
				AHEHE.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				AHEHE.BackgroundTransparency = 1.000
				AHEHE.Position = UDim2.new(0, 10, 0, 35)
				AHEHE.Size = UDim2.new(0, 448, 0, 5)
				AHEHE.Font = Enum.Font.SourceSans
				AHEHE.Text = ""
				AHEHE.TextColor3 = Color3.fromRGB(0, 0, 0)
				AHEHE.TextSize = 14.000
	
				bar.Name = "bar"
				bar.Parent = AHEHE
				bar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				bar.Size = UDim2.new(0, 448, 0, 5)
	
				bar1.Name = "bar1"
				bar1.Parent = bar
				bar1.BackgroundColor3 = _G.Color
				bar1.BackgroundTransparency = 0
				bar1.Size = UDim2.new(set/max, 0, 0, 5)
	
				bar1corner.CornerRadius = UDim.new(0, 5)
				bar1corner.Name = "bar1corner"
				bar1corner.Parent = bar1
	
				barcorner.CornerRadius = UDim.new(0, 5)
				barcorner.Name = "barcorner"
				barcorner.Parent = bar
	
				circlebar.Name = "circlebar"
				circlebar.Parent = bar1
				circlebar.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
				circlebar.Position = UDim2.new(1, -2, 0, -3)
				circlebar.Size = UDim2.new(0, 10, 0, 10)
	
				UICorner.CornerRadius = UDim.new(0, 100)
				UICorner.Parent = circlebar
	
				slidervalue.Name = "slidervalue"
				slidervalue.Parent = sliderr
				slidervalue.BackgroundColor3 = _G.Color
				slidervalue.BackgroundTransparency = 0
				slidervalue.Position = UDim2.new(0, 395, 0, 5)
				slidervalue.Size = UDim2.new(0, 65, 0, 18)
	
				valuecorner.CornerRadius = UDim.new(0, 5)
				valuecorner.Name = "valuecorner"
				valuecorner.Parent = slidervalue
	
				TextBox.Parent = slidervalue
				TextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				TextBox.Position = UDim2.new(0, 1, 0, 1)
				TextBox.Size = UDim2.new(0, 63, 0, 16)
				TextBox.Font = Enum.Font.GothamSemibold
				TextBox.TextColor3 = Color3.fromRGB(225, 225, 225)
				TextBox.TextSize = 9.000
				TextBox.Text = set
				TextBox.TextTransparency = 0
	
				UICorner_2.CornerRadius = UDim.new(0, 5)
				UICorner_2.Parent = TextBox
	
				local mouse = game.Players.LocalPlayer:GetMouse()
				local uis = game:GetService("UserInputService")
	
				if Value == nil then
					Value = set
					pcall(function()
						callback(Value)
					end)
				end
				
				AHEHE.MouseButton1Down:Connect(function()
					Value = math.floor((((tonumber(max) - tonumber(min)) / 448) * bar1.AbsoluteSize.X) + tonumber(min)) or 0
					pcall(function()
						callback(Value)
					end)
					TweenService:Create(
						bar1,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 448), 0, 5)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					--bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 448), 0, 5)
					TweenService:Create(
						circlebar,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Position =  UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 438), 0, -3)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					--circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 438), 0, -3)
					moveconnection = mouse.Move:Connect(function()
						TextBox.Text = Value
						Value = math.floor((((tonumber(max) - tonumber(min)) / 448) * bar1.AbsoluteSize.X) + tonumber(min))
						pcall(function()
							callback(Value)
						end)
						TweenService:Create(
							bar1,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 448), 0, 5)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						--bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 448), 0, 5)
						TweenService:Create(
							circlebar,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Position =  UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 438), 0, -3)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						--circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 438), 0, -3)
					end)
					releaseconnection = uis.InputEnded:Connect(function(Mouse)
						if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
							Value = math.floor((((tonumber(max) - tonumber(min)) / 448) * bar1.AbsoluteSize.X) + tonumber(min))
							pcall(function()
								callback(Value)
							end)
							TweenService:Create(
								bar1,
								TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 448), 0, 5)} -- UDim2.new(0, 128, 0, 25)
							):Play()
							--bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 448), 0, 5)
							TweenService:Create(
								circlebar,
								TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{Position =  UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 438), 0, -3)} -- UDim2.new(0, 128, 0, 25)
							):Play()
							--circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 438), 0, -3)
							moveconnection:Disconnect()
							releaseconnection:Disconnect()
						end
					end)
				end)
				releaseconnection = uis.InputEnded:Connect(function(Mouse)
					if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
						Value = math.floor((((tonumber(max) - tonumber(min)) / 448) * bar1.AbsoluteSize.X) + tonumber(min))
						TextBox.Text = Value
					end
				end)
	
				TextBox.FocusLost:Connect(function()
					if tonumber(TextBox.Text) > max then
						TextBox.Text  = max
					end
					bar1.Size = UDim2.new((TextBox.Text or 0) / max, 0, 0, 5)
					circlebar.Position = UDim2.new(1, -2, 0, -3)
					TextBox.Text = tostring(TextBox.Text and math.floor( (TextBox.Text / max) * (max - min) + min) )
					pcall(callback, TextBox.Text)
				end)
			end
	
			function main:Textbox(text,disappear,callback)
				local Textbox = Instance.new("Frame")
				local TextboxCorner = Instance.new("UICorner")
				local Textboxx = Instance.new("Frame")
				local TextboxxCorner = Instance.new("UICorner")
				local TextboxLabel = Instance.new("TextLabel")
				local txtbtn = Instance.new("TextButton")
				local RealTextbox = Instance.new("TextBox")
				local UICorner = Instance.new("UICorner")
	
				Textbox.Name = "Textbox"
				Textbox.Parent = MainFramePage
				Textbox.BackgroundColor3 = _G.Color
				Textbox.BackgroundTransparency = 0
				Textbox.Size = UDim2.new(0, 470, 0, 31)
	
				TextboxCorner.CornerRadius = UDim.new(0, 5)
				TextboxCorner.Name = "TextboxCorner"
				TextboxCorner.Parent = Textbox
	
				Textboxx.Name = "Textboxx"
				Textboxx.Parent = Textbox
				Textboxx.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
				Textboxx.Position = UDim2.new(0, 1, 0, 1)
				Textboxx.Size = UDim2.new(0, 468, 0, 29)
	
				TextboxxCorner.CornerRadius = UDim.new(0, 5)
				TextboxxCorner.Name = "TextboxxCorner"
				TextboxxCorner.Parent = Textboxx
	
				TextboxLabel.Name = "TextboxLabel"
				TextboxLabel.Parent = Textbox
				TextboxLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextboxLabel.BackgroundTransparency = 1.000
				TextboxLabel.Position = UDim2.new(0, 15, 0, 0)
				TextboxLabel.Text = text
				TextboxLabel.Size = UDim2.new(0, 145, 0, 31)
				TextboxLabel.Font = Enum.Font.GothamSemibold
				TextboxLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
				TextboxLabel.TextSize = 16.000
				TextboxLabel.TextTransparency = 0
				TextboxLabel.TextXAlignment = Enum.TextXAlignment.Left
	
				txtbtn.Name = "txtbtn"
				txtbtn.Parent = Textbox
				txtbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				txtbtn.BackgroundTransparency = 1.000
				txtbtn.Position = UDim2.new(0, 1, 0, 1)
				txtbtn.Size = UDim2.new(0, 468, 0, 29)
				txtbtn.Font = Enum.Font.SourceSans
				txtbtn.Text = ""
				txtbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
				txtbtn.TextSize = 14.000
	
				RealTextbox.Name = "RealTextbox"
				RealTextbox.Parent = Textbox
				RealTextbox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				RealTextbox.BackgroundTransparency = 0
				RealTextbox.Position = UDim2.new(0, 360, 0, 4)
				RealTextbox.Size = UDim2.new(0, 100, 0, 24)
				RealTextbox.Font = Enum.Font.GothamSemibold
				RealTextbox.Text = ""
				RealTextbox.TextColor3 = Color3.fromRGB(225, 225, 225)
				RealTextbox.TextSize = 11.000
				RealTextbox.TextTransparency = 0
	
				RealTextbox.FocusLost:Connect(function()
					callback(RealTextbox.Text)
					if disappear then
						RealTextbox.Text = ""
					end
				end)
	
				UICorner.CornerRadius = UDim.new(0, 5)
				UICorner.Parent = RealTextbox
			end
			function main:Label(text)
				local Label = Instance.new("TextLabel")
				local PaddingLabel = Instance.new("UIPadding")
				local labell = {}
		
				Label.Name = "Label"
				Label.Parent = MainFramePage
				Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Label.BackgroundTransparency = 1.000
				Label.Size = UDim2.new(0, 470, 0, 20)
				Label.Font = Enum.Font.GothamSemibold
				Label.TextColor3 = Color3.fromRGB(225, 225, 225)
				Label.TextSize = 16.000
				Label.Text = text
				Label.TextXAlignment = Enum.TextXAlignment.Left
	
				PaddingLabel.PaddingLeft = UDim.new(0,0)
				PaddingLabel.Parent = Label
				PaddingLabel.Name = "PaddingLabel"
		
				function labell:Set(newtext)
					Label.Text = newtext
				end
	
				return labell
			end
			function main:LabelP(text)
				local Label = Instance.new("TextLabel")
				local PaddingLabel = Instance.new("UIPadding")
				local labell = {}
		
				Label.Name = "Label"
				Label.Parent = MainFramePage
				Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Label.BackgroundTransparency = 1.000
				Label.Size = UDim2.new(0, 470, 0, 20)
				Label.Font = Enum.Font.GothamSemibold
				Label.TextColor3 = Color3.fromRGB(195, 195, 195)
				Label.TextSize = 15.000
				Label.Text = text
				Label.TextXAlignment = Enum.TextXAlignment.Left
	
				PaddingLabel.PaddingLeft = UDim.new(0,25)
				PaddingLabel.Parent = Label
				PaddingLabel.Name = "PaddingLabel"
		
				function labell:Set(newtext)
					Label.Text = newtext
				end
	
				return labell
			end
			function main:Seperator(text)
				local Seperator = Instance.new("Frame")
				local Sep1 = Instance.new("Frame")
				local Sep2 = Instance.new("TextLabel")
				local Sep3 = Instance.new("Frame")
				
				Seperator.Name = "Seperator"
				Seperator.Parent = MainFramePage
				Seperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Seperator.BackgroundTransparency = 1.000
				Seperator.Size = UDim2.new(0, 470, 0, 20)
				
				Sep1.Name = "Sep1"
				Sep1.Parent = Seperator
				Sep1.BackgroundColor3 = _G.Color
				Sep1.BorderSizePixel = 0
				Sep1.Position = UDim2.new(0, 0, 0, 10)
				Sep1.Size = UDim2.new(0, 80, 0, 1)
				
				Sep2.Name = "Sep2"
				Sep2.Parent = Seperator
				Sep2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Sep2.BackgroundTransparency = 1.000
				Sep2.Position = UDim2.new(0, 185, 0, 0)
				Sep2.Size = UDim2.new(0, 100, 0, 20)
				Sep2.Font = Enum.Font.GothamSemibold
				Sep2.Text = text
				Sep2.TextColor3 = Color3.fromRGB(255, 255, 255)
				Sep2.TextSize = 14.000
				
				Sep3.Name = "Sep3"
				Sep3.Parent = Seperator
				Sep3.BackgroundColor3 = _G.Color
				Sep3.BorderSizePixel = 0
				Sep3.Position = UDim2.new(0, 390, 0, 10)
				Sep3.Size = UDim2.new(0, 80, 0, 1)
			end
	
			function main:Line()
				local Linee = Instance.new("Frame")
				local Line = Instance.new("Frame")
				
				Linee.Name = "Linee"
				Linee.Parent = MainFramePage
				Linee.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Linee.BackgroundTransparency = 1.000
				Linee.Position = UDim2.new(0, 0, 0.119999997, 0)
				Linee.Size = UDim2.new(0, 470, 0, 20)
				
				Line.Name = "Line"
				Line.Parent = Linee
				Line.BackgroundColor3 = _G.Color
				Line.BorderSizePixel = 0
				Line.Position = UDim2.new(0, 0, 0, 10)
				Line.Size = UDim2.new(0, 470, 0, 1)
			end
			return main
		end
		return uitab
	end
end

_G.Setting_table = {
    Auto_Farm = false,
    FastAttack = true,
	Auto_Buso = true,
	Auto_Ken = true,
	Show_Damage = true,
	NoClip = true,
	Save_Member = true,
	Melee_A = true,
	Defense_A = true,
	SkillZ = true,
	Rejoin = true,
	Anti_AFK = true,
	K_MAX = 50,
	Chest_Lock = 50,
	Delay_C = 15
}

_G.Check_Save_Setting = "CheckSaveSetting"

getgenv()['JsonEncode'] = function(msg)
    return game:GetService("HttpService"):JSONEncode(msg)
end
getgenv()['JsonDecode'] = function(msg)
    return game:GetService("HttpService"):JSONDecode(msg)
end
getgenv()['Check_Setting'] = function(Name)
    if not _G.Dis and not isfolder('Lion Hub | Setting Save') then
        makefolder('Lion Hub | Setting Save')
    end
    if not _G.Dis and not isfile('Lion Hub | Setting Save/'..Name..'.json') then
        writefile('Lion Hub | Setting Save/'..Name..'.json',JsonEncode(_G.Setting_table))
    end
end
getgenv()['Get_Setting'] = function(Name)
    if not _G.Dis and isfolder('Lion Hub | Setting Save') and isfile('Lion Hub | Setting Save/'..Name..'.json') then
        _G.Setting_table = JsonDecode(readfile('Lion Hub | Setting Save/'..Name..'.json'))
        return _G.Setting_table
	elseif not _G.Dis then
        Check_Setting(Name)
    end
end
getgenv()['Update_Setting'] = function(Name)
    if not _G.Dis and isfolder('Lion Hub | Setting Save') and isfile('Lion Hub | Setting Save/'..Name..'.json') then
        writefile('Lion Hub | Setting Save/'..Name..'.json',JsonEncode(_G.Setting_table))
	elseif not _G.Dis then
        Check_Setting(Name)
    end
end

Check_Setting(_G.Check_Save_Setting)
Get_Setting(_G.Check_Save_Setting)

if _G.Setting_table.Save_Member then
	getgenv()['MyName'] = game.Players.LocalPlayer.Name
	print("Save Member")
elseif _G.Setting_table.Save_All_Member then
	getgenv()['MyName'] = "AllMember"
	print("Save All Member")
else
	getgenv()['MyName'] = "None"
	_G.Dis = true
end

Check_Setting(getgenv()['MyName'])
Get_Setting(getgenv()['MyName'])

_G.Setting_table.Key = _G.wl_key
Update_Setting(getgenv()['MyName'])

if type(_G.Setting_table.Weapon) ~= 'string' then
	for i2,v2 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
		if tostring(v2.ToolTip) == "Melee" then
			_G.Setting_table.Weapon = v2.Name
		end
	end
end

local win = library:Window("Lion",[[Hub]],[[Version : Beta  ]],"73482960622063",Enum.KeyCode.RightControl)
local W = win:T("Status User",[[72717605105840]])
local Sta = win:T("Status & Stats",[[9613645002]])
local Main = win:T("General",[[7040391851]])
local Quest = win:T("    Quest & Item",[[9606626859]])
local PvP = win:T("PvP & visual",[[9606626034]])
local Raid = win:T("Raid",[[9606629300]])
local Fruit = win:T("Fruit",[[98822311315124]])
local Race = win:T("Race V4",[[9606628205]])
local Sea = win:T("Sea Events",[[137409496322634]])
local Shop = win:T("Shop",[[9606625251]])
local Island = win:T("Island",[[9606628205]])
local Setting = win:T("Setting",[[9606644121]])
local Misc = win:T("Misc",[[9613645002]])

if game.PlaceId == 2753915549 then
        World1 = true
    elseif game.PlaceId == 4442272183 then
        World2 = true
    elseif game.PlaceId == 7449423635 then
        World3 = true
    else
    game:GetService("Players").LocalPlayer:Kick("Con Đĩ Mẹ Mày")
  end
      
         hookfunction(require(game:GetService("ReplicatedStorage").Effect.Container.Death), function()end)
        hookfunction(require(game:GetService("ReplicatedStorage").Effect.Container.Respawn), function()end)
        
        hookfunction(require(game:GetService("ReplicatedStorage").Effect.Container.Death), function()end)
        hookfunction(require(game:GetService("ReplicatedStorage").Effect.Container.Respawn), function()end)
        
	function CheckQuest() 
        MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value
        if World1 then
            if MyLevel == 1 or MyLevel <= 9 then
                Mon = "Bandit"
                LevelQuest = 1
                NameQuest = "BanditQuest1"
                NameMon = "Bandit"
                CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544)
                CFrameMon = CFrame.new(1045.962646484375, 27.00250816345215, 1560.8203125)
                
            elseif MyLevel == 10 or MyLevel <= 14 then
                Mon = "Monkey"
                LevelQuest = 1
                NameQuest = "JungleQuest"
                NameMon = "Monkey"
                CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                CFrameMon = CFrame.new(-1243.63867, 11.8520432, 160.512344)
                
            elseif MyLevel == 15 or MyLevel <= 29 then
                Mon = "Gorilla"
                LevelQuest = 2
                NameQuest = "JungleQuest"
                NameMon = "Gorilla"
                CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                CFrameMon = CFrame.new(-1231.79907, 6.27936316, -509.254761)
                
            elseif MyLevel == 30 or MyLevel <= 39 then        
                Mon = "Pirate"
                LevelQuest = 1
                NameQuest = "BuggyQuest1"
                NameMon = "Pirate"
                CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
                CFrameMon = CFrame.new(-1215.10522, 4.7520504, 3913.46265)
                
            elseif MyLevel == 40 or MyLevel <= 59 then
                Mon = "Brute"
                LevelQuest = 2
                NameQuest = "BuggyQuest1"
                NameMon = "Brute"
                CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
                CFrameMon = CFrame.new(-1005.80945, 14.869874, 4308.99268)
            elseif MyLevel == 60 or MyLevel <= 74 then
                Mon = "Desert Bandit"
                LevelQuest = 1
                NameQuest = "DesertQuest"
                NameMon = "Desert Bandit"
                CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
                CFrameMon = CFrame.new(924.7998046875, 6.44867467880249, 4481.5859375)
            elseif MyLevel == 75 or MyLevel <= 89 then
                Mon = "Desert Officer"
                LevelQuest = 2
                NameQuest = "DesertQuest"
                NameMon = "Desert Officer"
                CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
                CFrameMon = CFrame.new(1608.2822265625, 8.614224433898926, 4371.00732421875)
                
            elseif MyLevel == 90 or MyLevel <= 99 then
                Mon = "Snow Bandit"
                LevelQuest = 1
                NameQuest = "SnowQuest"
                NameMon = "Snow Bandit"
                CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
                CFrameMon = CFrame.new(1354.347900390625, 87.27277374267578, -1393.946533203125)
                
            elseif MyLevel == 100 or MyLevel <= 119 then
                Mon = "Snowman"
                LevelQuest = 2
                NameQuest = "SnowQuest"
                NameMon = "Snowman"
                CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
                CFrameMon = CFrame.new(1201.6412353515625, 144.57958984375, -1550.0670166015625)
                
            elseif MyLevel == 120 or MyLevel <= 149 then
                Mon = "Chief Petty Officer"
                LevelQuest = 1
                NameQuest = "MarineQuest2"
                NameMon = "Chief Petty Officer"
                CFrameQuest = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                CFrameMon = CFrame.new(-4881.23095703125, 22.65204429626465, 4273.75244140625)
                ----
            elseif MyLevel == 150 or MyLevel <= 174 then
                Mon = "Sky Bandit"
                LevelQuest = 1
                NameQuest = "SkyQuest"
                NameMon = "Sky Bandit"
                CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
                CFrameMon = CFrame.new(-4953.20703125, 295.74420166015625, -2899.22900390625)
                
            elseif MyLevel == 175 or MyLevel <= 189 then
                Mon = "Dark Master"
                LevelQuest = 2
                NameQuest = "SkyQuest"
                NameMon = "Dark Master"
                CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
                CFrameMon = CFrame.new(-5259.8447265625, 391.3976745605469, -2229.035400390625)
                
            elseif MyLevel == 190 or MyLevel <= 209 then
                Mon = "Prisoner"
                LevelQuest = 1
                NameQuest = "PrisonerQuest"
                NameMon = "Prisoner"
                CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
                CFrameMon = CFrame.new(5098.9736328125, -0.3204058110713959, 474.2373352050781)
                
            elseif MyLevel == 210 or MyLevel <= 249 then
                Mon = "Dangerous Prisoner"
                LevelQuest = 2
                NameQuest = "PrisonerQuest"
                NameMon = "Dangerous Prisoner"
                CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
                CFrameMon = CFrame.new(5654.5634765625, 15.633401870727539, 866.2991943359375)
                
            elseif MyLevel == 250 or MyLevel <= 274 then
                Mon = "Toga Warrior"
                LevelQuest = 1
                NameQuest = "ColosseumQuest"
                NameMon = "Toga Warrior"
                CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
                CFrameMon = CFrame.new(-1820.21484375, 51.68385696411133, -2740.6650390625)
            elseif MyLevel == 275 or MyLevel <= 299 then
                Mon = "Gladiator"
                LevelQuest = 2
                NameQuest = "ColosseumQuest"
                NameMon = "Gladiator"
                CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
                CFrameMon = CFrame.new(-1292.838134765625, 56.380882263183594, -3339.031494140625)
            elseif MyLevel == 300 or MyLevel <= 324 then
                Mon = "Military Soldier"
                LevelQuest = 1
                NameQuest = "MagmaQuest"
                NameMon = "Military Soldier"
                CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
                CFrameMon = CFrame.new(-5411.16455078125, 11.081554412841797, 8454.29296875)
            elseif MyLevel == 325 or MyLevel <= 374 then
                Mon = "Military Spy"
                LevelQuest = 2
                NameQuest = "MagmaQuest"
                NameMon = "Military Spy"
                CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
                CFrameMon = CFrame.new(-5802.8681640625, 86.26241302490234, 8828.859375)
            elseif MyLevel == 375 or MyLevel <= 399 then
                Mon = "Fishman Warrior"
                LevelQuest = 1
                NameQuest = "FishmanQuest"
                NameMon = "Fishman Warrior"
                CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
                CFrameMon = CFrame.new(60878.30078125, 18.482830047607422, 1543.7574462890625)
                if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                end
            elseif MyLevel == 400 or MyLevel <= 449 then
                Mon = "Fishman Commando"
                LevelQuest = 2
                NameQuest = "FishmanQuest"
                NameMon = "Fishman Commando"
                CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
                CFrameMon = CFrame.new(61922.6328125, 18.482830047607422, 1493.934326171875)
                if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                end
            elseif MyLevel == 450 or MyLevel <= 474 then
                Mon = "God's Guard"
                LevelQuest = 1
                NameQuest = "SkyExp1Quest"
                NameMon = "God's Guard"
                CFrameQuest = CFrame.new(-4721.88867, 843.874695, -1949.96643, 0.996191859, -0, -0.0871884301, 0, 1, -0, 0.0871884301, 0, 0.996191859)
                CFrameMon = CFrame.new(-4710.04296875, 845.2769775390625, -1927.3079833984375)
                if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
                end
            elseif MyLevel == 475 or MyLevel <= 524 then
                Mon = "Shanda"
                LevelQuest = 2
                NameQuest = "SkyExp1Quest"
                NameMon = "Shanda"
                CFrameQuest = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
                CFrameMon = CFrame.new(-7678.48974609375, 5566.40380859375, -497.2156066894531)
                if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
                end
            elseif MyLevel == 525 or MyLevel <= 549 then
                Mon = "Royal Squad"
                LevelQuest = 1
                NameQuest = "SkyExp2Quest"
                NameMon = "Royal Squad"
                CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                CFrameMon = CFrame.new(-7624.25244140625, 5658.13330078125, -1467.354248046875)
            elseif MyLevel == 550 or MyLevel <= 624 then
                Mon = "Royal Soldier"
                LevelQuest = 2
                NameQuest = "SkyExp2Quest"
                NameMon = "Royal Soldier"
                CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                CFrameMon = CFrame.new(-7836.75341796875, 5645.6640625, -1790.6236572265625)
            elseif MyLevel == 625 or MyLevel <= 649 then
                Mon = "Galley Pirate"
                LevelQuest = 1
                NameQuest = "FountainQuest"
                NameMon = "Galley Pirate"
                CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
                CFrameMon = CFrame.new(5551.02197265625, 78.90135192871094, 3930.412841796875)
            elseif MyLevel >= 650 then
                Mon = "Galley Captain"
                LevelQuest = 2
                NameQuest = "FountainQuest"
                NameMon = "Galley Captain"
                CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
                CFrameMon = CFrame.new(5441.95166015625, 42.50205993652344, 4950.09375)
            end
        elseif World2 then
            if MyLevel == 700 or MyLevel <= 724 then
                Mon = "Raider"
                LevelQuest = 1
                NameQuest = "Area1Quest"
                NameMon = "Raider"
                CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
                CFrameMon = CFrame.new(-728.3267211914062, 52.779319763183594, 2345.7705078125)
            elseif MyLevel == 725 or MyLevel <= 774 then
                Mon = "Mercenary"
                LevelQuest = 2
                NameQuest = "Area1Quest"
                NameMon = "Mercenary"
                CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
                CFrameMon = CFrame.new(-1004.3244018554688, 80.15886688232422, 1424.619384765625)
            elseif MyLevel == 775 or MyLevel <= 799 then
                Mon = "Swan Pirate"
                LevelQuest = 1
                NameQuest = "Area2Quest"
                NameMon = "Swan Pirate"
                CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
                CFrameMon = CFrame.new(1068.664306640625, 137.61428833007812, 1322.1060791015625)
            elseif MyLevel == 800 or MyLevel <= 874 then
                Mon = "Factory Staff"
                NameQuest = "Area2Quest"
                LevelQuest = 2
                NameMon = "Factory Staff"
                CFrameQuest = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
                CFrameMon = CFrame.new(73.07867431640625, 81.86344146728516, -27.470672607421875)
            elseif MyLevel == 875 or MyLevel <= 899 then
                Mon = "Marine Lieutenant"
                LevelQuest = 1
                NameQuest = "MarineQuest3"
                NameMon = "Marine Lieutenant"
                CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
                CFrameMon = CFrame.new(-2821.372314453125, 75.89727783203125, -3070.089111328125)
            elseif MyLevel == 900 or MyLevel <= 949 then
                Mon = "Marine Captain"
                LevelQuest = 2
                NameQuest = "MarineQuest3"
                NameMon = "Marine Captain"
                CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
                CFrameMon = CFrame.new(-1861.2310791015625, 80.17658233642578, -3254.697509765625)
            elseif MyLevel == 950 or MyLevel <= 974 then
                Mon = "Zombie"
                LevelQuest = 1
                NameQuest = "ZombieQuest"
                NameMon = "Zombie"
                CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
                CFrameMon = CFrame.new(-5657.77685546875, 78.96973419189453, -928.68701171875)
            elseif MyLevel == 975 or MyLevel <= 999 then
                Mon = "Vampire"
                LevelQuest = 2
                NameQuest = "ZombieQuest"
                NameMon = "Vampire"
                CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
                CFrameMon = CFrame.new(-6037.66796875, 32.18463897705078, -1340.6597900390625)
            elseif MyLevel == 1000 or MyLevel <= 1049 then
                Mon = "Snow Trooper"
                LevelQuest = 1
                NameQuest = "SnowMountainQuest"
                NameMon = "Snow Trooper"
                CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
                CFrameMon = CFrame.new(549.1473388671875, 427.3870544433594, -5563.69873046875)
            elseif MyLevel == 1050 or MyLevel <= 1099 then
                Mon = "Winter Warrior"
                LevelQuest = 2
                NameQuest = "SnowMountainQuest"
                NameMon = "Winter Warrior"
                CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
                CFrameMon = CFrame.new(1142.7451171875, 475.6398010253906, -5199.41650390625)
            elseif MyLevel == 1100 or MyLevel <= 1124 then
                Mon = "Lab Subordinate"
                LevelQuest = 1
                NameQuest = "IceSideQuest"
                NameMon = "Lab Subordinate"
                CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
                CFrameMon = CFrame.new(-5707.4716796875, 15.951709747314453, -4513.39208984375)
            elseif MyLevel == 1125 or MyLevel <= 1174 then
                Mon = "Horned Warrior"
                LevelQuest = 2
                NameQuest = "IceSideQuest"
                NameMon = "Horned Warrior"
                CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
                CFrameMon = CFrame.new(-6341.36669921875, 15.951770782470703, -5723.162109375)
            elseif MyLevel == 1175 or MyLevel <= 1199 then
                Mon = "Magma Ninja"
                LevelQuest = 1
                NameQuest = "FireSideQuest"
                NameMon = "Magma Ninja"
                CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
                CFrameMon = CFrame.new(-5449.6728515625, 76.65874481201172, -5808.20068359375)
            elseif MyLevel == 1200 or MyLevel <= 1249 then
                Mon = "Lava Pirate"
                LevelQuest = 2
                NameQuest = "FireSideQuest"
                NameMon = "Lava Pirate"
                CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
                CFrameMon = CFrame.new(-5213.33154296875, 49.73788070678711, -4701.451171875)
            elseif MyLevel == 1250 or MyLevel <= 1274 then
                Mon = "Ship Deckhand"
                LevelQuest = 1
                NameQuest = "ShipQuest1"
                NameMon = "Ship Deckhand"
                CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)         
                CFrameMon = CFrame.new(1212.0111083984375, 150.79205322265625, 33059.24609375)    
                if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                end
            elseif MyLevel == 1275 or MyLevel <= 1299 then
                Mon = "Ship Engineer"
                LevelQuest = 2
                NameQuest = "ShipQuest1"
                NameMon = "Ship Engineer"
                CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)   
                CFrameMon = CFrame.new(919.4786376953125, 43.54401397705078, 32779.96875)   
                if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                end             
            elseif MyLevel == 1300 or MyLevel <= 1324 then
                Mon = "Ship Steward"
                LevelQuest = 1
                NameQuest = "ShipQuest2"
                NameMon = "Ship Steward"
                CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)         
                CFrameMon = CFrame.new(919.4385375976562, 129.55599975585938, 33436.03515625)      
                if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                end
            elseif MyLevel == 1325 or MyLevel <= 1349 then
                Mon = "Ship Officer"
                LevelQuest = 2
                NameQuest = "ShipQuest2"
                NameMon = "Ship Officer"
                CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)
                CFrameMon = CFrame.new(1036.0179443359375, 181.4390411376953, 33315.7265625)
                if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                end
            elseif MyLevel == 1350 or MyLevel <= 1374 then
                Mon = "Arctic Warrior"
                LevelQuest = 1
                NameQuest = "FrostQuest"
                NameMon = "Arctic Warrior"
                CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
                CFrameMon = CFrame.new(5966.24609375, 62.97002029418945, -6179.3828125)
                if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 5000.034996032715, -132.83953857422))
                end
            elseif MyLevel == 1375 or MyLevel <= 1424 then
                Mon = "Snow Lurker"
                LevelQuest = 2
                NameQuest = "FrostQuest"
                NameMon = "Snow Lurker"
                CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
                CFrameMon = CFrame.new(5407.07373046875, 69.19437408447266, -6880.88037109375)
            elseif MyLevel == 1425 or MyLevel <= 1449 then
                Mon = "Sea Soldier"
                LevelQuest = 1
                NameQuest = "ForgottenQuest"
                NameMon = "Sea Soldier"
                CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
                CFrameMon = CFrame.new(-3028.2236328125, 64.67451477050781, -9775.4267578125)
            elseif MyLevel >= 1450 then
                Mon = "Water Fighter"
                LevelQuest = 2
                NameQuest = "ForgottenQuest"
                NameMon = "Water Fighter"
                CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
                CFrameMon = CFrame.new(-3352.9013671875, 285.01556396484375, -10534.841796875)
            end
        elseif World3 then
            if MyLevel == 1500 or MyLevel <= 1524 then
                Mon = "Pirate Millionaire"
                LevelQuest = 1
                NameQuest = "PiratePortQuest"
                NameMon = "Pirate Millionaire"
                CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
                CFrameMon = CFrame.new(-245.9963836669922, 47.30615234375, 5584.1005859375)
            elseif MyLevel == 1525 or MyLevel <= 1574 then
                Mon = "Pistol Billionaire"
                LevelQuest = 2
                NameQuest = "PiratePortQuest"
                NameMon = "Pistol Billionaire"
                CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
                CFrameMon = CFrame.new(-187.3301544189453, 86.23987579345703, 6013.513671875)
            elseif MyLevel == 1575 or MyLevel <= 1599 then
                Mon = "Dragon Crew Warrior"
                LevelQuest = 1
                NameQuest = "AmazonQuest"
                NameMon = "Dragon Crew Warrior"
                CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
                CFrameMon = CFrame.new(6141.140625, 51.35136413574219, -1340.738525390625)
            elseif MyLevel == 1600 or MyLevel <= 1624 then 
                Mon = "Dragon Crew Archer"
                NameQuest = "AmazonQuest"
                LevelQuest = 2
                NameMon = "Dragon Crew Archer"
                CFrameQuest = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
                CFrameMon = CFrame.new(6616.41748046875, 441.7670593261719, 446.0469970703125)
            elseif MyLevel == 1625 or MyLevel <= 1649 then
                Mon = "Female Islander"
                NameQuest = "AmazonQuest2"
                LevelQuest = 1
                NameMon = "Female Islander"
                CFrameQuest = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
                CFrameMon = CFrame.new(4685.25830078125, 735.8078002929688, 815.3425903320312)
            elseif MyLevel == 1650 or MyLevel <= 1699 then 
                Mon = "Giant Islander"
                NameQuest = "AmazonQuest2"
                LevelQuest = 2
                NameMon = "Giant Islander"
                CFrameQuest = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
                CFrameMon = CFrame.new(4729.09423828125, 590.436767578125, -36.97627639770508)
            elseif MyLevel == 1700 or MyLevel <= 1724 then
                Mon = "Marine Commodore"
                LevelQuest = 1
                NameQuest = "MarineTreeIsland"
                NameMon = "Marine Commodore"
                CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
                CFrameMon = CFrame.new(2286.0078125, 73.13391876220703, -7159.80908203125)
            elseif MyLevel == 1725 or MyLevel <= 1774 then
                Mon = "Marine Rear Admiral"
                NameMon = "Marine Rear Admiral"
                NameQuest = "MarineTreeIsland"
                LevelQuest = 2
                CFrameQuest = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
                CFrameMon = CFrame.new(3656.773681640625, 160.52406311035156, -7001.5986328125)
            elseif MyLevel == 1775 or MyLevel <= 1799 then
                Mon = "Fishman Raider"
                LevelQuest = 1
                NameQuest = "DeepForestIsland3"
                NameMon = "Fishman Raider"
                CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)   
                CFrameMon = CFrame.new(-10407.5263671875, 331.76263427734375, -8368.5166015625)
            elseif MyLevel == 1800 or MyLevel <= 1824 then
                Mon = "Fishman Captain"
                LevelQuest = 2
                NameQuest = "DeepForestIsland3"
                NameMon = "Fishman Captain"
                CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)   
                CFrameMon = CFrame.new(-10994.701171875, 352.38140869140625, -9002.1103515625) 
            elseif MyLevel == 1825 or MyLevel <= 1849 then
                Mon = "Forest Pirate"
                LevelQuest = 1
                NameQuest = "DeepForestIsland"
                NameMon = "Forest Pirate"
                CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
                CFrameMon = CFrame.new(-13274.478515625, 332.3781433105469, -7769.58056640625)
            elseif MyLevel == 1850 or MyLevel <= 1899 then
                Mon = "Mythological Pirate"
                LevelQuest = 2
                NameQuest = "DeepForestIsland"
                NameMon = "Mythological Pirate"
                CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)   
                CFrameMon = CFrame.new(-13680.607421875, 501.08154296875, -6991.189453125)
            elseif MyLevel == 1900 or MyLevel <= 1924 then
                Mon = "Jungle Pirate"
                LevelQuest = 1
                NameQuest = "DeepForestIsland2"
                NameMon = "Jungle Pirate"
                CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
                CFrameMon = CFrame.new(-12256.16015625, 331.73828125, -10485.8369140625)
            elseif MyLevel == 1925 or MyLevel <= 1974 then
                Mon = "Musketeer Pirate"
                LevelQuest = 2
                NameQuest = "DeepForestIsland2"
                NameMon = "Musketeer Pirate"
                CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
                CFrameMon = CFrame.new(-13457.904296875, 391.545654296875, -9859.177734375)
            elseif MyLevel == 1975 or MyLevel <= 1999 then
                Mon = "Reborn Skeleton"
                LevelQuest = 1
                NameQuest = "HauntedQuest1"
                NameMon = "Reborn Skeleton"
                CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                CFrameMon = CFrame.new(-8763.7236328125, 165.72299194335938, 6159.86181640625)
            elseif MyLevel == 2000 or MyLevel <= 2024 then
                Mon = "Living Zombie"
                LevelQuest = 2
                NameQuest = "HauntedQuest1"
                NameMon = "Living Zombie"
                CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                CFrameMon = CFrame.new(-10144.1318359375, 138.62667846679688, 5838.0888671875)
            elseif MyLevel == 2025 or MyLevel <= 2049 then
                Mon = "Demonic Soul"
                LevelQuest = 1
                NameQuest = "HauntedQuest2"
                NameMon = "Demonic Soul"
                CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0) 
                CFrameMon = CFrame.new(-9505.8720703125, 172.10482788085938, 6158.9931640625)
            elseif MyLevel == 2050 or MyLevel <= 2074 then
                Mon = "Posessed Mummy"
                LevelQuest = 2
                NameQuest = "HauntedQuest2"
                NameMon = "Posessed Mummy"
                CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                CFrameMon = CFrame.new(-9582.0224609375, 6.251527309417725, 6205.478515625)
            elseif MyLevel == 2075 or MyLevel <= 2099 then
                Mon = "Peanut Scout"
                LevelQuest = 1
                NameQuest = "NutsIslandQuest"
                NameMon = "Peanut Scout"
                CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                CFrameMon = CFrame.new(-2143.241943359375, 47.72198486328125, -10029.9951171875)
            elseif MyLevel == 2100 or MyLevel <= 2124 then
                Mon = "Peanut President"
                LevelQuest = 2
                NameQuest = "NutsIslandQuest"
                NameMon = "Peanut President"
                CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                CFrameMon = CFrame.new(-1859.35400390625, 38.10316848754883, -10422.4296875)
            elseif MyLevel == 2125 or MyLevel <= 2149 then
                Mon = "Ice Cream Chef"
                LevelQuest = 1
                NameQuest = "IceCreamIslandQuest"
                NameMon = "Ice Cream Chef"
                CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                CFrameMon = CFrame.new(-872.24658203125, 65.81957244873047, -10919.95703125)
            elseif MyLevel == 2150 or MyLevel <= 2199 then
                Mon = "Ice Cream Commander"
                LevelQuest = 2
                NameQuest = "IceCreamIslandQuest"
                NameMon = "Ice Cream Commander"
                CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                CFrameMon = CFrame.new(-558.06103515625, 112.04895782470703, -11290.7744140625)
            elseif MyLevel == 2200 or MyLevel <= 2224 then
                Mon = "Cookie Crafter"
                LevelQuest = 1
                NameQuest = "CakeQuest1"
                NameMon = "Cookie Crafter"
                CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
                CFrameMon = CFrame.new(-2374.13671875, 37.79826354980469, -12125.30859375)
            elseif MyLevel == 2225 or MyLevel <= 2249 then
                Mon = "Cake Guard"
                LevelQuest = 2
                NameQuest = "CakeQuest1"
                NameMon = "Cake Guard"
                CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
                CFrameMon = CFrame.new(-1598.3070068359375, 43.773197174072266, -12244.5810546875)
            elseif MyLevel == 2250 or MyLevel <= 2274 then
                Mon = "Baking Staff"
                LevelQuest = 1
                NameQuest = "CakeQuest2"
                NameMon = "Baking Staff"
                CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
                CFrameMon = CFrame.new(-1887.8099365234375, 77.6185073852539, -12998.3505859375)
            elseif MyLevel == 2275 or MyLevel <= 2299 then
                Mon = "Head Baker"
                LevelQuest = 2
                NameQuest = "CakeQuest2"
                NameMon = "Head Baker"
                CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
                CFrameMon = CFrame.new(-2216.188232421875, 82.884521484375, -12869.2939453125)
            elseif MyLevel == 2300 or MyLevel <= 2324 then
                Mon = "Cocoa Warrior"
                LevelQuest = 1
                NameQuest = "ChocQuest1"
                NameMon = "Cocoa Warrior"
                CFrameQuest = CFrame.new(233.22836303710938, 29.876001358032227, -12201.2333984375)
                CFrameMon = CFrame.new(-21.55328369140625, 80.57499694824219, -12352.3876953125)
            elseif MyLevel == 2325 or MyLevel <= 2349 then
                Mon = "Chocolate Bar Battler"
                LevelQuest = 2
                NameQuest = "ChocQuest1"
                NameMon = "Chocolate Bar Battler"
                CFrameQuest = CFrame.new(233.22836303710938, 29.876001358032227, -12201.2333984375)
                CFrameMon = CFrame.new(582.590576171875, 77.18809509277344, -12463.162109375)
            elseif MyLevel == 2350 or MyLevel <= 2374 then
                Mon = "Sweet Thief"
                LevelQuest = 1
                NameQuest = "ChocQuest2"
                NameMon = "Sweet Thief"
                CFrameQuest = CFrame.new(150.5066375732422, 30.693693161010742, -12774.5029296875)
                CFrameMon = CFrame.new(165.1884765625, 76.05885314941406, -12600.8369140625)
            elseif MyLevel == 2375 or MyLevel <= 2399 then
                Mon = "Candy Rebel"
                LevelQuest = 2
                NameQuest = "ChocQuest2"
                NameMon = "Candy Rebel"
                CFrameQuest = CFrame.new(150.5066375732422, 30.693693161010742, -12774.5029296875)
                CFrameMon = CFrame.new(134.86563110351562, 77.2476806640625, -12876.5478515625)
            elseif MyLevel == 2400 or MyLevel <= 2424 then
                Mon = "Candy Pirate"
                LevelQuest = 1
                NameQuest = "CandyQuest1"
                NameMon = "Candy Pirate"
                CFrameQuest = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375)
                CFrameMon = CFrame.new(-1310.5003662109375, 26.016523361206055, -14562.404296875)
            elseif MyLevel == 2425 or MyLevel <= 2449 then
                Mon = "Snow Demon"
                LevelQuest = 2
                NameQuest = "CandyQuest1"
                NameMon = "Snow Demon"
                CFrameQuest = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375)
                CFrameMon = CFrame.new(-880.2006225585938, 71.24776458740234, -14538.609375)
            elseif MyLevel == 2450 or MyLevel <= 2474 then
                Mon = "Isle Outlaw"
                LevelQuest = 1
                NameQuest = "TikiQuest1"
                NameMon = "Isle Outlaw"
                CFrameQuest = CFrame.new(-16547.748046875, 61.13533401489258, -173.41360473632812)
                CFrameMon = CFrame.new(-16442.814453125, 116.13899993896484, -264.4637756347656)
            elseif MyLevel == 2475 or MyLevel <= 2499 then
                Mon = "Island Boy"
                LevelQuest = 2
                NameQuest = "TikiQuest1"
                NameMon = "Island Boy"
                CFrameQuest = CFrame.new(-16547.748046875, 61.13533401489258, -173.41360473632812)
                CFrameMon = CFrame.new(-16901.26171875, 84.06756591796875, -192.88906860351562)
            elseif MyLevel == 2500 or MyLevel <= 2524 then
                Mon = "Sun-kissed Warrior"
                LevelQuest = 1
                NameQuest = "TikiQuest2"
                NameMon = "kissed"
                CFrameQuest = CFrame.new(-16539.078125, 55.68632888793945, 1051.5738525390625)
                CFrameMon = CFrame.new(-16349.8779296875, 92.0808334350586, 1123.4169921875)
            elseif MyLevel == 2525 or MyLevel <= 2550 then
                Mon = "Isle Champion"
                LevelQuest = 2
                NameQuest = "TikiQuest2"
                NameMon = "Isle Champion"
                CFrameQuest = CFrame.new(-16539.078125, 55.68632888793945, 1051.5738525390625)
                CFrameMon = CFrame.new(-16347.4150390625, 92.09503936767578, 1122.335205078125)
            end
        end
    end
    -- // Check Boss Quest
    function CheckBossQuest()
        if World1 then
            if SelectBoss == "The Gorilla King" then
                BossMon = "The Gorilla King"
                NameBoss = 'The Gorrila King'
                NameQuestBoss = "JungleQuest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$2,000\n7,000 Exp."
                CFrameQBoss = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
                CFrameBoss = CFrame.new(-1088.75977, 8.13463783, -488.559906, -0.707134247, 0, 0.707079291, 0, 1, 0,
                    -0.707079291, 0, -0.707134247)
            elseif SelectBoss == "Bobby" then
                BossMon = "Bobby"
                NameBoss = 'Bobby'
                NameQuestBoss = "BuggyQuest1"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$8,000\n35,000 Exp."
                CFrameQBoss = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
                CFrameBoss = CFrame.new(-1087.3760986328, 46.949409484863, 4040.1462402344)
            elseif SelectBoss == "The Saw" then
                BossMon = "The Saw"
                NameBoss = 'The Saw'
                CFrameBoss = CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906)
            elseif SelectBoss == "Yeti" then
                BossMon = "Yeti"
                NameBoss = 'Yeti'
                NameQuestBoss = "SnowQuest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$10,000\n180,000 Exp."
                CFrameQBoss = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
                CFrameBoss = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
            elseif SelectBoss == "Mob Leader" then
                BossMon = "Mob Leader"
                NameBoss = 'Mob Leader'
                CFrameBoss = CFrame.new(-2844.7307128906, 7.4180502891541, 5356.6723632813)
            elseif SelectBoss == "Vice Admiral" then
                BossMon = "Vice Admiral"
                NameBoss = 'Vice Admiral'
                NameQuestBoss = "MarineQuest2"
                QuestLvBoss = 2
                RewardBoss = "Reward:\n$10,000\n180,000 Exp."
                CFrameQBoss = CFrame.new(-5036.2465820313, 28.677835464478, 4324.56640625)
                CFrameBoss = CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375)
            elseif SelectBoss == "Saber Expert" then
                NameBoss = 'Saber Expert'
                BossMon = "Saber Expert"
                CFrameBoss = CFrame.new(-1458.89502, 29.8870335, -50.633564)
            elseif SelectBoss == "Warden" then
                BossMon = "Warden"
                NameBoss = 'Warden'
                NameQuestBoss = "ImpelQuest"
                QuestLvBoss = 1
                RewardBoss = "Reward:\n$6,000\n850,000 Exp."
                CFrameBoss = CFrame.new(5278.04932, 2.15167475, 944.101929, 0.220546961, -4.49946401e-06, 0.975376427,
                    -1.95412576e-05, 1, 9.03162072e-06, -0.975376427, -2.10519756e-05, 0.220546961)
                CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0,
                    -0.681965172, 0, -0.731384635)
            elseif SelectBoss == "Chief Warden" then
                BossMon = "Chief Warden"
                NameBoss = 'Chief Warden'
                NameQuestBoss = "ImpelQuest"
                QuestLvBoss = 2
                RewardBoss = "Reward:\n$10,000\n1,000,000 Exp."
                CFrameBoss = CFrame.new(5206.92578, 0.997753382, 814.976746, 0.342041343, -0.00062915677, 0.939684749,
                    0.00191645394, 0.999998152, -2.80422337e-05, -0.939682961, 0.00181045406, 0.342041939)
                CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0,
                    -0.681965172, 0, -0.731384635)
            elseif SelectBoss == "Swan" then
                BossMon = "Swan"
                NameBoss = 'Swan'
                NameQuestBoss = "ImpelQuest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$15,000\n1,600,000 Exp."
                CFrameBoss = CFrame.new(5325.09619, 7.03906584, 719.570679, -0.309060812, 0, 0.951042235, 0, 1, 0,
                    -0.951042235, 0, -0.309060812)
                CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0,
                    -0.681965172, 0, -0.731384635)
            elseif SelectBoss == "Magma Admiral" then
                BossMon = "Magma Admiral"
                NameBoss = 'Magma Admiral'
                NameQuestBoss = "MagmaQuest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$15,000\n2,800,000 Exp."
                CFrameQBoss = CFrame.new(-5314.6220703125, 12.262420654297, 8517.279296875)
                CFrameBoss = CFrame.new(-5765.8969726563, 82.92064666748, 8718.3046875)
            elseif SelectBoss == "Fishman Lord" then
                BossMon = "Fishman Lord"
                NameBoss = 'Fishman Lord'
                NameQuestBoss = "FishmanQuest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$15,000\n4,000,000 Exp."
                CFrameQBoss = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
                CFrameBoss = CFrame.new(61260.15234375, 30.950881958008, 1193.4329833984)
            elseif SelectBoss == "Wysper" then
                BossMon = "Wysper"
                NameBoss = 'Wysper'
                NameQuestBoss = "SkyExp1Quest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$15,000\n4,800,000 Exp."
                CFrameQBoss = CFrame.new(-7861.947265625, 5545.517578125, -379.85974121094)
                CFrameBoss = CFrame.new(-7866.1333007813, 5576.4311523438, -546.74816894531)
            elseif SelectBoss == "Thunder God" then
                BossMon = "Thunder God"
                NameBoss = 'Thunder God'
                NameQuestBoss = "SkyExp2Quest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$20,000\n5,800,000 Exp."
                CFrameQBoss = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
                CFrameBoss = CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188)
            elseif SelectBoss == "Cyborg" then
                BossMon = "Cyborg"
                NameBoss = 'Cyborg'
                NameQuestBoss = "FountainQuest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$20,000\n7,500,000 Exp."
                CFrameQBoss = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
                CFrameBoss = CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813)
            elseif SelectBoss == "Greybeard" then
                BossMon = "Greybeard"
                NameBoss = 'Greybeard'
                CFrameBoss = CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188)
            end
        end
        if World2 then
            if SelectBoss == "Diamond" then
                BossMon = "Diamond"
                NameBoss = 'Diamond'
                NameQuestBoss = "Area1Quest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$25,000\n9,000,000 Exp."
                CFrameQBoss = CFrame.new(-427.5666809082, 73.313781738281, 1835.4208984375)
                CFrameBoss = CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407)
            elseif SelectBoss == "Jeremy" then
                BossMon = "Jeremy"
                NameBoss = 'Jeremy'
                NameQuestBoss = "Area2Quest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$25,000\n11,500,000 Exp."
                CFrameQBoss = CFrame.new(636.79943847656, 73.413787841797, 918.00415039063)
                CFrameBoss = CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109)
            elseif SelectBoss == "Fajita" then
                BossMon = "Fajita"
                NameBoss = 'Fajita'
                NameQuestBoss = "MarineQuest3"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$25,000\n15,000,000 Exp."
                CFrameQBoss = CFrame.new(-2441.986328125, 73.359344482422, -3217.5324707031)
                CFrameBoss = CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625)
            elseif SelectBoss == "Don Swan" then
                BossMon = "Don Swan"
                NameBoss = 'Don Swan'
                CFrameBoss = CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875)
            elseif SelectBoss == "Smoke Admiral" then
                BossMon = "Smoke Admiral"
                NameBoss = 'Smoke Admiral'
                NameQuestBoss = "IceSideQuest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$20,000\n25,000,000 Exp."
                CFrameQBoss = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
                CFrameBoss = CFrame.new(-5275.1987304688, 20.757257461548, -5260.6669921875)
            elseif SelectBoss == "Awakened Ice Admiral" then
                BossMon = "Awakened Ice Admiral"
                NameBoss = 'Awakened Ice Admiral'
                NameQuestBoss = "FrostQuest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$20,000\n36,000,000 Exp."
                CFrameQBoss = CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813)
                CFrameBoss = CFrame.new(6403.5439453125, 340.29766845703, -6894.5595703125)
            elseif SelectBoss == "Tide Keeper" then
                BossMon = "Tide Keeper"
                NameBoss = 'Tide Keeper'
                NameQuestBoss = "ForgottenQuest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$12,500\n38,000,000 Exp."
                CFrameQBoss = CFrame.new(-3053.9814453125, 237.18954467773, -10145.0390625)
                CFrameBoss = CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188)
            elseif SelectBoss == "Darkbeard" then
                BossMon = "Darkbeard"
                NameBoss = 'Darkbeard'
                CFrameMon = CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531)
            elseif SelectBoss == "Cursed Captain" then
                BossMon = "Cursed Captain"
                NameBoss = 'Cursed Captain'
                CFrameBoss = CFrame.new(916.928589, 181.092773, 33422)
            elseif SelectBoss == "Order" then
                BossMon = "Order"
                NameBoss = 'Order'
                CFrameBoss = CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875)
            end
        end
        if World3 then
            if SelectBoss == "Stone" then
                BossMon = "Stone"
                NameBoss = 'Stone'
                NameQuestBoss = "PiratePortQuest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$25,000\n40,000,000 Exp."
                CFrameQBoss = CFrame.new(-289.76705932617, 43.819011688232, 5579.9384765625)
                CFrameBoss = CFrame.new(-1027.6512451172, 92.404174804688, 6578.8530273438)
            elseif SelectBoss == "Island Empress" then
                BossMon = "Island Empress"
                NameBoss = 'Island Empress'
                NameQuestBoss = "AmazonQuest2"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$30,000\n52,000,000 Exp."
                CFrameQBoss = CFrame.new(5445.9541015625, 601.62945556641, 751.43792724609)
                CFrameBoss = CFrame.new(5543.86328125, 668.97399902344, 199.0341796875)
            elseif SelectBoss == "Kilo Admiral" then
                BossMon = "Kilo Admiral"
                NameBoss = 'Kilo Admiral'
                NameQuestBoss = "MarineTreeIsland"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$35,000\n56,000,000 Exp."
                CFrameQBoss = CFrame.new(2179.3010253906, 28.731239318848, -6739.9741210938)
                CFrameBoss = CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125)
            elseif SelectBoss == "Captain Elephant" then
                BossMon = "Captain Elephant"
                NameBoss = 'Captain Elephant'
                NameQuestBoss = "DeepForestIsland"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$40,000\n67,000,000 Exp."
                CFrameQBoss = CFrame.new(-13232.682617188, 332.40396118164, -7626.01171875)
                CFrameBoss = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)
            elseif SelectBoss == "Beautiful Pirate" then
                BossMon = "Beautiful Pirate"
                NameBoss = 'Beautiful Pirate'
                NameQuestBoss = "DeepForestIsland2"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$50,000\n70,000,000 Exp."
                CFrameQBoss = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
                CFrameBoss = CFrame.new(5283.609375, 22.56223487854, -110.78285217285)
            elseif SelectBoss == "Cake Queen" then
                BossMon = "Cake Queen"
                NameBoss = 'Cake Queen'
                NameQuestBoss = "IceCreamIslandQuest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$30,000\n112,500,000 Exp."
                CFrameQBoss = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0,
                    -0.642767608, 0, -0.766061664)
                CFrameBoss = CFrame.new(-678.648804, 381.353943, -11114.2012, -0.908641815, 0.00149294338, 0.41757378,
                    0.00837114919, 0.999857843, 0.0146408929, -0.417492568, 0.0167988986, -0.90852499)
            elseif SelectBoss == "Longma" then
                BossMon = "Longma"
                NameBoss = 'Longma'
                CFrameBoss = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)
            elseif SelectBoss == "Soul Reaper" then
                BossMon = "Soul Reaper"
                NameBoss = 'Soul Reaper'
                CFrameBoss = CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813)
            elseif SelectBoss == "rip_indra True Form" then
                BossMon = "rip_indra True Form"
                NameBoss = 'rip_indra True Form'
                CFrameBoss = CFrame.new(-5415.3920898438, 505.74133300781, -2814.0166015625)
            end
        end
    end
    
    -- // Check Material
    function MaterialMon()
			if _G.SelectMaterial == "Radioactive Material" then
				MMon = "Factory Staff"
				MPos = CFrame.new(-507.7895202636719, 72.99479675292969, -126.45632934570312)
				SP = "Bar"
			elseif _G.SelectMaterial == "Mystic Droplet" then
				MMon = "Water Fighter"
				MPos = CFrame.new(-3214.218017578125, 298.69952392578125, -10543.685546875)
				SP = "ForgottenIsland"
			elseif _G.SelectMaterial == "Magma Ore" then
				if game.PlaceId == 2753915549 then
					MMon = "Military Spy"
					MPos = CFrame.new(-5850.2802734375, 77.28675079345703, 8848.6748046875)
					SP = "Magma"
				elseif game.PlaceId == 4442272183 then
					MMon = "Lava Pirate"
					MPos = CFrame.new(-5234.60595703125, 51.953372955322266, -4732.27880859375)
					SP = "CircleIslandFire"
				end
			elseif _G.SelectMaterial == "Angel Wings" then
				MMon = "Royal Soldier"
				MPos = CFrame.new(-7827.15625, 5606.912109375, -1705.5833740234375)
				SP = "Sky2"
			elseif _G.SelectMaterial == "Leather" then
				if game.PlaceId == 2753915549 then
					MMon = "Pirate"
					MPos = CFrame.new(-1211.8792724609375, 4.787090301513672, 3916.83056640625)
					SP = "Pirate"
				elseif game.PlaceId == 4442272183 then
					MMon = "Marine Captain"
					MPos = CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375)
					SP = "Greenb"
				elseif game.PlaceId == 7449423635 then
					MMon = "Jungle Pirate"
					MPos = CFrame.new(-11975.78515625, 331.7734069824219, -10620.0302734375)
					SP = "PineappleTown"
				end
			elseif _G.SelectMaterial == "Scrap Metal" then
				if game.PlaceId == 2753915549 then
					MMon = "Brute"
					MPos = CFrame.new(-1132.4202880859375, 14.844913482666016, 4293.30517578125)
					SP = "Pirate"
				elseif game.PlaceId == 4442272183 then
					MMon = "Mercenary"
					MPos = CFrame.new(-972.307373046875, 73.04473876953125, 1419.2901611328125)
					SP = "DressTown"
				elseif game.PlaceId == 7449423635 then
					MMon = "Pirate Millionaire"
					MPos = CFrame.new(-289.6311950683594, 43.8282470703125, 5583.66357421875)
					SP = "Default"
				end
			elseif _G.SelectMaterial == "Demonic Wisp" then
				MMon = "Demonic Soul"
				MPos = CFrame.new(-9503.388671875, 172.139892578125, 6143.0634765625)
				SP = "HauntedCastle"
			elseif _G.SelectMaterial == "Vampire Fang" then
				MMon = "Vampire"
				MPos = CFrame.new(-5999.20458984375, 6.437741279602051, -1290.059326171875)
				SP = "Graveyard"
			elseif _G.SelectMaterial == "Conjured Cocoa" then
				MMon = "Chocolate Bar Battler"
				MPos = CFrame.new(744.7930908203125, 24.76934242248535, -12637.7255859375)
				SP = "Chocolate"
			elseif _G.SelectMaterial == "Dragon Scale" then
				MMon = "Dragon Crew Warrior"
				MPos = CFrame.new(5824.06982421875, 51.38640213012695, -1106.694580078125)
				SP = "Hydra1"
			elseif _G.SelectMaterial == "Gunpowder" then
				MMon = "Pistol Billionaire"
				MPos = CFrame.new(-379.6134338378906, 73.84449768066406, 5928.5263671875)
				SP = "Mansion"
			elseif _G.SelectMaterial == "Fish Tail" then
				MMon = "Fishman Captain"
				MPos = CFrame.new(-10961.0126953125, 331.7977600097656, -8914.29296875)
				SP = "PineappleTown"
			elseif _G.SelectMaterial == "Mini Tusk" then
				MMon = "Mythological Pirate"
				MPos = CFrame.new(-13516.0458984375, 469.8182373046875, -6899.16064453125)
				SP = "BigMansion"
			end
		end
--//ESP
function UpdateIslandESP() 
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        pcall(function()
            if IslandESP then 
                if v.Name ~= "Sea" then
                    if not v:FindFirstChild('NameEsp') then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = "GothamBold"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(7, 236, 240)
                    else
                        v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                    end
                end
            else
                if v:FindFirstChild('NameEsp') then
                    v:FindFirstChild('NameEsp'):Destroy()
                end
            end
        end)
    end
end

function isnil(thing)
return (thing == nil)
end
local function round(n)
return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)
function UpdatePlayerChams()
for i,v in pairs(game:GetService'Players':GetChildren()) do
    pcall(function()
        if not isnil(v.Character) then
            if ESPPlayer then
                if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('NameEsp'..Number) then
                    local bill = Instance.new('BillboardGui',v.Character.Head)
                    bill.Name = 'NameEsp'..Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v.Character.Head
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' Distance')
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    if v.Team == game.Players.LocalPlayer.Team then
                        name.TextColor3 = Color3.new(0,255,0)
                    else
                        name.TextColor3 = Color3.new(255,0,0)
                    end
                else
                    v.Character.Head['NameEsp'..Number].TextLabel.Text = (v.Name ..' | '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' Distance\nHealth : ' .. round(v.Character.Humanoid.Health*100/v.Character.Humanoid.MaxHealth) .. '%')
                end
            else
                if v.Character.Head:FindFirstChild('NameEsp'..Number) then
                    v.Character.Head:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end
        end
    end)
end
end
function UpdateChestChams() 
for i,v in pairs(game.Workspace:GetChildren()) do
    pcall(function()
        if string.find(v.Name,"Chest") then
            if ChestESP then
                if string.find(v.Name,"Chest") then
                    if not v:FindFirstChild('NameEsp'..Number) then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'..Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = Enum.Font.GothamSemibold
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        if v.Name == "Chest1" then
                            name.TextColor3 = Color3.fromRGB(109, 109, 109)
                            name.Text = ("Chest 1" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        end
                        if v.Name == "Chest2" then
                            name.TextColor3 = Color3.fromRGB(173, 158, 21)
                            name.Text = ("Chest 2" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        end
                        if v.Name == "Chest3" then
                            name.TextColor3 = Color3.fromRGB(85, 255, 255)
                            name.Text = ("Chest 3" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        end
                    else
                        v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                    end
                end
            else
                if v:FindFirstChild('NameEsp'..Number) then
                    v:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end
        end
    end)
end
end
function UpdateDevilChams() 
for i,v in pairs(game.Workspace:GetChildren()) do
    pcall(function()
        if DevilFruitESP then
            if string.find(v.Name, "Fruit") then   
                if not v.Handle:FindFirstChild('NameEsp'..Number) then
                    local bill = Instance.new('BillboardGui',v.Handle)
                    bill.Name = 'NameEsp'..Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v.Handle
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(255, 255, 255)
                    name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
                else
                    v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
                end
            end
        else
            if v.Handle:FindFirstChild('NameEsp'..Number) then
                v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
            end
        end
    end)
end
end
function UpdateFlowerChams() 
for i,v in pairs(game.Workspace:GetChildren()) do
    pcall(function()
        if v.Name == "Flower2" or v.Name == "Flower1" then
            if FlowerESP then 
                if not v:FindFirstChild('NameEsp'..Number) then
                    local bill = Instance.new('BillboardGui',v)
                    bill.Name = 'NameEsp'..Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(255, 0, 0)
                    if v.Name == "Flower1" then 
                        name.Text = ("Blue Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        name.TextColor3 = Color3.fromRGB(0, 0, 255)
                    end
                    if v.Name == "Flower2" then
                        name.Text = ("Red Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        name.TextColor3 = Color3.fromRGB(255, 0, 0)
                    end
                else
                    v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                end
            else
                if v:FindFirstChild('NameEsp'..Number) then
                v:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end
        end   
    end)
end
end
function UpdateRealFruitChams() 
for i,v in pairs(game.Workspace.AppleSpawner:GetChildren()) do
    if v:IsA("Tool") then
        if RealFruitESP then 
            if not v.Handle:FindFirstChild('NameEsp'..Number) then
                local bill = Instance.new('BillboardGui',v.Handle)
                bill.Name = 'NameEsp'..Number
                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                bill.Size = UDim2.new(1,200,1,30)
                bill.Adornee = v.Handle
                bill.AlwaysOnTop = true
                local name = Instance.new('TextLabel',bill)
                name.Font = Enum.Font.GothamSemibold
                name.FontSize = "Size14"
                name.TextWrapped = true
                name.Size = UDim2.new(1,0,1,0)
                name.TextYAlignment = 'Top'
                name.BackgroundTransparency = 1
                name.TextStrokeTransparency = 0.5
                name.TextColor3 = Color3.fromRGB(255, 0, 0)
                name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            else
                v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            end
        else
            if v.Handle:FindFirstChild('NameEsp'..Number) then
                v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
            end
        end 
    end
end
for i,v in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
    if v:IsA("Tool") then
        if RealFruitESP then 
            if not v.Handle:FindFirstChild('NameEsp'..Number) then
                local bill = Instance.new('BillboardGui',v.Handle)
                bill.Name = 'NameEsp'..Number
                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                bill.Size = UDim2.new(1,200,1,30)
                bill.Adornee = v.Handle
                bill.AlwaysOnTop = true
                local name = Instance.new('TextLabel',bill)
                name.Font = Enum.Font.GothamSemibold
                name.FontSize = "Size14"
                name.TextWrapped = true
                name.Size = UDim2.new(1,0,1,0)
                name.TextYAlignment = 'Top'
                name.BackgroundTransparency = 1
                name.TextStrokeTransparency = 0.5
                name.TextColor3 = Color3.fromRGB(255, 174, 0)
                name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            else
                v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            end
        else
            if v.Handle:FindFirstChild('NameEsp'..Number) then
                v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
            end
        end 
    end
end
for i,v in pairs(game.Workspace.BananaSpawner:GetChildren()) do
    if v:IsA("Tool") then
        if RealFruitESP then 
            if not v.Handle:FindFirstChild('NameEsp'..Number) then
                local bill = Instance.new('BillboardGui',v.Handle)
                bill.Name = 'NameEsp'..Number
                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                bill.Size = UDim2.new(1,200,1,30)
                bill.Adornee = v.Handle
                bill.AlwaysOnTop = true
                local name = Instance.new('TextLabel',bill)
                name.Font = Enum.Font.GothamSemibold
                name.FontSize = "Size14"
                name.TextWrapped = true
                name.Size = UDim2.new(1,0,1,0)
                name.TextYAlignment = 'Top'
                name.BackgroundTransparency = 1
                name.TextStrokeTransparency = 0.5
                name.TextColor3 = Color3.fromRGB(251, 255, 0)
                name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            else
                v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            end
        else
            if v.Handle:FindFirstChild('NameEsp'..Number) then
                v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
            end
        end 
    end
end
end

function UpdateIslandESP() 
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        pcall(function()
            if IslandESP then 
                if v.Name ~= "Sea" then
                    if not v:FindFirstChild('NameEsp') then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = "GothamBold"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(7, 236, 240)
                    else
                        v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                    end
                end
            else
                if v:FindFirstChild('NameEsp') then
                    v:FindFirstChild('NameEsp'):Destroy()
                end
            end
        end)
    end
end

function isnil(thing)
return (thing == nil)
end
local function round(n)
return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)
function UpdatePlayerChams()
for i,v in pairs(game:GetService'Players':GetChildren()) do
    pcall(function()
        if not isnil(v.Character) then
            if ESPPlayer then
                if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('NameEsp'..Number) then
                    local bill = Instance.new('BillboardGui',v.Character.Head)
                    bill.Name = 'NameEsp'..Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v.Character.Head
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' Distance')
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    if v.Team == game.Players.LocalPlayer.Team then
                        name.TextColor3 = Color3.new(0,255,0)
                    else
                        name.TextColor3 = Color3.new(255,0,0)
                    end
                else
                    v.Character.Head['NameEsp'..Number].TextLabel.Text = (v.Name ..' | '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' Distance\nHealth : ' .. round(v.Character.Humanoid.Health*100/v.Character.Humanoid.MaxHealth) .. '%')
                end
            else
                if v.Character.Head:FindFirstChild('NameEsp'..Number) then
                    v.Character.Head:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end
        end
    end)
end
end
function UpdateChestChams() 
for i,v in pairs(game.Workspace:GetChildren()) do
    pcall(function()
        if string.find(v.Name,"Chest") then
            if ChestESP then
                if string.find(v.Name,"Chest") then
                    if not v:FindFirstChild('NameEsp'..Number) then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'..Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = Enum.Font.GothamSemibold
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        if v.Name == "Chest1" then
                            name.TextColor3 = Color3.fromRGB(109, 109, 109)
                            name.Text = ("Chest 1" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        end
                        if v.Name == "Chest2" then
                            name.TextColor3 = Color3.fromRGB(173, 158, 21)
                            name.Text = ("Chest 2" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        end
                        if v.Name == "Chest3" then
                            name.TextColor3 = Color3.fromRGB(85, 255, 255)
                            name.Text = ("Chest 3" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        end
                    else
                        v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                    end
                end
            else
                if v:FindFirstChild('NameEsp'..Number) then
                    v:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end
        end
    end)
end
end
function UpdateDevilChams() 
for i,v in pairs(game.Workspace:GetChildren()) do
    pcall(function()
        if DevilFruitESP then
            if string.find(v.Name, "Fruit") then   
                if not v.Handle:FindFirstChild('NameEsp'..Number) then
                    local bill = Instance.new('BillboardGui',v.Handle)
                    bill.Name = 'NameEsp'..Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v.Handle
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(255, 255, 255)
                    name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
                else
                    v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
                end
            end
        else
            if v.Handle:FindFirstChild('NameEsp'..Number) then
                v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
            end
        end
    end)
end
end
function UpdateFlowerChams() 
for i,v in pairs(game.Workspace:GetChildren()) do
    pcall(function()
        if v.Name == "Flower2" or v.Name == "Flower1" then
            if FlowerESP then 
                if not v:FindFirstChild('NameEsp'..Number) then
                    local bill = Instance.new('BillboardGui',v)
                    bill.Name = 'NameEsp'..Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(255, 0, 0)
                    if v.Name == "Flower1" then 
                        name.Text = ("Blue Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        name.TextColor3 = Color3.fromRGB(0, 0, 255)
                    end
                    if v.Name == "Flower2" then
                        name.Text = ("Red Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        name.TextColor3 = Color3.fromRGB(255, 0, 0)
                    end
                else
                    v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                end
            else
                if v:FindFirstChild('NameEsp'..Number) then
                v:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end
        end   
    end)
end
end
function UpdateRealFruitChams() 
for i,v in pairs(game.Workspace.AppleSpawner:GetChildren()) do
    if v:IsA("Tool") then
        if RealFruitESP then 
            if not v.Handle:FindFirstChild('NameEsp'..Number) then
                local bill = Instance.new('BillboardGui',v.Handle)
                bill.Name = 'NameEsp'..Number
                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                bill.Size = UDim2.new(1,200,1,30)
                bill.Adornee = v.Handle
                bill.AlwaysOnTop = true
                local name = Instance.new('TextLabel',bill)
                name.Font = Enum.Font.GothamSemibold
                name.FontSize = "Size14"
                name.TextWrapped = true
                name.Size = UDim2.new(1,0,1,0)
                name.TextYAlignment = 'Top'
                name.BackgroundTransparency = 1
                name.TextStrokeTransparency = 0.5
                name.TextColor3 = Color3.fromRGB(255, 0, 0)
                name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            else
                v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            end
        else
            if v.Handle:FindFirstChild('NameEsp'..Number) then
                v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
            end
        end 
    end
end
for i,v in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
    if v:IsA("Tool") then
        if RealFruitESP then 
            if not v.Handle:FindFirstChild('NameEsp'..Number) then
                local bill = Instance.new('BillboardGui',v.Handle)
                bill.Name = 'NameEsp'..Number
                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                bill.Size = UDim2.new(1,200,1,30)
                bill.Adornee = v.Handle
                bill.AlwaysOnTop = true
                local name = Instance.new('TextLabel',bill)
                name.Font = Enum.Font.GothamSemibold
                name.FontSize = "Size14"
                name.TextWrapped = true
                name.Size = UDim2.new(1,0,1,0)
                name.TextYAlignment = 'Top'
                name.BackgroundTransparency = 1
                name.TextStrokeTransparency = 0.5
                name.TextColor3 = Color3.fromRGB(255, 174, 0)
                name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            else
                v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            end
        else
            if v.Handle:FindFirstChild('NameEsp'..Number) then
                v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
            end
        end 
    end
end
for i,v in pairs(game.Workspace.BananaSpawner:GetChildren()) do
    if v:IsA("Tool") then
        if RealFruitESP then 
            if not v.Handle:FindFirstChild('NameEsp'..Number) then
                local bill = Instance.new('BillboardGui',v.Handle)
                bill.Name = 'NameEsp'..Number
                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                bill.Size = UDim2.new(1,200,1,30)
                bill.Adornee = v.Handle
                bill.AlwaysOnTop = true
                local name = Instance.new('TextLabel',bill)
                name.Font = Enum.Font.GothamSemibold
                name.FontSize = "Size14"
                name.TextWrapped = true
                name.Size = UDim2.new(1,0,1,0)
                name.TextYAlignment = 'Top'
                name.BackgroundTransparency = 1
                name.TextStrokeTransparency = 0.5
                name.TextColor3 = Color3.fromRGB(251, 255, 0)
                name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            else
                v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            end
        else
            if v.Handle:FindFirstChild('NameEsp'..Number) then
                v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
            end
        end 
    end
end
end

function isnil(thing)
return (thing == nil)
end
local function round(n)
return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)

function UpdateIslandMirageESP() 
for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
    pcall(function()
        if MirageIslandESP then 
            if v.Name == "Mirage Island" then
                if not v:FindFirstChild('NameEsp') then
                    local bill = Instance.new('BillboardGui',v)
                    bill.Name = 'NameEsp'
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = "Code"
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(80, 245, 245)
                else
                    v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                end
            end
        else
            if v:FindFirstChild('NameEsp') then
                v:FindFirstChild('NameEsp'):Destroy()
            end
        end
    end)
end
end

function isnil(thing)
return (thing == nil)
end
local function round(n)
return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)

function UpdateAfdESP() 
for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
    pcall(function()
        if AfdESP then 
            if v.Name == "Advanced Fruit Dealer" then
                if not v:FindFirstChild('NameEsp') then
                    local bill = Instance.new('BillboardGui',v)
                    bill.Name = 'NameEsp'
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = "Code"
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(80, 245, 245)
                else
                    v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                end
            end
        else
            if v:FindFirstChild('NameEsp') then
                v:FindFirstChild('NameEsp'):Destroy()
            end
        end
    end)
end
end

function UpdateAuraESP() 
for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
    pcall(function()
        if AuraESP then 
            if v.Name == "Master of Enhancement" then
                if not v:FindFirstChild('NameEsp') then
                    local bill = Instance.new('BillboardGui',v)
                    bill.Name = 'NameEsp'
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = "Code"
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(80, 245, 245)
                else
                    v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                end
            end
        else
            if v:FindFirstChild('NameEsp') then
                v:FindFirstChild('NameEsp'):Destroy()
            end
        end
    end)
end
end

function UpdateLSDESP() 
for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
    pcall(function()
        if LADESP then 
            if v.Name == "Legendary Sword Dealer" then
                if not v:FindFirstChild('NameEsp') then
                    local bill = Instance.new('BillboardGui',v)
                    bill.Name = 'NameEsp'
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = "Code"
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(80, 245, 245)
                else
                    v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                end
            end
        else
            if v:FindFirstChild('NameEsp') then
                v:FindFirstChild('NameEsp'):Destroy()
            end
        end
    end)
end
end

function UpdateGeaESP() 
for i,v in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do 
    pcall(function()
        if GearESP then 
            if v.Name == "MeshPart" then
                if not v:FindFirstChild('NameEsp') then
                    local bill = Instance.new('BillboardGui',v)
                    bill.Name = 'NameEsp'
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = "Code"
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(80, 245, 245)
                else
                    v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                end
            end
        else
            if v:FindFirstChild('NameEsp') then
                v:FindFirstChild('NameEsp'):Destroy()
            end
        end
    end)
end
end



function InfAb()
    if InfAbility then
        if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
            local inf = Instance.new("ParticleEmitter")
            inf.Acceleration = Vector3.new(0,0,0)
            inf.Archivable = true
            inf.Drag = 20
            inf.EmissionDirection = Enum.NormalId.Top
            inf.Enabled = true
            inf.Lifetime = NumberRange.new(0,0)
            inf.LightInfluence = 0
            inf.LockedToPart = true
            inf.Name = "Agility"
            inf.Rate = 500
            local numberKeypoints2 = {
                NumberSequenceKeypoint.new(0, 0);
                NumberSequenceKeypoint.new(1, 4); 
            }
            inf.Size = NumberSequence.new(numberKeypoints2)
            inf.RotSpeed = NumberRange.new(9999, 99999)
            inf.Rotation = NumberRange.new(0, 0)
            inf.Speed = NumberRange.new(30, 30)
            inf.SpreadAngle = Vector2.new(0,0,0,0)
            inf.Texture = ""
            inf.VelocityInheritance = 0
            inf.ZOffset = 2
            inf.Transparency = NumberSequence.new(0)
            inf.Color = ColorSequence.new(Color3.fromRGB(0,0,0),Color3.fromRGB(0,0,0))
            inf.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        end
    else
        if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
        end
    end
end


      function UpdateIslandKisuneESP() 
        for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            pcall(function()
                if KitsuneIslandEsp then 
                    if v.Name == "Kitsune Island" then
                        if not v:FindFirstChild('NameEsp') then
                            local bill = Instance.new('BillboardGui',v)
                            bill.Name = 'NameEsp'
                            bill.ExtentsOffset = Vector3.new(0, 1, 0)
                            bill.Size = UDim2.new(1,200,1,30)
                            bill.Adornee = v
                            bill.AlwaysOnTop = true
                            local name = Instance.new('TextLabel',bill)
                            name.Font = "Code"
                            name.FontSize = "Size14"
                            name.TextWrapped = true
                            name.Size = UDim2.new(1,0,1,0)
                            name.TextYAlignment = 'Top'
                            name.BackgroundTransparency = 1
                            name.TextStrokeTransparency = 0.5
                            name.TextColor3 = Color3.fromRGB(80, 245, 245)
                        else
                            v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                        end
                    end
                else
                    if v:FindFirstChild('NameEsp') then
                        v:FindFirstChild('NameEsp'):Destroy()
                    end
                end
            end)
        end
    end

    function Hop()
        local PlaceID = game.PlaceId
        local AllIDs = {}
        local foundAnything = ""
        local actualHour = os.date("!*t").hour
        local Deleted = false
        function TPReturner()
            local Site;
            if foundAnything == "" then
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
            else
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
            end
            local ID = ""
            if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                foundAnything = Site.nextPageCursor
            end
            local num = 0;
            for i,v in pairs(Site.data) do
                local Possible = true
                ID = tostring(v.id)
                if tonumber(v.maxPlayers) > tonumber(v.playing) then
                    for _,Existing in pairs(AllIDs) do
                        if num ~= 0 then
                            if ID == tostring(Existing) then
                                Possible = false
                            end
                        else
                            if tonumber(actualHour) ~= tonumber(Existing) then
                                local delFile = pcall(function()
                                    AllIDs = {}
                                    table.insert(AllIDs, actualHour)
                                end)
                            end
                        end
                        num = num + 1
                    end
                    if Possible == true then
                        table.insert(AllIDs, ID)
                        wait()
                        pcall(function()
                            wait()
                            game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                        end)
                        wait(4)
                    end
                end
            end
        end
        function Teleport() 
            while wait() do
                pcall(function()
                    TPReturner()
                    if foundAnything ~= "" then
                        TPReturner()
                    end
                end)
            end
        end
        Teleport()
    end       
--//Sea
function CheckPirateBoat()
    local checkmmpb = {"PirateGrandBrigade", "PirateBrigade"}
    for r, v in next, game:GetService("Workspace").Enemies:GetChildren() do
        if table.find(checkmmpb, v.Name) and v:FindFirstChild("Health") and v.Health.Value > 0 then
            return v
        end
    end
end

function CheckPirateBoat()
    local checkmmpb = {"FishBoat"}
    for r, v in next, game:GetService("Workspace").Enemies:GetChildren() do
        if table.find(checkmmpb, v.Name) and v:FindFirstChild("Health") and v.Health.Value > 0 then
            return v
        end
    end
end

function EquipAllWeapon()
	pcall(function()
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v:IsA('Tool') and not (v.Name == "Summon Sea Beast" or v.Name == "Water Body" or v.Name == "Awakening") then
				local ToolHumanoid = game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name) 
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(ToolHumanoid) 
                wait(1)
			end
		end
	end)
end

function TPP(CFgo)
	if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health <= 0 or not game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") then tween:Cancel() repeat wait() until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") and game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 wait(7) return end
	local tween_s = game:service"TweenService"
	local info = TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude/TweenSpeed, Enum.EasingStyle.Linear)
	tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = CFgo})
	tween:Play()

	local tweenfunc = {}

	function tweenfunc:Stop()
		tween:Cancel()
	end

	return tweenfunc
end
    
    function AutoHaki()
        if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
        end
    end
    
    function UnEquipWeapon(Weapon)
        if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) then
            _G.NotAutoEquip = true
            wait(.5)
            game.Players.LocalPlayer.Character:FindFirstChild(Weapon).Parent = game.Players.LocalPlayer.Backpack
            wait(.1)
            _G.NotAutoEquip = false
        end
    end

function EquipWeapon(ToolSe)
	if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
		local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
		wait(.4)
		game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
	end
end    
    
    function EquipWeapon(ToolSe)
        if not _G.NotAutoEquip then
            if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
                Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
                wait(.1)
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
            end
        end
    end
  
    function GetDistance(target)
        return math.floor((target.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)
    end
    
    function BTP(p)
    	pcall(function()
	    	if (p.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 1500 and not Auto_Raid and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
				repeat wait()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
					wait(0.5)
					game.Players.LocalPlayer.Character.Head:Destroy()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
				until (p.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 1500 and game.Players.LocalPlayer.Character.Humanoid.Health > 0
			end
		end)
	end
    function TP(Pos)
        Distance = (Pos.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if Distance < 300 then
            Speed = 300
        elseif Distance >= 1000 then
            Speed = 300
        end
        game:GetService("TweenService"):Create(
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
            {CFrame = Pos}
        ):Play()
        _G.Clip = true
        wait(Distance/Speed)
        _G.Clip = false
    end

function MinhDepZai(Pos)
        Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if game.Players.LocalPlayer.Character.Humanoid.Sit == true then game.Players.LocalPlayer.Character.Humanoid.Sit = false end
        pcall(function() tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/315, Enum.EasingStyle.Linear),{CFrame = Pos}) end)
        tween:Play()
        if Distance <= 200 then
            tween:Cancel()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
        end
        if _G.StopTween == true then
            tween:Cancel()
            _G.Clip = false
        end
    end

    function CheckNearestTeleporter(aI)
        local MyLevel = game.Players.LocalPlayer.Data.Level.Value
        vcspos = aI.Position
        min = math.huge
        min2 = math.huge
        local y = game.PlaceId
        if y == 2753915549 then
            OldWorld = true
        elseif y == 4442272183 then
            NewWorld = true
        elseif y == 7449423635 then
            ThreeWorld = true
        end
        if World3 then
            TableLocations = {
                ["Caslte On The Sea"] = Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125),
                ["Hydra"] = Vector3.new(5756.83740234375, 610.4240112304688, -253.9253692626953),
                ["Mansion"] = Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125),
                ["Great Tree"] = Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586),
                ["Ngu1"] = Vector3.new(-11993.580078125, 334.7812805175781, -8844.1826171875),
                ["ngu2"] = Vector3.new(5314.58203125, 25.419387817382812, -125.94227600097656)
            }
        elseif World2 then
            TableLocations = {
                ["Mansion"] = Vector3.new(-288.46246337890625, 306.130615234375, 597.9988403320312),
                ["Flamingo"] = Vector3.new(2284.912109375, 15.152046203613281, 905.48291015625),
                ["122"] = Vector3.new(923.21252441406, 126.9760055542, 32852.83203125),
                ["3032"] = Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)
            }
        elseif World1 then
            TableLocations = {
                ["1"] = Vector3.new(-7894.6201171875, 5545.49169921875, -380.2467346191406),
                ["2"] = Vector3.new(-4607.82275390625, 872.5422973632812, -1667.556884765625),
                ["3"] = Vector3.new(61163.8515625, 11.759522438049316, 1819.7841796875),
                ["4"] = Vector3.new(3876.280517578125, 35.10614013671875, -1939.3201904296875)
            }
        end
        TableLocations2 = {}
        for r, v in pairs(TableLocations) do
            TableLocations2[r] = (v - vcspos).Magnitude
        end
        for r, v in pairs(TableLocations2) do
            if v < min then
                min = v
                min2 = v
            end
        end
        for r, v in pairs(TableLocations2) do
            if v < min then
                min = v
                min2 = v
            end
        end
        for r, v in pairs(TableLocations2) do
            if v <= min then
                choose = TableLocations[r]
            end
        end
        min3 = (vcspos - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if min2 <= min3 then
            return choose
        end
    end
    
    function requestEntrance(aJ)
        args = {"requestEntrance", aJ}
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
        oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        char = game.Players.LocalPlayer.Character.HumanoidRootPart
        char.CFrame = CFrame.new(oldcframe.X, oldcframe.Y + 50, oldcframe.Z)
        task.wait(0.5)
    end
    
    function AntiLowHealth(aK)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
            aK,
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
        )
        wait()
    end
    TweenSpeed = 300
    function topos(aL)
        pcall(function()
                if game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and  game:GetService("Players").LocalPlayer.Character.Humanoid.Health > 0 and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart then
                    if not TweenSpeed then
                        TweenSpeed = 300
                    end
                    DefualtY = aL.Y
                    TargetY = aL.Y
                    targetCFrameWithDefualtY = CFrame.new(aL.X, DefualtY, aL.Z)
                    targetPos = aL.Position
                    oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    Distance = (targetPos - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude
                    if Distance <= 300 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = aL
                    end
                    local aM = CheckNearestTeleporter(aL)
                    if aM then
                        pcall(function()
                                tween:Cancel()
                            end)
                        requestEntrance(aM)
                    end
                    b1 = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,DefualtY,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
                    if IngoreY and (b1.Position - targetCFrameWithDefualtY.Position).Magnitude > 5 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,DefualtY,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
                        local tweenfunc = {}
                        local aN = game:service "TweenService"
                        local aO =
                            TweenInfo.new((targetPos -game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude /TweenSpeed,Enum.EasingStyle.Linear)
                        tween = aN:Create(game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"],aO,{CFrame = targetCFrameWithDefualtY})
                        tween:Play()
                        function tweenfunc:Stop()
                            tween:Cancel()
                        end
                        tween.Completed:Wait()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,TargetY,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
                    else
                        local tweenfunc = {}
                        local aN = game:service "TweenService"
                        local aO =
                            TweenInfo.new((targetPos -game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude /TweenSpeed,Enum.EasingStyle.Linear)
                        tween = aN:Create(game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"],aO,{CFrame = aL})
                        tween:Play()
                        function tweenfunc:Stop()
                            tween:Cancel()
                        end
                        tween.Completed:Wait()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,TargetY,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
                    end
                    if not tween then
                        return tween
                    end
                    return tweenfunc
                end
            end
        )
    end
IngoreY = true
Type = 1
spawn(function()
    while wait(.1) do
		if Type == 1 then
			Pos = CFrame.new(0,PosY,-30)
		elseif Type == 2 then
			Pos = CFrame.new(30,PosY,0)
		elseif Type == 3 then
			Pos = CFrame.new(0,PosY,30)	
		elseif Type == 4 then
			Pos = CFrame.new(-30,PosY,0)
        end
        end
    end)

spawn(function()
    while wait(0.5) do
        Type = 1
        wait(0.4)
        Type = 2
        wait(0.3)
        Type = 3
        wait(0.4)
        Type = 4
        wait(0.2)
        Type = 5
        wait(0.3)
    end
end)

spawn(function()
    while wait(.1) do
        Frame = 1
        wait(0.4)
        Frame = 2
        wait(0.4)
        Frame = 3
        wait(0.3)
        Frame = 4
        wait(0.4)
        Frame = 5
        wait(0.3)
    end
end)

Type = 1
spawn(function()
    while wait(.1) do
        if Frame == 1 then
            Check = CFrame.new(0,50,0)
		elseif F == 2 then
			Check = CFrame.new(0,0,-100)
		elseif F == 3 then
			Check = CFrame.new(100,0,0)
		elseif F == 4 then
			Check = CFrame.new(0,0,100)	
		elseif F == 5 then
			Check = CFrame.new(-100,0,0)
		elseif F == 6 then
			Check = CFrame.new(0,50,0)
        end
        end
    end)

spawn(function()
    while wait(.1) do
        F = 1
        wait(0.5)
        F = 2
        wait(0.5)
        F = 3
        wait(0.5)
        F = 4
        wait(0.5)
        F = 5
        wait(0.5)
    end
end)

--Tween Boats 
function TPB(CFgo)
local tween_s = game:service"TweenService"
local info = TweenInfo.new((game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame.Position - CFgo.Position).Magnitude/300, Enum.EasingStyle.Linear)
tween = tween_s:Create(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat, info, {CFrame = CFgo})
tween:Play()

local tweenfunc = {}

function tweenfunc:Stop()
    tween:Cancel()
end

return tweenfunc
end

function TPP(CFgo)
	if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health <= 0 or not game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") then tween:Cancel() repeat wait() until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") and game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 wait(7) return end
	local tween_s = game:service"TweenService"
	local info = TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude/325, Enum.EasingStyle.Linear)
	tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = CFgo})
	tween:Play()

	local tweenfunc = {}

	function tweenfunc:Stop()
		tween:Cancel()
	end

	return tweenfunc
end

function EquipWeaponSword()
	pcall(function()
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v.ToolTip == "Sword" and v:IsA('Tool') then
				local ToolHumanoid = game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name) 
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(ToolHumanoid) 
			end
		end
	end)
end

getgenv().ToTargets = function(p)
    task.spawn(function()
        pcall(function()
            if game:GetService("Players").LocalPlayer:DistanceFromCharacter(p.Position) <= 250 then 
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = p
            elseif not game.Players.LocalPlayer.Character:FindFirstChild("Root")then 
                local K = Instance.new("Part",game.Players.LocalPlayer.Character)
                K.Size = Vector3.new(1,0.5,1)
                K.Name = "Root"
                K.Anchored = true
                K.Transparency = 1
                K.CanCollide = false
                K.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,20,0)
            end
            local U = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude
            local z = game:service("TweenService")
            local B = TweenInfo.new((p.Position-game.Players.LocalPlayer.Character.Root.Position).Magnitude/300,Enum.EasingStyle.Linear)
            local S,g = pcall(function()
            local q = z:Create(game.Players.LocalPlayer.Character.Root,B,{CFrame = p})
            q:Play()
        end)
        if not S then 
            return g
        end
        game.Players.LocalPlayer.Character.Root.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            if S and game.Players.LocalPlayer.Character:FindFirstChild("Root") then 
                pcall(function()
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude >= 20 then 
                        spawn(function()
                            pcall(function()
                                if (game.Players.LocalPlayer.Character.Root.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 150 then 
                                    game.Players.LocalPlayer.Character.Root.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                                else 
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game.Players.LocalPlayer.Character.Root.CFrame
                                end
                            end)
                        end)
                    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude >= 10 and(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude < 20 then 
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
                    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude < 10 then 
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
                    end
                end)
            end
	    end)
    end)
    end

    spawn(function()
        pcall(function()
            while wait() do
                if _G.Auto_Bone or _G.AutoKata or _G.AutoLevel2 or _G.AutoFarmNearest or _G.AutoBoss or _G.Farmfast or _G.Tweenfruit or _G.Auto_Dungeon or _G.Kill_V4 or _G.killnoskill or _G.AutoQuestRace or _G.RaDaoKhi or _G.Luom_Gear or _G.DaoBiLon or _G.AutoSecondSea or _G.Auto_EvoRace or _G.Auto_Dragon_Trident or _G.Auto_Kill_Ply or _G.Teleport or _G.Eli_Ngu or _G.Chuate_Bac_Giang or _G.AutoCarvender or _G.Di_nghia_vu_quan_su or _G.AutoEctoplasm or _G.Kiem_Lua or Auto_Ki_Di or _G.AutoPole or _G.AutoPlayerHunter or _G.AutoMaterial or _G.Auto_Saber or _G.TweenToKitsune or _G.Auto_Nha_Dien or _G.TeleportNPC or _G.AutoDarkDagger or _G.ChonHaki or _G.RaidPirate or _G.AutoObservation or _G.AutoHakiV2 or _G.CollectAzure or _G.CitizenQuest or _G.TeleportIsland or _G.TeleportPly or _G.LionAutoDriveBoat or _G.FarmBoneAcient or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.AutoSwordMastery or _G.AutoCame or _G.autoLawRaid or _G.Auto_Seabest or _G.AutoTerrorshark or FarmShark or _G.farmpiranya or _G.Fish_Crew_Member or _G.KillGhostShip or _G.bjirFishBoat or _G.AutoSeaBest or _G.TweenFro or Grab_Chest or Grab_Chest2 or _G.AutoFarmBoss == true then
                    if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                        local Noclip = Instance.new("BodyVelocity")
                        Noclip.Name = "BodyClip"
                        Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                        Noclip.MaxForce = Vector3.new(100000,100000,100000)
                        Noclip.Velocity = Vector3.new(0,0,0)
                    end
                end
            end
        end)
    end)
  
    spawn(function()
        pcall(function()
            game:GetService("RunService").Stepped:Connect(function()
                if _G.Auto_Bone or _G.AutoKata or _G.AutoLevel2 or _G.AutoBoss or _G.Farmfast or _G.Tweenfruit or _G.Auto_Dungeon or _G.Kill_V4 or _G.killnoskill or _G.AutoQuestRace or _G.RaDaoKhi or _G.Luom_Gear or _G.DaoBiLon or _G.AutoSecondSea or _G.Auto_EvoRace or _G.Auto_Dragon_Trident or _G.BayDao or _G.Eli_Ngu or _G.Chuate_Bac_Giang or _G.AutoCarvender or _G.Di_nghia_vu_quan_su or _G.AutoEctoplasm or _G.Kiem_Lua or Auto_Ki_Di or _G.Khi_Dot_Len_Dien or _G.AutoPlayerHunter or _G.FarmBoneAcient or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.AutoSwordMastery or _G.TweenToKitsune or _G.Auto_Nha_Dien or _G.AutoMaterial or _G.TeleportNPC or _G.AutoDarkDagger or _G.ChonHaki or _G.RaidPirate or _G.AutoObservation or _G.AutoHakiV2 or _G.CollectAzure or _G.CitizenQuest or _G.TeleportIsland or _G.TeleportPly or _G.CacRace or _G.LionAutoDriveBoat or _G.LionAutoDriveBoat2 or _G.AutoTerrorshark or FarmShark or _G.farmpiranya or _G.Fish_Crew_Member or _G.KillGhostShip or _G.bjirFishBoat or _G.AutoSeaBest or _G.autoLawRaid or _G.Auto_Seabest or _G.KillThuyendan or _G.Buoi == true then
                    for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false    
                        end
                    end
                end
            end)
        end)
    end)   
    
function Click()
        if not _G.FastAttack then
            local Module = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework)
            local CombatFramework = debug.getupvalues(Module)[2]
            local CaMobNamehake = require(game.ReplicatedStorage.Util.CameraShaker)
            CaMobNamehake:Stop()
            CombatFramework.activeController.attacking = false
            CombatFramework.activeController.timeToNextAttack = 0
            CombatFramework.activeController.hitboxMagnitude = 180
            game:GetService 'VirtualUser':CaptureController()
            game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672))
        end
    end
    
spawn(function()
        while wait() do
            if _G.AutoObservation or _G.Auto_Bone or _G.Kill_V4 or _G.killnoskill or _G.Auto_Kill_Ply == true then
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken",true)
                end)
            end    
        end
    end)    
    
    function InstancePos(pos)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
    end    
   spawn(function()
        pcall(function()
            while wait() do
                for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do  
                    if v:IsA("Tool") then
                        if v:FindFirstChild("RemoteFunctionShoot") then 
                            SelectWeaponGun = v.Name
                        end
                    end
                end
            end
        end)
    end)
    
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end) 

local PlayerName = game.Players.LocalPlayer.DisplayName
require(game.ReplicatedStorage.Notification).new("<Color=Blue>" ..PlayerName.. "<Color=/>"):Display()


--//Code
setfpscap(60)
--//macdinh
local MinhDepZai = CFrame.new(-9506.234375, 172.130615234375, 6117.0771484375)
local CakePos = CFrame.new(-1978.45715, 251.535294, -12395.2979)
local JackBoCon = CFrame.new(-7748.0185546875, 5606.80615234375, -2305.898681640625)
local Domdom = CFrame.new(-5344.822265625, 423.98541259766, -2725.0930175781)
local LongMa = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)
local MuaTh = CFrame.new(-16927.451171875, 9.0863618850708, 433.8642883300781)

local realbhit = require(game.ReplicatedStorage.CombatFramework.RigLib)
local cooldownfastattack = tick()
local plr = game.Players.LocalPlayer

local Players = game:GetService("Players")
local playerCount = #game:GetService("Players"):GetPlayers()

local placeId = game.PlaceId
local jobId = game.JobId

local CheckLuOcCho = #game:GetService("Players"):GetPlayers()

_G.BringMode = 300
PosY = 45
AutoHaki()

spawn(function()
	function MinhDepZai()
		game:GetService("VirtualUser"):CaptureController()
		game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
	end
end)

function StopTween(target)
        if not target then
        _G.StopTween = true
        wait()
        topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
        if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
        end
        _G.StopTween = false
        _G.Clip = false
        end
        end

function GetDistance(q)
    if type(q) == "instance" then
        if Instance:IsA("BasePart") or Instance:IsA("Part") then
            return (q.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        elseif Instance:FindFirstChild("HumanoidRootPart") then
            return (q.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        else
            for r, v in pairs(q:GetDescendants()) do
                if v:IsA("BasePart") or v:IsA("Part") then
                    return (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                end
            end
        end
    else
        return (q - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    end
end

function InMyNetWork(object)
	if isnetworkowner then
		return isnetworkowner(object)
	else
		if (object.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode then 
			return true
		end
		return false
	end
end

--//Status User


local locallv = W:LabelP("Level")
    
    spawn(function()
        while wait() do
            pcall(function()
                locallv:Set("Level :".." "..game:GetService("Players").LocalPlayer.Data.Level.Value)
            end)
        end
    end)
    
    local localrace = W:LabelP("Race")
    
    spawn(function()
        while wait() do
            pcall(function()
                localrace:Set("Race :".." "..game:GetService("Players").LocalPlayer.Data.Race.Value)
            end)
        end
    end)
    
    local Race_S = W:LabelP("Version Race")
    
    local localbeli = W:LabelP("Beli")
    
    spawn(function()
        while wait() do
            pcall(function()
                localbeli:Set("Beli :".." "..game:GetService("Players").LocalPlayer.Data.Beli.Value)
            end)
        end
    end)
    
    local localfrag = W:LabelP("Fragment")
    
    spawn(function()
        while wait() do
            pcall(function()
                localfrag:Set("Fragments :".." "..game:GetService("Players").LocalPlayer.Data.Fragments.Value)
            end)
        end
    end)
    
    
    local localexp = W:LabelP("ExP")
    
    spawn(function()
        while wait() do
            pcall(function()
                localexp:Set("ExP Points :".." "..game:GetService("Players").LocalPlayer.Data.Exp.Value)
            end)
        end
    end)
    
    local localstat = W:LabelP("Stats Points")
    
    spawn(function()
        while wait() do
            pcall(function()
                localstat:Set("Stats Points :".." "..game:GetService("Players").LocalPlayer.Data.Points.Value)
            end)
        end
    end)
    
    local localbountyhornor = W:LabelP("Bounty")
    
    spawn(function()
        while wait() do
            pcall(function()
                localbountyhornor:Set("Bounty / Honor :".." "..game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value)
            end)
        end
    end)
    
    local localDevil = W:LabelP("Devil Fruit")
    
    spawn(function()
        while wait() do
            pcall(function()
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
                    localDevil:Set("Devil Fruit :".." "..game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)
                else
                    localDevil:Set("Not Have Devil Fruit")
                end
            end)
        end
    end)

W:Label("Tuy tui k bt bạn là ai nhưng chúc bạn 1 ngày tốt lành nhé🥰🥰")

---------------SettingTab
Main:Button("Copy Server Lion Hub",function()
	setclipboard("https://discord.gg/lion-hub")
	end)
---------------TabStatus
  Katakurista = Sta:LabelP("Status Katakuri")

spawn(
function()
	while wait() do
		pcall(  
		function()
			if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88 then
				Katakurista:Set("Kill : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,41).."")
			elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87 then
				Katakurista:Set("Kill : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,40).."")
			elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
				Katakurista:Set("Kill : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,39).." ")
			else
				Katakurista:Set("[ 👾 ] Katakuri Boss Spawn")
			end
		end
		)
	end
end
)
 
 Elite = Sta:LabelP("Elite Status")

spawn(
        function()
    while wait() do
        spawn(
                function()
            if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") 
            or game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") 
            or game:GetService("ReplicatedStorage"):FindFirstChild("Urban") 
            or game:GetService("Workspace").Enemies:FindFirstChild("Diablo") 
            or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") 
            or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
                Elite:Set("[ 👷 ] Elite Boss Spawn")	
            else
                Elite:Set("Elite: Not Found")	
            end
        end
        )
    end
end
)

  Mirage = Sta:LabelP("Mirage Island")

 function updateMirageStatus()
    local mirageIsland = game.Workspace._WorldOrigin.Locations:FindFirstChild('Mirage Island')
    if mirageIsland then
        Mirage:Set('[ 🏝 ] Mirage Island Spawn')
    else
        Mirage:Set('Mirage: Not Found')
    end
end

spawn(function()
    while wait(1) do
        pcall(updateMirageStatus)
    end
end
)

 Kitsune = Sta:LabelP("Sta Kitsune Island") 
    
    spawn(function()
        pcall(function()
            while wait() do
    if game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") then
    Kitsune:Set('🌱: Spawn')
    else
      Kitsune:Set('🎃: Not Spawn')
            end
               end
        end)
end)

local FrozenIsland = Sta:LabelP("Status Frozen")

spawn(function()
    pcall(function()
        while wait() do
            if game.Workspace._WorldOrigin.Locations:FindFirstChild('Frozen Dimension') then
                FrozenIsland:Set('🟢: Frozen Dimension Spawning')
            else
                FrozenIsland:Set('🔴: Frozen Dimension Not Found')
            end
        end
    end)
end)

local FullMoon = Sta:LabelP("Full Moon")

task.spawn(function()
    while task.wait() do
        pcall(function()
            if game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149431" then
                FullMoon:Set("[ 🌕 ] Full Moon 100%")
            elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149052" then
                FullMoon:Set("[ 🌖 ]  Full Moon 75%")
            elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709143733" then
                FullMoon:Set("[ 🌗 ] Full Moon 50%")
            elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709150401" then
                FullMoon:Set("[ 🌘 ] Full Moon 25%")
            elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149680" then
                FullMoon:Set("[ 🌘 ] Full Moon 15%")
            else
                FullMoon:Set("Wait For Moon")
            end
        end)
    end
end)
    
Sta:Toggle("Auto Stats Defense", false, function(value)
        _G.Auto_Stats_Defense = value
        Update_Setting(getgenv()['MyName'])
    end)    

Sta:Toggle("Auto Stats Melee", false, function(value)
        _G.Auto_Stats_Melee = value
        Update_Setting(getgenv()['MyName'])
    end)
    
Sta:Toggle("Auto Stats Sword", false, function(value)
        _G.Auto_Stats_Sword = value
        Update_Setting(getgenv()['MyName'])
    end)
    
Sta:Toggle("Auto Stats Gun", false, function(value)
        _G.Auto_Stats_Gun = value
        Update_Setting(getgenv()['MyName'])
    end)
    
Sta:Toggle("Auto Stats Devil Fruit", false, function(value)
        _G.Auto_Stats_Devil_Fruit = value
        Update_Setting(getgenv()['MyName'])
    end)
    
spawn(function()
	while wait() do
		if game.Players.localPlayer.Data.Points.Value <= PointStats then
			if melee then
				local args = {
					[1] = "AddPoint",
					[2] = "Melee",
					[3] = PointStats
				};
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer(unpack(args));
			end;
			if defense then
				local args = {
					[1] = "AddPoint",
					[2] = "Defense",
					[3] = PointStats
				};
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer(unpack(args));
			end;
			if sword then
				local args = {
					[1] = "AddPoint",
					[2] = "Sword",
					[3] = PointStats
				};
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer(unpack(args));
			end;
			if gun then
				local args = {
					[1] = "AddPoint",
					[2] = "Gun",
					[3] = PointStats
				};
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer(unpack(args));
			end;
			if demonfruit then
				local args = {
					[1] = "AddPoint",
					[2] = "Demon Fruit",
					[3] = PointStats
				};
				(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer(unpack(args));
			end;
		end;
	end;
end);

spawn(function()
    while wait() do
        if _G.Auto_Stats_Devil_Fruit then
            local args = {
                [1] = "AddPoint",
                [2] = "Demon Fruit",
                [3] = 3
            }
                        
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)

spawn(function()
    while wait() do
        if _G.Auto_Stats_Gun then
            local args = {
                [1] = "AddPoint",
                [2] = "Gun",
                [3] = 3
            }
                        
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)


spawn(function()
    while wait() do
        if _G.Auto_Stats_Sword then
            local args = {
                [1] = "AddPoint",
                [2] = "Sword",
                [3] = 3
            }
                        
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)

spawn(function()
    while wait() do
        if _G.Auto_Stats_Defense then
            local args = {
                [1] = "AddPoint",
                [2] = "Defense",
                [3] = 3
            }
                        
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)


spawn(function()
    while wait() do
        if _G.Auto_Stats_Melee then
            local args = {
                [1] = "AddPoint",
                [2] = "Melee",
                [3] = 3
            }
                        
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)

--//setting Farm
if not LPH_OBFUSCATED then
	LPH_JIT_MAX = (function(...) return ... end)
	LPH_NO_VIRTUALIZE = (function(...) return ... end)
	LPH_NO_UPVALUES = (function(...) return ... end)
end

NoAttackAnimation = true
local DmgAttack = game:GetService("ReplicatedStorage").Assets.GUI:WaitForChild("DamageCounter")
local PC = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework.Particle)
local RL = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
local oldRL = RL.wrapAttackAnimationAsync
RL.wrapAttackAnimationAsync = function(a,b,c,d,func)
	if not NoAttackAnimation then
		return oldRL(a,b,c,60,func)
	end

	local Hits = {}
	local Client = game.Players.LocalPlayer
	local Characters = game:GetService("Workspace").Characters:GetChildren()
	for i,v in pairs(Characters) do
		local Human = v:FindFirstChildOfClass("Humanoid")
		if v.Name ~= game.Players.LocalPlayer.Name and Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < 65 then
			table.insert(Hits,Human.RootPart)
		end
	end
	local Enemies = game:GetService("Workspace").Enemies:GetChildren()
	for i,v in pairs(Enemies) do
		local Human = v:FindFirstChildOfClass("Humanoid")
		if Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < 65 then
			table.insert(Hits,Human.RootPart)
		end
	end
	a:Play(0.01,0.01,0.01)
	pcall(func,Hits)
end

getAllBladeHits = LPH_NO_VIRTUALIZE(function(Sizes)
	local Hits = {}
	local Client = game.Players.LocalPlayer
	local Enemies = game:GetService("Workspace").Enemies:GetChildren()
	for i,v in pairs(Enemies) do
		local Human = v:FindFirstChildOfClass("Humanoid")
		if Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < Sizes+5 then
			table.insert(Hits,Human.RootPart)
		end
	end
	return Hits
end)

getAllBladeHitsPlayers = LPH_NO_VIRTUALIZE(function(Sizes)
	local Hits = {}
	local Client = game.Players.LocalPlayer
	local Characters = game:GetService("Workspace").Characters:GetChildren()
	for i,v in pairs(Characters) do
		local Human = v:FindFirstChildOfClass("Humanoid")
		if v.Name ~= game.Players.LocalPlayer.Name and Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < Sizes+5 then
			table.insert(Hits,Human.RootPart)
		end
	end
	return Hits
end)

local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))
local CombatFrameworkR = getupvalues(CombatFramework)[2]
local RigEven = game:GetService("ReplicatedStorage").RigControllerEvent
local AttackAnim = Instance.new("Animation")
local AttackCoolDown = 0
local cooldowntickFire = 0
local MaxFire = 1000
local FireCooldown = 0.06
local FireL = 0
local bladehit = {}

CancelCoolDown = LPH_JIT_MAX(function()
	local ac = CombatFrameworkR.activeController
	if ac and ac.equipped then
		AttackCoolDown = tick() + (FireCooldown or 0.01) + ((FireL/MaxFire)*0.3)
		RigEven.FireServer(RigEven,"weaponChange",ac.currentWeaponModel.Name)
		FireL = FireL + 1
		fask.delay((FireCooldown or 0.01) + ((FireL+0.3/MaxFire)*0.3),function()
			FireL = FireL - 1
		end)
	end
end)

AttackFunction = LPH_JIT_MAX(function(typef)
	local ac = CombatFrameworkR.activeController
	if ac and ac.equipped then
		local bladehit = {}
		if typef == 1 then
			bladehit = getAllBladeHits(60)
		elseif typef == 2 then
			bladehit = getAllBladeHitsPlayers(65)
		else
			for i2,v2 in pairs(getAllBladeHits(55)) do
				table.insert(bladehit,v2)
			end
			for i3,v3 in pairs(getAllBladeHitsPlayers(55)) do
				table.insert(bladehit,v3)
			end
		end
		if #bladehit > 0 then
			pcall(fask.spawn,ac.attack,ac)
			if tick() > AttackCoolDown then
				CancelCoolDown()
			end
			if tick() - cooldowntickFire > 0.3 then
				ac.timeToNextAttack = 0
				ac.hitboxMagnitude = 60
				pcall(fask.spawn,ac.attack,ac)
				cooldowntickFire = tick()
			end
			local AMI3 = ac.anims.basic[3]
			local AMI2 = ac.anims.basic[2]
			local REALID = AMI3 or AMI2
			AttackAnim.AnimationId = REALID
			local StartP = ac.humanoid:LoadAnimation(AttackAnim)
			StartP:Play(0.01,0.01,0.01)
			RigEven.FireServer(RigEven,"hit",bladehit,AMI3 and 3 or 2,"")
			fask.delay(0.01,function()
				StartP:Stop()
			end)
		end
	end
end)

function CheckStun()
	if game:GetService('Players').LocalPlayer.Character:FindFirstChild("Stun") then
		return game:GetService('Players').LocalPlayer.Character.Stun.Value ~= 0
	end
	return false
end

LPH_JIT_MAX(function()
	spawn(function()
		while game:GetService("RunService").Stepped:Wait() do
			local ac = CombatFrameworkR.activeController
			if ac and ac.equipped and not CheckStun() then
				if NeedAttacking and Fast_Attack then
					fask.spawn(function()
						pcall(fask.spawn,AttackFunction,1)
					end)
				elseif DamageAura then
					fask.spawn(function()
						pcall(fask.spawn,AttackFunction,3)
					end)
				elseif UsefastattackPlayers and Fast_Attack then
					fask.spawn(function()
						pcall(fask.spawn,AttackFunction,2)
					end)
				elseif NeedAttacking and Fast_Attack == false then
					if ac.hitboxMagnitude ~= 55 then
						ac.hitboxMagnitude = 55
					end
					pcall(fask.spawn,ac.attack,ac)
				end
			end
		end
	end)
end)()

Main:Dropdown("Select Fast Attack", {"Low Fast Attack","Normal Attack","Fast Attack","Super Fast Attack","New Fast Attack"}, function(value)
    SelectFastAttackMode = value
end)
SelectFastAttackMode = SelectFastAttackMode or "Super Fast Attack"

local function ChangeModeFastAttack(SelectFastAttackMode)
	if SelectFastAttackMode == "Low Fast Attack" then
		FireCooldown = 0.5
    elseif SelectFastAttackMode == "Normal Attack" then
		FireCooldown = 0.1
	elseif SelectFastAttackMode == "Fast Attack" then
		FireCooldown = 0.07
	elseif SelectFastAttackMode == "Super Fast Attack" then
		FireCooldown = 0.04
    elseif SelectFastAttackMode == "Kick Fast Attack" then
		FireCooldown = 0.01
	end
end

Main:Dropdown("Select Weapon", {"Melee","Sword","Fruit","Gun"}, function(value)
    _G.SelectWeapon = value
end)
_G.SelectWeapon = _G.SelectWeapon or "Melee"
task.spawn(function()
	while wait() do
		pcall(function()
			if _G.SelectWeapon == "Melee" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Melee" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.SelectWeapon = v.Name
						end
					end
				end
			elseif _G.SelectWeapon == "Sword" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Sword" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.SelectWeapon = v.Name
						end
					end
				end
			elseif _G.SelectWeapon == "Gun" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Gun" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.SelectWeapon = v.Name
						end
					end
				end
			elseif _G.SelectWeapon == "Fruit" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Blox Fruit" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.SelectWeapon = v.Name
						end
					end
				end
			end
		end)
	end
end) 

Main:Label("Level Farm")

Main:Toggle("Auto Level Farm", false, function(value)
        _G.AutoLevel2 = value
        StopTween(_G.AutoLevel2)
    end)
    
spawn(function()
        while wait() do
            if _G.AutoLevel2 then
                pcall(function()
local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                    if not string.find(QuestTitle, NameMon) then
                        StartMagnet = false
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        
                        StartMagnet = false
                        CheckQuest()
                        if BypassTP then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude > 1500 then
						BTP(CFrameQuest * CFrame.new(0,20,5))
						elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude < 1500 then
						topos(CFrameQuest)
						end
					else
						topos(CFrameQuest)
					end
					if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude <= 5 then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,LevelQuest)
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        CheckQuest()
                        if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    if v.Name == Mon then
                                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                                repeat wait()
                                                EquipWeapon(_G.SelectWeapon)
                                                AutoHaki()                                                 
                                                PosMon = v.HumanoidRootPart.CFrame
                                                topos(v.HumanoidRootPart.CFrame * Pos)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                v.Head.CanCollide = false
                                                StartMagnet = true
                                                
                                            until not _G.AutoLevel2 or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                        else
                                            StartMagnet = false
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                        end
                                    end
                                end
                            end
                        else
                            topos(CFrameMon)
                            StartMagnet = false
                            if game:GetService("ReplicatedStorage"):FindFirstChild(Mon) then
                             topos(game:GetService("ReplicatedStorage"):FindFirstChild(Mon).HumanoidRootPart.CFrame * CFrame.new(15,10,2))
                            end
                        end
                    end
                end)
            end
        end
    end) 
    
Main:Label("Nearest")

Main:Toggle("Auto Farm Nearest", false, function(value)
        _G.AutoFarmNearest = value
        StopTween(_G.AutoFarmNearest)
    end)
    
spawn(function()
	while wait() do
		if _G.AutoFarmNearest then
			for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v.Name and v:FindFirstChild("Humanoid") then
			        if v.Humanoid.Health > 0 then
			            repeat wait()
			              EquipWeapon(_G.SelectWeapon)
			                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
			                	local args = {
				                	[1] = "Buso"
			                	}
			                	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			               	end
			                topos(v.HumanoidRootPart.CFrame * Pos)
			                v.HumanoidRootPart.CanCollide = false 
			                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
						    game:GetService("VirtualUser"):CaptureController()
				       	    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672), game.Workspace.CurrentCamera.CFrame)
				       	    AutoFarmNearestMagnet = true
				       	    PosMon = v.HumanoidRootPart.CFrame
			            until not _G.AutoFarmNearest or not v.Parent or v.Humanoid.Health <= 0 
			            AutoFarmNearestMagnet = false
			        end
			    end
			end
		end
	end
end)

Main:Label("Katakuri V1 + V2")

Main:Toggle("Auto Katakuri V1", false, function(value)
        _G.AutoKata = value
        StopTween(_G.AutoKata)
    end)
    local Cake = {
    ["Cookie Crafter"] = CFrame.new(-2333.28052, 37.8239059, -12093.2861),
    ["Cake Guard"] = CFrame.new(-1575.56433, 37.8238907, -12416.2529),
    ["Baking Staff"] = CFrame.new(-1872.35742, 37.8239517, -12899.4248),
    ["Head Baker"] = CFrame.new(-2223.1416, 53.5283203, -12854.752)
}

spawn(function()
    spawn(function()
        while task.wait(.1) do
            if CakeBring then
                pcall(function()
                    for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker" then
                            local targetCFrame = Cake[v.Name]
                            if targetCFrame then
                                v.HumanoidRootPart.CFrame = targetCFrame
                            end
                            v.Head.CanCollide = false
                            v.Humanoid.Sit = false
                            v.Humanoid:ChangeState(14)
                            v.HumanoidRootPart.CanCollide = false
                            v.Humanoid.JumpPower = 0
                            v.Humanoid.WalkSpeed = 0
                            if v.Humanoid:FindFirstChild('Animator') then
                                v.Humanoid:FindFirstChild('Animator'):Destroy()
                            end
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        end
                    end
                end)
            end
        end
    end)
end)

spawn(function()
       while wait() do
         if _G.AutoKata and World3 then
         pcall(function()                        
      if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Cake Prince" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0 
                                        NeedAttacking = true
                                 v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                        topos(v.HumanoidRootPart.CFrame *Pos)
                                        CakeBring = false
                                        sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    until not _G.AutoKata == false or not v.Parent or v.Humanoid.Health <= 0 or tween:Cancel() or game:GetService("Workspace").Enemies:FindFirstChild("Ring") and game:GetService("Workspace").Enemies:FindFirstChild("Fist")
                                if game:GetService("Workspace").Enemies:FindFirstChild("Ring") and game:GetService("Workspace").Enemies:FindFirstChild("Fist")  then 
                     topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 200, 0))
                             end
                             end
                            end
                        end
                    else
               if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 and (CFrame.new(-1990.672607421875, 4532.99951171875, -14973.6748046875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 500 then
                        topos(CFrame.new(-2151.82153, 149.315704, -12404.9053))
                         else
                            if KillMob == 0 then
                            end                    
                            if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 1 then
                                if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker") then
                                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker" then
                                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                                repeat wait()
                                                    AutoHaki()
                                                    EquipWeapon(_G.SelectWeapon)
                                           v.HumanoidRootPart.CanCollide = false
                                                    v.Humanoid.WalkSpeed = 0
                                                    v.Head.CanCollide = false 
                                                    NeedAttacking = true
                                                    CakeBring = true 
                                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                                    sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)            
                                                until not _G.AutoKata or not v.Parent or v.Humanoid.Health <= 0 or game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or KillMob == 0
                                            end
                                        end
                                    end
                                else
                                if BypassTP then
                                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CakePos.Position).Magnitude > 1500 then
						        BTP(CakePos)
						        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CakePos.Position).Magnitude < 1500 then
						        end
						     end
                             CakeBring = false                     
                             local RandomTele = math.random(1, 3)
                                if RandomTele == 1 then
                                    topos(CFrame.new(-1436.86011, 167.753616, -12296.9512))
                                elseif RandomTele == 2 then
                                    topos(CFrame.new(-2383.78979, 150.450592, -12126.4961))
                                elseif RandomTele == 3 then
                                    topos(CFrame.new(-2231.2793, 168.256653, -12845.7559))
                                end
                                    if game:GetService("ReplicatedStorage"):FindFirstChild("Cookie Crafter") then
                                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cookie Crafter").HumanoidRootPart.CFrame * CFrame.new(2,20,2)) 
                                    else
                                        if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Guard") then
                                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Guard").HumanoidRootPart.CFrame * CFrame.new(2,20,2)) 
                                        else
                                            if game:GetService("ReplicatedStorage"):FindFirstChild("Baking Staff") then
                                                topos(game:GetService("ReplicatedStorage"):FindFirstChild("Baking Staff").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                                            else
                                                if game:GetService("ReplicatedStorage"):FindFirstChild("Head Baker") then
                                                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Head Baker").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                                                end
                                            end
                                        end
                                    end                       
                                end
                            else
                                if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                                    topos(game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                                else
                                    if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") then
                                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)       
    
Main:Toggle("Fully Auto Kata V2", false, function(value)
_G.Cuc = value
_G.Caceli = value
_G.PressQ = value
_G.Cuccho = value
StopTween(_G.Cuccho)
end)

local function bringMobsInGroup(mobs)
    for i, v in pairs(mobs) do
        if _G.AutoDoughtBoss and (v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker") then
            v.HumanoidRootPart.CFrame = POSCAKE
            v.HumanoidRootPart.CanCollide = false
            v.HumanoidRootPart.Size = Vector3.new(70,70,70)
            if v.Humanoid:FindFirstChild("Animator") then
                v.Humanoid.Animator:Destroy()
            end
            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
        end
    end
end

spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        pcall(function()
            if _G.AutoDoughtBoss then
                local mobs = {}
                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if (v.HumanoidRootPart.Position - POSCAKE.Position).magnitude <= 350 then
                        table.insert(mobs, v)
                        if #mobs >= 5 then 
                            bringMobsInGroup(mobs)
                            mobs = {}
                            task.wait(0.1) 
                        end
                    end
                end
                if #mobs > 0 then
                    bringMobsInGroup(mobs)
                end
            end
        end)
    end)
end)

function attackCakePrince(v)
    repeat wait()
        AutoHaki()
        EquipWeapon(_G.SelectWeapon)
        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
        v.HumanoidRootPart.CanCollide = false
        topos(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
        game:GetService'VirtualUser':CaptureController()
        game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
    until _G.AutoDoughtBoss == false or not v.Parent or v.Humanoid.Health <= 0
end

spawn(function()
    while wait() do
        if _G.AutoDoughtBoss then
            pcall(function()
                if game.ReplicatedStorage:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then   
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do 
                            if v.Name == "Cake Prince" then
                                attackCakePrince(v)
                            end    
                        end    
                    else
                        topos(CFrame.new(-2151.73877, 70.1083679, -12399.0566)) 
                        task.wait(1) 
                    end
                else
                    if game.Workspace.Enemies:FindFirstChild("Baking Staff") or game.Workspace.Enemies:FindFirstChild("Head Baker") or game.Workspace.Enemies:FindFirstChild("Cake Guard") or game.Workspace.Enemies:FindFirstChild("Cookie Crafter") then
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do  
                            if (v.Name == "Baking Staff" or v.Name == "Head Baker" or v.Name == "Cake Guard" or v.Name == "Cookie Crafter") and v.Humanoid.Health > 0 then
                                repeat wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    StartMagnet = true
                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)  
                                    POSCAKE = v.HumanoidRootPart.CFrame
                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(0,40,0))
                                    game:GetService'VirtualUser':CaptureController()
                                    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                until _G.AutoDoughtBoss == false or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    else
                       StartMagnet = false
                        topos(CFrame.new(-2134.48779, 148.698532, -12340.1348))
                    end
                end
            end)
        end
    end
end)

spawn(function()
		pcall(function()
			while wait() do
				if _G.Cuc and World3 then
					if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then 
					    _G.AutoDoughtBoss = true
					    _G.Caceli = false
					    _G.Cuccho = false
					end
				end
			end
		end)
	end)
	
	spawn(function()
		pcall(function()
			while wait() do
				if _G.Cuc and World3 then
					if not game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then 
					    _G.AutoDoughtBoss = false
					    _G.Caceli = true
					    _G.Cuccho = true
					end
				end
			end
		end)
	end)
	
spawn(function()
		pcall(function()
			while wait() do
				if _G.Caceli and World3 then
					if game:GetService("Workspace").Enemies:FindFirstChild("Urban") or game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") then
					    _G.Eli_Ngu = true
					    _G.Cuc = false
					    _G.Cuccho = false
					end
				end
			end
		end)
	end)
	
spawn(function()
		pcall(function()
			while wait() do
				if _G.Caceli and World3 then
					if not game:GetService("Workspace").Enemies:FindFirstChild("Urban") or not game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or not game:GetService("Workspace").Enemies:FindFirstChild("Deandre") then
					    _G.Eli_Ngu = false
					    _G.Cuc = true
					    _G.Cuccho = true
					end
				end
			end
		end)
	end)
	
spawn(function()
		pcall(function()
			while wait() do
				if _G.Cuccho and World3 then
					if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("God's Chalice") or not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") then 
					    Grab_Chest = true
					    _G.Cuc = false
					end
				end
			end
		end)
	end)
	
	spawn(function()
		pcall(function()
			while wait() do
				if _G.Cuccho and World3 then
					if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") then 
					    Grab_Chest = false
					    _G.Cuc = true
					end
				end
			end
		end)
	end)
	
Main:Label("Bone Farm")

    Main:Toggle("Auto Bones","9606294253",_G.Setting_For_Bones,function(value)
        _G.Auto_Bone = value
        _G.Setting_For_Bones = value
        Update_Setting(getgenv()['MyName'])
        StopTween(_G.Auto_Bone)
    end)
    local Bone = {
    ["Reborn Skeleton"] = CFrame.new(-8769.58984, 142.13063, 6055.27637),
    ["Living Zombie"] = CFrame.new(-10156.4531, 138.652481, 5964.5752),
    ["Demonic Soul"] = CFrame.new(-9525.17188, 172.13063, 6152.30566),
    ["Posessed Mummy"] = CFrame.new(-9570.88281, 5.81831884, 6187.86279)
}

spawn(function()
    spawn(function()
        while task.wait(.1) do
            if BonesBring then
                pcall(function()
                    for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
                            local targetCFrame = Bone[v.Name]
                            if targetCFrame then
                                v.HumanoidRootPart.CFrame = targetCFrame
                            end
                            v.Head.CanCollide = false
                            v.Humanoid.Sit = false
                            v.Humanoid:ChangeState(14)
                            v.HumanoidRootPart.CanCollide = false
                            v.Humanoid.JumpPower = 0
                            v.Humanoid.WalkSpeed = 0
                            if v.Humanoid:FindFirstChild('Animator') then
                                v.Humanoid:FindFirstChild('Animator'):Destroy()
                            end
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        end
                    end
                end)
            end
        end
    end)
end)

local FaiFaoQuestBone = CFrame.new(-9515.75, 174.8521728515625, 6079.40625)

    spawn(function()
        while wait() do
            if _G.Auto_Bone then
                pcall(function()
                    local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle
                                           .Title.Text
                    if not string.find(QuestTitle, "Demonic Soul") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        if BypassTP then
                            wait()
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - FaiFaoQuestBone.Position).Magnitude >
                                2500 then
                                BTP(FaiFaoQuestBone)

                            elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position -
                                FaiFaoQuestBone.Position).Magnitude < 2500 then

                                topos(FaiFaoQuestBone)
                            end
                        else

                            topos(FaiFaoQuestBone)
                        end
                        if (FaiFaoQuestBone.Position -
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",
                                "HauntedQuest2", 1)
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or
                            game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or
                            game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or
                            game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and
                                    v.Humanoid.Health > 0 then
                                    if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name ==
                                        "Demonic Soul" or v.Name == "Posessed Mummy" then
                                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest
                                                           .Container.QuestTitle.Title.Text, "Demonic Soul") then
                                            repeat
                                                task.wait()
                                                AutoHaki()
                                                EquipWeapon(_G.SelectWeapon)
                                                topos(v.HumanoidRootPart.CFrame * Pos)
                                                v.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                                                v.HumanoidRootPart.Transparency = 1
                                                BonesBring = true
                                                v.Humanoid.JumpPower = 0
                                                v.Humanoid.WalkSpeed = 0
                                                v.HumanoidRootPart.CanCollide = false
                                                FarmPos = v.HumanoidRootPart.CFrame
                                                MonFarm = v.Name
                                            until not _G.Auto_Bone or v.Humanoid.Health <= 0 or not v.Parent or
                                                game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ==
                                                false
                                        else
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                                "AbandonQuest")
                                        end
                                    end
                                end
                            end
                        else
                            if game:GetService("ReplicatedStorage"):FindFirstChild("Demonic Soul") then
                                topos(v.HumanoidRootPart.CFrame * Pos2)
                            end
                        end

                    end
                end)
            end
        end
    end)
    
if World1 then
Main:Label("Skip Level Farm")

Main:Toggle("Auto Farm Level Fast [1 -> 300]", false, function(value)
        _G.Farmfast = value
        StopTween(_G.Farmfast)
    end)
    
spawn(function()
		pcall(function()
			while wait() do
				if _G.Farmfast and World1 then
					if game.Players.LocalPlayer.Data.Level.Value >= 10 then
					    _G.AutoFarm = false
					    _G.Farmfast = true
					end
				end
			end
		end)
	end)
    spawn(function()
        while wait() do
            if _G.Farmfast and World1 then
                pcall(function()
                if game.Players.LocalPlayer.Data.Level.Value >= 10 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Shanda" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        StardMag = true
                                        FastMon = v.HumanoidRootPart.CFrame
                                        v.HumanoidRootPart.Size = Vector3.new(80,80,80)                             
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    until not _G.Farmfast or not v.Parent or v.Humanoid.Health <= 0
                                    StardMag = false
                                    topos(CFrame.new(-7678.48974609375, 5566.40380859375, -497.2156066894531))
                                    UnEquipWeapon(_G.SelectWeapon)
                                end
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Shanda") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Shanda").HumanoidRootPart.CFrame * CFrame.new(5,10,2))
                        end
                    end
                end)
            end
        end
    end)
    spawn(function()
		pcall(function()
			while wait() do
				if _G.Farmfast and World1 then
					if game.Players.LocalPlayer.Data.Level.Value >= 75 then
						_G.Farmfast = false
						_G.AutoPlayerHunter = true
					end
				end
			end
		end)
	end)
    spawn(function()
		pcall(function()
			while wait() do
				if _G.Farmfast and World1 then
					if game.Players.LocalPlayer.Data.Level.Value >= 200 then
				    	_G.AutoFarm = true
						_G.AutoPlayerHunter = false
					end
				end
			end
		end)
	end)
end

spawn(function()
    game:GetService("RunService").Heartbeat:connect(function()
        pcall(function()
            if _G.AutoPlayerHunter then
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") then
                    game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
                end
            end
        end)
    end)
end)
spawn(function()
    pcall(function()
        while wait(.1) do
            if _G.AutoPlayerHunter then
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                end
            end
        end
    end)
end)
spawn(function()
    while wait() do
        if _G.AutoPlayerHunter then
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                wait(.5)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
            else
                for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,v.Name) then
                        repeat wait()
                            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                local args = {
                                    [1] = "Buso"
                                }
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            end
                            EquipWeapon(_G.SelectWeapon)
                            Useskill = true
                            topos(v.HumanoidRootPart.CFrame * CFrame.new(1,7,3))								
                            v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                            game:GetService'VirtualUser':CaptureController()
                            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                        until _G.AutoPlayerHunter == false or v.Humanoid.Health <= 0
                        Useskill = false
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                end
            end
        end
    end
end)
spawn(function()
    while wait() do
		pcall(function()
			if Useskill then
				game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
				wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
				wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
				wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game)
				wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game)
			end
		end)
    end
end)

Main:Label("Mastery")

Main:Toggle("Farm Fruit Mastery [ Level ]", false, function(value)
        _G.AutoFarmFruitMastery = value
        StopTween(_G.AutoFarmFruitMastery)
    end)
spawn(function()
    while wait() do
        if _G.AutoFarmFruitMastery then
            pcall(function()
                local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                if not string.find(QuestTitle, NameMon) then
                    Magnet = false
                    UseSkill = false
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    StartMasteryFruitMagnet = false
                    UseSkill = false
                    CheckQuest()
                    repeat wait()
                        topos(CFrameQuest)
                    until (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.AutoFarmFruitMastery
                    if (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                        wait(0.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,LevelQuest)
                        wait(0.1)
                    end
                elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    CheckQuest()
                    if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                if v.Name == Mon then
                                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                        HealthMs = v.Humanoid.MaxHealth * _G.Kill_At/100
                                        repeat task.wait()
                                            if v.Humanoid.Health <= HealthMs then
                                                AutoHaki()
                                                EquipWeapon(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)
                                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0,10,0))
                                                v.HumanoidRootPart.CanCollide = false
                                                PosMonMasteryFruit = v.HumanoidRootPart.CFrame
                                                v.Humanoid.WalkSpeed = 0
                                                v.Head.CanCollide = false
                                                UseSkill = true
                                            else           
                                                UseSkill = false 
                                                AutoHaki()
                                                EquipWeapon(_G.SelectWeapon)
                                                topos(v.HumanoidRootPart.CFrame * Pos)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                PosMonMasteryFruit = v.HumanoidRootPart.CFrame
                                                v.Humanoid.WalkSpeed = 0
                                                v.Head.CanCollide = false
                                            end
                                            StartMasteryFruitMagnet = true
                                            game:GetService'VirtualUser':CaptureController()
                                            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                        until not _G.AutoFarmFruitMastery or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                    else
                                        UseSkill = false
                                        StartMasteryFruitMagnet = false
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                    end
                                end
                            end
                        end
                    else
                        topos(CFrameMon)
                        UnEquipWeapon(_G.SelectWeapon)
                        StartMasteryFruitMagnet = false   
                        UseSkill = false 
                        local Mob = game:GetService("ReplicatedStorage"):FindFirstChild(Mon) 
                        if Mob then
                            topos(Mob.HumanoidRootPart.CFrame * CFrame.new(0,0,10))
                        else
                            if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Y <= 1 then
                                game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = true
                                task.wait()
                                game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = false
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if UseSkill then
            pcall(function()
                CheckQuest()
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
                        MasBF = game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Data.DevilFruit.Value].Level.Value
                    elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
                        MasBF = game:GetService("Players").LocalPlayer.Backpack[game:GetService("Players").LocalPlayer.Data.DevilFruit.Value].Level.Value
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon-Dragon") then                      
                        if _G.SkillZ then
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                        
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                        end
                        if _G.SkillX then          
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))               
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                        end
                        if _G.SkillC then
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                          
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                            wait(2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                        end
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom-Venom") then   
                        if _G.SkillZ then
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                        
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                        end
                        if _G.SkillX then        
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))               
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                        end
                        if _G.SkillC then 
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                          
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                            wait(2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                        end
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha") then
                        if _G.SkillZ and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Size == Vector3.new(2, 2.0199999809265, 1) then
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                         
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                        end
                        if _G.SkillX then
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                           
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                        end
                        if _G.SkillC then
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                           
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                        end
                        if _G.SkillV then
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game)
                        end
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
                        if _G.SkillZ then 
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                         
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                        end
                        if _G.SkillX then
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                           
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                        end
                        if _G.SkillC then
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                           
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                        end
                        if _G.SkillV then
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game)
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        pcall(function()
            if UseSkill then
                for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren()) do
                    if v.Name == "NotificationTemplate" then
                        if string.find(v.Text,"Skill locked!") then
                            v:Destroy()
                        end
                    end
                end
            end
        end)
    end)
end)
spawn(function()
    pcall(function()
        game:GetService("RunService").RenderStepped:Connect(function()
            if UseSkill then
                local args = {
                    [1] = PosMonMasteryFruit.Position
                }
                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Data.DevilFruit.Value].RemoteEvent:FireServer(unpack(args))
            end
        end)
    end)
end)
spawn(function()
    while wait() do
        if UseSkillKub then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
                        MasBF = game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Data.DevilFruit.Value].Level.Value
                    elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
                        MasBF = game:GetService("Players").LocalPlayer.Backpack[game:GetService("Players").LocalPlayer.Data.DevilFruit.Value].Level.Value
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon-Dragon") then                      
                        if _G.SkillZ then
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                        
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                        end
                        if _G.SkillX then          
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))               
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                        end
                        if _G.SkillC then
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                          
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                            wait(2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                        end
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom-Venom") then   
                        if _G.SkillZ then
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                        
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                        end
                        if _G.SkillX then        
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))               
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                        end
                        if _G.SkillC then 
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                          
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                            wait(2)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                        end
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha") then
                        if _G.SkillZ and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Size == Vector3.new(2, 2.0199999809265, 1) then
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                         
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                        end
                        if _G.SkillX then
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                           
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                        end
                        if _G.SkillC then
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                           
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                        end
                        if _G.SkillV then
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game)
                        end
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
                        if _G.SkillZ then 
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                         
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                        end
                        if _G.SkillX then
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                           
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                        end
                        if _G.SkillC then
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))                           
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                        end
                        if _G.SkillV then
                            local args = {
                                [1] = PosMonMasteryFruit.Position
                            }
                            game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game)
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        pcall(function()
            if UseSkillKub then
                for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren()) do
                    if v.Name == "NotificationTemplate" then
                        if string.find(v.Text,"Skill locked!") then
                            v:Destroy()
                        end
                    end
                end
            end
        end)
    end)
end)
spawn(function()
    pcall(function()
        game:GetService("RunService").RenderStepped:Connect(function()
            if UseSkillKub then
                local args = {
                    [1] = PosMonMasteryFruit.Position
                }
                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Data.DevilFruit.Value].RemoteEvent:FireServer(unpack(args))
            end
        end)
    end)
end)

Main:Toggle("Auto Farm Gun Mastery", false, function(value)
    _G.AutoFarmGunMastery = value
    StopTween(_G.AutoFarmGunMastery)
end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoFarmGunMastery then
                local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                if not string.find(QuestTitle, NameMon) then
                    Magnet = false                                      
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    StartMasteryGunMagnet = false
                    CheckQuest()
                    topos(CFrameQuest)
                    if (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                        wait(0.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
                    end
                elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    CheckQuest()
                    if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                        pcall(function()
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == Mon then
                                    repeat task.wait()
                                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                            HealthMin = v.Humanoid.MaxHealth * _G.Kill_At/100
                                            if v.Humanoid.Health <= HealthMin then                                                
                                                EquipWeapon(SelectWeaponGun)
                                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0,10,0))
                                                v.Humanoid.WalkSpeed = 0
                                                v.HumanoidRootPart.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(2,2,1)
                                                v.Head.CanCollide = false                                                
                                                local args = {
                                                    [1] = v.HumanoidRootPart.Position,
                                                    [2] = v.HumanoidRootPart
                                                }
                                                game:GetService("Players").LocalPlayer.Character[SelectWeaponGun].RemoteFunctionShoot:InvokeServer(unpack(args))
                                            else
                                                AutoHaki()
                                                EquipWeapon(_G.SelectWeapon)
                                                v.Humanoid.WalkSpeed = 0
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Head.CanCollide = false               
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                topos(v.HumanoidRootPart.CFrame * Pos)
                                                game:GetService'VirtualUser':CaptureController()
                                                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                            end
                                            StartMasteryGunMagnet = true 
                                            PosMonMasteryGun = v.HumanoidRootPart.CFrame
                                        else
                                            StartMasteryGunMagnet = false
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                        end
                                    until v.Humanoid.Health <= 0 or _G.AutoFarmGunMastery == false or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                    StartMasteryGunMagnet = false
                                end
                            end
                        end)
                    else
                       topos(CFrameMon)
                       UnEquipWeapon(_G.SelectWeapon)
                        _G.AutoFarmGunMastery = false
                        local Mob = game:GetService("ReplicatedStorage"):FindFirstChild(Mon) 
                        if Mob then
                            topos(Mob.HumanoidRootPart.CFrame * CFrame.new(0,0,10))
                        else
                            if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Y <= 1 then
                                game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = true
                                task.wait()
                                game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = false
                            end
                        end
                    end 
                end
            end
        end
    end)
end)

Main:Toggle("Auto Farm Sword Mastery", false, function(value)
    _G.AutoSwordMastery = value
    StopTween(_G.AutoSwordMastery)
end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoSwordMastery then
                local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                if not string.find(QuestTitle, NameMon) then
                    Magnet = false                                      
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    AutoSwordMasteryMag = false
                    CheckQuest()
                    topos(CFrameQuest)
                    if (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                        wait(0.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
                    end
                elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    CheckQuest()
                    if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                        pcall(function()
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == Mon then
                                    repeat task.wait()
                                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                            HealthMin = v.Humanoid.MaxHealth * _G.Kill_At/100
                                            if v.Humanoid.Health <= HealthMin then                                                
                                                EquipWeaponSword()
                                                topos(v.HumanoidRootPart.CFrame * Pos)
                                                v.Humanoid.WalkSpeed = 0
                                                v.HumanoidRootPart.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                game:GetService'VirtualUser':CaptureController()
                                                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                                v.Head.CanCollide = false                                                
                                            else
                                                AutoHaki()
                                                EquipWeapon(_G.SelectWeapon)
                                                v.Humanoid.WalkSpeed = 0
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Head.CanCollide = false               
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                topos(v.HumanoidRootPart.CFrame * Pos)
                                                game:GetService'VirtualUser':CaptureController()
                                                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                            end
                                            AutoSwordMasteryMag = true 
                                            PosMon = v.HumanoidRootPart.CFrame
                                        else
                                            AutoSwordMasteryMag = false
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                        end
                                    until v.Humanoid.Health <= 0 or _G.AutoSwordMastery == false or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                    AutoSwordMasteryMag = false
                                end
                            end
                        end)
                    else
                       topos(CFrameMon)
                       UnEquipWeapon(_G.SelectWeapon)
                        AutoSwordMasteryMag = false
                        local Mob = game:GetService("ReplicatedStorage"):FindFirstChild(Mon) 
                        if Mob then
                            topos(Mob.HumanoidRootPart.CFrame * CFrame.new(0,0,10))
                        else
                            if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Y <= 1 then
                                game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = true
                                task.wait()
                                game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = false
                            end
                        end
                    end 
                end
            end
        end
    end)
end)

Main:Toggle("Use Skill Z", true, function(value)
    _G.SkillZ = value
end)

Main:Toggle("Use Skill X", true, function(value)
    _G.SkillX = value
end)

Main:Toggle("Use Skill C", true, function(value)
    _G.SkillC = value
end)

Main:Toggle("Use Skill V", true, function(value)
    _G.SkillV = value
end)

Main:Slider("Kill Monster At ..% Health", 0, 100, 40, function(value)
    _G.Kill_At = value
end)
_G.Kill_At = 40

Main:Label("Boss")
local Boss = {}
for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
    if string.find(v.Name, "Boss") then
        if v.Name == "Ice Admiral" then
            else
            table.insert(Boss, v.Name)
        end
    end
end
local bossCheck = {}
local bossNames = { "The Gorilla King", "Bobby", "The Saw", "Yeti", "Mob Leader", "lce Admiral", "Warden", "Chief Warden", "Swan", "Saber Expert", "Magma Admiral", "Fishman Lord", "Wysper", "Thunder God", "Cyborg", "Greybeard", "Diamond", "Jeremy", "Fajita", "Don Swan", "Smoke Admiral", "Awakened Ice Admiral", "Tide Keeper", "Order", "Darkbeard", "Cursed Captain", "Stone", "Island Empress", "Kilo Admiral", "Captain Elephant", "Beautiful Pirate", "Longma", "Cake Queen", "Soul Reaper", "Rip_Indra", "Cake Prince", "Dough King" }
if World1 or World2 or World3 then
    for _, bossName in pairs(bossNames) do
        if game:GetService("ReplicatedStorage"):FindFirstChild(bossName) then
            table.insert(bossCheck, bossName)
        end
    end
end
for _, name in pairs(Boss) do
    table.insert(bossCheck, name)
end

local BossName = Main:Dropdown("Select Boss", bossCheck, function(value)
    _G.SelectBoss = value
end)

Main:Button("Refresh Boss List", function()
    BossName:Clear()
    wait(0.1)
    for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if (v.Name == "rip_indra" or v.Name == "Ice Admiral")
                            or (v.Name == "Saber Expert" or v.Name == "The Saw" or v.Name == "Greybeard" or v.Name == "Mob Leader" or v.Name == "The Gorilla King" or v.Name == "Bobby" or v.Name == "Yeti" or v.Name == "Ice Admiral" or v.Name == "Warden" or v.Name == "Chief Warden" or v.Name == "Swan" or v.Name == "Magma Admiral" or v.Name == "Fishman Lord" or v.Name == "Wysper" or v.Name == "Thunder God" or v.Name == "Cyborg")
                            or (v.Name == "Don Swan" or v.Name == "Diamond" or v.Name == "Jeremy" or v.Name == "Fajita" or v.Name == "Smoke Admiral" or v.Name == "Awakened Ice Admiral" or v.Name == "Tide Keeper" or v.Name == "Order" or v.Name == "Darkbeard")
                            or (v.Name == "Stone" or v.Name == "Island Empress" or v.Name == "Kilo Admiral" or v.Name == "Captain Elephant" or v.Name == "Beautiful Pirate" or v.Name == "Cake Queen" or v.Name == "rip_indra True Form" or v.Name == "Longma" or v.Name == "Soul Reaper" or v.Name == "Cake Prince" or v.Name == "Dough King") then
            BossName:Add(v.Name)
        end
    end
end)

Main:Toggle("Auto Farm Selected Boss", false, function(value)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
    _G.AutoFarmBoss = value
    StopTween(_G.AutoFarmBoss)
end)
spawn(function()
    while wait() do
        if _G.AutoFarmBoss and BypassTP then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectBoss) then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == _G.SelectBoss then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.Size = Vector3.new(80,80,80)                             
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                until not _G.AutoFarmBoss or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                elseif game.ReplicatedStorage:FindFirstChild(_G.SelectBoss) then
                    if ((game.ReplicatedStorage:FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 1500 then
                        topos(game.ReplicatedStorage:FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame)
                    else
                        BTP(game.ReplicatedStorage:FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame)
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.AutoFarmBoss and not BypassTP then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectBoss) then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == _G.SelectBoss then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.Size = Vector3.new(80,80,80)                             
                                    topos(v.HumanoidRootPart.CFrame * (Farm_pos))
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                until not _G.AutoFarmBoss or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    if game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss) then
                        topos(game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                    end
                end
            end)
        end
    end
end)
    
if World1 then
		MaterialList = {"Scrap Metal","Leather","Angel Wings","Magma Ore","Fish Tail"}
	elseif World2 then
		MaterialList = {"Scrap Metal","Leather","Radioactive Material","Mystic Droplet","Magma Ore","Vampire Fang"}
	elseif World3 then
		MaterialList = {"Scrap Metal","Leather","Demonic Wisp","Conjured Cocoa","Dragon Scale","Gunpowder","Fish Tail","Mini Tusk"}
	end

local Materialist = Main:Dropdown("Select Material", MaterialList, function(value)
    _G.SelectMaterial = value
end)

Main:Toggle("Auto Farm Material", false, function(value)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
    _G.AutoMaterial = value
    StopTween(_G.AutoMaterial)
end)
spawn(function()
while task.wait() do
    if _G.AutoMaterial then
    pcall(function()
            MaterialMon(_G.SelectMaterial)
                TPP(MPos)
                        if game:GetService("Workspace").Enemies:FindFirstChild(MMon) then
                            for i,v in pairs (game.Workspace.Enemies:GetChildren()) do
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    if v.Name == MMon then
                                    repeat wait(_G.FastAttackDelay)
                                    AutoHaki()
                                    Min_XT_Is_Kak = true
                                    StartMagnet = true
                                    EquipWeapon(_G.SelectWeapon)
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                         v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                            v.HumanoidRootPart.Transparency = 1
                                            v.Humanoid.JumpPower = 0
                                            v.Humanoid.WalkSpeed = 0
                                             v.HumanoidRootPart.CanCollide = false
                                             PosMon = v.HumanoidRootPart.CFrame
                                             MonFarm = v.Name
                                            until not _G.AutoMaterial or not v.Parent or v.Humanoid.Health <= 0
                                            Min_XT_Is_Kak = false
                                            NeedAttacking = true
                                        end
                                    end
                                end
                                    else
                                        for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
                                        if string.find(v.Name, Mon) then
                                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude >= 10 then
                                           topos(v.HumanoidRootPart.CFrame * Pos)
                                        end
                                    end
                                end
                             end
                        end)
                      end
                   end
                end)
                
Main:Label("Pirate Raid")

Main:Toggle("Auto Pirate Raid", false, function(Vu)
_G.RaidPirate = Vu
StopTween(_G.RaidPirate)
end)

spawn(function()
    while wait() do
        if _G.RaidPirate then
            pcall(function()
                local CFrameBoss = CFrame.new(-5676.53759765625, 390.7705383300781, -2554.487548828125)
                if (CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if _G.RaidPirate and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000 then
                                repeat wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    Click()
                                until v.Humanoid.Health <= 0 or not v.Parent or not _G.RaidPirate
                            end
                        end
                    end
                else
                    UnEquipWeapon(_G.SelectWeapon)
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameBoss.Position).Magnitude > 1500 then
			        BTP(CFrameBoss)
				    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameBoss.Position).Magnitude < 1500 then
				    topos(CFrameBoss)
					end
                    end
                end
            end)
        end
    end
end)

Main:Label("Farm Ectoplasm")

Main:Toggle("Auto Ectoplasm", false, function(Vu)
_G.AutoEctoplasm = Vu
StopTween(_G.AutoEctoplasm)
end)
spawn(function()
 game:GetService("RunService").Heartbeat:Connect(function()
  pcall(function()
   for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
   if _G.AutoEctoplasm and StartMagnetEctoplasm and string.find(v.Name, "Ship") and (v.HumanoidRootPart.Position - PosMonEctoplasm.Position).magnitude <= 350 then
   v.HumanoidRootPart.CFrame = PosMonEctoplasm
   v.HumanoidRootPart.CanCollide = false
   v.HumanoidRootPart.Size = Vector3.new(50,50,50)
   if v.Humanoid:FindFirstChild("Animator") then
   v.Humanoid.Animator:Destroy()
   end
   sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
   end
   end
   end)
  end)
 end)

spawn(function()
 while wait() do
 if _G.AutoEctoplasm then
 pcall(function()
  if game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer") then
  for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
  if string.find(v.Name, "Ship") then
  repeat wait()
  AutoHaki()
  EquipWeapon(_G.SelectWeapon)
  PosMonEctoplasm = v.HumanoidRootPart.CFrame
  v.HumanoidRootPart.CanCollide = false
  v.HumanoidRootPart.Size = Vector3.new(50,50,50)
  topos(v.HumanoidRootPart.CFrame * Pos)
  StartMagnetEctoplasm = true
  game:GetService'VirtualUser':CaptureController()
  game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
  until _G.AutoEctoplasm == false or not v.Parent or v.Humanoid.Health <= 0
  StartMagnetEctoplasm = false
  else
   StartMagnetEctoplasm = false
  topos(CFrame.new(904.4072265625, 181.05767822266, 33341.38671875))
  end
  end
  else
   StartMagnetEctoplasm = false
  local Distance = (Vector3.new(904.4072265625, 181.05767822266, 33341.38671875) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
  if Distance > 20000 then
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
  end
  topos(CFrame.new(904.4072265625, 181.05767822266, 33341.38671875))
  end
  end)
 end
 end
 end)
                
Main:Label("Farm Chest")

Main:Toggle("Chest Farm", false, function(vu)
	Grab_Chest = vu
    StopTween(Grab_Chest)
	T_P_H = vu
	_G.STP = vu
	end)
	
	if _G.Grab_Chest then
	Grab_Chest = true
end
spawn(function()
	while wait(2) do
		pcall(function()
			if _G.Hop_Chest then
				if K_CH >= _G.K_MAX and not H_F then
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Character:FindFirstChild("Fist of Darkness") then
						H_F = true
					else
						Hop()
						wait(50)
					end
				end
			end
		end)
	end
end)

spawn(function()
    while wait(.2) do
        pcall(function()
            if Grab_Chest then
                if T_P_H then
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Character:FindFirstChild("Fist of Darkness") then
                        topos(CFrame.new(-379.70889282227, 73.0458984375, 304.84692382813))
                        H_F = true
						game:GetService'VirtualUser':Button1Down(Vector2.new(1280,600))
                        wait(3)
                    else
						_G.Chest_100 = nil
						_G.Chest_500 = nil
						_G.Chest_1000 = nil
						_G.Chest_1500 = nil
						_G.Chest_2000 = nil
						_G.Chest_2500 = nil
						_G.Chest_3500 = nil
						_G.Chest_4500 = nil
						_G.Chest_5500 = nil
						_G.Chest_6500 = nil
						_G.Chest_7500 = nil
						_G.Chest_9500 = nil
						_G.Chest_10500 = nil
						_G.Chest_12500 = nil
						_G.Chest_15500 = nil
						_G.Chest_17500 = nil
						Chest_100()
						Chest_500()
						Chest_1000()
						Chest_1500()
						Chest_2000()
						Chest_2500()
						Chest_3500()
						Chest_4500()
						Chest_5500()
						Chest_6500()
						Chest_7500()
						Chest_9500()
						Chest_10500()
						Chest_12500()
						Chest_15500()
						Chest_17500()
						if _G.Chest_100 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_100.CFrame)
							until not _G.Chest_100.Parent or not Grab_Chest
							if Grab_Chest then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_500.CFrame)
							until not _G.Chest_500.Parent or not Grab_Chest
							if Grab_Chest then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_1000 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_1000.CFrame)
							until not _G.Chest_1000.Parent or not Grab_Chest
							if Grab_Chest then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_1500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_1500.CFrame)
							until not _G.Chest_1500.Parent or not Grab_Chest
							if Grab_Chest then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_2000 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_2000.CFrame)
							until not _G.Chest_2000.Parent or not Grab_Chest
							if Grab_Chest then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_2500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_2500.CFrame)
							until not _G.Chest_2500.Parent or not Grab_Chest
							if Grab_Chest then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_3500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_3500.CFrame)
							until not _G.Chest_3500.Parent or not Grab_Chest
							if Grab_Chest then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_4500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_4500.CFrame)
							until not _G.Chest_4500.Parent or not Grab_Chest
							if Grab_Chest then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_5500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_5500.CFrame)
							until not _G.Chest_5500.Parent or not Grab_Chest
							if Grab_Chest then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_6500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_6500.CFrame)
							until not _G.Chest_6500.Parent or not Grab_Chest
							if Grab_Chest then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_7500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_7500.CFrame)
							until not _G.Chest_7500.Parent or not Grab_Chest
							if Grab_Chest then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_9500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_9500.CFrame)
							until not _G.Chest_9500.Parent or not Grab_Chest
							if Grab_Chest then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_10500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_10500.CFrame)
							until not _G.Chest_10500.Parent or not Grab_Chest
							if Grab_Chest then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_12500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_12500.CFrame)
							until not _G.Chest_12500.Parent or not Grab_Chest
							if Grab_Chest then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_15500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_15500.CFrame)
							until not _G.Chest_15500.Parent or not Grab_Chest
							if Grab_Chest then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_17500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_17500.CFrame)
							until not _G.Chest_17500.Parent or not Grab_Chest
							if Grab_Chest then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						end
                    end
                else
                    _G.Chest_100 = nil
						_G.Chest_500 = nil
						_G.Chest_1000 = nil
						_G.Chest_1500 = nil
						_G.Chest_2000 = nil
						_G.Chest_2500 = nil
						_G.Chest_3500 = nil
						_G.Chest_4500 = nil
						_G.Chest_5500 = nil
						_G.Chest_6500 = nil
						_G.Chest_7500 = nil
						_G.Chest_9500 = nil
						_G.Chest_10500 = nil
						_G.Chest_12500 = nil
						_G.Chest_15500 = nil
						_G.Chest_17500 = nil
						Chest_100()
						Chest_500()
						Chest_1000()
						Chest_1500()
						Chest_2000()
						Chest_2500()
						Chest_3500()
						Chest_4500()
						Chest_5500()
						Chest_6500()
						Chest_7500()
						Chest_9500()
						Chest_10500()
						Chest_12500()
						Chest_15500()
						Chest_17500()
						if _G.Chest_100 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_100.CFrame)
							until not _G.Chest_100.Parent or not Grab_Chest
							if Grab_Chest then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_500.CFrame)
							until not _G.Chest_500.Parent or not Grab_Chest
							if Grab_Chest then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_1000 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_1000.CFrame)
							until not _G.Chest_1000.Parent or not Grab_Chest
							if Grab_Chest then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_1500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_1500.CFrame)
							until not _G.Chest_1500.Parent or not Grab_Chest
							if Grab_Chest then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_2000 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_2000.CFrame)
							until not _G.Chest_2000.Parent or not Grab_Chest
							if Grab_Chest then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_2500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_2500.CFrame)
							until not _G.Chest_2500.Parent or not Grab_Chest
							if Grab_Chest then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_3500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_3500.CFrame)
							until not _G.Chest_3500.Parent or not Grab_Chest
							if Grab_Chest then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_4500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_4500.CFrame)
							until not _G.Chest_4500.Parent or not Grab_Chest
							if Grab_Chest then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_5500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_5500.CFrame)
							until not _G.Chest_5500.Parent or not Grab_Chest
							if Grab_Chest then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_6500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_6500.CFrame)
							until not _G.Chest_6500.Parent or not Grab_Chest
							if Grab_Chest then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_7500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_7500.CFrame)
							until not _G.Chest_7500.Parent or not Grab_Chest
							if Grab_Chest then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_9500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_9500.CFrame)
							until not _G.Chest_9500.Parent or not Grab_Chest
							if Grab_Chest then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_10500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_10500.CFrame)
							until not _G.Chest_10500.Parent or not Grab_Chest
							if Grab_Chest then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_12500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_12500.CFrame)
							until not _G.Chest_12500.Parent or not Grab_Chest
							if Grab_Chest then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_15500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_15500.CFrame)
							until not _G.Chest_15500.Parent or not Grab_Chest
							if Grab_Chest then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_17500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_17500.CFrame)
							until not _G.Chest_17500.Parent or not Grab_Chest
							if Grab_Chest then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						end
                end
            end
        end)
    end
end)

function Chest_100()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Chest1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
			_G.Chest_100 = v
			return
		elseif v.Name == "Chest2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
			_G.Chest_100 = v
			return
		end
	end
end
function Chest_500()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Chest1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
			_G.Chest_500 = v
			return
		elseif v.Name == "Chest2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
			_G.Chest_500 = v
			return
		end
	end
end
function Chest_1000()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Chest1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1000 then
			_G.Chest_1000 = v
			return
		elseif v.Name == "Chest2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1000 then
			_G.Chest_1000 = v
			return
		end
	end
end
function Chest_1500()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Chest1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1500 then
			_G.Chest_1500 = v
			return
		elseif v.Name == "Chest2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1500 then
			_G.Chest_1500 = v
			return
		end
	end
end
function Chest_2000()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Chest1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 then
			_G.Chest_2000 = v
			return
		elseif v.Name == "Chest2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 then
			_G.Chest_2000 = v
			return
		end
	end
end
function Chest_2500()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Chest1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2500 then
			_G.Chest_2500 = v
			return
		elseif v.Name == "Chest2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2500 then
			_G.Chest_2500 = v
			return
		end
	end
end
function Chest_3500()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Chest1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3500 then
			_G.Chest_3500 = v
			return
		elseif v.Name == "Chest2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3500 then
			_G.Chest_3500 = v
			return
		end
	end
end
function Chest_4500()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Chest1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4500 then
			_G.Chest_4500 = v
			return
		elseif v.Name == "Chest2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4500 then
			_G.Chest_4500 = v
			return
		end
	end
end
function Chest_5500()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Chest1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5500 then
			_G.Chest_5500 = v
			return
		elseif v.Name == "Chest2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5500 then
			_G.Chest_5500 = v
			return
		end
	end
end
function Chest_6500()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Chest1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 6500 then
			_G.Chest_6500 = v
			return
		elseif v.Name == "Chest2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 6500 then
			_G.Chest_6500 = v
			return
		end
	end
end
function Chest_7500()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Chest1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 7500 then
			_G.Chest_7500 = v
			return
		elseif v.Name == "Chest2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 7500 then
			_G.Chest_7500 = v
			return
		end
	end
end
function Chest_9500()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Chest1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 9500 then
			_G.Chest_9500 = v
			return
		elseif v.Name == "Chest2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 9500 then
			_G.Chest_9500 = v
			return
		end
	end
end
function Chest_10500()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Chest1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10500 then
			_G.Chest_10500 = v
			return
		elseif v.Name == "Chest2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10500 then
			_G.Chest_10500 = v
			return
		end
	end
end
function Chest_12500()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Chest1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 12500 then
			_G.Chest_12500 = v
			return
		elseif v.Name == "Chest2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 12500 then
			_G.Chest_12500 = v
			return
		end
	end
end
function Chest_15500()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Chest1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 15500 then
			_G.Chest_15500 = v
			return
		elseif v.Name == "Chest2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 15500 then
			_G.Chest_15500 = v
			return
		end
	end
end
function Chest_17500()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Chest1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 17500 then
			_G.Chest_17500 = v
			return
		elseif v.Name == "Chest2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 17500 then
			_G.Chest_17500 = v
			return
		end
	end
end
 
Main:Toggle("Stop If have key and cup", true, function(value)
_G.StopItemsChest = value
end)

spawn(function()
    while wait() do
        pcall(function()
            if _G.StopItemsChest then
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") then
                    Grab_Chest = false
                    topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
            end
        end)
    end
end)

Main:Toggle("Auto Space", false, function(value)
_G.PressQ = value
end)

spawn(function()
		while wait(.5) do
			if _G.PressQ then
				game:service('VirtualInputManager'):SendKeyEvent(true, "Space", false, game)
				wait(.3)
				game:service('VirtualInputManager'):SendKeyEvent(false, "Space", false, game)
			end
		end
	 end)
                                
Main:Label("Misc Farm")

Main:Button("Boost Fps",function()
game:GetService("Players").LocalPlayer.PlayerGui.Notifications.Enabled = false
			shared = {}
			shared.BC_1 = true
			shared.BC_2 = nil

			if shared.BC_1 and shared.BC_2 == nil then
				L_1 = game:GetService("Workspace");
				L_2 = game:GetService("Lighting");
				L_3 = L_1.Terrain;
				L_4 = game:GetService("Players");
				L_5 = L_4.LocalPlayer.Character;
				
				L_3.WaterWaveSize = 0;L_3.WaterWaveSpeed = 0;L_3.WaterReflectance = 0;L_3.WaterTransparency = 0;
				L_2.GlobalShadows = false;L_2.FogEnd = tonumber(9e9);L_2.Brightness = 0;
				settings().Rendering.QualityLevel = "Level01";
				settings().Rendering.GraphicsMode = "NoGraphics";
				for i,v in pairs(L_1:GetDescendants()) do
					if v.ClassName == "Part" or v.ClassName == "SpawnLocation" or v.ClassName == "WedgePart" or v.ClassName == "Terrain" or v.ClassName == "MeshPart" then
						v.Material = "Plastic";v.Reflectance = 0;v.CastShadow = false;
					elseif v.ClassName == "Decal" or v:IsA("Texture") then
						v.Texture = 0;v.Transparency = 1;
					elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
						v.LightInfluence = 0;v.Texture = 0;v.Lifetime = NumberRange.new(0);
					elseif v:IsA("Explosion") then
						v.BlastPressure = 0;v.BlastRadius = 0;
					elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
						v.Enabled = false;
					elseif v:IsA("MeshPart") then
						v.Material = "Plastic";v.Reflectance = 0;v.TextureId = 0;v.CastShadow = false;v.RenderFidelity = Enum.RenderFidelity.Performance;
					elseif v.ClassName == "SpecialMesh" then
						v.TextureId = "rbxassetid://0";
					elseif v.ClassName == "Shirt" or v.ClassName == "Pants" or v.ClassName == "Accessory" then
						v:Destroy();
					end
				end
				for i,v in pairs(L_2:GetDescendants()) do
					if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
						v.Enabled = false;
					end
				end
				for i,v in pairs(L_5:GetDescendants()) do
					if v.ClassName == "Shirt" or v.ClassName == "Pants" or v.ClassName == "Accessory" then
						v:Destroy();
					     end
					end
				end
			end
)
    
local x2Code = {
      "REWARDFUN",
      "Chandler",
      "NEWTROLL",
      "KITT_RESET",
      "Sub2CaptainMaui",
      "DEVSCOOKING",
      "kittgaming",
      "Sub2Fer999",
      "Enyu_is_Pro",
      "Magicbus",
      "JCWK",
      "Starcodeheo",
      "Bluxxy",
      "fudd10_v2",
      "SUB2GAMERROBOT_EXP1",
      "Sub2NoobMaster123",
      "Sub2UncleKizaru",
      "Sub2Daigrock",
      "Axiore",
      "TantaiGaming",
      "StrawHatMaine",
      "Sub2OfficialNoobie",
      "Fudd10",
      "Bignews",
      "TheGreatAce",
      "DRAGONABUSE",
      "SECRET_ADMIN",
      "ADMIN_TROLL",
      "STAFFBATTLE",
      "ADMIN_STRENGTH",
      "JULYUPDATE_RESET",
      "NOOB_REFUND",
      "15B_BESTBROTHERS",
      "CINCODEMAYO_BOOST",
      "ADMINGIVEAWAY",
      "GAMER_ROBOT_1M",
      "SUBGAMERROBOT_RESET",
      "SUB2GAMERROBOT_RESET1",
      "GAMERROBOT_YT",
      "TY_FOR_WATCHING",
      "EXP_5B",
      "RESET_5B",
      "UPD16",
      "3BVISITS",
      "2BILLION",
      "UPD15",
      "THIRDSEA",
      "1MLIKES_RESET",
      "UPD14",
      "1BILLION",
      "ShutDownFix2",
      "XmasExp",
      "XmasReset",
      "Update11",
      "PointsReset",
      "Update10",
      "Control",
      "SUB2OFFICIALNOOBIE",
      "AXIORE",
      "BIGNEWS",
      "BLUXXY",
      "CHANDLER",
      "ENYU_IS_PRO",
      "FUDD10",
      "FUDD10_V2",
      "KITTGAMING",
      "MAGICBUS",
      "STARCODEHEO",
      "STRAWHATMAINE",
      "SUB2CAPTAINMAUI",
      "SUB2DAIGROCK",
      "SUB2FER999",
      "SUB2NOOBMASTER123",
      "SUB2UNCLEKIZARU",
      "TANTAIGAMING",
      "THEGREATACE",
      "CONTROL",
      "UPDATE11",
      "XMASEXP",
      "Colosseum",
    }

Main:Button("Redeem All Code",function()
function _G.RedeemCode(value)
            game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(value)
        end
        for i,v in pairs(x2Code) do
            _G.RedeemCode(v)
        end
        end)
 
--//Quest Sea 2 + 1

Quest:Toggle("Auto Second Sea", false, function(value)
        _G.AutoSecondSea = value
        StopTween(_G.AutoSecondSea)
    end)
    spawn(function()
 while wait() do
 if _G.AutoSecondSea then
 pcall(function()
  if game.Players.LocalPlayer.Data.Level.Value >= 700 and World1 then
  _G.FarmLevel2 = false
  if game.Workspace.Map.Ice.Door.CanCollide == true and game.Workspace.Map.Ice.Door.Transparency == 0 then
  repeat wait() topos(CFrame.new(4851.8720703125, 5.6514348983765, 718.47094726563)) until (CFrame.new(4851.8720703125, 5.6514348983765, 718.47094726563).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.AutoSecondSea
  wait(1)
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
  EquipWeapon("Key")
  local pos2 = CFrame.new(1347.7124, 37.3751602, -1325.6488)
  repeat wait() topos(pos2) until (pos2.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.AutoSecondSea
  wait(3)
  elseif game.Workspace.Map.Ice.Door.CanCollide == false and game.Workspace.Map.Ice.Door.Transparency == 1 then
  if game:GetService("Workspace").Enemies:FindFirstChild("Ice Admiral") then
  for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
  if v.Name == "Ice Admiral" and v.Humanoid.Health > 0 then
  repeat wait()
  AutoHaki()
  EquipWeapon(_G.SelectWeapon)
  v.HumanoidRootPart.CanCollide = false
  v.HumanoidRootPart.Size = Vector3.new(60,60,60)
  v.HumanoidRootPart.Transparency = 1
  topos(v.HumanoidRootPart.CFrame * CFrame.new(PosX,PosY,PosZ))
  game:GetService("VirtualUser"):CaptureController()
  game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 870),workspace.CurrentCamera.CFrame)
  until v.Humanoid.Health <= 0 or not v.Parent or not _G.AutoSecondSea
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
  end
  end
  else
   topos(CFrame.new(1347.7124, 37.3751602, -1325.6488))
  end
  else
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
  end
  end
  end)
 end
 end
 end)
 
 Quest:Toggle("Auto Kill White Beard", false, function(value)
    _G.Autogay = value
    StopTween(_G.Autogay)
end)
local GayMakPos = CFrame.new(-5023.38330078125, 28.65203285217285, 4332.3818359375)
spawn(function()
    while wait() do
        if  _G.Autogay and World1 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Greybeard") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Greybeard" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                until not  _G.Autogay or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                if BypassTP then
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - GayMakPos.Position).Magnitude > 1500 then
                BTP(GayMakPos)
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - GayMakPos.Position).Magnitude < 1500 then
                topos(GayMakPos)
                end
            else
                topos(GayMakPos)
            end
                UnEquipWeapon(_G.SelectWeapon)
                topos(CFrame.new(-5023.38330078125, 28.65203285217285, 4332.3818359375))
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Greybeard") then
                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Greybeard").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                    else
                        if  _G.Autogayhop then
                            Hop()
                        end
                    end
                end
            end)
        end
    end
end)


Quest:Label("Item First Sea")
 
Quest:Toggle("Auto Saber", false, function(value)
        _G.Auto_Saber = value
        StopTween(_G.Auto_Saber)
    end)
    spawn(function()
        while task.wait() do
            if _G.Auto_Saber and game.Players.LocalPlayer.Data.Level.Value >= 200 then
                pcall(function()
                    if game:GetService("Workspace").Map.Jungle.Final.Part.Transparency == 0 then
                        if game:GetService("Workspace").Map.Jungle.QuestPlates.Door.Transparency == 0 then
                            if (CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
                                topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate1.Button.CFrame
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate2.Button.CFrame
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate3.Button.CFrame
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate4.Button.CFrame
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate5.Button.CFrame
                                wait(1)
                            else
                                topos(CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279))
                            end
                        else
                            if game:GetService("Workspace").Map.Desert.Burn.Part.Transparency == 0 then
                                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch") then
                                    EquipWeapon("Torch")
                                    topos(CFrame.new(1114.61475, 5.04679728, 4350.22803, -0.648466587, -1.28799094e-09, 0.761243105, -5.70652914e-10, 1, 1.20584542e-09, -0.761243105, 3.47544882e-10, -0.648466587))
                                  else
                                  topos(CFrame.new(-1610.00757, 11.5049858, 164.001587, 0.984807551, -0.167722285, -0.0449818149, 0.17364943, 0.951244235, 0.254912198, 3.42372805e-05, -0.258850515, 0.965917408))
                                end
                            else
                                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") ~= 0 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","GetCup")
                                    wait(0.5)
                                    EquipWeapon("Cup")
                                    wait(0.5)
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","FillCup",game:GetService("Players").LocalPlayer.Character.Cup)
                                    wait(0)
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan")
                                else
                                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == nil then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                                    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 0 then
                                    if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader") or game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader") then
										topos(CFrame.new(-2967.59521, -4.91089821, 5328.70703, 0.342208564, -0.0227849055, 0.939347804, 0.0251603816, 0.999569714, 0.0150796166, -0.939287126, 0.0184739735, 0.342634559)) 
                                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                                if v.Name == "Mob Leader" then
                                                   if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader [Lv. 120] [Boss]") then
                                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                                        repeat task.wait(_G.FastAttackDelay)
                                                        AutoHaki()
                                                        EquipWeapon(_G.SelectWeapon)
                                                        v.HumanoidRootPart.CanCollide = false
                                                        v.Humanoid.WalkSpeed = 0
                                                        v.HumanoidRootPart.Size = Vector3.new(80,80,80)
                                                        topos(v.HumanoidRootPart.CFrame * Pos)
                                                        AttackNoCD()
                                                        -- sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                                        until v.Humanoid.Health <= 0 or not _G.Auto_Saber
                                                     end
                                                end
                                                if game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader") then
                                                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader").HumanoidRootPart.CFrame * Farm_Mode)
                                                end
                                            end
                                        end
                                     end
                                    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 1 then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                                        wait(0.5)
                                        EquipWeapon("Relic")
                                        wait(0.5)
                                        topos(CFrame.new(-1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.66906877e-09, 0.481375456, 2.53851997e-08, 1, -5.79995607e-08, -0.481375456, 6.30572643e-08, 0.876514494))
                                    end
                                end
                            end
                        end
                    else
                        if game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert") or game:GetService("ReplicatedStorage"):FindFirstChild("Saber Expert") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    if v.Name == "Saber Expert" then
                                        repeat task.wait(_G.FastAttackDelay)
                                            EquipWeapon(_G.SelectWeapon)
                                            topos(v.HumanoidRootPart.CFrame * Pos)
                                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                            v.HumanoidRootPart.Transparency = 1
                                            v.Humanoid.JumpPower = 0
                                            v.Humanoid.WalkSpeed = 0
                                            v.HumanoidRootPart.CanCollide = false
                                            StartBring = true
                                            PosMon = v.HumanoidRootPart.CFrame
                                            MonFarm = v.Name
                                            AttackNoCD()
                                        until v.Humanoid.Health <= 0 or not _G.Auto_Saber
                                        StartBring = true
                                        if v.Humanoid.Health <= 0 then
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","PlaceRelic")
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)
    
Quest:Toggle("Auto Pole", false, function(value)
        _G.AutoPole = value
        StopTween(_G.AutoPole)
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoPole then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Thunder God") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Thunder God" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        topos(v.HumanoidRootPart.CFrame * MethodFarm)                         
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                        sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    until not _G.AutoPole or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God").HumanoidRootPart.CFrame * CFrame.new(5,10,7))
                        else
                            if _G.AutoPoleHop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
   
Quest:Label("Second Sea")

Quest:Toggle("Auto Bartilo Quest", false, function(Vu)
_G.AutoBartilo = Vu
end)

spawn(function()
    pcall(function()
        while wait(.1) do
            if _G.AutoBartilo then
                if game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then
                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then 
                        if game:GetService("Workspace").Enemies:FindFirstChild("Swan Pirate") then
                            Ms = "Swan Pirate"
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == Ms then
                                    pcall(function()
                                        repeat task.wait()
                                            sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                            EquipWeapon(_G.SelectWeapon)
                                            AutoHaki()
                                            v.HumanoidRootPart.Transparency = 1
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                            topos(v.HumanoidRootPart.CFrame * Pos)													
                                            PosMonBarto =  v.HumanoidRootPart.CFrame
                                            game:GetService'VirtualUser':CaptureController()
                                            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                            AutoBartiloBring = true
                                        until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoBartilo == false or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                        AutoBartiloBring = false
                                    end)
                                end
                            end
                        else
                            repeat topos(CFrame.new(932.624451, 156.106079, 1180.27466, -0.973085582, 4.55137119e-08, -0.230443969, 2.67024713e-08, 1, 8.47491108e-08, 0.230443969, 7.63147128e-08, -0.973085582)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(932.624451, 156.106079, 1180.27466, -0.973085582, 4.55137119e-08, -0.230443969, 2.67024713e-08, 1, 8.47491108e-08, 0.230443969, 7.63147128e-08, -0.973085582)).Magnitude <= 10
                        end
                    else
                        repeat topos(CFrame.new(-456.28952, 73.0200958, 299.895966)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-456.28952, 73.0200958, 299.895966)).Magnitude <= 10
                        wait(1.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","BartiloQuest",1)
                    end 
                elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Jeremy") then
                        Ms = "Jeremy"
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == Ms then
                                OldCFrameBartlio = v.HumanoidRootPart.CFrame
                                repeat task.wait()
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                    v.HumanoidRootPart.Transparency = 1
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    v.HumanoidRootPart.CFrame = OldCFrameBartlio
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    game:GetService'VirtualUser':CaptureController()
                                    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                    sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoBartilo == false
                            end
                        end
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Jeremy") then
                        repeat topos(CFrame.new(-456.28952, 73.0200958, 299.895966)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-456.28952, 73.0200958, 299.895966)).Magnitude <= 10
                        wait(1.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo")
                        wait(1)
                        repeat topos(CFrame.new(2099.88159, 448.931, 648.997375)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(2099.88159, 448.931, 648.997375)).Magnitude <= 10
                        wait(2)
                    else
                        repeat topos(CFrame.new(2099.88159, 448.931, 648.997375)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(2099.88159, 448.931, 648.997375)).Magnitude <= 10
                    end
                elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
                    repeat topos(CFrame.new(-1850.49329, 13.1789551, 1750.89685)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1850.49329, 13.1789551, 1750.89685)).Magnitude <= 10
                    wait(1)
                    repeat topos(CFrame.new(-1858.87305, 19.3777466, 1712.01807)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1858.87305, 19.3777466, 1712.01807)).Magnitude <= 10
                    wait(1)
                    repeat topos(CFrame.new(-1803.94324, 16.5789185, 1750.89685)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1803.94324, 16.5789185, 1750.89685)).Magnitude <= 10
                    wait(1)
                    repeat topos(CFrame.new(-1858.55835, 16.8604317, 1724.79541)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1858.55835, 16.8604317, 1724.79541)).Magnitude <= 10
                    wait(1)
                    repeat topos(CFrame.new(-1869.54224, 15.987854, 1681.00659)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1869.54224, 15.987854, 1681.00659)).Magnitude <= 10
                    wait(1)
                    repeat topos(CFrame.new(-1800.0979, 16.4978027, 1684.52368)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1800.0979, 16.4978027, 1684.52368)).Magnitude <= 10
                    wait(1)
                    repeat topos(CFrame.new(-1819.26343, 14.795166, 1717.90625)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1819.26343, 14.795166, 1717.90625)).Magnitude <= 10
                    wait(1)
                    repeat topos(CFrame.new(-1813.51843, 14.8604736, 1724.79541)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1813.51843, 14.8604736, 1724.79541)).Magnitude <= 10
                end
            end 
        end
    end)
end)

Quest:Toggle("Evo Race V2", false, function(Vu)
_G.Auto_EvoRace = Vu
StopTween(_G.Auto_EvoRace)
end)
spawn(function()
    pcall(function()
        while wait(.1) do
            if _G.Auto_EvoRace then
                if not game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved") then
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then
                        topos(CFrame.new(-2779.83521, 72.9661407, -3574.02002, -0.730484903, 6.39014104e-08, -0.68292886, 3.59963224e-08, 1, 5.50667032e-08, 0.68292886, 1.56424669e-08, -0.730484903))
                        if (Vector3.new(-2779.83521, 72.9661407, -3574.02002) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
                            wait(1.3)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","2")
                        end
                    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then
                        pcall(function()
                            if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1") then
                                topos(game:GetService("Workspace").Flower1.CFrame)
                            elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2") then
                                topos(game:GetService("Workspace").Flower2.CFrame)
                            elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3") then
                                if game:GetService("Workspace").Enemies:FindFirstChild("Zombie") then
                                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if v.Name == "Zombie" then
                                            repeat task.wait(_G.FastAttackDelay)
                                                AutoHaki()
                                                EquipWeapon(_G.SelectWeapon)
                                                topos(v.HumanoidRootPart.CFrame * Pos)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                PosMon = v.HumanoidRootPart.CFrame
                                                MonFarm = v.Name
                                                StartBring = true
                                            until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_EvoRace == false
                                            StartEvoMagnet = false
                                        end
                                    end
                                else
                                    topos(CFrame.new(-5685.9233398438, 48.480125427246, -853.23724365234))
                                end
                            end
                        end)
                    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","3")
                    end
                end
            end
        end
    end)
end)

Quest:Label("Factory")

Quest:Toggle("Auto Factory", false, function(Vu)
_G.Auto_Nha_Dien = Vu
StopTween(_G.Auto_Nha_Dien)
end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.Auto_Nha_Dien and World2 then
                if game:GetService("Workspace").Enemies:FindFirstChild("Core") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Core" and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                AutoHaki()         
                                EquipWeapon(_G.SelectWeapon)           
                                topos(CFrame.new(448.46756, 199.356781, -441.389252))
                            until v.Humanoid.Health <= 0 or _G.Auto_Nha_Dien == false
                        end
                    end
                else             
                    topos(CFrame.new(448.46756, 199.356781, -441.389252))
                end
            end
        end)
    end
end)

Quest:Label("Rengoku")

Quest:Toggle("Auto Rengoku", false, function(Vu)
_G.Kiem_Lua = Vu
StopTween(_G.Kiem_Lua)
end)
spawn(function()
        pcall(function()
            while wait() do
                if _G.Kiem_Lua and World2 then
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hidden Key") then
                        EquipWeapon("Hidden Key")
                        topos(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875))
                    elseif game:GetService("Workspace").Enemies:FindFirstChild("Snow Lurker") or game:GetService("Workspace").Enemies:FindFirstChild("Arctic Warrior") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v.Name == "Snow Lurker" or v.Name == "Arctic Warrior") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()                                    
                                    v.HumanoidRootPart.CanCollide = false
                                    RengokuMon = v.HumanoidRootPart.CFrame
                                    topos(v.HumanoidRootPart.CFrame * Pos)      
                                    RenGuKu = true
                                until _G.Kiem_Lua == false or not v.Parent or v.Humanoid.Health <= 0
                                StartRengokuMagnet = false
                            end
                        end
                    else
                        RenGuKu = false
                        topos(CFrame.new(5439.716796875, 84.420944213867, -6715.1635742188))
                    end
                end
            end
        end)
    end)
    
Quest:Label("Trident Sw")

Quest:Toggle("Auto Trident Sw", false, function(Vu)
_G.Auto_Dragon_Trident = Vu
StopTween(_G.Auto_Dragon_Trident)
end)
local TridentPos = CFrame.new(-3914.830322265625, 123.29389190673828, -11516.8642578125)
spawn(function()
    while wait() do
        if  _G.Auto_Dragon_Trident and World2 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Tide Keeper") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Tide Keeper" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                    sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                until not  _G.Auto_Dragon_Trident or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                if BypassTP then
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - TridentPos.Position).Magnitude > 1500 then
                BTP(TridentPos)
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - TridentPos.Position).Magnitude < 1500 then
                topos(TridentPos)
                end
            else
                topos(TridentPos)
            end
                UnEquipWeapon(_G.SelectWeapon)
                topos(CFrame.new(-3914.830322265625, 123.29389190673828, -11516.8642578125))
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Tide Keeper") then
                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Tide Keeper").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                    else
                        if  _G.Auto_Dragon_Trident_Hop then
                            Hopless()
                        end
                    end
                end
            end)
        end
    end
end)

Quest:Label("Dark Beard")

Quest:Toggle("Fully Auto Dark Bear", false, function(Vu)
_G.Auto_DarkBoss = Vu
_G.Spawn = Vu
_G.PressQ = Vu
Grab_Chest = Vu
end)

spawn(function()
		pcall(function()
			while wait() do
				if _G.Spawn and World2 then
					if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") then 
					    EquipWeapon("Fist of Darkness")
                        topos(CFrame.new(3777.63330078125, 14.975979804992676, -3499.052001953125))
					end
				end
			end
		end)
	end)
	
Quest:Toggle("Auto Dark Bear", false, function(Vu)
_G.Auto_DarkBoss = Vu
end)

spawn(function()
        while wait() do
            if _G.Auto_DarkBoss then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Darkbeard") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Darkbeard" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki() 
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(80,80,80)                             
                                        topos(v.HumanoidRootPart.CFrame *Pos)
                                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until not _G.Auto_DarkBoss or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Darkbeard") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Darkbeard").HumanoidRootPart.CFrame * CFrame.new(5,10,2))
                        end
                    end
                end)
            end
        end
    end)    
    
Quest:Button("Spawn Dark Beard", function()
if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") then
                        EquipWeapon("Fist of Darkness")
                        topos(CFrame.new(3777.63330078125, 14.975979804992676, -3499.052001953125))
                        end
                        end)
                       
Quest:Label("Yoru V3")

Quest:Toggle("Chest Farm For Fist Of Darkness", false, function(vu)
	Grab_Chest2 = vu
    StopTween(Grab_Chest2)
	T_P_H = vu
	_G.STP = vu
	end)
	
	if _G.Grab_Chest2 then
	Grab_Chest2 = true
end
spawn(function()
	while wait(2) do
		pcall(function()
			if _G.Hop_Chest then
				if K_CH >= _G.K_MAX and not H_F then
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Character:FindFirstChild("Fist of Darkness") then
						H_F = true
					else
						Hop()
						wait(50)
					end
				end
			end
		end)
	end
end)

spawn(function()
    while wait(.2) do
        pcall(function()
            if Grab_Chest2 then
                if T_P_H then
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Character:FindFirstChild("Fist of Darkness") then
                        topos(CFrame.new(-379.70889282227, 73.0458984375, 304.84692382813))
                        H_F = true
						game:GetService'VirtualUser':Button1Down(Vector2.new(1280,600))
                        wait(3)
                    else
						_G.Chest_100 = nil
						_G.Chest_500 = nil
						_G.Chest_1000 = nil
						_G.Chest_1500 = nil
						_G.Chest_2000 = nil
						_G.Chest_2500 = nil
						_G.Chest_3500 = nil
						_G.Chest_4500 = nil
						_G.Chest_5500 = nil
						_G.Chest_6500 = nil
						_G.Chest_7500 = nil
						_G.Chest_9500 = nil
						_G.Chest_10500 = nil
						_G.Chest_12500 = nil
						_G.Chest_15500 = nil
						_G.Chest_17500 = nil
						Chest_100()
						Chest_500()
						Chest_1000()
						Chest_1500()
						Chest_2000()
						Chest_2500()
						Chest_3500()
						Chest_4500()
						Chest_5500()
						Chest_6500()
						Chest_7500()
						Chest_9500()
						Chest_10500()
						Chest_12500()
						Chest_15500()
						Chest_17500()
						if _G.Chest_100 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_100.CFrame)
							until not _G.Chest_100.Parent or not Grab_Chest2
							if Grab_Chest2 then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_500.CFrame)
							until not _G.Chest_500.Parent or not Grab_Chest2
							if Grab_Chest2 then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_1000 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_1000.CFrame)
							until not _G.Chest_1000.Parent or not Grab_Chest2
							if Grab_Chest2 then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_1500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_1500.CFrame)
							until not _G.Chest_1500.Parent or not Grab_Chest2
							if Grab_Chest2 then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_2000 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_2000.CFrame)
							until not _G.Chest_2000.Parent or not Grab_Chest2
							if Grab_Chest2 then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_2500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_2500.CFrame)
							until not _G.Chest_2500.Parent or not Grab_Chest2
							if Grab_Chest2 then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_3500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_3500.CFrame)
							until not _G.Chest_3500.Parent or not Grab_Chest2
							if Grab_Chest2 then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_4500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_4500.CFrame)
							until not _G.Chest_4500.Parent or not Grab_Chest2
							if Grab_Chest2 then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_5500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_5500.CFrame)
							until not _G.Chest_5500.Parent or not Grab_Chest2
							if Grab_Chest2 then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_6500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_6500.CFrame)
							until not _G.Chest_6500.Parent or not Grab_Chest2
							if Grab_Chest2 then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_7500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_7500.CFrame)
							until not _G.Chest_7500.Parent or not Grab_Chest2
							if Grab_Chest2 then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_9500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_9500.CFrame)
							until not _G.Chest_9500.Parent or not Grab_Chest2
							if Grab_Chest2 then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_10500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_10500.CFrame)
							until not _G.Chest_10500.Parent or not Grab_Chest2
							if Grab_Chest2 then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_12500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_12500.CFrame)
							until not _G.Chest_12500.Parent or not Grab_Chest2
							if Grab_Chest2 then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_15500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_15500.CFrame)
							until not _G.Chest_15500.Parent or not Grab_Chest2
							if Grab_Chest2 then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_17500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_17500.CFrame)
							until not _G.Chest_17500.Parent or not Grab_Chest2
							if Grab_Chest2 then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						end
                    end
                else
                    _G.Chest_100 = nil
						_G.Chest_500 = nil
						_G.Chest_1000 = nil
						_G.Chest_1500 = nil
						_G.Chest_2000 = nil
						_G.Chest_2500 = nil
						_G.Chest_3500 = nil
						_G.Chest_4500 = nil
						_G.Chest_5500 = nil
						_G.Chest_6500 = nil
						_G.Chest_7500 = nil
						_G.Chest_9500 = nil
						_G.Chest_10500 = nil
						_G.Chest_12500 = nil
						_G.Chest_15500 = nil
						_G.Chest_17500 = nil
						Chest_100()
						Chest_500()
						Chest_1000()
						Chest_1500()
						Chest_2000()
						Chest_2500()
						Chest_3500()
						Chest_4500()
						Chest_5500()
						Chest_6500()
						Chest_7500()
						Chest_9500()
						Chest_10500()
						Chest_12500()
						Chest_15500()
						Chest_17500()
						if _G.Chest_100 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_100.CFrame)
							until not _G.Chest_100.Parent or not Grab_Chest2
							if Grab_Chest2 then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_500.CFrame)
							until not _G.Chest_500.Parent or not Grab_Chest2
							if Grab_Chest2 then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_1000 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_1000.CFrame)
							until not _G.Chest_1000.Parent or not Grab_Chest2
							if Grab_Chest2 then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_1500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_1500.CFrame)
							until not _G.Chest_1500.Parent or not Grab_Chest2
							if Grab_Chest2 then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_2000 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_2000.CFrame)
							until not _G.Chest_2000.Parent or not Grab_Chest2
							if Grab_Chest2 then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_2500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_2500.CFrame)
							until not _G.Chest_2500.Parent or not Grab_Chest2
							if Grab_Chest2 then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_3500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_3500.CFrame)
							until not _G.Chest_3500.Parent or not Grab_Chest2
							if Grab_Chest2 then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_4500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_4500.CFrame)
							until not _G.Chest_4500.Parent or not Grab_Chest2
							if Grab_Chest2 then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_5500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_5500.CFrame)
							until not _G.Chest_5500.Parent or not Grab_Chest2
							if Grab_Chest2 then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_6500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_6500.CFrame)
							until not _G.Chest_6500.Parent or not Grab_Chest2
							if Grab_Chest2 then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_7500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_7500.CFrame)
							until not _G.Chest_7500.Parent or not Grab_Chest2
							if Grab_Chest2 then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_9500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_9500.CFrame)
							until not _G.Chest_9500.Parent or not Grab_Chest2
							if Grab_Chest2 then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_10500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_10500.CFrame)
							until not _G.Chest_10500.Parent or not Grab_Chest2
							if Grab_Chest2 then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_12500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_12500.CFrame)
							until not _G.Chest_12500.Parent or not Grab_Chest2
							if Grab_Chest2 then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_15500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_15500.CFrame)
							until not _G.Chest_15500.Parent or not Grab_Chest2
							if Grab_Chest2 then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						elseif _G.Chest_17500 ~= nil then
							repeat wait(.3)
								TP(_G.Chest_17500.CFrame)
							until not _G.Chest_17500.Parent or not Grab_Chest2
							if Grab_Chest2 then
								K_CH = K_CH + 1
								K_C:Set('Chest : '..tostring(K_CH).."/".._G.K_MAX)
							end
						end
                end
            end
        end)
    end
end)

function Chest_100()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Chest1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
			_G.Chest_100 = v
			return
		elseif v.Name == "Chest2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
			_G.Chest_100 = v
			return
		end
	end
end
function Chest_500()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Chest1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
			_G.Chest_500 = v
			return
		elseif v.Name == "Chest2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
			_G.Chest_500 = v
			return
		end
	end
end
function Chest_1000()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Chest1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1000 then
			_G.Chest_1000 = v
			return
		elseif v.Name == "Chest2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1000 then
			_G.Chest_1000 = v
			return
		end
	end
end
function Chest_1500()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Chest1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1500 then
			_G.Chest_1500 = v
			return
		elseif v.Name == "Chest2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1500 then
			_G.Chest_1500 = v
			return
		end
	end
end
function Chest_2000()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Chest1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 then
			_G.Chest_2000 = v
			return
		elseif v.Name == "Chest2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 then
			_G.Chest_2000 = v
			return
		end
	end
end
function Chest_2500()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Chest1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2500 then
			_G.Chest_2500 = v
			return
		elseif v.Name == "Chest2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2500 then
			_G.Chest_2500 = v
			return
		end
	end
end
function Chest_3500()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Chest1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3500 then
			_G.Chest_3500 = v
			return
		elseif v.Name == "Chest2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3500 then
			_G.Chest_3500 = v
			return
		end
	end
end
function Chest_4500()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Chest1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4500 then
			_G.Chest_4500 = v
			return
		elseif v.Name == "Chest2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4500 then
			_G.Chest_4500 = v
			return
		end
	end
end
function Chest_5500()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Chest1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5500 then
			_G.Chest_5500 = v
			return
		elseif v.Name == "Chest2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5500 then
			_G.Chest_5500 = v
			return
		end
	end
end
function Chest_6500()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Chest1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 6500 then
			_G.Chest_6500 = v
			return
		elseif v.Name == "Chest2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 6500 then
			_G.Chest_6500 = v
			return
		end
	end
end
function Chest_7500()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Chest1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 7500 then
			_G.Chest_7500 = v
			return
		elseif v.Name == "Chest2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 7500 then
			_G.Chest_7500 = v
			return
		end
	end
end
function Chest_9500()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Chest1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 9500 then
			_G.Chest_9500 = v
			return
		elseif v.Name == "Chest2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 9500 then
			_G.Chest_9500 = v
			return
		end
	end
end
function Chest_10500()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Chest1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10500 then
			_G.Chest_10500 = v
			return
		elseif v.Name == "Chest2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10500 then
			_G.Chest_10500 = v
			return
		end
	end
end
function Chest_12500()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Chest1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 12500 then
			_G.Chest_12500 = v
			return
		elseif v.Name == "Chest2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 12500 then
			_G.Chest_12500 = v
			return
		end
	end
end
function Chest_15500()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Chest1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 15500 then
			_G.Chest_15500 = v
			return
		elseif v.Name == "Chest2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 15500 then
			_G.Chest_15500 = v
			return
		end
	end
end
function Chest_17500()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Chest1" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 17500 then
			_G.Chest_17500 = v
			return
		elseif v.Name == "Chest2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 17500 then
			_G.Chest_17500 = v
			return
		end
	end
end

Quest:Toggle("Stop If Have Key", true, function(Vu)
_G.StopItemsChest2 = Vu
end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.StopItemsChest2 then
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") then
                    Grab_Chest2 = false
                    _G.Auto_Seabest = false
                    topos(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828))
                end
            end
        end)
    end
end)

Quest:Button("Spawn Dark Beard For Yoru V3", function()
if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") then
                        EquipWeapon("Fist of Darkness")
                        topos(CFrame.new(3777.63330078125, 14.975979804992676, -3499.052001953125))
                        end
                        end)
                        
Quest:Button("Tween Place Up Yoru V3", function()
if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") then
UnEquipWeapon("Fist of Darkness")
topos(CFrame.new(-5726.02392578125, 48.60545349121094,-773.9669799804688))
end 
end)

Quest:Label("Don Swan")

Quest:Toggle("Auto Swan Glasses", false, function(value)
    _G.AutoFarmSwanGlasses = value
    StopTween(_G.AutoFarmSwanGlasses)
end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoFarmSwanGlasses then
                if game:GetService("Workspace").Enemies:FindFirstChild("Don Swan") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Don Swan" and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                            repeat task.wait()
                                pcall(function()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670))
                                    sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                end)
                            until _G.AutoFarmSwanGlasses == false or v.Humanoid.Health <= 0
                        end
                    end
                else 
                    repeat task.wait()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(2284.912109375, 15.537666320801, 905.48291015625)) 
                    until (CFrame.new(2284.912109375, 15.537666320801, 905.48291015625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 or _G.AutoFarmSwanGlasses == false
                end
            end
        end
    end)
end)
spawn(function()
    pcall(function()
        while wait(.1) do
            if (_G.AutoFarmSwanGlasses and _G.AutoFarmSwanGlasses_Hop) and World2 and not game:GetService("ReplicatedStorage"):FindFirstChild("Don Swan") and not game:GetService("Workspace").Enemies:FindFirstChild("Don Swan") then
                Hop()
            end
        end
    end)
end)

Quest:Label("True Triple Katana")

 Shisui = Quest:LabelP("❌ : Shisui")
 Saddi = Quest:LabelP("❌ : Saddi")
 Wando = Quest:LabelP("❌ : Wando")
 True_Triple_Katana = Quest:LabelP("❌ : True Triple Katana")

spawn(function()
  while task.wait() do
  pcall(function()
    for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")) do
    if v.Name == "Shisui" then
    Shisui:Set("✅ : Shisui")
    end
    if v.Name == "Saddi" then
    Saddi:Set("✅ : Saddi")
    end
    if v.Name == "Wando" then
    Wando:Set("✅ : Wando")
    end
    if v.Name == "True Triple Katana" then
    True_Triple_Katana:Set("✅ : True Triple Katana")
    end
    end
    end)
  end
  end)
  
Quest:Toggle("Auto Legendary Sw", false, function(Vu)
_G.BuyLengendSword = Vu
end)
task.spawn(function()
    while wait() do
    pcall(function()
      if _G.BuyLengendSword then
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer","1")
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer","2")
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer","3")
        end
      end)
    end
end)

Quest:Toggle("Buy True Triple Katana", false, function(Vu)
_G.BuyTTK = Vu
end)

task.spawn(function()
    while wait() do
    pcall(function()
      if _G.BuyTTK then
      local A_1 = "MysteriousMan"
      local A_2 = "2"
      local Event = game:GetService("ReplicatedStorage").Remotes["CommF_"]
            Event:InvokeServer(A_1, A_2)
        end
      end)
    end
end)

Quest:Label("Cyborg")

Quest:Toggle("Auto Cyborg", false, function(Vu)
Cyborg = Vu
Grab_Chest2 = Vu
_G.PressQ = Vu
StopTween(Grab_Chest2)
end)

spawn(function()
		pcall(function()
			while wait() do
				if Cyborg and World2 then
					if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") then 
					    _G.autoLawRaid = true
					    fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
					end
				end
			end
		end)
	end)
	
spawn(function()
		pcall(function()
			while wait() do
				if Cyborg and World2 then
					if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Core Brain") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") then 
					    _G.autoLawRaid = false
					    fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
					end
				end
			end
		end)
	end)
	
Quest:Label("Third Sea")

Quest:Toggle("Auto Elite", false, function(Vu)
_G.Eli_Ngu = Vu
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
 StopTween(_G.Eli_Ngu)
end)    

spawn(function()
        while wait() do
            if _G.Eli_Ngu then
                pcall(function()
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
						if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Diablo") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Deandre") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Urban") then
							if game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Diablo" or v.Name == "Deandre" or v.Name == "Urban" then
										if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
											repeat wait()
												AutoHaki()
                                                EquipWeapon(_G.SelectWeapon)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                topos(v.HumanoidRootPart.CFrame *Pos)
                                                
                                                sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                            until _G.Eli_Ngu == false or v.Humanoid.Health <= 0 or not v.Parent
										end
									end
								end
							else
								if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") then
                                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
                                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
                                    topos(game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
								end
							end                    
						end
					else

						if _G.AutoEliteHunterHop and game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("EliteHunter") == "I don't have anything for you right now. Come back later." then
							Hopless()
						else
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
						end
					end
				end)
			end
		end
	end)
	
Quest:Toggle("Auto Yama", false, function(Vu)
_G.AutoYama = Vu
end)
spawn(function()
    while wait() do
        if _G.AutoYama then
            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress") >= 30 then
                repeat wait(.1)
                    fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
                until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Yama") or not _G.AutoYama
            end
        end
    end
end)

Quest:Label("Tushita Sw")

Quest:Toggle("Auto Tushita", false, function(Vu)
_G.Di_nghia_vu_quan_su = Vu
StopTween(_G.Di_nghia_vu_quan_su)
end)

spawn(function()
    while wait(.5) do
        pcall(function()
            if _G.Di_nghia_vu_quan_su and World3 then
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Holy Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Holy Torch") then
                    repeat wait(.2)
                        EquipWeapon("Holy Torch")
                        topos(CFrame.new(-10752.4434, 415.261749, -9367.43848, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                    until (Vector3.new(-10752.4434, 415.261749, -9367.43848)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
                    wait(2)
                    repeat wait(.2)
                        EquipWeapon("Holy Torch")
                        topos(CFrame.new(-11671.6289, 333.78125, -9474.31934, 0.300932229, 0, -0.953645527, 0, 1, 0, 0.953645527, 0, 0.300932229))
                    until (Vector3.new(-11671.6289, 333.78125, -9474.31934)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
                    wait(2)
                    repeat wait(.2)
                        EquipWeapon("Holy Torch")
                        topos(CFrame.new(-12133.1406, 521.507446, -10654.292, 0.80428642, 0, -0.594241858, 0, 1, 0, 0.594241858, 0, 0.80428642))
                    until (Vector3.new(-12133.1406, 521.507446, -10654.292)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
                    wait(2)
                    repeat wait(.2)
                        EquipWeapon("Holy Torch")
                        topos(CFrame.new(-13336.127, 484.521179, -6985.31689, 0.853732228, 0, -0.520712316, 0, 1, 0, 0.520712316, 0, 0.853732228))
                    until (Vector3.new(-13336.127, 484.521179, -6985.31689)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
                    wait(2)
                    EquipWeapon("Holy Torch")
                    repeat wait(.2)
                        topos(CFrame.new(-13487.623, 336.436188, -7924.53857, -0.982848108, 0, 0.184417039, 0, 1, 0, -0.184417039, 0, -0.982848108))
                    until (Vector3.new(-13487.623, 336.436188, -7924.53857)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5
                    wait(2)
                    Com()
                    wait(20)
                elseif not game.Players.LocalPlayer.Backpack:FindFirstChild("Holy Torch") and not game.Players.LocalPlayer.Character:FindFirstChild("Holy Torch") then
                   local Distance = (Vector3.new(5153.18799, 172.82933, 909.815918) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
					    if Distance > 5000 then
					    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5314.58203125, 25.419387817382812, -125.94227600097656))
					    end                 
                   topos(CFrame.new(5153.18799, 172.82933, 909.815918))
                    wait(3)
                end
            end
        end)
    end
end)

Quest:Toggle("Auto Long Ma", false, function(Vu)
_G.Chuate_Bac_Giang = Vu
StopTween(_G.Chuate_Bac_Giang)
end)
spawn(function()
        while wait() do
            if  _G.Chuate_Bac_Giang and World3 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Longma") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Longma" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        topos(v.HumanoidRootPart.CFrame * Pos)
                               
                                        sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    until not  _G.Long_Ma_Bac_Giang or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - LongMa.Position).Magnitude > 1500 then
                    BTP(LongMa)
                    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - LongMa.Position).Magnitude < 1500 then
                    topos(LongMa)
                    end
                else
                    topos(LongMa)
                end
                    topos(CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Longma") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild("Longma").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if  _G.Autotushitahop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)
 
Quest:Label("Dark Dagger")

Quest:Toggle("Put Haki", false, function(Vu)
_G.ChonHaki = Vu
StopTween(_G.ChonHaki)
end)
spawn(function()
    while wait(.2) do
        pcall(function()
            if _G.ChonHaki then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Winter Sky")
            	wait(1)
            	repeat topos(CFrame.new(-5420.16602, 1084.9657, -2666.8208)) wait() 
                until _G.StopTween == true or Open_Color_Haki == false or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-5420.16602, 1084.9657, -2666.8208)).Magnitude <= 10
                wait(1)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Pure Red")
                wait(1)
                repeat topos(CFrame.new(-5414.41357, 309.865753, -2212.45776)) wait() 
                until _G.StopTween == true or Open_Color_Haki == false or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-5414.41357, 309.865753, -2212.45776)).Magnitude <= 10
                wait(1)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Snow White")
                wait(1)
                repeat topos(CFrame.new(-4971.47559, 331.565765, -3720.02954)) wait() 
                until _G.StopTween == true or Open_Color_Haki == false or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-4971.47559, 331.565765, -3720.02954)).Magnitude <= 10
                wait(1)
                game:GetService'VirtualUser':Button1Down(Vector2.new(1280,600))
                wait(3)
                game:GetService'VirtualUser':Button1Down(Vector2.new(1280,600))
            end
        end) 
    end
end)

Quest:Toggle("Fully Auto Dark Dagger", false, function(Vu)
ChestRip = Vu
_G.PressQ = Vu
Grab_Chest = Vu
_G.Spawn2 = Vu
_G.DarkDag = Vu
StopTween(_G.Chest)
end)

spawn(function()
		pcall(function()
			while wait() do
				if ChestRip and World3 then
					if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("God's Chalice") or not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") then 
					    _G.AutoDarkDagger = false
					end
				end
			end
		end)
	end)

spawn(function()
		pcall(function()
			while wait() do
				if _G.Spawn2 and World3 then
					if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") then 
					    EquipWeapon("God's Chalice")
topos(CFrame.new(-5562.37255859375, 314.0408630371094, -2659.544189453125))
					end
				end
			end
		end)
	end)
	
spawn(function()
		pcall(function()
			while wait() do
				if _G.DarkDag and World3 then
					if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form") or game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") then
					    _G.AutoDarkDagger = true
					end
				end
			end
		end)
	end)
	 
Quest:Toggle("Auto Dark Dagger", false, function(Vu)
_G.AutoDarkDagger = Vu
StopTween(_G.AutoDarkDagger)
end)
spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoDarkDagger and World3 then
                    if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form") or game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == ("rip_indra True Form" or v.Name == "rip_indra") and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                                repeat task.wait()
                                    spawn(function()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(70,70,70)
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(PosX,PosY,PosZ))
                                    end)
                                until not _G.AutoDarkDagger or v.Humanoid.Health <= 0
                            end
                        end
                    else
                        topos(CFrame.new(-5344.822265625, 423.98541259766, -2725.0930175781))
                    end
                end
            end
        end)
    end) 

Quest:Button("Spawn Rip_Indra", function()
if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") then
EquipWeapon("God's Chalice")
topos(CFrame.new(-5562.37255859375, 314.0408630371094, -2659.544189453125))
end
end)

--//Players
Playerslist = {}
for i,v in pairs(game:GetService("Players"):GetChildren()) do
    table.insert(Playerslist,v.Name)
end
local SelectPly = PvP:Dropdown("Select Players", Playerslist, function(value)
    _G.SelectPly = value
end)

PvP:Button("Refresh", function()
    Playerslist = {}
    SelectedPly:Clear()
    for i,v in pairs(game:GetService("Players"):GetChildren()) do  
        SelectedPly:Add(v.Name)
    end
end)

PvP:Toggle("Spectate Player", false, function(value)
    SpectatePlys = value
    local plr1 = game:GetService("Players").LocalPlayer.Character.Humanoid
    local plr2 = game:GetService("Players"):FindFirstChild(_G.SelectPly)
    repeat wait(.1)
        game:GetService("Workspace").Camera.CameraSubject = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.Humanoid
    until SpectatePlys == false 
    game:GetService("Workspace").Camera.CameraSubject = game:GetService("Players").LocalPlayer.Character.Humanoid
end)

PvP:Toggle("Teleport Player", false, function(value)
    _G.TeleportPly = value
    end)
spawn(function()
	while wait() do
		if _G.TeleportPly then
			pcall(function()
				if game.Players:FindFirstChild(_G.SelectPly) then
					topos(game.Players[_G.SelectPly].Character.HumanoidRootPart.CFrame)
				end
			end)
		end
	end
end)	
 
PvP:Toggle("Auto Kill Player", false, function(value)
    _G.Auto_Kill_Ply = value
    StopTween(_G.Auto_Kill_Ply)
end)
spawn(function()
    while wait() do
        if _G.Auto_Kill_Ply then
            pcall(function()
                if _G.SelectPly ~= nil then 
                    if game.Players:FindFirstChild(_G.SelectPly) then
                        if game.Players:FindFirstChild(_G.SelectPly).Character.Humanoid.Health > 0 then
                            repeat task.wait()
                                EquipWeapon(_G.SelectWeapon)
                                AutoHaki()
                                game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.CanCollide = false
                                topos(game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.CFrame * CFrame.new(0,5,0))
                                spawn(function()
                                    pcall(function()
                                        if _G.SelectWeapon == SelectWeaponGun then
                                            local args = {
                                                [1] = game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.Position,
                                                [2] = game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart
                                            }
                                            game:GetService("Players").LocalPlayer.Character[SelectWeaponGun].RemoteFunctionShoot:InvokeServer(unpack(args))
                                        else
                                            game:GetService("VirtualUser"):CaptureController()
                                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                        end
                                    end)
                                end)
                            until game.Players:FindFirstChild(_G.SelectPly).Character.Humanoid.Health <= 0 or not game.Players:FindFirstChild(_G.SelectPly) or not _G.Auto_Kill_Ply
                        end
                    end
                end
            end)
        end
    end
end)

PvP:Button("Get Kill Player Quest", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
end)

PvP:Label("Aimbot")

PvP:Toggle("Aim Nearest Player", false,function(value)
        AimSkillNearest = value
        _G.Aimbot_Skill = value
        _G.Aimbot_Gun = value
    end)
      spawn(function()
            while task.wait() do
                if _G.Aimbot_Gun and game:GetService("Players").LocalPlayer.Character:FindFirstChild(SelectWeaponGun) then
                    pcall(function()
                        game:GetService("Players").LocalPlayer.Character[SelectWeaponGun].Cooldown.Value = 0
                        local args = {
                            [1] = game:GetService("Players"):FindFirstChild(PlayerSelectAimbot).Character.HumanoidRootPart.Position,
                            [2] = game:GetService("Players"):FindFirstChild(PlayerSelectAimbot).Character.HumanoidRootPart
                        }
                        game:GetService("Players").LocalPlayer.Character[SelectWeaponGun].RemoteFunctionShoot:InvokeServer(unpack(args))
                        game:GetService'VirtualUser':CaptureController()
                        game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                    end)
                end
            end
        end)
        spawn(function()
            pcall(function()
                while task.wait() do
                    if _G.Aimbot_Skill and PlayerSelectAimbot ~= nil and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and game.Players.LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name]:FindFirstChild("MousePos") then
                        local args = {
                            [1] = game:GetService("Players"):FindFirstChild(PlayerSelectAimbot).Character.HumanoidRootPart.Position
                        }
                        
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name).RemoteEvent:FireServer(unpack(args))
                    end
                end
            end)
        end)
        
        spawn(function()
            while wait(.1) do
                pcall(function()
                    local MaxDistance = math.huge
                    for i,v in pairs(game:GetService("Players"):GetPlayers()) do
                        if v.Name ~= game.Players.LocalPlayer.Name then
                            local Distance = v:DistanceFromCharacter(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
                            if Distance < MaxDistance then
                                MaxDistance = Distance
                                TargetPlayerAim = v.Name
                            end
                        end
                    end
                end)
            end
        end)
        
        spawn(function()
            pcall(function()
                game:GetService("RunService").RenderStepped:connect(function()
                    if AimSkillNearest and TargetPlayerAim ~= nil and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and game.Players.LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name]:FindFirstChild("MousePos") then
                        local args = {
                            [1] = game:GetService("Players"):FindFirstChild(TargetPlayerAim).Character.HumanoidRootPart.Position
                        }
                        game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                    end
                end)
            end)
        end)
        
PvP:Label("Visual")
        
PvP:Toggle("ESP Player", false, function(value)
    _G.ESPPLayers = value
    ESPPlayer = value
    UpdatePlayerChams()
end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.ESPPLayers then
                UpdatePlayerChams()
            end
        end
    end)
end)
PvP:Toggle("ESP Chest", false, function(value)
    _G.ESPCHESTE = value
    ChestESP = value
    UpdateChestChams()
end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.ESPCHESTE then
                UpdateChestChams()
            end
        end
    end)
end)
PvP:Toggle("ESP Flower", false, function(value)
    _G.ESPFloweers = value
    FlowerESP = value
    UpdateFlowerChams()
end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.ESPFloweers then
                UpdateFlowerChams()
            end
        end
    end)
end)
PvP:Toggle("ESP All Fruits", false, function(value)
    _G.AutoESPFruit = value
    DevilFruitESP = value
    UpdateDevilChams()
end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoESPFruit then
                UpdateDevilChams()
            end
        end
    end)
end)
PvP:Toggle("ESP Real Fruits", false, function(value)
    _G.AutoESPFruit2 = value
    RealFruitESP = value
    UpdateRealFruitChams()
end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoESPFruit2 then
                UpdateRealFruitChams()
            end
        end
    end)
end)
PvP:Toggle("ESP Island", false, function(value)
    _G.AutoESPisland = value
    IslandESP = value
    UpdateIslandESP()
end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoESPisland then
                UpdateIslandESP()
            end
        end
    end)
end)
PvP:Toggle("ESP Mirage", false, function(value)
    _G.AutoESPislandMNM = value
    MirageIslandESP = value
    UpdateIslandMirageESP()
end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoESPislandMNM then
                UpdateIslandMirageESP()
            end
        end
    end)
end)
PvP:Toggle("ESP Advance Dealer", false, function(value)
    _G.AutoESPAFD = value
    AfdESP = value
    UpdateAfdESP()
end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoESPAFD then
                UpdateAfdESP()
            end
        end
    end)
end)

--//Raid
local TimeRaid = Raid:Label("Wait For Dungeon")
    
    local Island1 = Raid:LabelP(": lsland 1")
    local Island2 = Raid:LabelP(": lsland 2")
    local Island3 = Raid:LabelP(": lsland 3")
    local Island4 = Raid:LabelP(": lsland 4")
    local Island5 = Raid:LabelP(": lsland 5")
    
    Raid:Line()
    
    spawn(function()
        pcall(function()
            while wait() do
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
                    TimeRaid:Set(game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Text)
                else
                    TimeRaid:Set("Wait For Dungeon")
                end
            end
        end)
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
    if game.Workspace._WorldOrigin.Locations:FindFirstChild('Island 1') then
    Island1:Set('✅: Island 1')
    else
      Island1:Set('❌: Island 1' )end
            end
        end)
end)

spawn(function()
        pcall(function()
            while wait() do
    if game.Workspace._WorldOrigin.Locations:FindFirstChild('Island 2') then
    Island2:Set('✅: Island 2')
    else
      Island2:Set('❌: Island 2' )end
            end
        end)
end)

spawn(function()
        pcall(function()
            while wait() do
    if game.Workspace._WorldOrigin.Locations:FindFirstChild('Island 3') then
    Island3:Set('✅: Island 3')
    else
      Island3:Set('❌: Island 3' )end
            end
        end)
end)

spawn(function()
        pcall(function()
            while wait() do
    if game.Workspace._WorldOrigin.Locations:FindFirstChild('Island 4') then
    Island4:Set('✅: Island 4')
    else
      Island4:Set('❌: Island 4' )end
            end
        end)
end)

spawn(function()
        pcall(function()
            while wait() do
    if game.Workspace._WorldOrigin.Locations:FindFirstChild('Island 5') then
    Island5:Set('✅: Island 5')
    else
      Island5:Set('❌: Island 5' )end
            end
        end)
end)

if World2 then
    Raid:Button("Teleport To Lab", function()
        topos(CFrame.new(-6438.73535, 250.645355, -4501.50684))
    end)
elseif World3 then
    Raid:Button("Teleport To Lab", function()
        topos(CFrame.new(-5017.40869, 314.844055, -2823.0127, -0.925743818, 4.48217499e-08, -0.378151238, 4.55503146e-09, 1, 1.07377559e-07, 0.378151238, 9.7681621e-08, -0.925743818))
    end)
end

    _G.SelectChip = selectraids or ""
	Raidslist = {}
	RaidsModule = require(game.ReplicatedStorage.Raids)
	for i,v in pairs(RaidsModule.raids) do
		table.insert(Raidslist,v)
	end
	for i,v in pairs(RaidsModule.advancedRaids) do
		table.insert(Raidslist,v)
	end
	
    Raid:Dropdown("Select Chips",Raidslist,function(value)
        _G.SelectChip = value
    end)
    
    spawn(function()
        while wait() do
            if _G.AutoSelectDungeon then
                pcall(function()
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flame-Flame") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame-Flame") then
                        _G.SelectChip = "Flame"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ice-Ice") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice-Ice") then
                        _G.SelectChip = "Ice"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quake-Quake") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake-Quake") then
                        _G.SelectChip = "Quake"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Light-Light") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light-Light") then
                        _G.SelectChip = "Light"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark-Dark") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark-Dark") then
                        _G.SelectChip = "Dark"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("String-String") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("String-String") then
                        _G.SelectChip = "String"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rumble-Rumble") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble-Rumble") then
                        _G.SelectChip = "Rumble"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Magma-Magma") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma-Magma") then
                        _G.SelectChip = "Magma"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Human-Human: Buddha Fruit") then
                        _G.SelectChip = "Human: Buddha"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand-Sand") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand-Sand") then
                        _G.SelectChip = "Sand"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird-Bird: Phoenix") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird-Bird: Phoenix") then
                        _G.SelectChip = "Bird: Phoenix"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dough") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough") then
                        _G.SelectChip = "Dough"
                    else
                        _G.SelectChip = "Flame"
                    end
                end)
            end
        end
    end)
    
    Raid:Toggle("Buy Chip",_G.AutoBuyChip,function(value)
        _G.AutoBuyChip = value
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoBuyChip then
                    if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") then
                        if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
                        end
                    end
                end
            end
        end)
    end)
    
    Raid:Button("Buy Chip Select",function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc","Select",_G.SelectChip)
    end)
    
    
    Raid:Button("Start Dungeon",function()
        if World2 then
            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
        elseif World3 then
            fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
        end
    end)
    

Raid:Toggle("Enable Raid", false, function(value)
    _G.Kill_Aura = value
    _G.Auto_Dungeon = value
    _G.Auto_StartRaid = value
end)
spawn(function()
    pcall(function() 
        while wait() do
            if _G.Kill_Aura then
                if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == true then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            pcall(function()
                                repeat wait()
                                    sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    v.Humanoid.Health = 0
                                    v.HumanoidRootPart.CanCollide = false
                                until not _G.Kill_Aura or not v.Parent or v.Humanoid.Health <= 0
                            end)
                        end
                    end
                end
            end
        end
    end)
end)

spawn(function()
    while wait(.1) do
        pcall(function()
            if _G.Auto_StartRaid then
                if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
                    if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") then
                        if World2 then
                            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                        elseif World3 then
                            fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                        end
                    end
                end
            end
        end)
    end
end)

function IsIslandRaid(cu)
    if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island " .. cu) then
        min = 4500
        for r, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            if
                v.Name == "Island " .. cu and
                    (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < min
             then
                min = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            end
        end
        for r, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            if
                v.Name == "Island " .. cu and
                    (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= min
             then
                return v
            end
        end
    end
end
function getNextIsland()
    TableIslandsRaid = {5, 4, 3, 2, 1}
    for r, v in pairs(TableIslandsRaid) do
        if IsIslandRaid(v) and (IsIslandRaid(v).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4500 then
            return IsIslandRaid(v)
        end
    end
end
spawn(function()
    while wait() do
        if _G.Auto_Dungeon then
            if getNextIsland() then
                spawn(topos(getNextIsland().CFrame * CFrame.new(0, 60, 0)), 1)
            end
        end
    end
end)

Raid:Toggle("Auto Awanken Fruit", false, function(value)
    _G.Auto_Awakener = value
end)
spawn(function()
    pcall(function()
        while wait(.1) do
            if _G.Auto_Awakener then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Check")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Awaken")
            end
        end
    end)
end)

Raid:Toggle("Auto Get Fruit < 1m", false, function(value)
_G.Autofruit = value
end)
spawn(function()
    while wait(.1) do
        pcall(function()
     if _G.Autofruit then
         -- Script generated by SimpleSpy - credits to exx#939
local args = {
    [1] = "LoadFruit",
    [2] = "Rocket-Rocket"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
-- Script generated by SimpleSpy - credits to exx#9394

-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "LoadFruit",
    [2] = "Spin-Spin"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "LoadFruit",
    [2] = "Chop-Chop"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

-- Script generated by SimpleSpy - credits to exx#9394

-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "LoadFruit",
    [2] = "Spring-Spring"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "LoadFruit",
    [2] = "Bomb-Bomb"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "LoadFruit",
    [2] = "Smoke-Smoke"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "LoadFruit",
    [2] = "Spike-Spike"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "LoadFruit",
    [2] = "Flame-Flame"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "LoadFruit",
    [2] = "Falcon-Falcon"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "LoadFruit",
    [2] = "Ice-Ice"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "LoadFruit",
    [2] = "Sand-Sand"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "LoadFruit",
    [2] = "Dark-Dark"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "LoadFruit",
    [2] = "Revive-Revive"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "LoadFruit",
    [2] = "Diamond-Diamond"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "LoadFruit",
    [2] = "Light-Light"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "LoadFruit",
    [2] = "Rubber-Rubber"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "LoadFruit",
    [2] = "Barrier-Barrier"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))


game:GetService("Players").LocalPlayer.PlayerGui.Notifications:Destroy()
end
end)
end
end)

Raid:Label("Raid Law")

Raid:Toggle("Auto Raid Law", false, function(value)
_G.autoLawRaid = value
end)

spawn(function()
    pcall(function()
        while wait() do
            if _G.autoLawRaid and World2 then
                if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") and
                    not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip") and
                    not game:GetService("Workspace").Enemies:FindFirstChild("Order") and
                    not game:GetService("ReplicatedStorage"):FindFirstChild("Order") then
                    wait(1)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip",
                        "1")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip",
                        "2")
                end
            end
        end
    end)
end)

spawn(function()
    pcall(function()
        while wait(.1) do
            if _G.autoLawRaid and World2 then
                if not game:GetService("Workspace").Enemies:FindFirstChild("Order") and
                    not game:GetService("ReplicatedStorage"):FindFirstChild("Order") then
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") or
                        game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip") then
                        fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main
                                              .ClickDetector)
                    end
                end
                if game:GetService("ReplicatedStorage"):FindFirstChild("Order") or
                    game:GetService("Workspace").Enemies:FindFirstChild("Order") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Order") then
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Order" then
                                repeat
                                    game:GetService("RunService").Heartbeat:wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(120, 120, 120)
                                until not v.Parent or v.Humanoid.Health <= 0 or _G.autoLawRaid == false
                            end
                        end
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Order") then
                        topos(CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875))
                    end
                end
            end
        end
    end)
end)

Raid:Button("Start Law Raid",function()
if World2 then
            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
        end
    end)

Raid:Button("Tween to raid lab",function()
topos(CFrame.new(-5573.46337890625, 329.1658935546875, -5938.73828125))
end)
--//Islands
Island:Label("World")

function TpWorld1()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
end
function TpWorld2() 
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")	
end
function TpWorld3()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
end

Island:Button("Teleport to World 1", function()
	TpWorld1()
end)
Island:Button("Teleport to World 2", function()
	TpWorld2()
end)

Island:Button("Teleport to World 3", function()
	TpWorld3()
end)

Island:Label("Map")

if World1 then
    Island:Dropdown("Select Island", {
        "WindMill",
        "Marine",
        "Middle Town",
        "Jungle",
        "Pirate Village",
        "Desert",
        "Snow Island",
        "MarineFord",
        "Colosseum",
        "Sky Island 1",
        "Sky Island 2",
        "Sky Island 3",
        "Prison",
        "Magma Village",
        "Under Water Island",
        "Fountain City",
        "Shank Room",
        "Mob Island"
        }, function(value)
            _G.SelectIsland = value
    end)
end

if World2 then
    Island:Dropdown("Select Island", {
        "The Cafe",
        "Frist Spot",
        "Dark Area",
        "Flamingo Mansion",
        "Flamingo Room",
        "Green Zone",
        "Factory",
        "Colossuim",
        "Zombie Island",
        "Two Snow Mountain",
        "Punk Hazard",
        "Cursed Ship",
        "Ice Castle",
        "Forgotten Island",
        "Ussop Island",
        "Mini Sky Island"
        }, function(value)
            _G.SelectIsland = value
    end)
end

if World3 then
    Island:Dropdown("Select Island", {
        "Mansion",
        "Port Town",
        "Great Tree",
        "Castle On The Sea",
        "MiniSky", 
        "Hydra Island",
        "Floating Turtle",
        "Haunted Castle",
        "Ice Cream Island",
        "Peanut Island",
        "Cake Island",
        "Cocoa Island",
        "Candy Island New",
        "Tiki Outpost"
        }, function(value)
            _G.SelectIsland = value
    end)
end

Island:Toggle("Teleport To Selected Island", false, function(value)
    _G.TeleportIsland = value
    if _G.TeleportIsland == true then
        repeat wait()
            if _G.SelectIsland == "WindMill" then
                topos(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594))
            elseif _G.SelectIsland == "Marine" then
                topos(CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156))
            elseif _G.SelectIsland == "Middle Town" then
                topos(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
            elseif _G.SelectIsland == "Jungle" then
                topos(CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754))
            elseif _G.SelectIsland == "Pirate Village" then
                topos(CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969))
            elseif _G.SelectIsland == "Desert" then
                topos(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688))
            elseif _G.SelectIsland == "Snow Island" then
                topos(CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469))
            elseif _G.SelectIsland == "MarineFord" then
                topos(CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313))
            elseif _G.SelectIsland == "Colosseum" then
                topos( CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969))
            elseif _G.SelectIsland == "Sky Island 1" then
                topos(CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063))
            elseif _G.SelectIsland == "Sky Island 2" then  
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
            elseif _G.SelectIsland == "Sky Island 3" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
            elseif _G.SelectIsland == "Prison" then
                topos( CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656))
            elseif _G.SelectIsland == "Magma Village" then
                topos(CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875))
            elseif _G.SelectIsland == "Under Water Island" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            elseif _G.SelectIsland == "Fountain City" then
                topos(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813))
            elseif _G.SelectIsland == "Shank Room" then
                topos(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
            elseif _G.SelectIsland == "Mob Island" then
                topos(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
            elseif _G.SelectIsland == "The Cafe" then
                topos(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828))
            elseif _G.SelectIsland == "Frist Spot" then
                topos(CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375))
            elseif _G.SelectIsland == "Dark Area" then
                topos(CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375))
            elseif _G.SelectIsland == "Flamingo Mansion" then
                topos(CFrame.new(-483.73370361328, 332.0383605957, 595.32708740234))
            elseif _G.SelectIsland == "Flamingo Room" then
                topos(CFrame.new(2284.4140625, 15.152037620544, 875.72534179688))
            elseif _G.SelectIsland == "Green Zone" then
                topos( CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344))
            elseif _G.SelectIsland == "Factory" then
                topos(CFrame.new(424.12698364258, 211.16171264648, -427.54049682617))
            elseif _G.SelectIsland == "Colossuim" then
                topos( CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641))
            elseif _G.SelectIsland == "Zombie Island" then
                topos(CFrame.new(-5622.033203125, 492.19604492188, -781.78552246094))
            elseif _G.SelectIsland == "Two Snow Mountain" then
                topos(CFrame.new(753.14288330078, 408.23559570313, -5274.6147460938))
            elseif _G.SelectIsland == "Punk Hazard" then
                topos(CFrame.new(-6127.654296875, 15.951762199402, -5040.2861328125))
            elseif _G.SelectIsland == "Cursed Ship" then
                topos(CFrame.new(923.40197753906, 125.05712890625, 32885.875))
            elseif _G.SelectIsland == "Ice Castle" then
                topos(CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188))
            elseif _G.SelectIsland == "Forgotten Island" then
                topos(CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875))
            elseif _G.SelectIsland == "Ussop Island" then
                topos(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781))
            elseif _G.SelectIsland == "Mini Sky Island" then
                topos(CFrame.new(-288.74060058594, 49326.31640625, -35248.59375))
            elseif _G.SelectIsland == "Great Tree" then
                topos(CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625))
            elseif _G.SelectIsland == "Castle On The Sea" then
                topos(CFrame.new(-5074.45556640625, 314.5155334472656, -2991.054443359375))
            elseif _G.SelectIsland == "MiniSky" then
                topos(CFrame.new(-260.65557861328, 49325.8046875, -35253.5703125))
            elseif _G.SelectIsland == "Port Town" then
                topos(CFrame.new(-290.7376708984375, 6.729952812194824, 5343.5537109375))
            elseif _G.SelectIsland == "Hydra Island" then
                topos(CFrame.new(5228.8842773438, 604.23400878906, 345.0400390625))
            elseif _G.SelectIsland == "Floating Turtle" then
                topos(CFrame.new(-13274.528320313, 531.82073974609, -7579.22265625))
            elseif _G.SelectIsland == "Mansion" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
            elseif _G.SelectIsland == "Haunted Castle" then
                topos(CFrame.new(-9515.3720703125, 164.00624084473, 5786.0610351562))
            elseif _G.SelectIsland == "Ice Cream Island" then
                topos(CFrame.new(-902.56817626953, 79.93204498291, -10988.84765625))
            elseif _G.SelectIsland == "Peanut Island" then
                topos(CFrame.new(-2062.7475585938, 50.473892211914, -10232.568359375))
            elseif _G.SelectIsland == "Cake Island" then
                topos(CFrame.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375))
            elseif _G.SelectIsland == "Cocoa Island" then
                topos(CFrame.new(87.94276428222656, 73.55451202392578, -12319.46484375))
            elseif _G.SelectIsland == "Candy Island New⛄" then
                topos(CFrame.new(-1014.4241943359375, 149.11068725585938, -14555.962890625))
            elseif _G.SelectIsland == "Tiki Outpost" then
                topos(CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099))
            end
        until not _G.TeleportIsland
    end
    StopTween(_G.TeleportIsland)
end)

    Island:Label("Npc")
    
    if World1 then
        Island:Dropdown("Select NPC",{
            "Random Devil Fruit",
            "Blox Fruits Dealer",
            "Remove Devil Fruit",
            "Ability Teacher",
            "Dark Step", 
            "Electro",
            "Fishman Karate"
            }, function(value)
            _G.SelectNPC = value
        end)
    end

    if World2 then
        Island:Dropdown("Select NPC",{
            "Dargon Berath",
            "Mtsterious Man",
            "Mysterious Scientist",
            "Awakening Expert",
            "Nerd", 
            "Bar Manager",
            "Blox Fruits Dealer",
            "Trevor",
            "Enhancement Editor",
            "Pirate Recruiter",
            "Marines Recruiter",
            "Chemist",
            "Cyborg",
            "Ghoul Mark",
            "Guashiem",
            "El Admin",
            "El Rodolfo",
            "Arowe"
            }, function(value)
            _G.SelectNPC = value
        end)
    end

    if World3 then
        Island:Dropdown("Select NPC",{
            "Blox Fruits Dealer",
            "Remove Devil Fruit",
            "Horned Man",
            "Hungey Man",
            "Previous Hero", 
            "Butler",
            "Lunoven",
            "Trevor",
            "Elite Hunter",
            "Player Hunter",
            "Uzoth"
            }, function(value)
            _G.SelectNPC = value
        end)
    end

    Island:Toggle("Teleport NPC", false, function(value)
        _G.TeleportNPC = value
        if _G.TeleportNPC == true then
            repeat wait()
                if _G.SelectNPC == "Dargon Berath" then
                    topos(CFrame.new(703.372986, 186.985519, 654.522034, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                elseif _G.SelectNPC == "Mtsterious Man" then
                    topos(CFrame.new(-2574.43335, 1627.92371, -3739.35767, 0.378697902, -9.06400288e-09, 0.92552036, -8.95582009e-09, 1, 1.34578926e-08, -0.92552036, -1.33852689e-08, 0.378697902))
                elseif _G.SelectNPC == "Mysterious Scientist" then
                    topos(CFrame.new(-6437.87793, 250.645355, -4498.92773, 0.502376854, -1.01223634e-08, -0.864648759, 2.34106086e-08, 1, 1.89508653e-09, 0.864648759, -2.11940012e-08, 0.502376854))
                elseif _G.SelectNPC == "Awakening Expert" then
                    topos(CFrame.new(-408.098846, 16.0459061, 247.432846, 0.028394036, 6.17599138e-10, 0.999596894, -5.57905944e-09, 1, -4.59372484e-10, -0.999596894, -5.56376767e-09, 0.028394036))
                elseif _G.SelectNPC == "Nerd" then
                    topos(CFrame.new(-401.783722, 73.0859299, 262.306702, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                elseif _G.SelectNPC == "Bar Manager" then
                    topos(CFrame.new(-385.84726, 73.0458984, 316.088806, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                elseif _G.SelectNPC == "Blox Fruits Dealer" then
                    topos(CFrame.new(-450.725464, 73.0458984, 355.636902, -0.780352175, -2.7266168e-08, 0.625340283, 9.78516468e-09, 1, 5.58128797e-08, -0.625340283, 4.96727601e-08, -0.780352175))
                elseif _G.SelectNPC == "Trevor" then
                    topos(CFrame.new(-341.498322, 331.886444, 643.024963, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                elseif _G.SelectNPC == "Plokster" then
                    topos( CFrame.new(-1885.16016, 88.3838196, -1912.28723, -0.513468027, 0, 0.858108759, 0, 1, 0, -0.858108759, 0, -0.513468027))
                elseif _G.SelectNPC == "Enhancement Editor" then
                    topos(CFrame.new(-346.820221, 72.9856339, 1194.36218, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                elseif _G.SelectNPC == "Pirate Recruiter" then  
                    topos(CFrame.new(-428.072998, 72.9495239, 1445.32422, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                elseif _G.SelectNPC == "Marines Recruiter" then
                    topos(CFrame.new(-1349.77295, 72.9853363, -1045.12964, 0.866493046, 0, -0.499189168, 0, 1, 0, 0.499189168, 0, 0.866493046))
                elseif _G.SelectNPC == "Chemist" then
                    topos( CFrame.new(-2777.45288, 72.9919434, -3572.25732, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                elseif _G.SelectNPC == "Ghoul Mark" then
                    topos(CFrame.new(635.172546, 125.976357, 33219.832, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                elseif _G.SelectNPC == "Cyborg" then
                    topos(CFrame.new(629.146851, 312.307373, -531.624146, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                elseif _G.SelectNPC == "Guashiem" then
                    topos(CFrame.new(937.953003, 181.083359, 33277.9297, 1, -8.60126406e-08, 3.81773896e-17, 8.60126406e-08, 1, -1.89969598e-16, -3.8177373e-17, 1.89969598e-16, 1))
                elseif _G.SelectNPC == "El Admin" then
                    topos(CFrame.new(1322.80835, 126.345039, 33135.8789, 0.988783717, -8.69797603e-08, -0.149354503, 8.62223786e-08, 1, -1.15461916e-08, 0.149354503, -1.46101409e-09, 0.988783717))
                elseif _G.SelectNPC == "El Rodolfo" then
                    topos(CFrame.new(941.228699, 40.4686775, 32778.9922, -0.818029106, -1.19524382e-08, 0.575176775, -1.28741648e-08, 1, 2.47053866e-09, -0.575176775, -5.38394795e-09, -0.818029106))
                elseif _G.SelectNPC == "Arowe" then
                    topos(CFrame.new(-1994.51038, 125.519142, -72.2622986, -0.16715166, -6.55417338e-08, -0.985931218, -7.13315558e-08, 1, -5.43836585e-08, 0.985931218, 6.12376851e-08, -0.16715166))
                elseif _G.SelectNPC == "Random Devil Fruit" then
                    topos(CFrame.new(-1436.19727, 61.8777695, 4.75247526, -0.557794094, 2.74216543e-08, 0.829979479, 5.83273234e-08, 1, 6.16037932e-09, -0.829979479, 5.18467118e-08, -0.557794094))
                elseif _G.SelectNPC == "Blox Fruits Dealer" then
                    topos(CFrame.new(-923.255066, 7.67800522, 1608.61011, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                elseif _G.SelectNPC == "Remove Devil Fruit" then
                    topos(CFrame.new(5664.80469, 64.677681, 867.85907, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                elseif _G.SelectNPC == "Ability Teacher" then
                    topos(CFrame.new(-1057.67822, 9.65220833, 1799.49146, -0.865874112, -9.26330159e-08, 0.500262439, -7.33759435e-08, 1, 5.816689e-08, -0.500262439, 1.36579752e-08, -0.865874112))
                elseif _G.SelectNPC == "Dark Step" then
                    topos( CFrame.new(-987.873047, 13.7778397, 3989.4978, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                elseif _G.SelectNPC == "Electro" then
                    topos(CFrame.new(-5389.49561, 13.283, -2149.80151, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                elseif _G.SelectNPC == "Fishman Karate" then
                    topos( CFrame.new(61581.8047, 18.8965912, 987.832703, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                elseif _G.SelectNPC == "Random Devil Fruit" then
                    topos(CFrame.new(-12491, 337, -7449))
                elseif _G.SelectNPC == "Blox Fruits Dealer" then
                    topos(CFrame.new(-12511, 337, -7448))
                elseif _G.SelectNPC == "Remove Devil Fruit" then
                    topos(CFrame.new(-5571, 1089, -2661))
                elseif _G.SelectNPC == "Horned Man" then
                    topos(CFrame.new(-11890, 931, -8760))
                elseif _G.SelectNPC == "Hungey Man" then
                    topos(CFrame.new(-10919, 624, -10268))
                elseif _G.SelectNPC == "Previous Hero" then
                    topos(CFrame.new(-10368, 332, -10128))
                elseif _G.SelectNPC == "Butler" then
                    topos(CFrame.new(-5125, 316, -3130))
                elseif _G.SelectNPC == "Lunoven" then
                    topos(CFrame.new(-5117, 316, -3093))
                elseif _G.SelectNPC == "Elite Hunter" then
                    topos(CFrame.new(-5420, 314, -2828))
                elseif _G.SelectNPC == "Player Hunter" then
                    topos(CFrame.new(-5559, 314, -2840))
                elseif _G.SelectNPC == "Uzoth" then
                    topos(CFrame.new(-9785, 852, 6667))
                end
            until not _G.TeleportNPC
        end
        StopTween(_G.TeleportNPC)
    end)
    
--//Setting Farm
Setting:Toggle("Fast Attack", true, function(value)
        Fast_Attack = value
	DamageAura = value
	ClickNoCooldown = value
	DmgAttack.Enabled = not value	
    end)

Setting:Toggle("Auto Click", false, function(Vu)
_G.click = Vu
end)
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.click then
             pcall(function()
                game:GetService'VirtualUser':CaptureController()
			    game:GetService'VirtualUser':Button1Down(Vector2.new(0,1,0,1))
            end)
        end
    end)
end)

local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
Mouse.Button1Down:Connect(function()
	if ClickNoCooldown then
		local ac = CombatFrameworkR.activeController

		if ac and ac.equipped then
			ac.hitboxMagnitude = 55
			pcall(AttackFunction,2)
		end
	end
end)

Setting:Toggle("Bring Mon", true, function(value)
        _G.BringMonster = Value
    end)

spawn(function()
	while task.wait() do
		pcall(function()
            CheckQuest()
			for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
				if _G.BringMonster then
					if StartBring and v.Name == MonFarm or v.Name == Mon and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode then
						if v.Name == "Factory Staff" then
							if (v.HumanoidRootPart.Position - PosMon.Position).Magnitude <= 5000 then
								v.Head.CanCollide = false
								v.HumanoidRootPart.CanCollide = false
								v.HumanoidRootPart.CFrame = PosMon
								if v.Humanoid:FindFirstChild("Animator") then
									v.Humanoid.Animator:Destroy()
								end
								sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
							end
						elseif v.Name == MonFarm or v.Name == Mon then
							if (v.HumanoidRootPart.Position - PosMon.Position).Magnitude <= 4500 then
                                v.HumanoidRootPart.CFrame = PosMon
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
							end
						end
					end
				end
			end
		end)
	end
end)
        spawn(function()
            while task.wait() do
                pcall(function()
                    if _G.BringMonster then
                        CheckQuest()
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if _G.AutoFarm and StartMagnet and v.Name == Mon and (Mon == "Factory Staff" or Mon == "Monkey" or Mon == "Dragon Crew Warrior" or Mon == "Dragon Crew Archer") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 220 then
                                v.HumanoidRootPart.CFrame = PosMon
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                            elseif _G.AutoFarm and StartMagnet and v.Name == Mon and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode then
                                v.HumanoidRootPart.CFrame = PosMon
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                            end
                        end
                    end
                end)
            end
        end)
        spawn(function()
            while task.wait() do
                pcall(function()
                    if _G.BringMonster then
                        CheckQuest()
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if _G.AutoFarm and StartMagnet and v.Name == Mon and (Mon == "Factory Staff" or Mon == "Monkey" or Mon == "Dragon Crew Warrior" or Mon == "Dragon Crew Archer") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 250 then
                                v.HumanoidRootPart.CFrame = PosMon
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                            elseif _G.AutoFarm and StartMagnet and v.Name == Mon and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode then
                                v.HumanoidRootPart.CFrame = PosMon
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                            end
                            if _G.AutoEctoplasm and StartEctoplasmMagnet then
                            if string.find(v.Name, "Ship") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - EctoplasmMon.Position).Magnitude <= _G.BringMode then
                                v.HumanoidRootPart.CFrame = EctoplasmMon
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                         end                                                       
                          if _G.Kiem_Lua and StartRengokuMagnet then
                                if (v.Name == "Snow Lurker" or v.Name == "Arctic Warrior") and (v.HumanoidRootPart.Position - RengokuMon.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    v.Humanoid:ChangeState(14)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CFrame = RengokuMon
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                end
                            end
                            if _G.CitizenQuest and Magnetcitizen then
                                if v.Name == "Forest Pirate" and (v.HumanoidRootPart.Position - MusketeerHatMon.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    v.Humanoid:ChangeState(14)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CFrame = MusketeerHatMon
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                end
                            end
                            if _G.CitizenQuest2 and Magnetcitizen2 then
                                if v.Name == "Forest Pirate" and (v.HumanoidRootPart.Position - MusketeerHatMon.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    v.Humanoid:ChangeState(14)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CFrame = PosHee
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                end
                            end
                            if _G.Auto_EvoRace and StartEvoStartMagnet then
                                if v.Name == "Zombie" and (v.HumanoidRootPart.Position - PosMonEvo.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    v.Humanoid:ChangeState(14)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CFrame = PosMonEvo
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                end
                            end
                            if _G.AutoBartilo and AutoBartiloBring then
                        if v.Name == "Swan Pirate" and (v.HumanoidRootPart.Position - PosMonBarto.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                            v.Humanoid:ChangeState(14)
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            v.HumanoidRootPart.CFrame = PosMonBarto
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                        end
                    end
                            if _G.AutoFarmFruitMastery and StartMasteryFruitMagnet then
                                if v.Name == "Monkey" then
                                    if (v.HumanoidRootPart.Position - PosMonMasteryFruit.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        v.Humanoid:ChangeState(14)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Head.CanCollide = false
                                        v.HumanoidRootPart.CFrame = PosMonMasteryFruit
                                        if v.Humanoid:FindFirstChild("Animator") then
                                            v.Humanoid.Animator:Destroy()
                                        end
                                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                    end
                                elseif v.Name == "Factory Staff" then
                                    if (v.HumanoidRootPart.Position - PosMonMasteryFruit.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        v.Humanoid:ChangeState(14)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Head.CanCollide = false
                                        v.HumanoidRootPart.CFrame = PosMonMasteryFruit
                                        if v.Humanoid:FindFirstChild("Animator") then
                                            v.Humanoid.Animator:Destroy()
                                        end
                                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                    end
                                elseif v.Name == Mon then
                                    if (v.HumanoidRootPart.Position - PosMonMasteryFruit.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        v.Humanoid:ChangeState(14)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Head.CanCollide = false
                                        v.HumanoidRootPart.CFrame = PosMonMasteryFruit
                                        if v.Humanoid:FindFirstChild("Animator") then
                                            v.Humanoid.Animator:Destroy()
                                        end
                                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                    end
                                end
                            end
                            if BonesBring and StartMagnetBoneMon then
                        if (v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy") and (v.HumanoidRootPart.Position - PosMonBone.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    v.Humanoid:ChangeState(14)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CFrame = PosMonBone
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                end
                            end
                            if _G.Auto_Bone and StartMagnetBoneMon then
                                if (v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy") and (v.HumanoidRootPart.Position - PosMonBone.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    v.Humanoid:ChangeState(14)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CFrame = PosMonBone
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                end
                            end
                            if _G.AutoFarmGunMastery and StartMasteryGunMagnet then
                                if v.Name == "Monkey" then
                                    if (v.HumanoidRootPart.Position - PosMonMasteryGun.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        v.Humanoid:ChangeState(14)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Head.CanCollide = false
                                        v.HumanoidRootPart.CFrame = PosMonMasteryGun
                                        if v.Humanoid:FindFirstChild("Animator") then
                                            v.Humanoid.Animator:Destroy()
                                        end
                                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                    end
                                elseif v.Name == "Factory Staff" then
                                    if (v.HumanoidRootPart.Position - PosMonMasteryGun.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        v.Humanoid:ChangeState(14)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Head.CanCollide = false
                                        v.HumanoidRootPart.CFrame = PosMonMasteryGun
                                        if v.Humanoid:FindFirstChild("Animator") then
                                            v.Humanoid.Animator:Destroy()
                                        end
                                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                    end
                                elseif v.Name == Mon then
                                    if (v.HumanoidRootPart.Position - PosMonMasteryGun.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        v.Humanoid:ChangeState(14)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Head.CanCollide = false
                                        v.HumanoidRootPart.CFrame = PosMonMasteryGun
                                        if v.Humanoid:FindFirstChild("Animator") then
                                            v.Humanoid.Animator:Destroy()
                                        end
                                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                    end
                                end
                            end                     
                            if _G.AutoKata and MagnetDought then
                                if (v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker") and (v.HumanoidRootPart.Position - PosMonDoughtOpenDoor.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then                                    
                                    v.Humanoid:ChangeState(10)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CFrame = PosMonDoughtOpenDoor
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                end
                            end
                        end
                    end
                end)
             end
    end)
task.spawn(function()
	while task.wait() do
		pcall(function()
			if Min_XT_Is_Kak and _G.BringMonster then
				for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
					if not string.find(v.Name,"Boss") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode then
						if InMyNetWork(v.HumanoidRootPart) then
							v.HumanoidRootPart.CFrame = PosGay
							v.Humanoid.JumpPower = 0
							v.Humanoid.WalkSpeed = 0
							v.HumanoidRootPart.Size = Vector3.new(60,60,60)
							v.HumanoidRootPart.Transparency = 1
							v.HumanoidRootPart.CanCollide = false
							v.Head.CanCollide = false
							if v.Humanoid:FindFirstChild("Animator") then
								v.Humanoid.Animator:Destroy()
							end
							v.Humanoid:ChangeState(11)
							v.Humanoid:ChangeState(14)
						end
					end
				end
			end
		end)
	end
end)
task.spawn(function()
	while task.wait() do
		pcall(function()
			if _G.AutoSwordMastery and AutoSwordMasteryMag and _G.BringMonster then
				for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
					if not string.find(v.Name,"Boss") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode then
						if InMyNetWork(v.HumanoidRootPart) then
							v.HumanoidRootPart.CFrame = PosMon
							v.Humanoid.JumpPower = 0
							v.Humanoid.WalkSpeed = 0
							v.HumanoidRootPart.Size = Vector3.new(60,60,60)
							v.HumanoidRootPart.Transparency = 1
							v.HumanoidRootPart.CanCollide = false
							v.Head.CanCollide = false
							if v.Humanoid:FindFirstChild("Animator") then
								v.Humanoid.Animator:Destroy()
							end
							v.Humanoid:ChangeState(11)
							v.Humanoid:ChangeState(14)
						end
					end
				end
			end
		end)
	end
end)
task.spawn(function()
	while task.wait() do
		pcall(function()
			if Min_XT_Is_Kak and _G.BringMonster then
				for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
					if not string.find(v.Name,"Boss") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode then
						if InMyNetWork(v.HumanoidRootPart) then
							v.HumanoidRootPart.CFrame = PosNarathiwat
							v.Humanoid.JumpPower = 0
							v.Humanoid.WalkSpeed = 0
							v.HumanoidRootPart.Size = Vector3.new(60,60,60)
							v.HumanoidRootPart.Transparency = 1
							v.HumanoidRootPart.CanCollide = false
							v.Head.CanCollide = false
							if v.Humanoid:FindFirstChild("Animator") then
								v.Humanoid.Animator:Destroy()
							end
							v.Humanoid:ChangeState(11)
							v.Humanoid:ChangeState(14)
						end
					end
				end
			end
		end)
	end
end)
task.spawn(function()
	while task.wait() do
		pcall(function()
			if _G.AutoFarmNearest and AutoFarmNearestMagnet or SelectMag and _G.BringMonster then
				for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
					if not string.find(v.Name,"Boss") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode then
						if InMyNetWork(v.HumanoidRootPart) then
							v.HumanoidRootPart.CFrame = PosMon
							v.Humanoid.JumpPower = 0
							v.Humanoid.WalkSpeed = 0
							v.HumanoidRootPart.Size = Vector3.new(60,60,60)
							v.HumanoidRootPart.Transparency = 1
							v.HumanoidRootPart.CanCollide = false
							v.Head.CanCollide = false
							if v.Humanoid:FindFirstChild("Animator") then
								v.Humanoid.Animator:Destroy()
							end
							v.Humanoid:ChangeState(11)
							v.Humanoid:ChangeState(14)
						end
					end
				end
			end
		end)
	end
end)

task.spawn(function()
while true do wait()
if setscriptable then
setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
end
if sethiddenproperty then
sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
end
end
end)
--//Bypass Tp
Setting:Toggle("Bypass TP", true, function(value)
        BypassTP = value
        end)
        
Setting:Toggle("No Clip", false, function(value)
        _G.No_clip = value
        end)
spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if _G.No_clip then
                for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false    
                    end
                end
            end
        end)
    end)
end)

  function NoDodgeCool()
        if nododgecool then
            for i,v in next, getgc() do
                if game:GetService("Players").LocalPlayer.Character.Dodge then
                    if typeof(v) == "function" and getfenv(v).script == game:GetService("Players").LocalPlayer.Character.Dodge then
                        for i2,v2 in next, getupvalues(v) do
                            if tostring(v2) == "0.1" then
                            repeat wait(.1)
                                setupvalue(v,i2,0)
                            until not nododgecool
                            end
                        end
                    end
                end
            end
        end
  end
  
Race:Toggle("Auto Hop for gear in mirage island", false, function(value)
HopMirage = value
end)


function Hopless()
repeat wait() until game:IsLoaded()
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end
function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' ..
            PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' ..
            PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i, v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _, Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)
            end
        end
    end
end

function TeleportLow()
    pcall(function()
        TPReturner()
        if foundAnything ~= "" then
            TPReturner()
        end
    end)
end
TeleportLow() 
end
--//Function auto hop for gear
spawn(function()
		pcall(function()
			while wait() do
				if HopMirage and World3 then
					if not game.Workspace._WorldOrigin.Locations:FindFirstChild('Mirage Island') then
					    Hopless()
					end
				end
			end
		end)
	end)
	
	spawn(function()
		pcall(function()
			while wait() do
				if HopMirage and World3 then
					if game.Workspace._WorldOrigin.Locations:FindFirstChild('Mirage Island') then 
					    _G.DaoBiLon = true
					    _G.MP40 = true
					    _G.AutoAgility = true
					    _G.Luom_Gear = true
					end
				end
			end
		end)
	end) 
	
  Race:Toggle("Speak With the Red Head in a big rock", false, function(value)
function topos(Pos)
        Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if game.Players.LocalPlayer.Character.Humanoid.Sit == true then game.Players.LocalPlayer.Character.Humanoid.Sit = false end
        pcall(function() tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/250, Enum.EasingStyle.Linear),{CFrame = Pos}) end)
        tween:Play()
        if Distance <= 250  then
            tween:Cancel()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
        end
        if _G.StopTween == true then
            tween:Cancel()
            _G.Clip = false
        end
    end
    
    function GetDistance(target)
        return math.floor((target.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)
    end

function two(gotoCFrame) --- Tween
      pcall(function()
          game.Players.LocalPlayer.Character.Humanoid.Sit = false
          game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
      end)
      if (game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - gotoCFrame.Position).Magnitude <= 200 then
          pcall(function() 
              tweenz:Cancel()
          end)
          game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.CFrame = gotoCFrame
      else
          local tween_s = game:service"TweenService"
          local info = TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - gotoCFrame.Position).Magnitude/999999, Enum.EasingStyle.Linear)
           tween, err = pcall(function()
              tweenz = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = gotoCFrame})
              tweenz:Play()
          end)
          if not tween then return err end
      end
      function _TweenCanCle()
          tweenz:Cancel()
      end
  
end



local args = {
    [1] = "requestEntrance",
    [2] = Vector3.new(-12463.6025390625, 378.3270568847656, -7566.0830078125)
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
wait(1)
two(CFrame.new(-5043.92432, 316.20578, -2994.26904, -0.996121764, 0.00353530352, 0.0879130736, -1.68627594e-07, 0.999192297, -0.0401832461, -0.0879841298, -0.0400274247, -0.99531734))
wait(1)
topos(CFrame.new(-5355.62256, 313.715485, -2495.17383, 0.447177857, 6.1724144e-08, 0.894445062, 3.27962084e-08, 1, -8.54047784e-08, -0.894445062, 6.75255336e-08, 0.447177857))
wait(4)
two(CFrame.new(-5501.28369, 1090.39294, -2465.23438, -0.865793586, 0.025783211, 0.499736547, 2.4792098e-07, 0.99867171, -0.0515246391, -0.500401258, -0.0446095653, -0.864643633))
two(CFrame.new(-5844.28418, 1074.10681, -2100.07422, 0.957914591, 0.0115018021, 0.286822826, 4.72762622e-07, 0.999196887, -0.0400702134, -0.287053347, 0.0383839831, 0.957145214))
local args = {
    [1] = "RaceV4Progress",
    [2] = "Check"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
local args = {
    [1] = "RaceV4Progress",
    [2] = "Begin"
}


game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))

wait(1)

 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.3555, 14896.5352, 102.624695, 0, 0, 1, 0, 1, 0, -1, 0, 0)
 wait(0.5)
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.3555, 14896.5352, 102.624695, 0, 0, 1, 0, 1, 0, -1, 0, 0)
 wait(1)
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.3555, 14896.5352, 102.624695, 0, 0, 1, 0, 1, 0, -1, 0, 0)
 wait(1.5)
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.3555, 14896.5352, 102.624695, 0, 0, 1, 0, 1, 0, -1, 0, 0)
 two(CFrame.new(28608.6953, 14898.1895, 105.982483, 0.403912157, -0.0356420763, -0.91410315, 6.79865479e-08, 0.999240696, -0.0389616787, 0.914797783, 0.015737053, 0.403605521))
 wait(1)
local args = {
    [1] = "RaceV4Progress",
    [2] = "TeleportBack"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))


wait(1.5)
local args = {
    [1] = "RaceV4Progress",
    [2] = "Teleport"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
wait(2)

local args = {
    [1] = "requestEntrance",
    [2] = Vector3.new(-12463.6025390625, 378.3270568847656, -7566.0830078125)
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
wait(1)
two(CFrame.new(-5043.92432, 316.20578, -2994.26904, -0.996121764, 0.00353530352, 0.0879130736, -1.68627594e-07, 0.999192297, -0.0401832461, -0.0879841298, -0.0400274247, -0.99531734))
topos(CFrame.new(-5355.62256, 313.715485, -2495.17383, 0.447177857, 6.1724144e-08, 0.894445062, 3.27962084e-08, 1, -8.54047784e-08, -0.894445062, 6.75255336e-08, 0.447177857))


local args = {
    [1] = "RaceV4Progress",
    [2] = "Check"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
local args = {
    [1] = "RaceV4Progress",
    [2] = "Continue"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
NotificationLibrary:SendNotification("Warning", "Completed Function", 10)
end)

Race:Toggle("Teleport Mirage", false, function(value)
_G.DaoBiLon = value
StopTween(_G.DaoBiLon)
end)
spawn(function()
            pcall(function()
                while wait() do
                    if _G.DaoBiLon then
                        if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                            topos(CFrame.new(game:GetService("Workspace").Map.MysticIsland.Center.Position.X,500,game:GetService("Workspace").Map.MysticIsland.Center.Position.Z))
                           NotificationLibrary:SendNotification("Warning", "Tween Mirage Island: On", 10)
                        end
                    end
                end
            end)
        end)
        
Race:Toggle("Lock Moon + turn V3", false, function(value)
_G.MP40 = value
_G.AutoAgility = value
end)

spawn(function()
    while wait() do
		pcall(function()
			if _G.MP40 then
			    wait(0.5)
				local moonDir = game.Lighting:GetMoonDirection()
                local lookAtPos = game.Workspace.CurrentCamera.CFrame.p + moonDir * 100
                game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.p, lookAtPos)
			end
		end)
    end
end)

spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoAgility then
                    game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
                end
            end
        end)
    end)
    
Race:Toggle("Tween To The Blue Gear", false, function(Vu)
_G.Luom_Gear = Vu
end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.Luom_Gear then
				if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
					for i,v in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do 
						if v:IsA("MeshPart")then 
                            if v.Material == Enum.Material.Neon then  
                                topos(v.CFrame)
                            end
                        end
					end
				end
			end
        end
    end)
end)

spawn(function()
		pcall(function()
			while wait() do
				if _G.Luom_Gear and World3 then
					if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
					    _G.DaoBiLon = false
					end
				end
			end
		end)
	end)
	
Race:Label("V4")
Race:Toggle("Completed Trial", false, function(Vu)
    _G.AutoQuestRace = Vu
    StopTween(_G.AutoQuestRace)
end)

spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoQuestRace then
				if game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
					for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
						if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
							pcall(function()
								repeat wait(.1)
									v.Humanoid.Health = 0
									v.HumanoidRootPart.CanCollide = false
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
								until not _G.AutoQuestRace or not v.Parent or v.Humanoid.Health <= 0
							end)
						end
					end
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
                    for i,v in pairs(game:GetService("Workspace").Map.SkyTrial.Model:GetDescendants()) do
                        if v.Name ==  "snowisland_Cylinder.081" then
                            TPP(v.CFrame* CFrame.new(0,0,0))
                        end
                    end 
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
					topos(CFrame.new(28490.708984375, 14895.759765625, -420.38848876953125))
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
					for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
						if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
							pcall(function()
								repeat wait(.1)
									v.Humanoid.Health = 0
									v.HumanoidRootPart.CanCollide = false
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
								until not _G.AutoQuestRace or not v.Parent or v.Humanoid.Health <= 0
							end)
						end
					end
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
                    for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
                        if v.Name == "StartPoint" then
                            TPP(v.CFrame* CFrame.new(0,3,0))
                            if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
                                _G.AutoQuestRace = false
                                StopTween(_G.AutoQuestRace)
                       end
                        end
                    end
                end
            end
        end
    end)
end)

Race:Toggle("Kill Sea beast trial", false, function(Vu)
    _G.AutoSeaBest = Vu
    StopTween(_G.AutoSeaBest)
end)
spawn(function()
        while wait() do
            if _G.AutoSeaBest then
                   pcall(function()                   
					for i,v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
						if v:FindFirstChild("HumanoidRootPart") then
						    AutoHaki()
							topos(v.HumanoidRootPart.CFrame * CFrame.new(1,450,45))
							game:GetService("VirtualUser"):CaptureController()
							game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
							for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
								if v:IsA("Tool") then
									if v.ToolTip == "Melee" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
										game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
									end
								end
							end
							game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
								if v:IsA("Tool") then
									if v.ToolTip == "Blox Fruit" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
										game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
									end
								end
							end
							game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
					        game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(0.6)
							for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
								if v:IsA("Tool") then
									if v.ToolTip == "Sword" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
										game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
									end
								end
							end
							game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(0.5)
							for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
								if v:IsA("Tool") then
									if v.ToolTip == "Gun" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
										game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
									end
								end
							end
							game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
						end
					end
                    end)
                end
        end
          end)
          
Race:Label("Kill Trial")

Race:Toggle("Kill Player No Skill", false, function(Vu)
_G.killnoskill = Vu
StopTween(_G.killnoskill)
end)
spawn(function()
    while wait() do 
        pcall(function()
            if _G.killnoskill and World3 then
                for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
                    if v.Name ~= game.Players.LocalPlayer.Name and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 230 then
                        if v.Humanoid.Health > 0 then
                            repeat wait()
                                AutoHaki()
                                EquipWeapon(_G.SelectWeapon)
                                NameTarget = v.Name
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(0,0,5))
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                Click()
                            until not _G.killnoskill or not v.Parent or v.Humanoid.Health <= 0 
                        end
                    end
                end
            end
        end)
    end
end)

Race:Toggle("Kill Player After Trial Use Skill", false, function(Vu)
_G.Kill_V4 = Vu
StopTween(_G.Kill_V4)
end)
spawn(
    function()
    while task.wait() do
        if _G.Kill_V4 and World3 then
            pcall(
                function()
    if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == true then
                for i, v in pairs(game.Workspace.Characters:GetChildren()) do
                    if v.Name ~= game.Players.LocalPlayer.Name then
                        if v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") and v.Parent and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 230 then
                            repeat task.wait()
                                AutoHaki()
                                EquipWeapon(_G.SelectWeapon)
                                UsefastattackPlayers = true
                            topos(v.HumanoidRootPart.CFrame * CFrame.new(1, 1, 2))
                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            if _G.Z then
           game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
                     wait(.1)
           game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                                end
                            if _G.X then
           game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                     wait(.1)
           game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                                end
                            if _G.C then
           game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                     wait(.1)
           game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
           end
                           if _G.V then
           game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game)
                     wait(.1)
           game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game)
                                end
                                if _G.F then
           game:GetService("VirtualInputManager"):SendKeyEvent(true,"F",false,game)
                     wait(.1)
           game:GetService("VirtualInputManager"):SendKeyEvent(false,"F",false,game)
           end
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.Humanoid.WalkSpeed = 0          
              sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                            until _G.Kill_V4 == false or v.Humanoid.Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid")
                            end
                        end
                    end
                end
            end
            )
        end
    end
end
)

Race:Toggle("Reset After Trial", false, function(Vu)
Reset = Vu
StopTween(Reset)
end)
spawn(function()
		pcall(function()
			while wait() do
				if Reset then
					if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == true then
					    game.Players.LocalPlayer.Character.Head:Destroy()
					end
				end
			end
		end)
	end)
	
Race:Button("Reset Charater", function()
game.Players.LocalPlayer.Character.Head:Destroy()
end)

Race:Label("Setting For Kill Trial")

Race:Toggle("Skill Z", true, function(Vu)
    _G.Z = Vu
end)

Race:Toggle("Skill X", true, function(Vu)
    _G.X = Vu
end)

Race:Toggle("Skill C", false, function(Vu)
    _G.C = Vu
end)

Race:Toggle("Skill V", false, function(Vu)
    _G.V = Vu
end)

Race:Toggle("Skill F", false, function(Vu)
    _G.F = Vu
end)

Race:Label("Train")

Race:Toggle("Auto Train", false, function(Vu)
_G.CacRace = Vu
    _G.Auto_Bone = Vu
    StopTween(_G.Auto_Bone)
end)

spawn(function()
    pcall(function()
        while wait() do
            if _G.CacRace then
                if game.Players.LocalPlayer.Character.RaceTransformed.Value == true then
                    _G.Auto_Bone = false
                    topos(CFrame.new(-8964.06640625, 545.8358154296875, 5416.81640625)) 
                end
            end
        end
    end)
end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.CacRace then
                if game.Players.LocalPlayer.Character.RaceTransformed.Value == false then
                    _G.Auto_Bone = true
                end
            end
        end
    end
    )
end
)
task.spawn(
    function()
        while task.wait() do
            task.wait()
            if _G.CacRace then
                if
                    game.Players.LocalPlayer.Character:FindFirstChild("RaceEnergy") and
                        game.Players.LocalPlayer.Character.RaceEnergy.Value >= 1 and
                        not game.Players.LocalPlayer.Character.RaceTransformed.Value
                 then
                    local be = game:service("VirtualInputManager")
                    be:SendKeyEvent(true, "Y", false, game)
                    task.wait()
                    be:SendKeyEvent(false, "Y", false, game)
                end
            end
        end
    end
)
spawn(
   function()
      pcall(
        function()
           while wait(0.1) do
            if _G.CacRace then
                local args = {
                [1] = true
                }
                local args = {
                    [1] = "UpgradeRace",
                    [2] = "Buy"
                }
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
            end
        end 
    end
    )
end
)                            

Race:Button("Teleport to Aicent Red", function()
	topos(CFrame.new(28973.6484375, 14889.759765625, -115.873291015625))
end)

Race:Label("Place For Up V4")

function Xaodo()
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
        "requestEntrance",
        Vector3.new(28727.33203125, 15147.4345703125, -84.25939178466797)
        )
end

Race:Button("Teleport to Greet Tree", function()
    topos(CFrame.new(28603.7305, 14896.5352, 105.38382))
    wait(1)
    local args = {
    [1] = "RaceV4Progress",
    [2] = "TeleportBack"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end)

Race:Button("Teleport to Temple Of Time", function()
       topos(CFrame.new(28286.361328125, 14896.634765625, 102.62467193603516))
    end)

Race:Button("Tele gear", function() 
    topos(CFrame.new(29539.582, 15068.6846, -86.7974472))
    end)

          Race:Button("Teleport to Race Doors", function()
	           if game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
                topos(CFrame.new(29239.271484375, 14890.759765625, -204.24472045898438))
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
                topos(CFrame.new(28969.751953125, 14923.216796875, 234.89938354492188))
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
                topos(CFrame.new(28221.904296875, 14894.7763671875, -210.73574829101562))
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
                topos(CFrame.new(28490.708984375, 14895.759765625, -420.38848876953125))
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
                topos(CFrame.new(28673.220703125, 14890.4609375, 456.0308837890625))
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
                topos(CFrame.new(29023.35546875, 14891.642578125, -377.6640625))
				end
end)

--//Shop
Shop:Label("Sword")
Shop:Button("Buy Katana", function() 
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Katana")
end)
Shop:Button("Buy Cutlass", function() 
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cutlass")
end)
Shop:Button("Buy Duel Katana", function() 
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Duel Katana")
end)
Shop:Button("Buy Iron Mace", function() 
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Iron Mace")
end)
Shop:Button("Buy Pipe", function() 
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Pipe")
end)
Shop:Button("Buy Triple Katana", function() 
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Triple Katana")
end)
Shop:Button("Buy Dual-Headed Blade", function() 
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Dual-Headed Blade")
end)
Shop:Button("Buy Bisento", function() 
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Bisento")
end)
Shop:Button("Buy Soul Cane", function() 
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Soul Cane")
end)

Shop:Label("Gun")
Shop:Button("Buy Slingshot", function() 
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Slingshot")
end)
Shop:Button("Buy Musket", function() 
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Musket")
end)
Shop:Button("Buy Flintlock", function() 
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Flintlock")
end)
Shop:Button("Buy Refined Flintlock", function() 
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Refined Flintlock")
end)
Shop:Button("Buy Cannon", function() 
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cannon")
end)
Shop:Button("Buy Kabucha", function() 
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Slingshot","1")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Slingshot","2")
end)

Shop:Label("Fragments")
Shop:Button("Buy Refund Stats", function() 
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","1")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","2")
end)
Shop:Button("Race Reroll", function() 
    local args = {
        [1] = "BlackbeardReward",
        [2] = "Reroll",
        [3] = "2"
    }
   end)

Shop:Button("Buy Haki Color", function() 
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "2")
end)
Shop:Toggle("Auto Buy Haki Color + Auto Hop", false, function(vu)
	_G.Setting_table.Buso_Haki = vu
	Buso_Haki_Buy = vu
	Update_Setting(getgenv()['MyName'])
end)

spawn(function()
	while wait(.5) do
		pcall(function()
			if Buso_Haki_Buy then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "2")
			else
				wait(3)
			end
		end)
	end
end)

spawn(function()
	while wait(2) do
		pcall(function()
			if _G.Setting_table.Buso_Haki_Hop then
				wait(10)
				Hopless()
				wait(20)
			else
				wait(3)
			end
		end)
	end
end)

--//Fruit
Fruit:Button("Shop Devil Fruit",function()
    local args = {
        [1] = "GetFruits"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    game.Players.localPlayer.PlayerGui.Main.FruitShop.Visible = true
end)

Fruit:Toggle("Random Fruit", false, function(value)
    _G.Random_Auto = value
end)
spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.Random_Auto then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
                end 
            end
        end)
    end)
    
Fruit:Button("Random Fruit",function()
    local args = {
        [1] = "Cousin",
        [2] = "Buy"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Fruit:Toggle("Tween Fruit", false, function(value)
    _G.Tweenfruit = Value
    StopTween(_G.Tweenfruit)
end)
    
spawn(function()
    while wait(.1) do
        if _G.Tweenfruit then
            for i,v in pairs(game.Workspace:GetChildren()) do
                if string.find(v.Name, "Fruit") then
                    topos(v.Handle.CFrame)
                end
            end
        end
    end
end)

Fruit:Toggle("Bring All Fruits", false, function(value)
    _G.AutoBringFruit = value
end)
spawn(function()
    pcall(function()
        while wait(.1) do
            if _G.AutoBringFruit then
                for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if string.find(v.Name, "Fruit") then
                        if v:IsA("Tool") then
                            v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 45, 0)
                            wait(.3)
                            local FireFruit = game.Players.LocalPlayer.Character.HumanoidRootPart
                            firetouchinterest(FireFruit, v.Handle, 0)
                        end
                    end
                end
            end
        end
    end)
end)
Fruit:Toggle("Store All Fruits", false, function(value)
    _G.AutoStoreSsFruit = value
end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoStoreSsFruit then
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and string.find(v.Name, "Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit",v:GetAttribute("OriginalName"),v)
                        Load.Text = "Keep Fruit Success"
                    end
                end
                for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v:IsA("Tool") and string.find(v.Name, "Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit",v:GetAttribute("OriginalName"),v)
                        Load.Text = "Keep Fruit Success"
                    end
                end
            end
        end
    end)
end)

Fruit:Button("Rain Fruit",function()
for h, i in pairs(game:GetObjects("rbxassetid://14759368201")[1]:GetChildren()) do
            i.Parent = game.Workspace.Map
            i:MoveTo(
                game.Players.LocalPlayer.Character.PrimaryPart.Position +
                    Vector3.new(math.random(-50, 50), 100, math.random(-50, 50))
            )
            if i.Fruit:FindFirstChild("AnimationController") then
                i.Fruit:FindFirstChild("AnimationController"):LoadAnimation(i.Fruit:FindFirstChild("Idle")):Play()
            end
            i.Handle.Touched:Connect(
                function(cR)
                    if cR.Parent == game.Players.LocalPlayer.Character then
                        i.Parent = game.Players.LocalPlayer.Backpack
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(i)
                    end
                end
            )
        end
    end
    )
    
--//Sea Event
Sea:Label("Boat")
BoatsName = {}
for i,v in pairs(game:GetService("Workspace").Boats:GetChildren()) do  
    table.insert(BoatsName ,v.Name)
end

Boats = Sea:Dropdown("Select Boats",BoatsName,function(value)
    _G.SelectB = value
end)

Sea:Button("Refresh", function()
    BoatsName = {}
    Boats:Clear()
    for i,v in pairs(game:GetService("Workspace").Boats:GetChildren()) do  
       Boats:Add(v.Name)
    end
end)

Sea:Toggle("Teleport To Boats", false, function(value)
    _G.TPB = bool       
    StopTween(_G.TPB)
    if _G.TPB then
        _G.Boats = true
        while _G.Boats do wait()
            Distance = (game:GetService("Workspace").Boats[_G.SelectB].VehicleSeat.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            Speed = 220
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear)
            tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = game:GetService("Workspace").Boats[_G.SelectB].VehicleSeat.CFrame})
            tween:Play()
            _G.Clip = true
            wait(Distance/Speed)
        end
    elseif _G.TPB == false then
        _G.Boats = false
        while _G.Boats do wait()
            Distance = (game:GetService("Workspace").Boats[_G.SelectB].VehicleSeat.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            Speed = 220
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear)
            tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = game:GetService("Workspace").Boats[_G.SelectB].VehicleSeat.CFrame})
            tween:Play()
            _G.Clip = true
            wait(Distance/Speed)
        end
        tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(.1, Enum.EasingStyle.Linear)
        tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame})
        tween:Play()
        _G.Clip = false
    end
end)

Sea:Button("Bring Boats", function()
    game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Boats[_G.SelectB].VehicleSeat.CFrame
end)

Sea:Toggle("Spectate Boats", false, function(value)
    Sp = value
    local plr1 = game.Players.LocalPlayer.Character.Humanoid
    local plr2 = game:GetService("Workspace").Boats:FindFirstChild(_G.SelectB)
    repeat wait(.1)
       game.Workspace.Camera.CameraSubject = game:GetService("Workspace").Boats[_G.SelectB].VehicleSeat
    until Sp == false 
    game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
end)

Sea:Label("Auto")

Sea:Toggle("Drive Boat", false, function(value)
    _G.LionAutoDriveBoat = value
    StopTween(_G.LionAutoDriveBoat)
end)

spawn(function()
    while wait() do
        pcall(function()
            if _G.LionAutoDriveBoat then
                if not game:GetService("Workspace").Enemies:FindFirstChild("Shark") or not game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") or not game:GetService("Workspace").Enemies:FindFirstChild("Piranha") or not game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") or not game:GetService("Workspace").SeaBeasts:FindFirstChild("SeaBeast1") or not game:GetService("Workspace").Boats:FindFirstChild("FishBoat") or not game:GetService("Workspace").Boats:FindFirstChild("PirateGrandBrigade") then
                    if not game:GetService("Workspace").Boats:FindFirstChild("PirateBrigade") then
                        buyb = TPP(CFrame.new(-16927.451171875, 9.0863618850708, 433.8642883300781))
                        if (CFrame.new(-16927.451171875, 9.0863618850708, 433.8642883300781).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                            if buyb then buyb:Stop() end
                            local args = {
                                [1] = "BuyBoat",
                                [2] = "PirateBrigade"
                            }

                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        end
                    elseif game:GetService("Workspace").Boats:FindFirstChild("PirateBrigade") then
                        if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false then
                            TPP(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame * CFrame.new(0,1,0))
                        else
                            for i,v in pairs(game:GetService("Workspace").Boats:GetChildren()) do
                                if v.Name == "PirateBrigade" then
                                    repeat wait()
                                        if (CFrame.new(-17013.80078125, 10.962434768676758, 438.0169982910156).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                                            TPB(CFrame.new(-44541.7617, 30.0003204, -1244.8584, -0.0844199061, -0.00553312758, 0.9964149, -0.0654025897, 0.997858942, 2.02319411e-10, -0.99428153, -0.0651681125, -0.0846010372))
                                        elseif (CFrame.new(-44541.7617, 30.0003204, -1244.8584, -0.0844199061, -0.00553312758, 0.9964149, -0.0654025897, 0.997858942, 2.02319411e-10, -0.99428153, -0.0651681125, -0.0846010372).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                                            TPB(CFrame.new(-38887.5547, 30.0004578, -2162.99023, -0.188895494, -0.00704088295, 0.981971979, -0.0372481011, 0.999306023, -1.39882339e-09, -0.981290519, -0.0365765914, -0.189026669))
                                        elseif (CFrame.new(-38887.5547, 30.0004578, -2162.99023, -0.188895494, -0.00704088295, 0.981971979, -0.0372481011, 0.999306023, -1.39882339e-09, -0.981290519, -0.0365765914, -0.189026669).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                                            TPB(CFrame.new(-44541.7617, 30.0003204, -1244.8584, -0.0844199061, -0.00553312758, 0.9964149, -0.0654025897, 0.997858942, 2.02319411e-10, -0.99428153, -0.0651681125, -0.0846010372))
                                        end 
                                    until game:GetService("Workspace").Enemies:FindFirstChild("Shark") or game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") or game:GetService("Workspace").Enemies:FindFirstChild("Piranha") or game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") or game:GetService("Workspace").SeaBeasts:FindFirstChild("SeaBeast1") or game:GetService("Workspace").Boats:FindFirstChild("FishBoat") or game:GetService("Workspace").Boats:FindFirstChild("PirateGrandBrigade") or _G.LionAutoDriveBoat == false
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.LionAutoDriveBoat then
                if game:GetService("Workspace").Enemies:FindFirstChild("Shark") or game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") or game:GetService("Workspace").Enemies:FindFirstChild("Piranha") or game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") or game:GetService("Workspace").SeaBeasts:FindFirstChild("SeaBeast1") or game:GetService("Workspace").Boats:FindFirstChild("FishBoat") or game:GetService("Workspace").Boats:FindFirstChild("PirateGrandBrigade") then
                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                end
            end
        end
    end)
end)

Sea:Toggle("Auto Rough Sea", false, function(value)
    _G.NoClipRock = value
    _G.AutoPressW = value
    StopTween( _G.AutoPressW)
end)
spawn(function()
                while wait() do
                    pcall(function()
                    for i, boat in pairs(game:GetService("Workspace").Boats:GetChildren()) do
                        for _, v in pairs(game:GetService("Workspace").Boats[boat.Name]:GetDescendants()) do
                            if v:IsA("BasePart") then
                                if _G.NoClipRock or _G.SailBoat then
                                    v.CanCollide = false
                                else
                                    v.CanCollide = true
                                end
                            end
                        end
                    end
                    end)
                end
            end)
            
spawn(function()
                while wait() do
                    pcall(function()
                        if _G.AutoPressW then
                            if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"W",false,game)
                        end
                        end
                    end)
                end
            end)
            
Sea:Toggle("No Clip Rock", false, function(value)
    _G.NoClipRock = value
    StopTween(_G.NoClipRock)
end)

Sea:Toggle("Press Q", false, function(value)
    _G.AutoPressW = value
    StopTween(_G.AutoPressW)
end)

Sea:Toggle("Auto Kill Terror Shark", false, function(value)
    _G.AutoTerrorshark = value
    StopTween( _G.AutoTerrorshark)
end)
spawn(function()
    while wait() do
        if  _G.AutoTerrorshark and World3 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Terrorshark" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    PosNarathiwat = v.HumanoidRootPart.CFrame
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                until not  _G.AutoTerrorshark or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark") then
                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                    else
                        if  _G.AutoTerrorsharkhop then
                            Hop()
                        end
                    end
                end
            end)
        end
    end
end)

Sea:Toggle("Auto Kill Shark", false, function(value)
    FarmShark = value
    StopTween(FarmShark)
end)
spawn(function()
    while wait() do
        if  FarmShark and World3 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Shark") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Shark" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    PosNarathiwat = v.HumanoidRootPart.CFrame
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                until not  FarmShark or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark") then
                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                    else
                        if  _G.AutoTerrorsharkhop then
                            Hop()
                        end
                    end
                end
            end)
        end
    end
end)

Sea:Toggle("Auto Kill Piranha", false, function(value)
    _G.farmpiranya = value
    StopTween(_G.farmpiranya)
end)
spawn(function()
    while wait() do
        if  _G.farmpiranya and World3 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Piranha") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Piranha" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    PosNarathiwat = v.HumanoidRootPart.CFrame
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                until not  _G.farmpiranya or not v.Parent or v.Humanoid.Health <= 0
 
                            end
                        end
                    end
                else
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Piranha") then
                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Piranha").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                    else
                        if  _G.AutoTerrorsharkhop then
                            Hop()
                        end
                    end
                end
            end)
        end
    end
end)

Sea:Toggle("Auto Kill Fish Crew Member", false, function(value)
    _G.Fish_Crew_Member = value
    StopTween(_G.Fish_Crew_Member)
end)
spawn(function()
    while wait() do
        if  _G.Fish_Crew_Member and World3 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Fish Crew Member" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    PosNarathiwat = v.HumanoidRootPart.CFrame
                                    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                    topos(v.HumanoidRootPart.CFrame * Pos)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                until not  _G.Fish_Crew_Member or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Fish Crew Member") then
                        topos(game:GetService("ReplicatedStorage"):FindFirstChild("Fish Crew Member").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                    else
                        if  _G.AutoTerrorsharkhop then
                            Hop()
                        end
                    end
                end
            end)
        end
    end
end)

Sea:Toggle("Auto Kill Raid Ship", false, function(value)
    _G.KillGhostShip = value
    StopTween(_G.KillGhostShip)
end)
spawn(function()
    while wait() do
        if _G.KillGhostShip then
            pcall(function()
                if CheckPirateBoat() then
                    game:GetService("VirtualInputManager"):SendKeyEvent(true,32,false,game)
                    wait(.5)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false,32,false,game)
                    local v = CheckPirateBoat()
                    repeat
                        wait()
                        spawn(topos(v.Engine.CFrame * CFrame.new(0, -20, 0)), 1)
                        AimBotSkillPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -5, 0)
                        Skillaimbot = true
                        AutoSkill = false
                    until not v or not v.Parent or v.Health.Value <= 0 or not CheckPirateBoat()
                    Skillaimbot = true
                    AutoSkill = false
                end
            end)
        end
    end
end)

Sea:Toggle("Auto Kill Ghost Ship", false, function(value)
    _G.bjirFishBoat = value
    StopTween(_G.bjirFishBoat)
end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.bjirFishBoat then
                if CheckPirateBoat() then
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 32, false, game)
                    wait(0.5)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 32, false, game)
                    local v = CheckPirateBoat()
                    repeat
                        wait()
                        spawn(topos(v.Engine.CFrame * CFrame.new(0, -20, 0), 1))
                        AutoSkill = true
                        Skillaimbot = true
                        AimBotSkillPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -5, 0)
                    until v.Parent or v.Health.Value <= 0 or not CheckPirateBoat()
                    AutoSkill = false
                    Skillaimbot = false
                end
            end
        end)
    end
end)   
spawn(function()
    while wait() do
        if _G.bjirFishBoat then
               pcall(function()
                    if CheckPirateBoat() then
                        AutoHaki()
                        game:GetService("VirtualUser"):CaptureController()
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v:IsA("Tool") then
                                if v.ToolTip == "Melee" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
                                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                end
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v:IsA("Tool") then
                                if v.ToolTip == "Blox Fruit" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
                                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                end
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.6)
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v:IsA("Tool") then
                                if v.ToolTip == "Sword" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
                                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                end
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.5)
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v:IsA("Tool") then
                                if v.ToolTip == "Gun" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
                                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                end
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
                    end
                end)
            end
    end
end)

Sea:Toggle("Auto Sea Beast", false, function(value)
    _G.AutoSeaBest = value
    StopTween(_G.AutoSeaBest)
end)
if not _G.AutoSeaBest then
            AutoSkill = false
            Skillaimbot = false
        end
    function CheckSeaBeast()
        if game:GetService("Workspace"):FindFirstChild("SeaBeasts") then
            for i,v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
                if v:FindFirstChild("Humanoid") or v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health < 0 then
                    return true
                end
            end
        end
        return false
    end
         spawn(function()
             while wait() do
                 if _G.AutoSeaBest then
                         pcall(function()
                         if game:GetService("Workspace"):FindFirstChild("SeaBeasts") then
                             for i,v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
                                 if CheckSeaBeast() then
                                 repeat wait()
                                      CFrameSeaBeast = v.HumanoidRootPart.CFrame * CFrame.new(0,400,0)
                                      if (CFrameSeaBeast.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position).Magnitude <= 50 then
                                          AutoSkill = true
                                      else
                                          AutoSkill = false
                                      end
                                      Skillaimbot = true
                                      AimBotSkillPosition = v.HumanoidRootPart.CFrame.Position
                                      TP2(CFrameSeaBeast)
                                  until not _G.AutoSeaBest or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health < 0 or not v.Parent
                                 Skillaimbot = false
                                  AutoSkill = false
                                 end
                             end
                         end
                         end)
                     end
                 end
             end)
        
local gg = getrawmetatable(game)
local old = gg.__namecall
setreadonly(gg,false)
gg.__namecall = newcclosure(function(...)
	local method = getnamecallmethod()
	local args = {...}
	if tostring(method) == "FireServer" then
		if tostring(args[1]) == "RemoteEvent" then
			if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
				if Skillaimbot then
					args[2] = AimBotSkillPosition
					return old(unpack(args))
				end
			end
		end
	end
	return old(...)
end)
Skillz = true
Skillx = true
Skillc = true
Skillv = true
spawn(function()
    while wait() do
        pcall(function()
            if AutoSkill then
                if Skillz then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                    wait(.1)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
                end
                if Skillx then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                    wait(.1)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                end
                if Skillc then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
                    wait(.1)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
                end
                if Skillv then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
                    wait(.1)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
                end
            end
        end)
    end
end)

Sea:Label("🦊 Kitsune 🦊")

Sea:Toggle("Summon Kitsune Island [ Only Summon ]", false, function(value)
    _G.LionAutoDriveBoat2 = value
    StopTween(_G.LionAutoDriveBoat2)
end)
	
spawn(function()
    while wait() do
        pcall(function()
            if _G.LionAutoDriveBoat2 then
                if not game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") then
                    if not game:GetService("Workspace").Boats:FindFirstChild("PirateBrigade") then
                        buyb = TPP(CFrame.new(-16927.451171875, 9.0863618850708, 433.8642883300781))
                        if (CFrame.new(-16927.451171875, 9.0863618850708, 433.8642883300781).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                            if buyb then buyb:Stop() end
                            local args = {
                                [1] = "BuyBoat",
                                [2] = "PirateBrigade"
                            }

                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        end
                    elseif game:GetService("Workspace").Boats:FindFirstChild("PirateBrigade") then
                        if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false then
                            TPP(game:GetService("Workspace").Boats.PirateBrigade.VehicleSeat.CFrame * CFrame.new(0,1,0))
                        else
                            for i,v in pairs(game:GetService("Workspace").Boats:GetChildren()) do
                                if v.Name == "PirateBrigade" then
                                    repeat wait()
                                        if (CFrame.new(-17013.80078125, 10.962434768676758, 438.0169982910156).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                                            TPB(CFrame.new(-44541.7617, 30.0003204, -1244.8584, -0.0844199061, -0.00553312758, 0.9964149, -0.0654025897, 0.997858942, 2.02319411e-10, -0.99428153, -0.0651681125, -0.0846010372))
                                        elseif (CFrame.new(-44541.7617, 30.0003204, -1244.8584, -0.0844199061, -0.00553312758, 0.9964149, -0.0654025897, 0.997858942, 2.02319411e-10, -0.99428153, -0.0651681125, -0.0846010372).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                                            TPB(CFrame.new(-38887.5547, 30.0004578, -2162.99023, -0.188895494, -0.00704088295, 0.981971979, -0.0372481011, 0.999306023, -1.39882339e-09, -0.981290519, -0.0365765914, -0.189026669))
                                        elseif (CFrame.new(-38887.5547, 30.0004578, -2162.99023, -0.188895494, -0.00704088295, 0.981971979, -0.0372481011, 0.999306023, -1.39882339e-09, -0.981290519, -0.0365765914, -0.189026669).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                                            TPB(CFrame.new(-44541.7617, 30.0003204, -1244.8584, -0.0844199061, -0.00553312758, 0.9964149, -0.0654025897, 0.997858942, 2.02319411e-10, -0.99428153, -0.0651681125, -0.0846010372))
                                        end 
                                    until game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") or _G.LionAutoDriveBoat2 == false
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)
spawn(function()
    pcall(function()
        while wait() do
            if _G.LionAutoDriveBoat2 then
                if game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") then
                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                end
            end
        end
    end)
end)

Sea:Toggle("Tween to Kitsune Island", false, function(value)
    _G.TweenToKitsune = value
    StopTween(_G.TweenToKitsune)
end)

spawn(function()
    while wait() do
        if _G.TweenToKitsune then
            pcall(function()
                if game.Workspace._WorldOrigin.Locations:FindFirstChild('Kitsune Island') then
                    topos(game.Workspace._WorldOrigin.Locations:FindFirstChild('Kitsune Island').HumanoidRootPart.CFrame * CFrame.new(0,100,0))
                end
            end)
        end
    end
end)

Sea:Toggle("Collect Azure", false, function(value)
    _G.CollectAzure = value
    StopTween(_G.CollectAzure)
end)
spawn(function()
            while wait() do
                if _G.CollectAzure then
                    pcall(function()
                        if game:GetService("Workspace"):FindFirstChild("AttachedAzureEmber") then
                            topos(game:GetService("Workspace"):WaitForChild("EmberTemplate"):FindFirstChild("Part").CFrame) NotificationLibrary:SendNotification("Lụm Cac cha mày", 10)
                        end
                    end)
                end
            end
        end)
        
        _G.SetToTradeAureEmber = 22
        Sea:Slider("Set Azure", 10, 25, _G.SetToTradeAureEmber, function(v)
            _G.SetToTradeAureEmber = v
        end)

        Sea:Toggle("Trade Azure", false, function(Vu)
            _G.TradeAureEmber = Vu
        end)

        function GetCountMaterials(MaterialName)
            local Inventory = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")
            for i, v in pairs(Inventory) do
                if v.Name == MaterialName then
                    return v["Count"]
                end
            end
        end

        spawn(function()
            while wait() do
                if _G.TradeAureEmber then
                    pcall(function()
                        local AzureAvilable = GetCountMaterials("Azure Ember")
                        if AzureAvilable >= _G.SetToTradeAureEmber then
                            game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/KitsuneStatuePray"):InvokeServer()
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KitsuneStatuePray")
                        end
                    end)
                end
            end
        end)