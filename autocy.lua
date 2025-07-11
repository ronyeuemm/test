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

local BlackListLocation = {}
        function CheckNearestTeleporter(vcs)
            vcspos = vcs.Position
            min = math.huge
            min2 = math.huge
            local placeId = game.PlaceId
            if placeId == 2753915549 then
                OldWorld = true
            elseif placeId == 4442272183 then
                NewWorld = true
            elseif placeId == 7449423635 then
                ThreeWorld = true
            end
            local chooseis
            if ThreeWorld then
                TableLocations = {
                    ["Caslte On The Sea"] = Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125),
                    ["Hydra"] = Vector3.new(5756.83740234375, 610.4240112304688, -253.9253692626953),
                    ["Mansion"] = Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125),
                    ["Great Tree"] = Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586),
                    ["Ngu1"] = Vector3.new(-11993.580078125, 334.7812805175781, -8844.1826171875),
                    ["ngu2"] = Vector3.new(5314.58203125, 25.419387817382812, -125.94227600097656),
                    ["Temple Of Time"] = Vector3.new(2957.833740234375, 2286.495361328125, -7217.05078125)
                }
                if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 then
                --TableLocations["Dismension"] = Vector3.new(-1990.672607421875, 4532.99951171875, -14973.6748046875)
                end
            elseif NewWorld then
                TableLocations = {
                    ["Mansion"] = Vector3.new(-288.46246337890625, 306.130615234375, 597.9988403320312),
                    ["Flamingo"] = Vector3.new(2284.912109375, 15.152046203613281, 905.48291015625),
                    ["122"] = Vector3.new(923.21252441406, 126.9760055542, 32852.83203125),
                    ["3032"] = Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)
                }
            elseif OldWorld then
                TableLocations = {
                    ["1"] = Vector3.new(-7894.6201171875, 5545.49169921875, -380.2467346191406),
                    ["2"] = Vector3.new(-4607.82275390625, 872.5422973632812, -1667.556884765625),
                    ["3"] = Vector3.new(61163.8515625, 11.759522438049316, 1819.7841796875),
                    ["4"] = Vector3.new(3876.280517578125, 35.10614013671875, -1939.3201904296875)
                }
            end
            mmbb = {}
            for i2, v2 in pairs(TableLocations) do
                if not table.find(BlackListLocation, i2) then
                    mmbb[i2] = v2
                end
            end
            TableLocations = mmbb
            TableLocations2 = {}
            for i, v in pairs(TableLocations) do
                if typeof(v) ~= "table" then
                    TableLocations2[i] = (v - vcspos).Magnitude
                else
                    TableLocations2[i] = (v["POS"] - vcspos).Magnitude
                end
            end
            for i, v in pairs(TableLocations2) do
                if v < min then
                    min = v
                    min2 = v
                end
            end
            for i, v in pairs(TableLocations2) do
                if v < min then
                    min = v
                    min2 = v
                end
            end
            for i, v in pairs(TableLocations2) do
                if v <= min then
                    choose = TableLocations[i]
                    chooseis = i
                end
            end
            min3 = (vcspos - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            if min2 + 100 <= min3 then
                return choose, chooseis
            end
        end
        function requestEntrance(vector3, fr)
            if not fr or fr ~= "Temple Of Time" and fr ~= "Dismension" then
                args = {
                    "requestEntrance",
                    vector3
                }
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
                oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                char = game.Players.LocalPlayer.Character.HumanoidRootPart
                char.CFrame = CFrame.new(oldcframe.X, oldcframe.Y + 50, oldcframe.Z)
                task.wait(0.5)
            else
                pcall(
                    function()
                        TweenTemple()
                        if GetDistance(CFrame.new(28282.5703125, 14896.8505859375, 105.1042709350586)) > 10 then
                            return
                        end
                        game.Players.LocalPlayer.Character:MoveTo(
                            CFrame.new(
                                28390.7812,
                                14895.8574,
                                106.534714,
                                0.0683786646,
                                1.44424162e-08,
                                -0.997659445,
                                7.52342522e-10,
                                1,
                                1.45278642e-08,
                                0.997659445,
                                -1.74397752e-09,
                                0.0683786646
                            ).Position
                        )
                        AllNPCS = getnilinstances()
                        for i, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
                            table.insert(AllNPCS, v)
                        end
                        for i, v in pairs(AllNPCS) do
                            if v.Name == "Mysterious Force" then
                                TempleMysteriousNPC1 = v
                            end
                            if v.Name == "Mysterious Force3" then
                                TempleMysteriousNPC2 = v
                            end
                        end
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                            TempleMysteriousNPC2.HumanoidRootPart.CFrame
                        wait(0.3)
                        if
                            (TempleMysteriousNPC2.HumanoidRootPart.Position -
                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 15
                         then
                            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "TeleportBack")
                        end
                        wait(0.75)
                    end
                )
            end
        end
        function AntiLowHealth(yc5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
                yc5,
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
            )
            wait()
        end
        function loadplr()
            repeat
                task.wait()
                if not game.Players.LocalPlayer.Character:FindFirstChild("Tween Access") then
                    tikcsm = tick()
                    repeat
                        task.wait()
                    until tick() - tikcsm >= 1.5
                    if not game.Players.LocalPlayer.Character:FindFirstChild("Tween Access") then
                        TweenAccess = Instance.new("IntValue")
                        TweenAccess.Name = "Tween Access"
                        TweenAccess.Parent = game.Players.LocalPlayer.Character
                    end
                end
            until game.Players.LocalPlayer.Character:FindFirstChild("Tween Access")
        end
        loadplr()
        function CancelTween()
            if not LoadedUiHub then
                return
            end
            pcall(
                function()
                    tween:Cancel()
                end
            )
        end
        spawn(
            function()
                while task.wait() do
                    pcall(
                        function()
                            if not game.Players.LocalPlayer.Character:FindFirstChild("Tween Access") then
                                CancelTween()
                                repeat
                                    task.wait()
                                    if not game.Players.LocalPlayer.Character:FindFirstChild("Tween Access") then
                                        tikcsm = tick()
                                        repeat
                                            task.wait()
                                        until tick() - tikcsm >= 1.5
                                        if not game.Players.LocalPlayer.Character:FindFirstChild("Tween Access") then
                                            TweenAccess = Instance.new("IntValue")
                                            TweenAccess.Name = "Tween Access"
                                            TweenAccess.Parent = game.Players.LocalPlayer.Character
                                        end
                                    end
                                until game.Players.LocalPlayer.Character:FindFirstChild("Tween Access")
                            end
                        end
                    )
                end
            end
        )
        
        ticktp = tick()
        tweenticks = tick()
        tickcancel = tick()
        local AntiLowHealthting
        tickflag = tick() - 5
        spawn(
            function()
                while task.wait() do
                    if tick() - tickflag < 5 then
                        pcall(
                            function()
                                game.Players.LocalPlayer.Humanoid:ChangeState(11)
                            end
                        )
                    else
                        pcall(
                            function()
                                game.Players.LocalPlayer.Humanoid:ChangeState()
                            end
                        )
                    end
                end
            end
        )
        function GetMidPointPart(tbpart)
            local pascal
            local allpas = 0
            for i, v in pairs(tbpart) do
                pcall(
                    function()
                        if not pascal then
                            pascal = v.Position
                        else
                            pascal = pascal + v.Position
                        end
                        allpas = allpas + 1
                    end
                )
            end
            return pascal / allpas
        end
        function GetAllIsland()
            tbs = {}
            for __, pathteam in pairs(game:GetService("Workspace")["_WorldOrigin"].PlayerSpawns:GetChildren()) do
                for i, v in pairs(pathteam:GetChildren()) do
                    if not tbs[v.Name] then
                        tbs[v.Name] = GetMidPointPart(v:GetChildren())
                    end
                end
            end
            return tbs
        end
        function GetAllIsland()
            tbs = {}
            for __, pathteam in pairs(game:GetService("Workspace")["_WorldOrigin"].PlayerSpawns:GetChildren()) do
                for i, v in pairs(pathteam:GetChildren()) do
                    if not tbs[v.Name] then
                        tbs[v.Name] = GetMidPointPart(v:GetChildren())
                    end
                end
            end
            return tbs
        end
        ALLISLAND = GetAllIsland()
        ALLISLANDOp = {}
        for i, v in pairs(ALLISLAND) do
            table.insert(ALLISLANDOp, i)
        end
        getgenv().ResetedTime = 0
        function getNearestSpawn(targetCFrame)
            min = 2000
            local min2
            for i, CF in pairs(GetAllIsland()) do
                if GetDistance(CFrame.new(CF.X, CF.Y, CF.Z), targetCFrame) < min then
                    min = GetDistance(CFrame.new(CF.X, CF.Y, CF.Z), targetCFrame)
                end
            end
            for i, CF in pairs(GetAllIsland()) do
                if GetDistance(CFrame.new(CF.X, CF.Y, CF.Z), targetCFrame) <= min then
                    min2 = CFrame.new(CF.X, CF.Y, CF.Z)
                end
            end
            if min2 then
                return min2
            end
        end
        function GetMidPoint(MobName, b2)
            if Mob.Name == "Ship Officer [Lv. 1325]" then
                return b2.CFrame
            end
            if 1 > 1 then
                return b2.CFrame
            end
            local totalpos
            allid = 0
            for i, v in pairs(game.workspace.Enemies:GetChildren()) do
                if
                    v.Name == MobName and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                        (b2 and GetDistance(v.HumanoidRootPart, b2) <= 475)
                 then
                    if not totalpos then
                        totalpos = v.HumanoidRootPart.Position
                    elseif totalpos then
                        totalpos = totalpos + v.HumanoidRootPart.Position
                    end
                    allid = allid + 1
                end
            end
            if totalpos then
                return totalpos / allid
            end
        end 
        function TweenObject(TweenCFrame,obj,ts)
            if not ts then ts = 350 end
            local tween_s = game:service "TweenService"
            local info =
                TweenInfo.new(
                (TweenCFrame.Position -
                    obj.Position).Magnitude /
                    ts,
                Enum.EasingStyle.Linear
            )
            tween =
                tween_s:Create(
                    obj,
                info,
                {CFrame = TweenCFrame}
            )
            tween:Play() 
        end
        function Tween(targetCFrame)
            bbc11, bbc12 =
                pcall(
                function()
                    if
                        game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer.Character and
                            game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") and
                            game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                            game:GetService("Players").LocalPlayer.Character.Humanoid.Health > 0 and
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                     then
                        if not game.Players.LocalPlayer.Character:FindFirstChild("Tween Access") then
                            return print("not tween access")
                        end
                        if not TweenSpeed or type(TweenSpeed) ~= "number" then
                            TweenSpeed = 325
                        end
                        if AntiLowHealthting then
                            return
                        end
                        tween = nil
                        DefualtY = targetCFrame.Y
                        if DefualtY < 50 then
                            DefualtY = 75
                        end
                        if Config["Auto Beta"] then
                            DefualtY = DefualtY + 100
                        end
                        TargetY = targetCFrame.Y
                        targetCFrameWithDefualtY = CFrame.new(targetCFrame.X, DefualtY, targetCFrame.Z)
                        targetPos = targetCFrame.Position
                        oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        Distance =
                            (targetPos -
                            game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude
                        if Distance <= 300 and tick() - ticktp >= 0.01 then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetCFrame
                            ticktp = tick()
                            return
                        end
                        if game.Players.LocalPlayer.Character.Humanoid.Sit then
                            for i, v in pairs(game.workspace:GetDescendants()) do
                                if v:IsA("Seat") then
                                    v:Destroy()
                                end
                            end
                        end
                        LowHealth = game.Players.LocalPlayer.Character.Humanoid.MaxHealth * 30 / 100
                        NotLowHealth = game.Players.LocalPlayer.Character.Humanoid.MaxHealth * 70 / 100 
                        IsLowHealth = math.floor((game.Players.LocalPlayer.Character.Humanoid.Health/game.Players.LocalPlayer.Character.Humanoid.MaxHealth*100)*100)/100 <= 30
                        if IsLowHealth then
                            CancelTween()
                            OldY = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y
                            repeat
                                wait()
                                Tweento(targetCFrame * GetCFrameADD())
                                AntiLowHealthting = true
                            until not Config["Panic Mode"] or not game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") or
                                game.Players.LocalPlayer.Character.Humanoid.Health > NotLowHealth
                            AntiLowHealth(OldY)
                            AntiLowHealthting = false
                        end
                        local bmg, bmg2 = CheckNearestTeleporter(targetCFrame)
                        if bmg then
                            timetry = 0
                            repeat
                                pcall(
                                    function()
                                        tween:Cancel()
                                    end
                                )
                                wait()
                                requestEntrance(bmg, bmg2)
                                timetry = timetry + 1
                            until not CheckNearestTeleporter(targetCFrame) or timetry >= 10
                            if timetry >= 10 and CheckNearestTeleporter(targetCFrame) then
                                if bmg2 == "Temple Of Time" then
                                    print("insert blacklist temple")
                                    table.insert(BlackListLocation, bmg2)
                                end
                                game.Players.LocalPlayer.Character.Humanoid.Health = 0
                            end
                        end
                        b1 =
                            CFrame.new(
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
                            DefualtY,
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
                        )
                        if DoNotTweenInThisTime then
                            CancelTween()
                            return
                        end
                        if Config["Same Y"] and (b1.Position - targetCFrameWithDefualtY.Position).Magnitude > 5 then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                CFrame.new(
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
                                DefualtY,
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
                            )
                            local tweenfunc = {}
                            local tween_s = game:service "TweenService"
                            local info =
                                TweenInfo.new(
                                (targetPos -
                                    game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude /
                                    TweenSpeed,
                                Enum.EasingStyle.Linear
                            )
                            tween =
                                tween_s:Create(
                                game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"],
                                info,
                                {CFrame = targetCFrameWithDefualtY}
                            )
                            tween:Play()
                            function tweenfunc:Stop()
                                tween:Cancel()
                            end
                            TweenStats = tween.PlaybackState
                            tween.Completed:Wait()
                            TweenStats = tween.PlaybackState
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                CFrame.new(
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
                                TargetY,
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
                            )
                        else
                            local tweenfunc = {}
                            local tween_s = game:service "TweenService"
                            local info =
                                TweenInfo.new(
                                (targetPos -
                                    game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude /
                                    TweenSpeed,
                                Enum.EasingStyle.Linear
                            )
                            tween =
                                tween_s:Create(
                                game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"],
                                info,
                                {CFrame = targetCFrame}
                            )
                            tween:Play()
                            function tweenfunc:Stop()
                                tween:Cancel()
                            end
                            TweenStats = tween.PlaybackState
                            tween.Completed:Wait()
                            TweenStats = tween.PlaybackState
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                CFrame.new(
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
                                TargetY,
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
                            )
                        end
                        if not tween then
                            return tween
                        end
                        return tweenfunc
                    end
                end
            )
            if not bbc11 then
            end
        end

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