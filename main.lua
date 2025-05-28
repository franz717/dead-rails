-- Load Orion Library
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/GRPGaming/Key-System/refs/heads/Xycer-Hub-Script/ZusumeLib(Slider)'))()

-- Create Window
local Window = OrionLib:MakeWindow({
    Name = "Dead Rails | Orion GUI by xrgadget",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "DeadRailsHack",
    IntroEnabled = true,
    IntroText = "Dead Rails Script by xrgadget",
    IntroIcon = "rbxassetid://7733954760",
    Icon = "rbxassetid://7733954760"
})

-- Main Tab
local MainTab = Window:MakeTab({
    Name = "Main Hack",
    Icon = "rbxassetid://7734053495",
    PremiumOnly = false
})

-- Variables
local SpeedEnabled = false
local SpeedValue = 50
local FlyEnabled = false
local FlySpeed = 50
local AutoFarmEnabled = false
local NoClipEnabled = false
local InfHealthEnabled = false

-- Speed Hack
MainTab:AddToggle({
    Name = "SpeedHack",
    Default = false,
    Callback = function(Value) SpeedEnabled = Value end
})

MainTab:AddSlider({
    Name = "Speed Value",
    Min = 16,
    Max = 150,
    Default = 50,
    Color = Color3.fromRGB(255,255,0),
    Increment = 1,
    ValueName = "Speed",
    Callback = function(Value) SpeedValue = Value end
})

-- Fly Hack
MainTab:AddToggle({
    Name = "FlyHack",
    Default = false,
    Callback = function(Value) FlyEnabled = Value end
})

MainTab:AddSlider({
    Name = "Fly Speed",
    Min = 1,
    Max = 150,
    Default = 50,
    Color = Color3.fromRGB(0,255,255),
    Increment = 1,
    ValueName = "Fly",
    Callback = function(Value) FlySpeed = Value end
})

-- No Clip
MainTab:AddToggle({
    Name = "No Clip (tembus tembok)",
    Default = false,
    Callback = function(Value) NoClipEnabled = Value end
})

-- Infinite Health
MainTab:AddToggle({
    Name = "Infinite Health (Tak Bisa Mati)",
    Default = false,
    Callback = function(Value) InfHealthEnabled = Value end
})

-- Auto Unlock Trains
MainTab:AddButton({
    Name = "Auto Unlock All Trains",
    Callback = function()
        local gui = game.Players.LocalPlayer.PlayerGui:FindFirstChild("TrainMenu")
        if gui then
            for _, button in pairs(gui:GetDescendants()) do
                if button:IsA("TextButton") and button.Name == "LockIcon" then
                    button.Visible = false
                    if button.Parent:FindFirstChild("TrainName") then
                        button.Parent.TrainName.TextColor3 = Color3.fromRGB(255, 255, 255)
                    end
                end
            end
            OrionLib:MakeNotification({Name = "Unlocked", Content = "Semua Train di-unlock (visual)", Time = 3})
        end
    end
})

-- Auto Unlock Classes
MainTab:AddButton({
    Name = "Auto Unlock All Class",
    Callback = function()
        local gui = game.Players.LocalPlayer.PlayerGui:FindFirstChild("ClassMenu")
        if gui then
            for _, class in pairs(gui:GetDescendants()) do
                if class:IsA("TextButton") and class:FindFirstChild("Locked") then
                    class.Locked.Visible = false
                    class.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
                end
            end
            OrionLib:MakeNotification({Name = "Unlocked", Content = "Semua Class di-unlock (visual)", Time = 3})
        end
    end
})

-- Auto Join Nearest Train
MainTab:AddButton({
    Name = "Auto Join Train",
    Callback = function()
        local player = game.Players.LocalPlayer
        local trains = workspace:FindFirstChild("Trains")
        if trains and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = player.Character.HumanoidRootPart
            local closestTrain = nil
            local shortestDist = math.huge
            for _, train in pairs(trains:GetChildren()) do
                if train:IsA("Model") and train:FindFirstChild("Door") then
                    local dist = (hrp.Position - train.Door.Position).Magnitude
                    if dist < shortestDist then
                        shortestDist = dist
                        closestTrain = train
                    end
                end
            end
            if closestTrain then
                hrp.CFrame = closestTrain.Door.CFrame + Vector3.new(0, 3, 0)
                OrionLib:MakeNotification({Name = "Teleported", Content = "Masuk ke kereta terdekat.", Time = 3})
            else
                OrionLib:MakeNotification({Name = "Gagal", Content = "Kereta tidak ditemukan.", Time = 3})
            end
        end
    end
})

-- Teleport to Safe Zone
MainTab:AddButton({
    Name = "Teleport ke Safe Zone",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local safeZone = workspace:FindFirstChild("SafeZone")
            if safeZone then
                player.Character.HumanoidRootPart.CFrame = safeZone.CFrame + Vector3.new(0, 5, 0)
                OrionLib:MakeNotification({Name = "Teleport", Content = "Berhasil ke Safe Zone.", Time = 3})
            else
                OrionLib:MakeNotification({Name = "Error", Content = "Safe Zone tidak ditemukan.", Time = 3})
            end
        end
    end
})

-- Looping Effects
local RunService = game:GetService("RunService")
RunService.RenderStepped:Connect(function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:FindFirstChild("HumanoidRootPart")
    local humanoid = character:FindFirstChildOfClass("Humanoid")

    if SpeedEnabled and humanoid then
        humanoid.WalkSpeed = SpeedValue
    elseif humanoid then
        humanoid.WalkSpeed = 16
    end

    if FlyEnabled and hrp then
        hrp.Velocity = Vector3.new(0, FlySpeed, 0)
    end

    if NoClipEnabled and character then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide == true then
                part.CanCollide = false
            end
        end
    end

    if InfHealthEnabled and humanoid then
        humanoid.Health = humanoid.MaxHealth
    end
end)

-- Init GUI
OrionLib:Init()
