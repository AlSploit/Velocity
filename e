local LocalPlayer = game.Players.LocalPlayer

local UserInputService = game:GetService("UserInputService")

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
UIListLayout.Padding = UDim.new(0, 85)

task.spawn(function()
	UserInputService.InputBegan:Connect(function(Input)
		if Input.KeyCode == Enum.KeyCode.M then
			ContainerFrame.Visible = not ContainerFrame.Visible
		end
	end)
end)

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
	Tab.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
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
	local Keybind = Instance.new("TextButton")
	local KBPadding = Instance.new("UIPadding")
	local KBCorner = Instance.new("UICorner")
	local Keyboard = Instance.new("ImageLabel")
	local Options = Instance.new("Frame")

	local AssignKeyBind = false
	local Checker = {["Enabled"] = false}
	local KeyBind = ""

	function Checker:Toggle(Bool)
		Bool = Bool or (not Checker["Enabled"])
		Checker["Enabled"] = Bool

		if not Bool then
			task.spawn(function()
				CallBack(false)
				ModuleButton.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
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

	task.spawn(function()
		Keybind.Activated:Connect(function()
			AssignKeyBind = true
			Keybind.Text = "... | "
		end)
	end)

	task.spawn(function()
		UserInputService.InputBegan:Connect(function(Input)
			if Input.KeyCode == KeyBind.Keycode then
				Checker:Toggle()
			end 
			
			if AssignKeyBind == true then
				AssignKeyBind = false
				
				KeyBind = Input.Name
				Keybind.Text = KeyBind .. "| "
			end
		end)
	end)
	
	task.spawn(function()
		UserInputService.InputBegan:Connect(function(Input)
			if Input.KeyCode.Name == KeyBind then
				Checker:Toggle()
			end
		end)
	end)

	Module.Name = "Module"
	Module.Parent = Parent
	Module.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Module.BackgroundTransparency = 1.000
	Module.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Module.BorderSizePixel = 0
	Module.Size = UDim2.new(1, 0, 0, 40)

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

	DropDownButton.Parent = Module
	DropDownButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	DropDownButton.BackgroundTransparency = 1.000
	DropDownButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	DropDownButton.BorderSizePixel = 0
	DropDownButton.Position = UDim2.new(0, 187, 0, 14)
	DropDownButton.Rotation = 90.000
	DropDownButton.Size = UDim2.new(0, 13, 0, 13)
	DropDownButton.Image = "http://www.roblox.com/asset/?id=6026663699"
	DropDownButton.ScaleType = Enum.ScaleType.Fit

	Keybind.Name = "Keybind"
	Keybind.Parent = Module
	Keybind.AnchorPoint = Vector2.new(1, 0)
	Keybind.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
	Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Keybind.BorderSizePixel = 0
	Keybind.Position = UDim2.new(0.9, -30, 0, 12)
	Keybind.Size = UDim2.new(0, 0, 0, 15)
	Keybind.Font = Enum.Font.Gotham
	Keybind.Text = "| "
	Keybind.TextColor3 = Color3.fromRGB(255, 255, 255)
	Keybind.TextSize = 14.000

	KBPadding.Name = "KBPadding"
	KBPadding.Parent = Keybind
	KBPadding.PaddingLeft = UDim.new(0, 5)
	KBPadding.PaddingRight = UDim.new(0, 18)

	KBCorner.Name = "KBCorner"
	KBCorner.Parent = Keybind

	Keyboard.Name = "Keyboard"
	Keyboard.Parent = Keybind
	Keyboard.AnchorPoint = Vector2.new(1, 0)
	Keyboard.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Keyboard.BackgroundTransparency = 1.000
	Keyboard.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Keyboard.BorderSizePixel = 0
	Keyboard.Position = UDim2.new(1, 15, 0, 0)
	Keyboard.Size = UDim2.new(0, 15, 0, 15)
	Keyboard.Image = "http://www.roblox.com/asset/?id=6034818398"

	Options.Name = "Options"
	Options.Parent = Module
	Options.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
	Options.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Options.BorderSizePixel = 0
	Options.Position = UDim2.new(0, 0, 0, 40)
	Options.Size = UDim2.new(1, 0, 0, 0)

	return DropDownButton, Options
end

local VelocityApi = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlSploit/Velocity/main/Api"))()

local LocalPlayer = game.Players.LocalPlayer

local CombatTab = CreateTab("Combat")

local KillAura = CreateToggle("KillAura", CombatTab, true, function(Callback)
	print(Callback)
end)
