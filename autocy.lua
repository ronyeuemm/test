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

local LocalPlayer = game.Players.LocalPlayer
local connection, tween, pp, canTween = nil, nil, nil, false
local rTween = function() if connection then connection:Disconnect() connection = nil end
	if tween then tween:Cancel() tween = nil end
	if pp then pp:Destroy() pp = nil end
end local dTween = function(ch) canTween = false
	local hrp = ch:FindFirstChild("HumanoidRootPart")
	if hrp then canTween = true return end
	task.defer(function() if ch:FindFirstChild("HumanoidRootPart") then canTween = true end end)
end
LocalPlayer.CharacterAdded:Connect(function(ch) rTween() dTween(ch) end)
if LocalPlayer.Character then dTween(LocalPlayer.Character) end
Tween = newcclosure(function(cf, trg)pcall(function() if cf == false then return rTween() end
    cf = typeof(cf) == "Vector3" and CFrame.new(cf) or (typeof(cf) == "Instance" and cf:IsA("BasePart") and cf.CFrame) or cf
    if tween or typeof(cf) ~= "CFrame" or connection or pp then return end
    local ch = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    if not canTween then return end local hrp = ch:FindFirstChild("HumanoidRootPart") or ch:WaitForChild("HumanoidRootPart", 3)
    trg = trg or hrp local d = (cf.Position - trg.Position).Magnitude
    if trg == hrp and d < 400 then trg.CFrame = cf end pp = Instance.new("Part", game:GetService("ReplicatedFirst"))
    pp.Anchored, pp.Transparency, pp.Name, pp.CFrame = true, 1, "", trg.CFrame
    local speed = d / (d <= 700 and 600 or d <= 1500 and 450 or d <= 2000 and 400 or (getgenv().LocalConfig and getgenv().LocalConfig.Settings and getgenv().LocalConfig.Settings["Tween Speed"]) or 300)
    tween = game:GetService("TweenService"):Create(pp, TweenInfo.new(speed, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {CFrame = cf}) local r = ch:FindFirstChild("HumanoidRootPart")
    connection = game:GetService("RunService").Heartbeat:Connect(function() if r and trg and pp then trg.CFrame = pp.CFrame end end)
    tween:Play()
    tween.Completed:Once(rTween)
end) end)

cycheck = false
micro = false
core = false
collectedChests = {}

task.spawn(function()
	while task.wait(0.1) do
		local lp = game.Players.LocalPlayer
		local comm = game:GetService("ReplicatedStorage").Remotes.CommF_
		if getgenv().Cy == "Get Cyborg Race" then
			if not game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CyborgTrainer", "Buy") then
				local cd = workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector
				if not cycheck then
					fireclickdetector(cd)
					fireclickdetector(cd)
					cycheck = true
				elseif cycheck and (checkno("Không tìm thấy con Chip.") or checkno("Microchip not found.")) and not (game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or lp.Character:FindFirstChild("Fist of Darkness")) then
					micro = true
				end

				if micro and not (game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Character:FindFirstChild("Fist of Darkness")) then
					local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
					local pos = char:GetPivot().Position
					local chests = game:GetService("CollectionService"):GetTagged("_ChestTagged")
					local nearest, dist = nil, math.huge

					for _, chest in ipairs(chests) do
						if not chest:GetAttribute("IsDisabled") and not collectedChests[chest] then
							local mag = (chest:GetPivot().Position - pos).Magnitude
							if mag < dist then
								dist, nearest = mag, chest
							end
						end
					end

					local foundUncollected = false
					for _, chest in ipairs(chests) do
						if not chest:GetAttribute("IsDisabled") and not collectedChests[chest] then
							foundUncollected = true
						end
					end
					if not foundUncollected then
						collectedChests = {}
					end

					if nearest then
						Tween(nearest:GetPivot())
						repeat task.wait()
						until (nearest:GetPivot().Position - char:GetPivot().Position).Magnitude <= 10

						if char:FindFirstChild("Head") and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0 and not collectedChests[nearest] then
							local valid = nearest and nearest.Parent and not nearest:GetAttribute("IsDisabled")
							if not valid then
								collectedChests[nearest] = true
								chestCount += 1
								ChestCounter:SetDesc(chestCount)
							end
						end

						if char:FindFirstChild("Humanoid") and char.Humanoid.Sit then
							char.Humanoid.Sit = false
						end
						task.wait(0.5)
					end
				elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or lp.Character:FindFirstChild("Fist of Darkness") then
					micro = false
					fireclickdetector(cd)
				elseif (checkno("Core Brain") or checkno("Lõi")) and not (lp.Backpack:FindFirstChild("Core Brain") or lp.Character:FindFirstChild("Core Brain")) then
					core = true
				end

				if core and not (lp.Backpack:FindFirstChild("Core Brain") or lp.Character:FindFirstChild("Core Brain")) then
					local hasMicro = lp.Backpack:FindFirstChild("Microchip") or lp.Character:FindFirstChild("Microchip")
					if not hasMicro and not CheckBoss("Order") then
						task.wait(1)
						comm:InvokeServer("BlackbeardReward", "Microchip", "1")
						comm:InvokeServer("BlackbeardReward", "Microchip", "2")
					elseif hasMicro and not CheckBoss("Order") then
						fireclickdetector(cd)
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
					fireclickdetector(cd)
				end
			end
		end
	end
end)

task.spawn(function()
	while task.wait(0.1) do
		if getgenv().Cy == "Evo V2" then
			if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1") == 0 then
				Tween(CFrame.new(-2779.835, 72.966, -3574.020))
				if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-2779.835, 72.966, -3574.020)).Magnitude <= 10 then
					task.wait(0.5)
					game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "2")
				end
			elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1") == 1 then
				local bp = game.Players.LocalPlayer.Backpack
				local char = game.Players.LocalPlayer.Character
				if not (bp:FindFirstChild("Flower 1") or char:FindFirstChild("Flower 1")) then
					Tween(game.Workspace.Flower1.CFrame)
				elseif not (bp:FindFirstChild("Flower 2") or char:FindFirstChild("Flower 2")) then
					Tween(game.Workspace.Flower2.CFrame)
				elseif not (bp:FindFirstChild("Flower 3") or char:FindFirstChild("Flower 3")) then
					local enemies = workspace.Enemies:GetChildren()
					for _, v in ipairs(enemies) do
						if table.find({ "Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer" }, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
							repeat
								task.wait()
								AutoHaki()
								EquipWeaponMelee()
								Tween(v.HumanoidRootPart.CFrame * CFrame.new(10, 25, 10))
							until not v.Parent or v.Humanoid.Health <= 0 or bp:FindFirstChild("Flower 3") or char:FindFirstChild("Flower 3")
						end
					end
					if #enemies == 0 then
						game.ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.213, 126.976, 32852.832))
					end
				end
			elseif comm:InvokeServer("Alchemist", "1") == 2 then
				comm:InvokeServer("Alchemist", "3")
			end
		end
	end
end)

GetFruitUnder1 = function()
	local fruits = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")
	if not fruits then return false end
	for _, v in ipairs(fruits) do
		if v.Type == "Blox Fruit" then
			local ok = pcall(function()
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit", v.Name)
			end)
			if ok then return true end
		end
	end
	return false
end

evo, completed = false, false
task.spawn(function()
	while task.wait(1) do
		if not evo and getgenv().Cy == "Evo V3" then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
			task.wait(1)
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
			evo = true
		end
		if evo and not completed and not game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible and game.Players.LocalPlayer.Data.Race.Value == "Cyborg" then
			local found = false
			repeat
				GetFruitUnder1()
				for _, container in ipairs({ game.Players.LocalPlayer.Backpack:GetChildren(), game.Players.LocalPlayer.Character:GetChildren() }) do
					for _, item in ipairs(container) do
						if string.find(item.Name, "Fruit") then
							found = true
						end
					end
				end
				task.wait(1)
			until found
			if game.Players.LocalPlayer.Data.Race.Value:InvokeServer("Wenlocktoad", "3") ~= -2 then
				completed = true
			end
		end
	end
end)

task.spawn(function()
	while task.wait(0.1) do
		if getgenv().Cy == "To Sea 2" then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
		end
	end
end)

getgenv().Cy = ""

task.spawn(function()
	while task.wait(1) do
		if placeId ~= 4442272183 and game.Players.LocalPlayer.Data.Race.Value ~= "Cyborg" then
			getgenv().Cy = "To Sea 2"
		elseif game.Players.LocalPlayer.Data.Race.Value ~= "Cyborg" then
			local res = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CyborgTrainer", "Buy")
			if not res then
				getgenv().Cy = "Get Cyborg Race"
			elseif not game.Players.LocalPlayer.Data.Race:FindFirstChild("Evolved") then
				getgenv().Cy = "Evo V2"
			elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad", "3") ~= -2 then
				getgenv().Cy = "Evo V3"
			else
				getgenv().Cy = ""
			end
		else
			getgenv().Cy = ""
		end
	end
end)

task.spawn(function()
	while task.wait(3) do
		local vim = game:GetService("VirtualInputManager")
		vim:SendKeyEvent(true, "Space", false, game)
		vim:SendKeyEvent(false, "Space", false, game)
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
