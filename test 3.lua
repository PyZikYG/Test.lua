local curtime = globals.curtime()
local fake_flick = ui.new_hotkey("AA", "Anti-aimbot angles", "Fake Flick")
local fake_flick_invert = ui.new_hotkey("AA", "Anti-aimbot angles", "Inverter")
local yaw, yaw_val = ui.reference("AA","Anti-aimbot angles","Yaw")
local byaw, byaw_val = ui.reference("AA","Anti-aimbot angles","Body yaw")
local fl_limit = ui.reference("AA","Fake lag","Limit")
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
