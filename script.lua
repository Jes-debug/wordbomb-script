local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local TextLabel_3 = Instance.new("TextLabel")
local TextLabel_4 = Instance.new("TextLabel")
local TextLabel_5 = Instance.new("TextLabel")


ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
Frame.Position = UDim2.new(0, 0, 0.693520129, 0)
Frame.Size = UDim2.new(0, 228, 0, 175)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
TextLabel.Size = UDim2.new(0, 227, 0, 21)
TextLabel.Font = Enum.Font.Gotham
TextLabel.Text = "WordBomb Gui"
TextLabel.TextColor3 = Color3.fromRGB(252, 0, 15)
TextLabel.TextSize = 14.000

TextLabel_2.Parent = Frame
TextLabel_2.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
TextLabel_2.Position = UDim2.new(0.030837005, 0, 0.229729742, 0)
TextLabel_2.Size = UDim2.new(0, 200, 0, 28)
TextLabel_2.Font = Enum.Font.Gotham
TextLabel_2.Text = "Just chillax. The game plays itself."
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextSize = 14.000

TextLabel_3.Parent = Frame
TextLabel_3.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
TextLabel_3.Position = UDim2.new(0.030837005, 0, 0.810810804, 0)
TextLabel_3.Size = UDim2.new(0, 200, 0, 28)
TextLabel_3.Font = Enum.Font.GothamBlack
TextLabel_3.Text = "Modded by 31xJes"
TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.TextSize = 14.000

TextLabel_4.Parent = Frame
TextLabel_4.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
TextLabel_4.Position = UDim2.new(0.00438596494, 0, 0.689980745, 0)
TextLabel_4.Size = UDim2.new(0, 227, 0, 28)
TextLabel_4.Font = Enum.Font.GothamBlack
TextLabel_4.Text = "and my english word list"
TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.TextSize = 11.000

TextLabel_5.Parent = Frame
TextLabel_5.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
TextLabel_5.Position = UDim2.new(0.00438596494, 0, 0.572825909, 0)
TextLabel_5.Size = UDim2.new(0, 227, 0, 28)
TextLabel_5.Font = Enum.Font.GothamBlack
TextLabel_5.Text = "Based off AngelD23's Word Bomb Finder"
TextLabel_5.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_5.TextSize = 11.000

loadstring(game:HttpGet("https://raw.githubusercontent.com/Jes-debug/wordbomb-word-list/main/wordbomb-word-list", true))()

local Used = {}

local function InTable(str)
	for i,v in pairs(Used) do
		print(v)
		if v == str then
			return true
		end
	end
end

local function GetLetters()
	local TextFrame = game:GetService("Players").LocalPlayer.PlayerGui.GameUI.Container.GameSpace.DefaultUI.GameContainer.DesktopContainer.InfoFrameContainer.InfoFrame.TextFrame
	local Text = ""
	for i,v in pairs(TextFrame:GetChildren()) do
		if v.Name == "LetterFrame" then
			Text = Text..(v.Letter.TextLabel.Text)
		end
	end
	return Text
end

local function FindWord(Word)
	local Result
	for i,v in pairs(ENGLISH_WORDS) do
		if string.find(v, string.lower(Word)) and not InTable(v) then
			Result = v
			table.insert(Used, v)
			return Result
		end
	end
end

local function CreateInstance(cls,props)
	local inst = Instance.new(cls)
	for i,v in pairs(props) do
		inst[i] = v
	end
	return inst
end

local UserInputService = game:GetService("UserInputService")

function TextBoxFocused(textbox)
	local rand1 = math.random(100, 175)/100
	if textbox.Name == "Typebox" then
		wait(rand1)
		local a = FindWord(GetLetters())
		for v in string.gmatch(a, "(%w)") do wait()
			local rand2 = math.random(2, 10)/100
			textbox.Text = textbox.Text..string.upper(v)
			wait(rand2)
		end
		keypress(0x0D)
	else
		wait()
	end
end

UserInputService.TextBoxFocused:Connect(TextBoxFocused)
