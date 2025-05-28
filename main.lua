-- Load Orion Library
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/GRPGaming/Key-System/refs/heads/Xycer-Hub-Script/ZusumeLib(Slider)'))()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera

local Window = OrionLib:MakeWindow({
    Name = "Dead Rails | Orion GUI by xrgadget",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "DeadRailsHackMobile",
    IntroEnabled = true,
    IntroText = "Zafran Ganteng Banget Imut Kiyut",
    IntroIcon = "rbxassetid://7733954760",
    Icon = "rbxassetid://7733954760"
})

local MainTab = Window:MakeTab({
    Name = "Main Hack",
    Icon = "rbxassetid://7734053495",
    PremiumOnly = false
})

-- Variables
local SpeedEnabled, SpeedValue = false, 50
local FlyEnabled, FlySpeed = false, 50
local Noclip = false
local InfHealth = false
local KillAura = false
local GunAura = false
local ZoomDistance = 10

-- Speed Hack
MainTab:AddToggle({
    Name = "SpeedHack",
    Default = false,
    Callback = function(val) SpeedEnabled = val end
})
MainTab:AddSlider({
    Name = "Speed Value",
    Min = 16,
    Max = 150,
    Default = 50,
    Color = Color3.fromRGB(255,255,0),
    Increment = 1,
    ValueName = "Speed",
    Callback = function(val) SpeedValue = val end
})

-- Fly Hack (Directional)
MainTab:AddToggle({
    Name = "FlyHack (Kendali HP)",
    Default = false,
    Callback = function(v)
        FlyEnabled = v
    end
})
MainTab:AddSlider({
    Name = "Fly Speed",
    Min = 10,
    Max = 150,
    Default = 50,
    Color = Color3.fromRGB(0,255,255),
    Increment = 1,
    ValueName = "Fly",
    Callback = function(v) FlySpeed = v end
})

-- No Clip
MainTab:AddToggle({
    Name = "No Clip (Tembus Tembok)",
    Default = false,
    Callback = function(v)
        Noclip = v
    end
})

-- Infinite Health
MainTab:AddToggle({
    Name = "Infinite Health",
    Default = false,
    Callback = function(v)
        InfHealth = v
    end
})

-- Auto Kill Aura (Shovel)
MainTab:AddToggle({
    Name = "Kill Aura (Sekop)",
    Default = false,
    Callback = function(v) KillAura = v end
})

-- Auto Gun Kill Aura
MainTab:AddToggle({
    Name = "Gun Aura (Senjata)",
    Default = false,
    Callback = function(v) GunAura = v end
})

-- Zoom 3rd Person
MainTab:AddSlider({
    Name = "3rd Person Zoom",
    Min = 5,
    Max = 100,
    Default = 10,
    Increment = 1,
    ValueName = "Zoom",
    Callback = function(v)
        ZoomDistance = v
        Camera.CameraSubject = LocalPlayer.Character:FindFirstChild("Humanoid")
        Camera.CameraType = Enum.CameraType.Custom
        Camera.CameraOffset = Vector3.new(0, 0, -ZoomDistance)
    end
})

-- Teleport Locations
local TeleportLocations = {
    ["Base 0km"] = Vector3.new(0, 5, 0),
    ["Base 10km"] = Vector3.new(1000, 5, 0),
    ["Base 20km"] = Vector3.new(2000, 5, 0),
    ["Base 30km"] = Vector3.new(3000, 5, 0),
    ["Base 40km"] = Vector3.new(4000, 5, 0),
    ["Base 50km"] = Vector3.new(5000, 5, 0),
    ["Base 60km"] = Vector3.new(6000, 5, 0),
    ["Base 70km"] = Vector3.new(7000, 5, 0),
    ["Base 80km"] = Vector3.new(8000, 5, 0),
    ["Lab Tesla"] = Vector3.new(6000, 10, 600),
    ["Fort"] = Vector3.new(7800, 10, 200),
    ["Castle"] = Vector3.new(5000, 20, 800),
    ["Sterling"] = Vector3.new(3500, 10, -300),
    ["Train"] = Vector3.new(0, 5, 1000),
    ["End"] = Vector3.new(8500, 5, 0)
}
for name, pos in pairs(TeleportLocations) do
    MainTab:AddButton({
        Name = "Teleport ke " .. name,
        Callback = function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
            end
        end
    })
end

-- Loop System
RunService.RenderStepped:Connect(function()
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")

    if SpeedEnabled and hum then hum.WalkSpeed = SpeedValue else hum.WalkSpeed = 16 end

    if FlyEnabled and hrp then
        local camLook = Camera.CFrame.LookVector
        hrp.Velocity = camLook * FlySpeed
    end

    if Noclip and char then
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide == true then
                part.CanCollide = false
            end
        end
    end

    if InfHealth and hum then
        hum.Health = hum.MaxHealth
    end

    if KillAura and char:FindFirstChildOfClass("Tool") and char:FindFirstChildOfClass("Tool").Name:lower():find("shovel") then
        for _, enemy in pairs(workspace:GetDescendants()) do
            if enemy:IsA("Model") and enemy:FindFirstChild("Humanoid") and enemy ~= char then
                local eh = enemy:FindFirstChild("HumanoidRootPart")
                if eh and (eh.Position - hrp.Position).Magnitude < 10 then
                    pcall(function() char:FindFirstChildOfClass("Tool"):Activate() end)
                end
            end
        end
    end

    if GunAura and char:FindFirstChildOfClass("Tool") and not char:FindFirstChildOfClass("Tool").Name:lower():find("shovel") then
        for _, enemy in pairs(workspace:GetDescendants()) do
            if enemy:IsA("Model") and enemy:FindFirstChild("Humanoid") and enemy ~= char then
                local eh = enemy:FindFirstChild("HumanoidRootPart")
                if eh and (eh.Position - hrp.Position).Magnitude < 30 then
                    pcall(function() char:FindFirstChildOfClass("Tool"):Activate() end)
                end
            end
        end
    end
end)

OrionLib:Init()
