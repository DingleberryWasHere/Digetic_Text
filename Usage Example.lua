

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local Modules = ReplicatedStorage:WaitForChild("Modules")
local Output = Modules:WaitForChild("OutPut")
local TextModules = Output:WaitForChild("Text")
local FinchText = require(TextModules:WaitForChild("DiegeticText"))

local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local RootPart = Character:WaitForChild("HumanoidRootPart")

task.wait(2)


local dialogueNodes = {
	{
		Text = "Hi player.",
		Offset = Vector3.new(0, 2, -10),
		Settings = {
			TextSize = 60,
			FloatSpeed = 1.2,
			FadeDistance = 30
		},
		Duration = 2.0 
	},

	{
		Text = "this is my open source dialogue system....",
		Offset = Vector3.new(5, 2, -15),
		Settings = {
			TextSize = 50,
			FloatSpeed = 1.5,
			FadeDistance = 35
		},
		Duration = 2.5
	},

	{
		Text = "inspired by...",
		Offset = Vector3.new(10, 2, -20),
		Settings = {
			TextSize = 50,
			FloatSpeed = 0.8,
			FadeDistance = 40
		},
		Duration = 2.0
	},

	{
		Text = "What remains of Edith Finch....",
		Offset = Vector3.new(15, 2, -25),
		Settings = {
			TextSize = 60,
			FloatSpeed = 2.0,
			FadeDistance = 40
		},
		Duration = 3.0
	},

	{
		Text = "thank you for testing :D",
		Offset = Vector3.new(20, 2, -30),
		Settings = {
			TextSize = 70,
			FloatSpeed = 1.0,
			FadeDistance = 50
		},
		Duration = 2.0
	}
}



task.spawn(function()

	for i, node in ipairs(dialogueNodes) do

		local spawnLocation = RootPart.Position + node.Offset

		local dialogue = FinchText.new(
			node.Text,
			spawnLocation,
			node.Settings
		)

		if dialogue.AnimateIn then
			dialogue:AnimateIn(2) 
		end

		task.wait(node.Duration)

	end

end)
