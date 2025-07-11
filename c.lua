
if  not LPH_OBFUSCATED then
	function LPH_JIT_MAX(...)
		return ...;
	end
	function LPH_NO_VIRTUALIZE(...)
		return ...;
	end
	function LPH_NO_UPVALUES(...)
		return ...;
	end
end

if _G.team == "Marines" then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines")
elseif _G.team == "Pirates" then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
end

repeat
    task.wait(1)
    local chooseTeam = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("ChooseTeam", true)
    local uiController = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("UIController", true)

    if chooseTeam and chooseTeam.Visible and uiController then
        for _, v in pairs(getgc(true)) do
            if type(v) == "function" and getfenv(v).script == uiController then
                local constant = getconstants(v)
                pcall(function()
                    if (constant[1] == "Pirates" or constant[1] == "Marines") and #constant == 1 then
                        if constant[1] == getgenv().Team then
                            v(getgenv().Team)
                        end
                    end
                end)
            end
        end
    end
until game:GetService("Players").LocalPlayer.Team

getgenv().NoClip = false

spawn(function()
    while task.wait() do
        pcall(function()
            local char = game.Players.LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                if getgenv().NoClip then
                    if not hrp:FindFirstChild("BodyClip") then
                        local bv = Instance.new("BodyVelocity")
                        bv.Name = "BodyClip"
                        bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
                        bv.Velocity = Vector3.new(0, 0, 0)
                        bv.Parent = hrp
                    end
                    for _, v in pairs(char:GetDescendants()) do
                        if v:IsA("BasePart") and v.CanCollide then
                            v.CanCollide = false
                        end
                    end
                else
                    if hrp:FindFirstChild("BodyClip") then
                        hrp.BodyClip:Destroy()
                    end
                    for _, v in pairs(char:GetDescendants()) do
                        if v:IsA("BasePart") and not v.CanCollide then
                            v.CanCollide = true
                        end
                    end
                end
            end
        end)
    end
end)

function AutoHaki()
  local player = game:GetService("Players").LocalPlayer
  local character = player.Character
  if character and not character:FindFirstChild("HasBuso") then
    local remote = game:GetService("ReplicatedStorage").Remotes.CommF_
    if remote then
      remote:InvokeServer("Buso") 
    end
  end
end

function EquipWeaponMelee()
	pcall(function()
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v.ToolTip == "Melee" and v:IsA('Tool') then
				local ToolHumanoid = game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name) 
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(ToolHumanoid) 
			end
		end
	end)
end

function checkno(searchText)
    local notifications = game.Players.LocalPlayer:FindFirstChild("PlayerGui")
    if not notifications then return false end
    local notifFrame = notifications:FindFirstChild("Notifications")
    if not notifFrame then return false end
    for _, notification in pairs(notifFrame:GetDescendants()) do
        if notification:IsA("TextLabel") or notification:IsA("TextBox") then
            local success, text = pcall(function() return notification.Text end)
            if success and text and string.find(text:lower(), searchText:lower()) then
                return true
            end
        end
    end
    return false
end

function Tween(Pos)
    Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
        game.Players.LocalPlayer.Character.Humanoid.Sit = false
    end
    pcall(function()
        tween = game:GetService("TweenService"):Create(
            game.Players.LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(Distance / 333, Enum.EasingStyle.Linear),
            { CFrame = Pos }
        )
    end)
    getgenv().NoClip = true
    tween:Play()
    if Distance <= 100 then
        tween:Cancel()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
    end
    if _G.StopTween == true then
        tween:Cancel()
        getgenv().NoClip = false
    end

    if (Pos.Position - Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)).Magnitude <= 3000 then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.213, 126.976, 32852.832))
    end
end

cycheck = false
micro = false
core = false
local collectedChests = {}

spawn(function()
    while task.wait(0.1) do
        local lp = game.Players.LocalPlayer
        if getgenv().Cy == "Get Cyborg Race" then
            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CyborgTrainer", "Buy") == nil then
                local clickdetector = workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector

                if not cycheck then
                    fireclickdetector(clickdetector)
                    fireclickdetector(clickdetector)
                    cycheck = true
                elseif cycheck and (checkno("Không tìm thấy con Chip.") or checkno("Microchip not found.")) and not lp.Backpack:FindFirstChild("Fist of Darkness") and not lp.Character:FindFirstChild("Fist of Darkness") then
                    micro = true
                end

                if micro and not lp.Backpack:FindFirstChild("Fist of Darkness") and not lp.Character:FindFirstChild("Fist of Darkness") then
                    local Character = lp.Character or lp.CharacterAdded:Wait()
                    local Position = Character:GetPivot().Position
                    local Chests = game:GetService("CollectionService"):GetTagged("_ChestTagged")
                    local Nearest, Distance = nil, math.huge

                    for _, Chest in ipairs(Chests) do
                        if not Chest:GetAttribute("IsDisabled") and not collectedChests[Chest] then
                            local Magnitude = (Chest:GetPivot().Position - Position).Magnitude
                            if Magnitude < Distance then
                                Distance, Nearest = Magnitude, Chest
                            end
                        end
                    end

                    local foundUncollected = false
                    for _, Chest in ipairs(Chests) do
                        if not Chest:GetAttribute("IsDisabled") and not collectedChests[Chest] then
                            foundUncollected = true
                            break
                        end
                    end
                    if not foundUncollected then
                        collectedChests = {}
                    end

                    if Nearest then
                        local chestCF = Nearest:GetPivot()
                        Tween(chestCF)

                        repeat task.wait()
                        until (Nearest:GetPivot().Position - Character:GetPivot().Position).Magnitude <= 10

                        if Character:FindFirstChild("Head") and Character:FindFirstChild("Humanoid") and Character.Humanoid.Health > 0 and not collectedChests[Nearest] then
                            local chestStillExists = Nearest and Nearest.Parent and not Nearest:GetAttribute("IsDisabled")
                            
                            if chestStillExists then
                                if not Nearest.Parent or Nearest:GetAttribute("IsDisabled") then
                                    collectedChests[Nearest] = true
                                    chestCount += 1
                                    ChestCounter:SetDesc(chestCount)
                                end
                            end
                        end

                        if Character:FindFirstChild("Humanoid") and Character.Humanoid.Sit then
                            Character.Humanoid.Sit = false
                        end
                        task.wait(0.5)
                    end
                elseif lp.Backpack:FindFirstChild("Fist of Darkness") or lp.Character:FindFirstChild("Fist of Darkness") then
                    micro = false
                    fireclickdetector(clickdetector)
                elseif (checkno("Core Brain") or checkno("Lõi")) and not lp.Backpack:FindFirstChild("Core Brain") and not lp.Character:FindFirstChild("Core Brain") then
                    core = true
                end

                if core and not lp.Backpack:FindFirstChild("Core Brain") and not lp.Character:FindFirstChild("Core Brain") then
                    local hasMicro = lp.Backpack:FindFirstChild("Microchip") or lp.Character:FindFirstChild("Microchip")
                    if not hasMicro and not CheckBoss("Order") then
                        task.wait(1)
                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "1")
                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
                    elseif hasMicro and not CheckBoss("Order") then
                        fireclickdetector(clickdetector)
                    end

                    local order = workspace.Enemies:FindFirstChild("Order") or game.ReplicatedStorage:FindFirstChild("Order")
                    if order then
                        if order.Parent == workspace.Enemies and order:FindFirstChild("Humanoid") and order:FindFirstChild("HumanoidRootPart") and order.Humanoid.Health > 0 then
                            repeat
                                task.wait()
                                AutoHaki()
                                EquipWeaponMelee()
                                Tween(order.HumanoidRootPart.CFrame * CFrame.new(10, 20, 10))
                            until not order.Parent or order.Humanoid.Health <= 0 or lp.Backpack:FindFirstChild("Core Brain") or lp.Character:FindFirstChild("Core Brain")
                        elseif order.Parent == game.ReplicatedStorage then
                            Tween(CFrame.new(-6217.202, 28.0476, -5053.135))
                        end
                    end
                end

                if lp.Backpack:FindFirstChild("Core Brain") or lp.Character:FindFirstChild("Core Brain") then
                    core = false
                    fireclickdetector(clickdetector)
                end
            end
        end
    end
end)

spawn(function()
    while task.wait(0.1) do
      if getgenv().Cy == "Evo V2" then
        if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1") == 0 then
         Tween(CFrame.new(-2779.83521, 72.9661407, -3574.02002, -0.730484903, 6.39014104e-08, -0.68292886, 3.59963224e-08, 1, 5.50667032e-08, 0.68292886, 1.56424669e-08, -0.730484903))
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-2779.83521, 72.9661407, -3574.02002, -0.730484903, 6.39014104e-08, -0.68292886, 3.59963224e-08, 1, 5.50667032e-08, 0.68292886, 1.56424669e-08, -0.730484903)).Magnitude <= 10 then
            wait(0.5)
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "2")
        end
    elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1") == 1 then
        if not game.Players.LocalPlayer.Backpack:FindFirstChild("Flower 1") and not game.Players.LocalPlayer.Character:FindFirstChild("Flower 1") then
            Tween(game.Workspace.Flower1.CFrame)
        elseif not game.Players.LocalPlayer.Backpack:FindFirstChild("Flower 2") and not game.Players.LocalPlayer.Character:FindFirstChild("Flower 2") then
            Tween(game.Workspace.Flower2.CFrame)
        elseif not game.Players.LocalPlayer.Backpack:FindFirstChild("Flower 3") and not game.Players.LocalPlayer.Character:FindFirstChild("Flower 3") then
            if game.Workspace.Enemies:FindFirstChild("Ship Deckhand") or game.Workspace.Enemies:FindFirstChild("Ship Engineer") or game.Workspace.Enemies:FindFirstChild("Ship Steward") or game.Workspace.Enemies:FindFirstChild("Ship Officer") then
                for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if (v.Name == "Ship Deckhand" or v.Name == "Ship Engineer" or v.Name == "Ship Steward" or v.Name == "Ship Officer") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        repeat task.wait()
                            AutoHaki()
                            EquipWeaponMelee()
                            Tween(v.HumanoidRootPart.CFrame * CFrame.new(10, 25, 10))
                        until not v.Parent or v.Humanoid.Health <= 0 or game.Players.LocalPlayer.Backpack:FindFirstChild("Flower 3") or game.Players.LocalPlayer.Character:FindFirstChild("Flower 3")
                    end
                end
            else
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.213, 126.976, 32852.832))
            end
        end
    elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1") == 2 then
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "3")
        end
    end
  end
end)
    
function GetFruitUnder1()
    local fruit = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")
    if not fruit then return false end

    for _, v in pairs(fruit) do
        if v.Type == "Blox Fruit" then
            local success = pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit", v.Name)
            end)
            if success then
                return true
            end
        end
    end

    return false
end

local evo = false
local completed = false

spawn(function()
    while task.wait(1) do
        local player = game:GetService("Players").LocalPlayer
        local repStorage = game:GetService("ReplicatedStorage").Remotes.CommF_
        local race = player.Data.Race.Value

        if not evo and getgenv().Cy == "Evo V3" then
            repStorage:InvokeServer("Wenlocktoad", "1")
            task.wait(1)
            repStorage:InvokeServer("Wenlocktoad", "2")
            evo = true
        end

        if evo and not completed and not player.PlayerGui.Main.Timer.Visible then
            if race == "Cyborg" then
                local foundFruit = false
                repeat
                    GetFruitUnder1()

                    local containers = {
                        player.Backpack:GetChildren(),
                        player.Character:GetChildren()
                    }

                    for _, container in ipairs(containers) do
                        for _, item in ipairs(container) do
                            if string.find(item.Name, "Fruit") then
                                foundFruit = true
                                break
                            end
                        end
                        if foundFruit then break end
                    end

                    task.wait(1)
                until foundFruit

                local result = repStorage:InvokeServer("Wenlocktoad", "3")
                if result ~= -2 then
                    completed = true
                end
            end
        end
    end
end)

spawn(function()
   while task.wait(.1) do
       if getgenv().Cy == "To Sea 2" then
         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
       end
   end
end)

getgenv().Cy = ""

spawn(function()
    while task.wait(1) do
        local player = game.Players.LocalPlayer
        local race = player.Data.Race.Value
        local placeId = game.PlaceId
        local commF = game:GetService("ReplicatedStorage").Remotes.CommF_

        if placeId ~= 4442272183 and race ~= "Cyborg" then
            getgenv().Cy = "To Sea 2"
        elseif race ~= "Cyborg" then
            local result = commF:InvokeServer("CyborgTrainer", "Buy")
            if result == nil then
                getgenv().Cy = "Get Cyborg Race"
            elseif race == "Cyborg" and not game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved") then
                getgenv().Cy = "Evo V2"
            elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad", "3") ~= -2 then
                getgenv().Cy = "Evo V3"
            else
                getgenv().Cy = ""
            end
        else
            getgenv().Cy = ""
        end
        warn(getgenv().Cy)
    end
end)


spawn(function()
    while task.wait(3) do
        game:GetService("VirtualInputManager"):SendKeyEvent(true, "Space", false, game)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, "Space", false, game)
    end
end)

_G.FastAttack = true

if _G.FastAttack then
    local _ENV = (getgenv or getrenv or getfenv)()

    local function SafeWaitForChild(parent, childName)
        local success, result = pcall(function()
            return parent:WaitForChild(childName)
        end)
        if not success or not result then
            warn("noooooo: " .. childName)
        end
        return result
    end

    local function WaitChilds(path, ...)
        local last = path
        for _, child in {...} do
            last = last:FindFirstChild(child) or SafeWaitForChild(last, child)
            if not last then break end
        end
        return last
    end

    local VirtualInputManager = game:GetService("VirtualInputManager")
    local CollectionService = game:GetService("CollectionService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local TeleportService = game:GetService("TeleportService")
    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    local Player = Players.LocalPlayer

    if not Player then
        warn("Không tìm thấy người chơi cục bộ.")
        return
    end

    local Remotes = SafeWaitForChild(ReplicatedStorage, "Remotes")
    if not Remotes then return end

    local Validator = SafeWaitForChild(Remotes, "Validator")
    local CommF = SafeWaitForChild(Remotes, "CommF_")
    local CommE = SafeWaitForChild(Remotes, "CommE")

    local ChestModels = SafeWaitForChild(workspace, "ChestModels")
    local WorldOrigin = SafeWaitForChild(workspace, "_WorldOrigin")
    local Characters = SafeWaitForChild(workspace, "Characters")
    local Enemies = SafeWaitForChild(workspace, "Enemies")
    local Map = SafeWaitForChild(workspace, "Map")

    local EnemySpawns = SafeWaitForChild(WorldOrigin, "EnemySpawns")
    local Locations = SafeWaitForChild(WorldOrigin, "Locations")

    local RenderStepped = RunService.RenderStepped
    local Heartbeat = RunService.Heartbeat
    local Stepped = RunService.Stepped

    local Modules = SafeWaitForChild(ReplicatedStorage, "Modules")
    local Net = SafeWaitForChild(Modules, "Net")

    local sethiddenproperty = sethiddenproperty or function(...) return ... end
    local setupvalue = setupvalue or (debug and debug.setupvalue)
    local getupvalue = getupvalue or (debug and debug.getupvalue)

    local Settings = {
        AutoClick = true,
        ClickDelay = 0,
    }

    local Module = {}

    Module.FastAttack = (function()
        if _ENV.rz_FastAttack then
            return _ENV.rz_FastAttack
        end

        local FastAttack = {
            Distance = 60,
            attackMobs = true,
            attackPlayers = true,
            Equipped = nil
        }

        local RegisterAttack = SafeWaitForChild(Net, "RE/RegisterAttack")
        local RegisterHit = SafeWaitForChild(Net, "RE/RegisterHit")

        local function IsAlive(character)
            return character and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0
        end

        local function ProcessEnemies(OthersEnemies, Folder)
            local BasePart = nil
            for _, Enemy in Folder:GetChildren() do
                local Head = Enemy:FindFirstChild("Head")
                if Head and IsAlive(Enemy) and Player:DistanceFromCharacter(Head.Position) < FastAttack.Distance then
                    if Enemy ~= Player.Character then
                        table.insert(OthersEnemies, { Enemy, Head })
                        BasePart = Head
                    end
                end
            end
            return BasePart
        end

        function FastAttack:Attack(BasePart, OthersEnemies)
            if not BasePart or #OthersEnemies == 0 then return end
            RegisterAttack:FireServer(Settings.ClickDelay or 0)
            RegisterHit:FireServer(BasePart, OthersEnemies)
        end

        function FastAttack:AttackNearest()
            local OthersEnemies = {}
            local Part1 = ProcessEnemies(OthersEnemies, Enemies)
            local Part2 = ProcessEnemies(OthersEnemies, Characters)
            if #OthersEnemies > 0 then
                self:Attack(Part1 or Part2, OthersEnemies)
            else
                task.wait(0)
            end
        end

        function FastAttack:BladeHits()
            local Equipped = IsAlive(Player.Character) and Player.Character:FindFirstChildOfClass("Tool")
            if Equipped and Equipped.ToolTip ~= "Gun" then
                self:AttackNearest()
            else
                task.wait(0)
            end
        end

        task.spawn(function()
            while task.wait(Settings.ClickDelay) do
                if Settings.AutoClick then
                    FastAttack:BladeHits()
                end
            end
        end)

        _ENV.rz_FastAttack = FastAttack
        return FastAttack
    end)()
end