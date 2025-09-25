local player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "MiniScriptHub"

-- Logowanie kodem
local codeCorrect = false
local codeBox = Instance.new("TextBox", gui)
codeBox.Size = UDim2.new(0,200,0,50)
codeBox.Position = UDim2.new(0.5,-100,0.4,0)
codeBox.PlaceholderText = "Enter Code"
codeBox.TextScaled = true
codeBox.BackgroundColor3 = Color3.fromRGB(40,40,40)
codeBox.TextColor3 = Color3.fromRGB(255,255,255)
codeBox.Text = ""

local loginButton = Instance.new("TextButton", gui)
loginButton.Size = UDim2.new(0,100,0,50)
loginButton.Position = UDim2.new(0.5,-50,0.5,0)
loginButton.Text = "Login"
loginButton.TextScaled = true
loginButton.BackgroundColor3 = Color3.fromRGB(70,70,70)
loginButton.TextColor3 = Color3.fromRGB(255,255,255)
loginButton.MouseButton1Click:Connect(function()
    if codeBox.Text == "123" then
        codeCorrect = true
        codeBox:Destroy()
        loginButton:Destroy()
        -- Ikona 💣
        local icon = Instance.new("TextButton", gui)
        icon.Text = "💣"
        icon.Size = UDim2.new(0,50,0,50)
        icon.Position = UDim2.new(0,10,0,10)
        icon.TextScaled = true
        icon.BackgroundColor3 = Color3.fromRGB(100,0,0)
        icon.TextColor3 = Color3.fromRGB(255,255,255)
        icon.AutoButtonColor = true
        local menuOpen = false

        local menu = Instance.new("Frame", gui)
        menu.Size = UDim2.new(0,250,0,150)
        menu.Position = UDim2.new(0,10,0,70)
        menu.BackgroundColor3 = Color3.fromRGB(30,30,30)
        menu.Visible = false
        menu.ClipsDescendants = true
        menu.BorderSizePixel = 0
        menu.AnchorPoint = Vector2.new(0,0)
        menu.BackgroundTransparency = 0
        menu.Roundness = 0 -- Roblox nie ma bezpośrednio Roundness w Frame, można użyć UICorner
        local corner = Instance.new("UICorner", menu)
        corner.CornerRadius = UDim.new(0,12)

        -- Infinity Jump Toggle
        local infJump = false
        local infBtn = Instance.new("TextButton", menu)
        infBtn.Size = UDim2.new(0,220,0,50)
        infBtn.Position = UDim2.new(0,15,0,10)
        infBtn.Text = "Infinity Jump: OFF"
        infBtn.TextScaled = true
        infBtn.BackgroundColor3 = Color3.fromRGB(60,60,200)
        infBtn.TextColor3 = Color3.fromRGB(255,255,255)
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
        immBtn.BackgroundColor3 = Color3.fromRGB(200,60,60)
        immBtn.TextColor3 = Color3.fromRGB(255,255,255)
        immBtn.MouseButton1Click:Connect(function()
            immortal = not immortal
            immBtn.Text = "Immortality: "..(immortal and "ON" or "OFF")
        end)

        -- Pokaż/ukryj menu po kliknięciu ikony
        icon.MouseButton1Click:Connect(function()
            menuOpen = not menuOpen
            menu.Visible = menuOpen
        end)

        -- Infinity Jump logika
        UIS.JumpRequest:Connect(function()
            if infJump and player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)

        -- Immortality logika
        game:GetService("RunService").Stepped:Connect(function()
            if immortal and player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.Health = player.Character.Humanoid.MaxHealth
            end
        end)
    else
        codeBox.Text = ""
    end
end)
