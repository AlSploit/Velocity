repeat task.wait() until game:IsLoaded()

local LocalPlayer = game.Players.LocalPlayer

local Camera = game:GetService("Workspace").CurrentCamera

local TweenService = game:GetService("TweenService")
local StatisticsService = game:GetService("Stats")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local AutowinValue = true

local KnitGotten, KnitClient

repeat
	task.wait()

	KnitGotten, KnitClient = pcall(function()
		return debug.getupvalue(require(LocalPlayer.PlayerScripts.TS.knit).setup, 6)
	end)

	if KnitGotten then break end

until KnitGotten

repeat task.wait() until debug.getupvalue(KnitClient.Start, 1)

task.spawn(function()
	local AutowinGui = Instance.new("ScreenGui")
	
	AutowinGui.Name = "AutowinGui"
	AutowinGui.Parent = LocalPlayer.PlayerGui
	AutowinGui.ResetOnSpawn = false
	
	local MainFrame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIGradient = Instance.new("UIGradient")
	local Background = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local Autowin = Instance.new("TextButton")
	local UICorner_3 = Instance.new("UICorner")
	local Bed = Instance.new("TextLabel")
	local UICorner_4 = Instance.new("UICorner")
	local Ping = Instance.new("TextLabel")
	local UICorner_5 = Instance.new("UICorner")
	local UIStroke = Instance.new("UIStroke")
	local UIStroke_1 = Instance.new("UIStroke")
	
	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke.Color = Color3.new(0.109804, 0.109804, 0.109804)
	UIStroke.Thickness = 4
	UIStroke.Parent = MainFrame
	UIStroke.Name = "UIStroke"
	
	UIStroke_1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke_1.Color = Color3.new(0.109804, 0.109804, 0.109804)
	UIStroke_1.Thickness = 3
	UIStroke_1.Parent = Background
	UIStroke_1.Name = "UIStroke"

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = AutowinGui
	MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MainFrame.BorderSizePixel = 0
	MainFrame.Position = UDim2.new(0.706465065, 0, 0.579242437, 0)
	MainFrame.Size = UDim2.new(0.190, 0, 0.150, 0)
	MainFrame.ZIndex = 5

	UICorner.CornerRadius = UDim.new(0, 12)
	UICorner.Parent = MainFrame

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(170, 0, 0)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(195, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(170, 0, 0))}
	UIGradient.Parent = MainFrame

	Background.Name = "Background"
	Background.Parent = MainFrame
	Background.BackgroundColor3 = Color3.fromRGB(228, 228, 228)
	Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Background.BorderSizePixel = 0
	Background.Position = UDim2.new(0.0329999812, 0, 0.0909090936, 0)
	Background.Size = UDim2.new(0.933333337, 0, 0.818181813, 0)
	Background.ZIndex = 6

	UICorner_2.CornerRadius = UDim.new(0, 12)
	UICorner_2.Parent = Background

	Autowin.Name = "Autowin"
	Autowin.Parent = Background
	Autowin.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Autowin.BackgroundTransparency = 1.000
	Autowin.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Autowin.BorderSizePixel = 0
	Autowin.Position = UDim2.new(0.183010742, 0, -0.0035955878, 0)
	Autowin.Size = UDim2.new(0.625, 0, 0.388888896, 0)
	Autowin.ZIndex = 7
	Autowin.Font = Enum.Font.FredokaOne
	Autowin.Text = "Autowin: On"
	Autowin.TextColor3 = Color3.fromRGB(28, 28, 28)
	Autowin.TextSize = 25.000
	Autowin.TextWrapped = true

	UICorner_3.CornerRadius = UDim.new(0, 12)
	UICorner_3.Parent = Autowin

	Bed.Name = "Bed"
	Bed.Parent = Background
	Bed.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Bed.BackgroundTransparency = 1.000
	Bed.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Bed.BorderSizePixel = 0
	Bed.Position = UDim2.new(0.0718996301, 0, 0.378551751, 0)
	Bed.Size = UDim2.new(0.357142866, 0, 0.388888896, 0)
	Bed.ZIndex = 7
	Bed.Font = Enum.Font.FredokaOne
	Bed.Text = "Bed: ✅"
	Bed.TextColor3 = Color3.fromRGB(28, 28, 28)
	Bed.TextSize = 25.000
	Bed.TextWrapped = true

	UICorner_4.CornerRadius = UDim.new(0, 12)
	UICorner_4.Parent = Bed

	Ping.Name = "Ping"
	Ping.Parent = Background
	Ping.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Ping.BackgroundTransparency = 1.000
	Ping.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Ping.BorderSizePixel = 0
	Ping.Position = UDim2.new(0.566523314, 0, 0.378551751, 0)
	Ping.Size = UDim2.new(0.357142866, 0, 0.388888896, 0)
	Ping.ZIndex = 7
	Ping.Font = Enum.Font.FredokaOne
	Ping.Text = "Ping: 100"
	Ping.TextColor3 = Color3.fromRGB(28, 28, 28)
	Ping.TextSize = 25.000
	Ping.TextWrapped = true

	UICorner_5.CornerRadius = UDim.new(0, 12)
	UICorner_5.Parent = Ping
	
	local function GetPing()
		local DataPing = StatisticsService:FindFirstChild("Data Ping", true)

		local PingValue = DataPing and DataPing:GetValueString() and DataPing:GetValueString():split(".")[1]

		if PingValue and PingValue:match("%d+$") then
			return tonumber(PingValue)
		end

		return math.round(StatisticsService.PerformanceStats.Ping:GetValue())
	end

	task.spawn(function()
		while task.wait() do
			
			if GetMatchState() ~= 0 then
				Bed.Text = "Bed: " .. LocalPlayer.leaderstats.Bed.Value
			end
			
			Ping.Text = "Ping: " .. GetPing()
		end
	end)
	
	task.spawn(function()
		Autowin.Activated:Connect(function()
			AutowinValue = not AutowinValue
			
			if AutowinValue == false then
				Autowin.Text = "Autowin: Off"
			end
			
			if AutowinValue == true then
				Autowin.Text = "Autowin: On"
			end
		end)
	end)
end)

local Client = require(game:GetService("ReplicatedStorage").TS.remotes).default.Client

local IsNetworkOwner = isnetworkowner or (gethiddenproperty and function(part)
	if gethiddenproperty(part, "NetworkOwnershipRule") == Enum.NetworkOwnership.Manual then 
		return false
	end
	return true
end) or function() return true end

local function DumpRemote(Tab)
	for i, v in pairs(Tab) do
		if v == "Client" then
			return Tab[i + 1]
		end
	end
	return ""
end

function KillHumanoid(Time)
	task.wait(Time)
	if LocalPlayer:FindFirstChild("leaderstats") and LocalPlayer.leaderstats:FindFirstChild("Bed") then
		if LocalPlayer.leaderstats.Bed.Value == "✅" then
			LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
			game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("ResetCharacter"):FireServer()
		end
	end
end

function IsAlive(Player)
	Player = Player or LocalPlayer
	if not Player.Character then return false end
	if not Player.Character:FindFirstChild("Head") then return false end
	if not Player.Character:FindFirstChild("Humanoid") then return false end
	if Player.Character:FindFirstChild("Humanoid").Health < 0.11 then return false end
	return true
end

function GetPlayerOfBedColor(Bed)
	local Value = false

	local Color = Bed:FindFirstChild("Covers").BrickColor

	for i, v in pairs(game.Players:GetPlayers()) do
		if v.TeamColor == Color then
			Value = true
		end
	end

	return Value
end

function GetPlayerOfBedTeam(Bed)
	local Player = nil

	local Color = Bed:FindFirstChild("Covers").BrickColor

	for i, v in pairs(game.Players:GetPlayers()) do
		if v.TeamColor == Color then
			Player = v
		end
	end

	return Player
end

function FindNearestBed()
	local NearestBed = nil
	local MinDistance = math.huge
	for _,v in pairs(game.Workspace:GetDescendants()) do
		if v.Name:lower() == "bed" and v:FindFirstChild("Covers") and v:FindFirstChild("Covers").BrickColor ~= LocalPlayer.Team.TeamColor and GetPlayerOfBedColor(v) then
			local Distance = (v.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
			if Distance < MinDistance then
				NearestBed = v
				MinDistance = Distance
			end
		end
	end
	return NearestBed
end

function FindNearestPlayer()
	local NearestPlayer
	local NearestDistance = math.huge
	for i, v in pairs(game.Players:GetChildren()) do
		if IsAlive(v) and v ~= LocalPlayer and v.Team ~= LocalPlayer.Team and not v.Character:GetAttribute("PetrifyId") then
			local Distance = (v.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
			if Distance < NearestDistance then
				NearestPlayer = v
				NearestDistance = Distance
			end
		end
	end
	return NearestPlayer, NearestDistance
end

local Bedwars = {
	["KnockbackTable"] = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.damage["knockback-util"]).KnockbackUtil.calculateKnockbackVelocity, 1),
	["CombatConstant"] = require(game:GetService("ReplicatedStorage").TS.combat["combat-constant"]).CombatConstant,
	["SprintController"] = KnitClient.Controllers.SprintController,
	["ShopItems"] = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.games.bedwars.shop["bedwars-shop"]).BedwarsShop.getShopItem, 2),
	["DamageTypes"] = require(game:GetService("ReplicatedStorage").TS.damage["damage-type"]).DamageType,
	["PingController"] = require(LocalPlayer.PlayerScripts.TS.controllers.game.ping["ping-controller"]).PingController,
	["ClientHandlerStore"] = require(LocalPlayer.PlayerScripts.TS.ui.store).ClientStore,
	["DamageIndicator"] = KnitClient.Controllers.DamageIndicatorController.spawnDamageIndicator,
	["BlockCPSConstants"] = require(game:GetService("ReplicatedStorage").TS["shared-constants"]).CpsConstants,
	["SwordController"] = KnitClient.Controllers.SwordController,
	["BlockController"] = require(ReplicatedStorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out).BlockEngine,
	["PickupRemote"] = DumpRemote(debug.getconstants(KnitClient.Controllers.ItemDropController.checkForPickup)),
	["AttackRemote"] = DumpRemote(debug.getconstants(KnitClient.Controllers.SwordController.sendServerRequest)),	
	["FovController"] = KnitClient.Controllers.FovController,
}

local TweenSpeed = 0.65
local AcDisabled = false

function GetMatchState()
	return Bedwars["ClientHandlerStore"]:getState().Game.matchState
end

function TweenToNearestBed(Bed)
	local Bed = Bed or FindNearestBed()

	if Bed then		
		local TweenInformation = TweenInfo.new(TweenSpeed, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0)
		local BedTween = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInformation, {CFrame = Bed.CFrame + Vector3.new(0, 15, 0)})

		BedTween:Play()
	end	
end

function TweenToNearestPlayer()
	local Player, Distance = FindNearestPlayer()

	if Player then		
		local TweenInformation = TweenInfo.new(TweenSpeed, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0)
		local PlayerTween = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInformation, {CFrame = Player.Character.HumanoidRootPart.CFrame + Vector3.new(0, 15, 0)})

		PlayerTween:Play()
	end
end

function GetScythe()
	for i, v in pairs(game.Workspace:FindFirstChild("Camera"):FindFirstChild("Viewmodel"):GetChildren()) do
		if v:IsA("Accessory") and v.Name:find("scythe") then
			return true
		end
	end
end

function TweenToNearestPlayerSlow(NearestPlayer)
	local NearestPlayer = NearestPlayer or FindNearestPlayer()

	if NearestPlayer then
		local TweenTime = (LocalPlayer.Character.HumanoidRootPart.Position - NearestPlayer.Character.HumanoidRootPart.Position).Magnitude / 23

		local TweenInformation = TweenInfo.new(TweenTime, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0)
		local PlayerTween = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInformation, {CFrame = NearestPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)})

		LocalPlayer.Character.Humanoid:ChangeState("Jumping")

		PlayerTween:Play()
	end
end

function TweenUp()
	local TweenInformation = TweenInfo.new(0.05, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0)
	local DownTween = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInformation, {CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 10, 0)})
	DownTween:Play()
end

function AutowinDecision()	
	--Decide whether to BedTp or PlayerTp

	task.spawn(function() --BedTp
		local Magnitude = 0
		local NearestPlayer, NearestPlayerDistance = FindNearestPlayer()
		local Bed = FindNearestBed()

		if Bed then
			TweenToNearestBed(Bed)
			local PlayerOfBedColor = GetPlayerOfBedTeam(Bed)
			local Magnitude = 0

			task.spawn(function()
				
				task.wait(TweenSpeed)
				repeat 
					task.wait(0.25) 
					
					if Bed and IsAlive(LocalPlayer) then
						Magnitude = (LocalPlayer.Character.HumanoidRootPart.Position - Bed.Position).Magnitude TweenUp() 
					end
					
				until not IsAlive(LocalPlayer) or PlayerOfBedColor.leaderstats.Bed.Value ~= "✅" or not Bed or Magnitude > 40

				repeat
					task.wait()
					NearestPlayer, NearestPlayerDistance = FindNearestPlayer()

					Magnitude = (LocalPlayer.Character.HumanoidRootPart.Position - NearestPlayer.Character.HumanoidRootPart.Position).Magnitude 

					TweenToNearestPlayerSlow(NearestPlayer)

					task.wait(0.3)

				until not IsAlive(LocalPlayer) or Magnitude > 60

				KillHumanoid(0)
			end)
		end
	end)

	task.spawn(function() --PlayerTp
		local Magnitude = 0
		local NearestPlayer, NearestPlayerDistance = FindNearestPlayer()
		local Bed = FindNearestBed()

		if not Bed and NearestPlayer then
			TweenToNearestPlayer()

			task.spawn(function()
				task.wait(TweenSpeed + 0.7)

				repeat
					task.wait()
					NearestPlayer, NearestPlayerDistance = FindNearestPlayer()

					Magnitude = (LocalPlayer.Character.HumanoidRootPart.Position - NearestPlayer.Character.HumanoidRootPart.Position).Magnitude 

					TweenToNearestPlayerSlow(NearestPlayer)

					task.wait(0.3)

				until not IsAlive(LocalPlayer) or Magnitude > 60

				KillHumanoid(0)
			end)		
		end
	end)
end

task.spawn(function() --Start the autowin decision
	local BedTpCooldown = false

	LocalPlayer.CharacterAdded:Connect(function()
		repeat task.wait() until LocalPlayer.Character:FindFirstChildOfClass("ForceField")

		task.wait(0.2)
		
		if AutowinValue == true then
			AutowinDecision()
		end
	end)
end)
