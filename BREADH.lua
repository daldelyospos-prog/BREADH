-- Create a ScreenGui and a TextButton for the AutoInv functionality
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create GUI elements
local screenGui = Instance.new("ScreenGui", playerGui)
local autoInvButton = Instance.new("TextButton", screenGui)

-- Button properties
autoInvButton.Size = UDim2.new(0, 200, 0, 50)
autoInvButton.Position = UDim2.new(0.5, -100, 0.5, -25)
autoInvButton.Text = "AutoInv: OFF"
autoInvButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red for OFF

-- Variables
local isAutoInvOn = false
local autoClickConnection

-- Function to simulate clicking slot 2
local function clickSlot2()
    -- Replace with your actual inventory click function
    print("Clicking inventory slot 2...")
    -- Example: game.Inventory:ClickSlot(2) -- Replace with actual click code
end

-- Toggle function for AutoInv
local function toggleAutoInv()
    isAutoInvOn = not isAutoInvOn
    if isAutoInvOn then
        autoInvButton.Text = "AutoInv: ON"
        autoInvButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Green for ON
        autoClickConnection = game:GetService("RunService").Heartbeat:Connect(function()
            clickSlot2()
            wait(1) -- Adjust the wait time for click interval
        end)
    else
        autoInvButton.Text = "AutoInv: OFF"
        autoInvButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red for OFF
        if autoClickConnection then
            autoClickConnection:Disconnect()
            autoClickConnection = nil
        end
    end
end

-- Connect the button click to the toggle function
autoInvButton.MouseButton1Click:Connect(toggleAutoInv)
