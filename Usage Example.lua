-- Output/LocalScript.lua
-- Client-side controller for the narrative elements.

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- Waiting for the module structure (Safe loading)
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
		Offset = Vector3.new(0, 5, -10),
		Settings = {
			TextSize = 60,
			FloatSpeed = 1.2,
			FadeDistance = 30
		},
		Duration = 2.0 
	},

	{
		Text = "We fixed the framerate bug.",
		Offset = Vector3.new(5, 6, -15),
		Settings = {
			TextSize = 50,
			FloatSpeed = 1.5,
			FadeDistance = 35
		},
		Duration = 2.5
	},

	{
		Text = "By using a coroutine loop...",
		Offset = Vector3.new(10, 4, -20),
		Settings = {
			TextSize = 50,
			FloatSpeed = 0.8,
			FadeDistance = 40
		},
		Duration = 2.0
	},

	{
		Text = "...the text won't pile up anymore.",
		Offset = Vector3.new(15, 7, -25),
		Settings = {
			TextSize = 60,
			FloatSpeed = 2.0,
			FadeDistance = 40
		},
		Duration = 3.0
	},

	{
		Text = "thank you for testing :D",
		Offset = Vector3.new(20, 5, -30),
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