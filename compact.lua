local number = 0
local x = 0
local MopX = {  }
local themes = {
    blueberry = Color3.fromRGB(35, 32, 127),
    dark = Color3.fromRGB(45,45,45),
    ["light dark"] = Color3.fromRGB(57,57,57),
    crimson = Color3.fromRGB(108, 23, 23),
    tree = Color3.fromRGB(0, 85, 0),
}

    


function MopX.makeFrame(allow_rainbow)
    local self = MopX
    local ScreenGui = Instance.new("ScreenGui")
    self.frame_main = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local UICorner = Instance.new("UICorner")
    local notis = Instance.new("ScrollingFrame")
    local TextLabel = Instance.new("TextLabel")

    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Name = "porn"

    self.frame_main.Name = "cart"
    self.frame_main.Parent = ScreenGui
    self.frame_main.Active = true
    self.frame_main.BackgroundColor3 = Color3.fromRGB(35, 32, 127)
    self.frame_main.BorderColor3 = Color3.fromRGB(213213312122880, 321312337920, 321321)
    self.frame_main.BorderSizePixel = 2
    self.frame_main.Position = UDim2.new(0.445957005, 0, 0.20735006, 0)
    self.frame_main.Size = UDim2.new(0, 218, 0, 474)
    self.frame_main.Draggable = true
    allow_rainbow = allow_rainbow or false
    if allow_rainbow then
        spawn(function()
            function zigzag(X) return math.acos(math.cos(X*math.pi))/math.pi end

            counter = 0
            
            while wait(0.1)do
             self.frame_main.BackgroundColor3 = Color3.fromHSV(zigzag(counter),1,1)
             
             counter = counter + 0.01 end
        end)
    end
    

    UIListLayout.Parent = self.frame_main
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 7)

    UICorner.CornerRadius = UDim.new(0, 15)
    UICorner.Parent = self.frame_main
    return MopX
end

local ui = {  }
function ui:tog(name, bool, callback)
    number = number + 1
    local tog = Instance.new("TextButton")
    local togcorner = Instance.new("UICorner")
    local toglabel = Instance.new("TextLabel")
    tog.Name = number
    tog.Parent = MopX.frame_main
    tog.BackgroundColor3 = Color3.fromRGB(6, 255, 2)
    tog.BackgroundTransparency = 1.000
    tog.BorderColor3 = Color3.fromRGB(6, 255, 2)
    tog.Size = UDim2.new(0, 140, 0, 50)
    tog.Font = Enum.Font.SourceSans
    tog.TextColor3 = Color3.fromRGB(255, 255, 255)
    tog.TextSize = 30.000
    tog.TextXAlignment = Enum.TextXAlignment.Left
    tog.Text = name

    togcorner.CornerRadius = UDim.new(0, 6)
    togcorner.Name = "togcorner"
    togcorner.Parent = tog

    toglabel.Name = "toglabel"
    toglabel.Parent = tog
    toglabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    toglabel.BackgroundTransparency = 1.000
    toglabel.Position = UDim2.new(1.13571429, 0, 0, 0)
    toglabel.Size = UDim2.new(0, 58, 0, 41)
    toglabel.Font = Enum.Font.SourceSans
    toglabel.Text = 'OFF'
    toglabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    toglabel.TextSize = 35.000
    toglabel.RichText = true

    --run script on jump
    local toggled = bool
    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(k)
        if k == "\32" then
            if tog.TextColor3 == Color3.new(0,255,0) then 
                toggled = not toggled
                pcall(function() 
                if toggled == true then 
                toglabel.Text='ON';toglabel.TextColor3=Color3.fromRGB(0, 255, 0) elseif toggled == false then toglabel.Text='OFF';toglabel.TextColor3=Color3.fromRGB(255, 0, 0) end 
                callback(toggled) 
                end) 
            end
        end
    end)

end

function ui:btn(name, callback)   
    number = number + 1
    local btn = Instance.new("TextButton")
    local btncorner = Instance.new("UICorner")

    btn.Name = number
    btn.Parent = MopX.frame_main
    btn.BackgroundColor3 = Color3.fromRGB(6, 255, 2)
    btn.BackgroundTransparency = 1.000
    btn.BorderColor3 = Color3.fromRGB(6, 255, 2)
    btn.Size = UDim2.new(0, 140, 0, 50)
    btn.Font = Enum.Font.SourceSans
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 30.000
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Text = name

    btncorner.CornerRadius = UDim.new(0, 6)
    btncorner.Name = "btncorner"
    btncorner.Parent = btn
    
    --run script on jump
    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(k)
        if k == "\32" then
            if btn.TextColor3 == Color3.new(0,255,0) then pcall(callback) end
        end
    end)

end

function ui:label(text, pos)
    
    local Label = Instance.new("TextLabel")
    Label.Name = "Label"
    Label.Parent = MopX.frame_main
    Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Label.BackgroundTransparency = 1.000
    Label.Size = UDim2.new(0, 200, 0, 50)
    Label.Font = Enum.Font.SourceSans
    Label.Text = text
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextScaled = true
    Label.TextSize = 20.000
    Label.TextWrapped = true
    
    if pos == "Center" then Label.TextXAlignment = Enum.TextXAlignment.Center end
    if pos == "Left" then Label.TextXAlignment = Enum.TextXAlignment.Left end
    if pos == "Right" then Label.TextXAlignment = Enum.TextXAlignment.Right end

end

function MopX:Config(themeToSet)
    MopX.theme = themeToSet.theme
    self.frame_main.BackgroundColor3 = themes[themeToSet.theme]
    return MopX
end

--lets start this fucking bs keyarrow selecting shit kms..
local src = {  }
function src:Init()
    game.CoreGui.porn.cart["1"].TextColor3 = Color3.new(0,255,0)
    local backupnumber = number
    number = number - 1
    warn(backupnumber)
    local gui = game.CoreGui.porn.cart

    local selection_before_changed = 1
    local curr_selection = 1

    function c_down() curr_selection = curr_selection -1 end
    function b_down() selection_before_changed = selection_before_changed -1 end
   
    function c_up() curr_selection = curr_selection +1 end
    function b_up() selection_before_changed = selection_before_changed +1 end
   
    function setAll(num) selection_before_changed = num curr_selection = num end

    function next(v) gui[v].TextColor3 = Color3.new(0,255,0) end
    function next_before(v) gui[v].TextColor3 = Color3.new(255,255,255) end
  
    function clear_up_downDOWN() gui[backupnumber].TextColor3 = Color3.new(0,255,0) gui[selection_before_changed].TextColor3 = Color3.new(255,255,255) end
    function clear_up_downUP() gui['1'].TextColor3 = Color3.new(0,255,0) gui[selection_before_changed].TextColor3 = Color3.new(255,255,255) end
   
    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(k)
        if k == "\17" then -- up
            if curr_selection < 2 then warn('curr below') clear_up_downDOWN() setAll(backupnumber) return end
            if selection_before_changed < 2 then warn('before below') clear_up_downDOWN() setAll(backupnumber) return end
            next_before(selection_before_changed)
            b_down()

            c_down()
            next(curr_selection)

        end
    end)
    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(k)
        if k == "\18" then -- down
            if curr_selection > number then warn('curr above') clear_up_downUP() setAll(1)  return end
            if selection_before_changed > number then warn('before above') clear_up_downUP() setAll(1) return end
            next_before(selection_before_changed)
            b_up()

            c_up()
            next(curr_selection)
            
        end
    end)

end
return MopX,ui,src
