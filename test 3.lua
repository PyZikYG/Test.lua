-- our menu elements :D
local exploit_choice = ui.new_combobox("AA", "Anti-aimbot angles", "Exploit choice", {"Default", "Roll aa", "Fake flick"})
local force_roll_angle = ui.new_slider('AA', 'Anti-aimbot angles', 'Roll', -50, 50, 0)
local active_roll = ui.new_hotkey('AA', 'Anti-aimbot angles', 'Roll on key \nhotkey', false)
local fake_flick = ui.new_hotkey("AA", "Anti-aimbot angles", "Fake Flick")
local fake_flick_invert = ui.new_hotkey("AA", "Anti-aimbot angles", "Inverter")

-- all aa refs
local yawbody, yaw = ui.reference("AA", "Anti-aimbot angles", "Yaw")
local bodyyaw, bodyyaw2 = ui.reference("AA", "Anti-aimbot angles", "Body yaw")
local freeyaw = ui.reference("AA", "Anti-aimbot angles", "Freestanding body yaw")
local edge = ui.reference("AA", "Anti-aimbot angles", "Edge yaw")
local jyaw, jyawslide = ui.reference("AA", "Anti-aimbot angles", "Yaw jitter")
local pitch = ui.reference("AA", "Anti-aimbot angles", "Pitch")
local yawbase = ui.reference("AA", "Anti-aimbot angles", "Yaw base")
local freestanding, freestanding2 = ui.reference("AA", "Anti-aimbot angles", "Freestanding")
local fyawlimit = ui.reference("AA", "Anti-aimbot angles", "Fake yaw limit")
local freestand_byaw = ui.reference("AA", "Anti-aimbot angles", "Freestanding body yaw")
local slow_walk, slow_walk2 = ui.reference("AA", "Other", "Slow motion")
local roll = ui.reference('AA', 'Anti-aimbot angles', 'Roll')
local fl_limit = ui.reference("AA","Fake lag","Limit")
local yaw, yaw_val = ui.reference("AA","Anti-aimbot angles","Yaw")
local byaw, byaw_val = ui.reference("AA","Anti-aimbot angles","Body yaw")

-- this is here for debugging or indicators whatever you want idgaf
local state = "NONE"

-- roll aa !!!

client.set_event_callback('setup_command', function(cmd)
   local active_roll = ui.get(active_roll)
   local roll_angle = ui.get(force_roll_angle)

   if active_roll then
      ui.set(roll, 0)
      cmd.roll = roll_angle
   else
      ui.set(roll, roll_angle)
   end
end)





--fakeflick

local curtime = globals.curtime()

fakeFlick = false

client.set_event_callback("setup_command", function(cmd)
    fakeFlick = not fakeFlick
    if ui.get(fake_flick) then
    ui.set(fl_limit, 1)
    else
    ui.set(fl_limit, 14)
    end
    ui.set(byaw_val, (ui.get(fake_flick_invert) and -180 or 180))
    ui.set(byaw, "Static")
    if globals.curtime() > curtime + 0.1 and ui.get(fake_flick) then
        ui.set(yaw_val, (ui.get(fake_flick_invert) == 1 and -100 or 100))
        curtime = globals.curtime()
    else
        ui.set(yaw_val, 0)
    end
end)







--on_run_command
local function run_command()
	if ui.get(exploit_choice) == "Default" then
		ui.set_visible(yawbody, false)
	    ui.set_visible(yaw, false)
	    ui.set_visible(bodyyaw, false)
	    ui.set_visible(bodyyaw2, false)
	    ui.set_visible(edge, true)
	    ui.set_visible(jyaw, false)
	    ui.set_visible(jyawslide, false)
	    ui.set_visible(pitch, false)
	    ui.set_visible(yawbase, false)
	    ui.set_visible(freestanding, true)
	    ui.set_visible(freestanding2, true)
	    ui.set_visible(fyawlimit, false)
	    ui.set_visible(freestand_byaw, false)
        ui.set_visible(force_roll_angle, false)
        ui.set_visible(active_roll, false)
        ui.set_visible(fake_flick, false)
        ui.set_visible(fake_flick_invert, false)


        
    elseif ui.get(exploit_choice) == "Roll aa" then
		ui.set_visible(yawbody, false)
	    ui.set_visible(yaw, false)
	    ui.set_visible(bodyyaw, false)
	    ui.set_visible(bodyyaw2, false)
	    ui.set_visible(edge, true)
	    ui.set_visible(jyaw, false)
	    ui.set_visible(jyawslide, false)
	    ui.set_visible(pitch, false)
	    ui.set_visible(yawbase, false)
	    ui.set_visible(freestanding, true)
	    ui.set_visible(freestanding2, true)
	    ui.set_visible(fyawlimit, false)
	    ui.set_visible(freestand_byaw, false)
        ui.set_visible(force_roll_angle, true)
        ui.set_visible(active_roll, true)
        ui.set_visible(fake_flick, false)
        ui.set_visible(fake_flick_invert, false)


    elseif ui.get(exploit_choice) == "Fake flick" then
		ui.set_visible(yawbody, false)
	    ui.set_visible(yaw, false)
	    ui.set_visible(bodyyaw, false)
	    ui.set_visible(bodyyaw2, false)
	    ui.set_visible(edge, true)
	    ui.set_visible(jyaw, false)
	    ui.set_visible(jyawslide, false)
	    ui.set_visible(pitch, false)
	    ui.set_visible(yawbase, false)
	    ui.set_visible(freestanding, true)
	    ui.set_visible(freestanding2, true)
	    ui.set_visible(fyawlimit, false)
	    ui.set_visible(freestand_byaw, false)
        ui.set_visible(force_roll_angle, false)
        ui.set_visible(active_roll, false)
        ui.set_visible(fake_flick, true)
        ui.set_visible(fake_flick_invert, true)
    	
    end
    

    
    
end



    


--callbacks
client.set_event_callback("run_command", run_command)
