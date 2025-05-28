-- Memuat Orion Library
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/GRPGaming/Key-System/refs/heads/Xycer-Hub-Script/ZusumeLib(Slider)"))()

-- Membuat jendela utama
local Window = OrionLib:MakeWindow({
    Name = "Main Hack",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "DeadRailsConfig",
    IntroEnabled = true,
    IntroText = "Welcome to Dead Rails Hack",
    IntroIcon = "rbxassetid://4483345998",
    Icon = "rbxassetid://4483345998",
    CloseCallback = function()
        print("GUI Closed")
    end
})

-- Membuat tab utama
local MainTab = Window:MakeTab({
    Name = "Main Features",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Membuat bagian untuk SpeedHack
local SpeedSection = MainTab:AddSection({
    Name = "SpeedHack"
})

-- Toggle untuk SpeedHack
SpeedSection:AddToggle({
    Name = "Enable SpeedHack",
    Default = false,
    Callback = function(state)
        if state then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
        else
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        end
    end
})

-- Slider untuk mengatur kecepatan
SpeedSection:AddSlider({
    Name = "Set Speed",
    Min = 16,
    Max = 200,
    Default = 100,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "Speed",
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})

-- Membuat bagian untuk FlyHack
local FlySection = MainTab:AddSection({
    Name = "FlyHack"
})

-- Toggle untuk FlyHack
FlySection:AddToggle({
    Name = "Enable FlyHack",
    Default = false,
    Callback = function(state)
        if state then
            -- Implementasi FlyHack dengan kontrol arah
            -- Anda dapat menambahkan skrip fly di sini
        else
            -- Menonaktifkan FlyHack
        end
    end
})

-- Slider untuk mengatur kecepatan terbang
FlySection:AddSlider({
    Name = "Set Fly Speed",
    Min = 10,
    Max = 200,
    Default = 100,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "Fly Speed",
    Callback = function(value)
        -- Mengatur kecepatan terbang
    end
})

-- Membuat bagian untuk fitur lobi
local LobbySection = MainTab:AddSection({
    Name = "Lobby Features"
})

-- Tombol untuk Auto Unlock All Trains
LobbySection:AddButton({
    Name = "Auto Unlock All Trains",
    Callback = function()
        -- Implementasi untuk membuka semua kereta
    end
})

-- Tombol untuk Auto Unlock All Class
LobbySection:AddButton({
    Name = "Auto Unlock All Class",
    Callback = function()
        -- Implementasi untuk membuka semua kelas
    end
})

-- Membuat bagian untuk fitur tambahan
local ExtraSection = MainTab:AddSection({
    Name = "Extra Features"
})

-- Toggle untuk No Clip
ExtraSection:AddToggle({
    Name = "Enable No Clip",
    Default = false,
    Callback = function(state)
        if state then
            -- Implementasi No Clip
        else
            -- Menonaktifkan No Clip
        end
    end
})

-- Toggle untuk Infinite Health
ExtraSection:AddToggle({
    Name = "Enable Infinite Health",
    Default = false,
    Callback = function(state)
        if state then
            -- Implementasi Infinite Health
        else
            -- Menonaktifkan Infinite Health
        end
    end
})

-- Toggle untuk Auto Kill Aura
ExtraSection:AddToggle({
    Name = "Enable Auto Kill Aura (Shovel)",
    Default = false,
    Callback = function(state)
        if state then
            -- Implementasi Auto Kill Aura dengan sekop
        else
            -- Menonaktifkan Auto Kill Aura
        end
    end
})

-- Toggle untuk Auto Gun Kill Aura
ExtraSection:AddToggle({
    Name = "Enable Auto Gun Kill Aura",
    Default = false,
    Callback = function(state)
        if state then
            -- Implementasi Auto Gun Kill Aura
        else
            -- Menonaktifkan Auto Gun Kill Aura
        end
    end
})

-- Membuat bagian untuk Teleport
local TeleportSection = MainTab:AddSection({
    Name = "Teleport"
})

-- Dropdown untuk memilih lokasi teleportasi
TeleportSection:AddDropdown({
    Name = "Select Teleport Location",
    Default = "Base 0km",
    Options = {
        "Base 0km",
        "Base 10km",
        "Base 20km",
        "Base 30km",
        "Base 40km",
        "Base 50km",
        "Base 60km",
        "Base 70km",
        "Base 80km",
        "Train",
        "Lab Tesla",
        "Sterling",
        "Castle",
        "Fort",
        "End"
    },
    Callback = function(value)
        -- Implementasi teleportasi ke lokasi yang dipilih
    end
})

-- Membuat bagian untuk tampilan kamera
local CameraSection = MainTab:AddSection({
    Name = "Camera View"
})

-- Toggle untuk 3rd Person View
CameraSection:AddToggle({
    Name = "Enable 3rd Person View",
    Default = false,
    Callback = function(state)
        if state then
            -- Mengaktifkan 3rd Person View
        else
            -- Menonaktifkan 3rd Person View
        end
    end
})

-- Inisialisasi Orion Library
OrionLib:Init()
