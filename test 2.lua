--version 1.1.6 // last updated 07/19/20

--comes with manual aa
--first try // deadline 2 weeks (i'll just update it from now no recode and maybe bugfixes)
--not customizable just hardcoded

--getting locals for ui.set
local bodyyaw, yaw = ui.reference("AA", "Anti-aimbot angles", "Yaw")
local bodyyaw, bodyyaw2 = ui.reference("AA", "Anti-aimbot angles", "Body yaw")
local jyaw, jyawslide = ui.reference("AA", "Anti-aimbot angles", "Yaw jitter")
local yawbase = ui.reference("AA", "Anti-aimbot angles", "Yaw base")
local fyawlimit = ui.reference("AA", "Anti-aimbot angles", "Fake yaw limit")
local pitch = ui.reference("AA", "Anti-aimbot angles", "Pitch")
local freestanding = ui.reference("AA", "Anti-aimbot angles", "Freestanding body yaw")


--the stuff we need to begin with
local enabled = ui.new_checkbox("AA", "Anti-aimbot angles", "Manual AA")


--fixed the multiselect stupid stuff and now its combobox
local back = ui.new_hotkey("AA", "Anti-aimbot angles", "[M] BACK")
local left = ui.new_hotkey("AA", "Anti-aimbot angles", "[M] LEFT")
local right = ui.new_hotkey("AA", "Anti-aimbot angles", "[M] RIGHT")







--lets see what we have active // tropics did this 
local function includes(table, key)
    local state = false
    for i=1, #table do
        if table[i] == key then
            state = true
            break 
        end
    end
    return state
end

--setting the function for tables
local function setTableVisibility(table, state)
    for i=1, #table do
        ui.set_visible(table[i], state)
    end
end

local function handleGUI()
    local enabled = ui.get(enabled)
    setTableVisibility({color}, enabled)
    setTableVisibility({back, left, right}, enabled)
end

--locals for manual aa and indicators
local leftReady = false
local rightReady = false
local mode = "back"
local screen = {client.screen_size()}
local center = {screen[1]/2, screen[2]/2}

local function runCommand()
    if ui.get(enabled) == false then
        return
    end


--manual aa // i didnt do this, pewds3 and kez2474 did
    if ui.get(enabled) == true then
        if ui.get(back) then
            mode = "back"
        elseif ui.get(left) and leftReady then
            if mode == "left" then
                mode = "back"
            else
                mode = "left"
            end
            leftReady = false
        elseif ui.get(right) and rightReady then
            if mode == "right" then
                mode = "back"
            else
                mode = "right"
            end
            rightReady = false
        end
    
        if ui.get(left) == false then
            leftReady = true
         end
    
        if ui.get(right) == false then
            rightReady = true
        end
    
        if mode == "back" then
            ui.set(yaw, 0)
        elseif mode == "left" then
            ui.set(yaw, -90)
        elseif mode == "right" then
            ui.set(yaw, 90)
        end
    end
end

local function paint()
    if ui.get(enabled) == false then
        return
    end
    
    local lp = entity.get_local_player()

    if lp == nil or entity.is_alive(lp) == false then
        return
    end



       

        
    end


        
       
   

client.set_event_callback("paint", paint)
client.set_event_callback("run_command", runCommand) 
client.set_event_callback("paint_ui", handleGUI)  
