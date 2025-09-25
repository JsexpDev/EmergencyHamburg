local player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")

-- ScreenGui
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "HackStyleScriptHub"

-- Tło logowania
local bg = Instance.new("Frame", gui)
bg.Size = UDim2.new(0,300,0,150)
bg.Position = UDim2.new(0.5,-150,0.4,0)
bg.BackgroundColor3 = Color3.fromRGB(0,0,0)
bg.BorderSizePixel = 0
local bgCorner = Instance.new("UICorner", bg)
bgCorner.CornerRadius = UDim.new(0,15)

-- Label
local label = Instance.new("TextLabel", bg)
label.Size = UDim2.new(1,0,0,50)
label.Position = UDim2.new(0,0,0,0)
label.BackgroundTransparency = 1
label.Text = "Enter Code"
label.TextColor3 = Color3.fromRGB(0,255,0)
label.TextScaled = true
label.Font = Enum.Font.Code

-- TextBox
local codeBox = Instance.new("TextBox", bg)
codeBox.Size = UDim2.new(0.8,0,0,40)
codeBox.Position = UDim2.new(0.1,0,0.4,0)
codeBox.BackgroundColor3 = Color3.fromRGB(0,0,0)
codeBox.BorderSizePixel = 1
codeBox.TextColor3 = Color3.fromRGB(0,255,0)
codeBox.PlaceholderText = "Enter code..."
codeBox.TextScaled = true
codeBox.Font = Enum.Font.Code

-- Button
local loginButton = Instance.new("TextButton", bg)
loginButton.Size = UDim2.new(0.5,0,0,40)
loginButton.Position = UDim2.new(0.25,0,0.7,0)
loginButton.Text = "Login"
loginButton.BackgroundColor3 = Color3.fromRGB(0,100,0)
loginButton.TextColor3 = Color3.fromRGB(0,255,0)
loginButton.TextScaled = true
loginButton.Font = Enum.Font.Code
local loggedIn = false

loginButton.MouseButton1Click:Connect(function()
    if codeBox.Text == "123" then
        loggedIn = true
        bg:Destroy()

        -- Ikonka 💣
        local icon = Instance.new("TextButton", gui)
        icon.Text = "💣"
        icon.Size = UDim2.new(0,50,0,50)
        icon.Position = UDim2.new(0,10,0,10)
        icon.BackgroundColor3 = Color3.fromRGB(0,50,0)
        icon.TextColor3 = Color3.fromRGB(0,255,0)
        icon.TextScaled = true
        icon.Font = Enum.Font.Code
        icon.AutoButtonColor = true

        -- Menu
        local menu = Instance.new("Frame", gui)
        menu.Size = UDim2.new(0,250,0,150)
        menu.Position = UDim2.new(0,10,0,70)
        menu.BackgroundColor3 = Color3.fromRGB(0,0,0)
        menu.Visible = false
        local menuCorner = Instance.new("UICorner", menu)
        menuCorner.CornerRadius = UDim.new(0,12)

        -- Infinity Jump Toggle
        local infJump = false
        local infBtn = Instance.new("TextButton", menu)
        infBtn.Size = UDim2.new(0,220,0,50)
        infBtn.Position = UDim2.new(0,15,0,10)
        infBtn.Text = "Infinity Jump: OFF"
        infBtn.TextScaled = true
        infBtn.BackgroundColor3 = Color3.fromRGB(0,50,0)
        infBtn.TextColor3 = Color3.fromRGB(0,255,0)
        infBtn.Font = Enum.Font.Code
        infBtn.MouseButton1Click:Connect(function()
            infJump = not infJump
            infBtn.Text = "Infinity Jump: "..(infJump and "ON" or "OFF")
        end)

        -- Immortality Toggle
        local immortal = false
        local immBtn = Instance.new("TextButton", menu)
        immBtn.Size = UDim2.new(0,220,0,50)
        immBtn.Position = UDim2.new(0,15,0,70)
        immBtn.Text = "Immortality: OFF"
        immBtn.TextScaled = true
        immBtn.BackgroundColor3 = Color3.fromRGB(50,0,0)
        immBtn.TextColor3 = Color3.fromRGB(0,255,0)
        immBtn.Font = Enum.Font.Code
        immBtn.MouseButton1Click:Connect(function()
            immortal = not immortal
            immBtn.Text = "Immortality: "..(immortal and "ON" or "OFF")
        end)

        -- Pokaż/ukryj menu po kliknięciu ikonki
        icon.MouseButton1Click:Connect(function()
            menu.Visible = not menu.Visible
        end)

        -- Infinity Jump
        UIS.JumpRequest:Connect(function()
            if infJump and player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)

        -- Immortality
        RS.Stepped:Connect(function()
            if immortal and player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.Health = player.Character.Humanoid.MaxHealth
            end
        end)

    else
        codeBox.Text = ""
    end
end)
