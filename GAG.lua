local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("CooperHub | Premium Script", "GrapeTheme")
local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("AUTO FARM")

local SEEDPOS = CFrame.new(86.59000396728516, 2.999999761581421, -27.00395965576172)
local SELLPOS = CFrame.new(86.5854721069336, 2.999999761581421, 0.4267842769622803)
local GEARPOS = CFrame.new(-284.4152526855469, 2.999999761581421, -32.97789764404297)
local CRATEPOS = CFrame.new(-285.00555419921875, 2.999999761581421, -15.64926815032959)
local EGGPOS = CFrame.new(-285.143310546875, 2.999999761581421, -0.8999100923538208)


local buyfruit = false 

-- buy frit zone

local function Fruit()
    local fruits = {
        "Carrot", "Strawberry", "Blueberry", "Tomato", "Watermelon",
        "Cauliflower", "Green Apple", "Avocado", "Banana", "Pineapple",
        "Kiwi", "Bell Pepper", "Prikly Pear", "Loquat", "Feijoa",
        "Sugar Apple"
    }

    for _, fruit in pairs(fruits) do
        local args = {fruit}
        game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("BuySeedStock"):FireServer(unpack(args))
    end
end

-- Loop ทำงานตลอด แต่ควบคุมด้วย buyfruit
task.spawn(function()
    while true do
        if buyfruit then
            Fruit()
        end
        task.wait(0.01)
    end
end)

-- Toggle UI
Section:NewToggle("Auto Buy Fruit", "Toggle For Buy Fruit", function(state)
    if state then
        print("Toggle On")
        buyfruit = true
    else
        print("Toggle Off")
        buyfruit = false
    end
end)

--buy gear zone

local buygear = false 

local function Gear()
    local gears = {
        "Watering Can", "Trowel", "Recall Wrench", "Basic Sprinkler", "Advanced Sprinkler",
        "Godly Sprinkler", "Lightning Rod", "Tanning Mirror", "Friendship Pot", "Master Sprinkler"
    }

    for _, gear in pairs(gears) do
        local args = {gear}
        game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("BuyGearStock"):FireServer(unpack(args))
    end
end

-- Loop ทำงานตลอด แต่ควบคุมด้วย buyfruit
task.spawn(function()
    while true do
        if buygear then
            Gear()
        end
        task.wait(0.01)
    end
end)

-- Toggle UI
Section:NewToggle("Auto Buy Gear", "Toggle For Buy Gear", function(state)
    if state then
        print("Toggle On")
        buygear = true
    else
        print("Toggle Off")
        buygear = false
    end
end)

--buy egg zone

local buyegg = false 

local function Egg()
    local args = {
	        1
    }
    game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("BuyPetEgg"):FireServer(unpack(args))

        local args = {
	        2
    }
    game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("BuyPetEgg"):FireServer(unpack(args))

    local args = {
	        3
    }
    game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("BuyPetEgg"):FireServer(unpack(args))

end

-- Loop ทำงานตลอด แต่ควบคุมด้วย buyfruit
task.spawn(function()
    while true do
        if buyegg then
            Egg()
        end
        task.wait(0.01)
    end
end)

-- Toggle UI
Section:NewToggle("Auto Buy Egg", "Toggle For Buy Egg", function(state)
    if state then
        print("Toggle On")
        buyegg = true
    else
        print("Toggle Off")
        buyegg = false
    end
end)

--Auto Honey Zone
local honeys = false 

local function Honey()
    local args = {
	    "MachineInteract"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("HoneyMachineService_RE"):FireServer(unpack(args))

end


-- Loop ทำงานตลอด แต่ควบคุมด้วย buyfruit
task.spawn(function()
    while true do
        if honey then
            Honey()
        end
        task.wait(0.01)
    end
end)

-- Toggle UI
Section:NewToggle("Auto Machine Honey", "Auto Claim and Input Fruit", function(state)
    if state then
        print("Toggle On")
        honey = true
    else
        print("Toggle Off")
        honey = false
    end
end)

--UI TOGGLE
local Tab = Window:NewTab("Menu")
local Section = Tab:NewSection("Active Menu")

function Fastsell()
    local OGPOS = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = SELLPOS
    wait(0.2)
    game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("Sell_Inventory"):FireServer()
    wait(0.2)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OGPOS

end

Section:NewButton("Sell Fast", "Teleport to sell and go back", function()
    print("Clicked")
    Fastsell()
end)

--Teleport
local Tab = Window:NewTab("Teleport")
local Section = Tab:NewSection("Teleport")

function TP(Pos)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
end

Section:NewButton("Seed Shop", "Teleport to seed shop", function()
    print("Clicked")
    TP(SEEDPOS)
end)

Section:NewButton("Sell Stuff", "Teleport to sell stuff", function()
    print("Clicked")
    TP(SELLPOS)
end)

Section:NewButton("Gear Shop", "Teleport to gear shop", function()
    print("Clicked")
    TP(GEARPOS)
end)

Section:NewButton("Crate Shop", "Teleport to crate shop", function()
    print("Clicked")
    TP(CRATEPOS)
end)

Section:NewButton("Egg Shop", "Teleport to egg shop", function()
    print("Clicked")
    TP(EGGPOS)
end)


--UI TOGGLE
local Tab = Window:NewTab("Miscellaneous")
local Section = Tab:NewSection("Toggle UI Script")

Section:NewKeybind("Toggle UI", "Press X to toggle UI", Enum.KeyCode.X, function()
	Library:ToggleUI()
end)
