local LocalPlayer = game.Players.LocalPlayer

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local Velocity = Instance.new("ScreenGui")
local ContainerFrame = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")

Velocity.Name = "Velocity"
Velocity.Parent = game.Players.LocalPlayer.PlayerGui
Velocity.ResetOnSpawn = false

ContainerFrame.Name = "ContainerFrame"
ContainerFrame.Parent = Velocity
ContainerFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ContainerFrame.BackgroundTransparency = 1.000
ContainerFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ContainerFrame.BorderSizePixel = 0
ContainerFrame.Position = UDim2.new(0, 0, 0, 0)
ContainerFrame.Size = UDim2.new(1, 0, 0.985, 0)
ContainerFrame.Visible = false

UIListLayout.Parent = ContainerFrame
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 30)

task.spawn(function()
	UserInputService.InputBegan:Connect(function(Input)
		if Input.KeyCode == Enum.KeyCode.M then
			ContainerFrame.Visible = not ContainerFrame.Visible
		end
	end)
end)

local DefaultLayoutOrder = 0

function CreateTab(Name)
	local Tab = Instance.new("Frame")
	local TabCorner = Instance.new("UICorner")
	local TabInfo = Instance.new("Frame")
	local TabIcon = Instance.new("ImageLabel")
	local TabName = Instance.new("TextLabel")
	local UIPadding = Instance.new("UIPadding")
	local TabInfoCorner = Instance.new("UICorner")
	local CornerDetail = Instance.new("Frame")
	local Modules = Instance.new("ScrollingFrame")
	local ModulesLayout = Instance.new("UIListLayout")

	Tab.Name = "Tab"
	Tab.Parent = ContainerFrame
	Tab.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
	Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Tab.BorderSizePixel = 0
	Tab.Position = UDim2.new(0, 0, 0, 0)
	Tab.Size = UDim2.new(0, 210, 0, 40)

	TabCorner.CornerRadius = UDim.new(0, 10)
	TabCorner.Name = "TabCorner"
	TabCorner.Parent = Tab

	TabInfo.Name = "TabInfo"
	TabInfo.Parent = Tab
	TabInfo.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
	TabInfo.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabInfo.BorderSizePixel = 0
	TabInfo.Size = UDim2.new(1, 0, 0, 40)

	TabIcon.Name = "TabIcon"
	TabIcon.Parent = TabInfo
	TabIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabIcon.BackgroundTransparency = 1.000
	TabIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabIcon.BorderSizePixel = 0
	TabIcon.Position = UDim2.new(0, 13, 0, 13)
	TabIcon.Size = UDim2.new(0, 15, 0, 15)
	TabIcon.Image = "rbxassetid://14483662459"

	TabName.Name = Name .. "Tab"
	TabName.Parent = TabInfo
	TabName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabName.BackgroundTransparency = 1.000
	TabName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabName.BorderSizePixel = 0
	TabName.Size = UDim2.new(1, 0, 1, 0)
	TabName.Font = Enum.Font.GothamBold
	TabName.Text = Name
	TabName.TextColor3 = Color3.fromRGB(255, 255, 255)
	TabName.TextSize = 16.000
	TabName.TextWrapped = true
	TabName.TextXAlignment = Enum.TextXAlignment.Left

	UIPadding.Parent = TabName
	UIPadding.PaddingLeft = UDim.new(0, 38)

	TabInfoCorner.CornerRadius = UDim.new(0, 10)
	TabInfoCorner.Name = "TabInfoCorner"
	TabInfoCorner.Parent = TabInfo

	CornerDetail.Name = "CornerDetail"
	CornerDetail.Parent = TabInfo
	CornerDetail.AnchorPoint = Vector2.new(0, 1)
	CornerDetail.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
	CornerDetail.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CornerDetail.BorderSizePixel = 0
	CornerDetail.Position = UDim2.new(0, 0, 1, 0)
	CornerDetail.Size = UDim2.new(1, 0, 0.125, 7)

	Modules.Name = "Modules"
	Modules.Parent = Tab
	Modules.Active = true
	Modules.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
	Modules.BackgroundTransparency = 1.000
	Modules.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Modules.BorderSizePixel = 0
	Modules.ClipsDescendants = false
	Modules.Position = UDim2.new(0, 0, 0, 40)
	Modules.Size = UDim2.new(1, 0, 0, 0)
	Modules.CanvasSize = UDim2.new(0, 0, 0, 0)
	Modules.ScrollBarThickness = 0

	ModulesLayout.Name = "ModulesLayout"
	ModulesLayout.Parent = Modules
	ModulesLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	ModulesLayout.SortOrder = Enum.SortOrder.LayoutOrder

	return Modules
end

function CreateToggle(Name, Parent, DefaultValue, CallBack)
	local Module = Instance.new("Frame")
	local ModuleButton = Instance.new("TextButton")
	local UIPadding_2 = Instance.new("UIPadding")
	local DropDownButton = Instance.new("ImageButton")

	local Checker = {["Enabled"] = false}

	function Checker:Toggle(Bool)
		Bool = Bool or (not Checker["Enabled"])
		Checker["Enabled"] = Bool

		if not Bool then
			task.spawn(function()
				CallBack(false)
				ModuleButton.BackgroundColor3 = Color3.new(0.101961, 0.101961, 0.101961)
			end)
		else
			task.spawn(function()
				CallBack(true)
				ModuleButton.BackgroundColor3 = Color3.new(0.635294, 0.313725, 1)
			end)
		end
	end

	if DefaultValue == true then
		Checker:Toggle()
	end

	task.spawn(function()
		ModuleButton.Activated:Connect(function()
			Checker:Toggle()	
		end)
	end)	

	Module.Name = "Module"
	Module.Parent = Parent
	Module.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Module.BackgroundTransparency = 1.000
	Module.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Module.BorderSizePixel = 0
	Module.Size = UDim2.new(1, 0, 0, 40)
	Module.ZIndex = 1
	
	Module.LayoutOrder = DefaultLayoutOrder + 5
	DefaultLayoutOrder = Module.LayoutOrder

	ModuleButton.Name = "ModuleButton"
	ModuleButton.Parent = Module
	ModuleButton.BackgroundColor3 = Color3.fromRGB(161, 79, 255)
	ModuleButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ModuleButton.BorderSizePixel = 0
	ModuleButton.Size = UDim2.new(1, 0, 0, 40)
	ModuleButton.AutoButtonColor = false
	ModuleButton.Font = Enum.Font.Gotham
	ModuleButton.Text = Name
	ModuleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	ModuleButton.TextSize = 14.000
	ModuleButton.TextXAlignment = Enum.TextXAlignment.Left

	UIPadding_2.Parent = ModuleButton
	UIPadding_2.PaddingLeft = UDim.new(0, 13)
	UIPadding_2.PaddingTop = UDim.new(0, 1)

	DropDownButton.Parent = ModuleButton
	DropDownButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	DropDownButton.BackgroundTransparency = 1.000
	DropDownButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	DropDownButton.BorderSizePixel = 0
	DropDownButton.Position = UDim2.new(0, 165, 0, 12)
	DropDownButton.Rotation = 0
	DropDownButton.Size = UDim2.new(0, 13, 0, 13)
	DropDownButton.Image = "http://www.roblox.com/asset/?id=6026663699"
	DropDownButton.ScaleType = Enum.ScaleType.Fit

	return Module, DropDownButton, Module.LayoutOrder
end

function CreateMiniToggle(Name, Parent, LayoutOrder, DefaultValue, CallBack)
	local Toggle = Instance.new("Frame")
	local ToggleName = Instance.new("TextLabel")
	local UIPadding_3 = Instance.new("UIPadding")
	local ToggleFrame = Instance.new("Frame")
	local ToggleFrameCorner = Instance.new("UICorner")
	local ToggleButton = Instance.new("TextButton")
	local ToggleButtonCorner = Instance.new("UICorner")
	
	local Checker = {["Enabled"] = false}

	function Checker:Toggle(Bool)
		Bool = Bool or (not Checker["Enabled"])
		Checker["Enabled"] = Bool

		if not Bool then
			task.spawn(function()
				CallBack(false)
				ToggleFrame.BackgroundColor3 = Color3.new(0.101961, 0.101961, 0.101961)
				
				local TweenInformation = TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0)
				local PositionTween = TweenService:Create(ToggleButton, TweenInformation, {Position = UDim2.new(-0.367, 14, 0.5, 0)})
				
				PositionTween:Play()
			end)
		else
			task.spawn(function()
				CallBack(true)
				ToggleFrame.BackgroundColor3 = Color3.new(0.635294, 0.313725, 1)
				
				local TweenInformation = TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0)
				local PositionTween = TweenService:Create(ToggleButton, TweenInformation, {Position = UDim2.new(0, 14 ,0.5, 0)})

				PositionTween:Play()
			end)
		end
	end

	if DefaultValue == true then
		Checker:Toggle()
	end

	task.spawn(function()
		ToggleButton.Activated:Connect(function()
			Checker:Toggle()	
		end)
	end)	
	
	Toggle.Name = "Toggle"
	Toggle.Parent = Parent
	Toggle.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
	Toggle.BackgroundTransparency = 1.000
	Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Toggle.BorderSizePixel = 0
	Toggle.Size = UDim2.new(1, 0, 0, 30)

	ToggleName.Name = "ToggleName"
	ToggleName.Parent = Toggle
	ToggleName.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
	ToggleName.BackgroundTransparency = 0
	ToggleName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ToggleName.BorderSizePixel = 0
	ToggleName.Size = UDim2.new(1, 0, 1, 0)
	ToggleName.Font = Enum.Font.Gotham
	ToggleName.Text = Name
	ToggleName.TextColor3 = Color3.fromRGB(255, 255, 255)
	ToggleName.TextSize = 14.000
	ToggleName.TextXAlignment = Enum.TextXAlignment.Left

	UIPadding_3.Parent = ToggleName
	UIPadding_3.PaddingLeft = UDim.new(0, 10)

	ToggleFrame.Name = "ToggleFrame"
	ToggleFrame.Parent = Toggle
	ToggleFrame.BackgroundColor3 = Color3.fromRGB(161, 79, 255)
	ToggleFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ToggleFrame.BorderSizePixel = 0
	ToggleFrame.Position = UDim2.new(0, 170, 0, 5)
	ToggleFrame.Size = UDim2.new(0.143, 0, 0.667, 0)
	ToggleFrame.ZIndex = 2

	ToggleFrameCorner.CornerRadius = UDim.new(0, 10)
	ToggleFrameCorner.Name = "ToggleFrameC"
	ToggleFrameCorner.Parent = ToggleFrame

	ToggleButton.Name = "ToggleButton"
	ToggleButton.Parent = ToggleFrame
	ToggleButton.AnchorPoint = Vector2.new(0, 0.5)
	ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ToggleButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ToggleButton.BorderSizePixel = 0
	ToggleButton.Position = UDim2.new(0, 14, 0.5, 0)
	ToggleButton.Size = UDim2.new(0, 14, 0, 14)
	ToggleButton.AutoButtonColor = false
	ToggleButton.Font = Enum.Font.SourceSans
	ToggleButton.Text = ""
	ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	ToggleButton.TextSize = 14.000
	ToggleButton.ZIndex = 3

	ToggleButtonCorner.CornerRadius = UDim.new(1, 0)
	ToggleButtonCorner.Name = "ToggleButtonCorner"
	ToggleButtonCorner.Parent = ToggleButton
	
	return Toggle
end

local CombatTab = CreateTab("Combat")
local BlatantTab = CreateTab("Blatant")
local UtilityTab = CreateTab("Utility")
local WorldTab = CreateTab("World")

task.spawn(function()
	local KillAura, DropDownButton, LayoutOrder = CreateToggle("KillAura", CombatTab, true, function(CallBack)

	end)

	print(LayoutOrder .. " Killaura")

	local CustomAnimationsValue = true
	local CustomAnimations = nil

	DropDownButton.Activated:Connect(function()
		if CustomAnimationsValue == true then
			local TweenInformation = TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0)
			local RotationTween = TweenService:Create(DropDownButton, TweenInformation, {Rotation = 90})

			RotationTween:Play()

			CustomAnimations = CreateMiniToggle("CustomAnimations", CombatTab, LayoutOrder + 2, true, function(CallBack)
				print(LayoutOrder + 1 .. " CustomAnimations")
			end)


			KillAura.LayoutOrder = LayoutOrder + 3
		end

		if CustomAnimationsValue == false then
			local TweenInformation = TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0)
			local RotationTween = TweenService:Create(DropDownButton, TweenInformation, {Rotation = 0})

			RotationTween:Play()

			CustomAnimations:Destroy()
		end

		CustomAnimationsValue = not CustomAnimationsValue
	end)
end)

task.spawn(function()
	local Velocity, DropDownButton, LayoutOrder = CreateToggle("Velocity", CombatTab, true, function(CallBack)
		
	end)
	
	print(LayoutOrder .. " Velocity")

	local CustomAnimationsValue = true
	local CustomAnimations = nil

	DropDownButton.Activated:Connect(function()
		if CustomAnimationsValue == true then
			local TweenInformation = TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0)
			local RotationTween = TweenService:Create(DropDownButton, TweenInformation, {Rotation = 90})

			RotationTween:Play()

			CustomAnimations = CreateMiniToggle("CustomAnimations", CombatTab, LayoutOrder + 2, true, function(CallBack)
				print(LayoutOrder + 1 .. " CustomAnimations2")
			end)
		end

		if CustomAnimationsValue == false then
			local TweenInformation = TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0)
			local RotationTween = TweenService:Create(DropDownButton, TweenInformation, {Rotation = 0})

			RotationTween:Play()

			CustomAnimations:Destroy()
		end

		CustomAnimationsValue = not CustomAnimationsValue
	end)
end)
