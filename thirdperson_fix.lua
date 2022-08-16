local ui_get, console_cmd = ui.get, client.exec

local fix = ui.new_checkbox("VISUALS", "EFFECTS", "Thirdperson fix")
local fix_slider = ui.new_slider("VISUALS", "EFFECTS", "Thirdperson Distance", 30, 200, 150)

local function on_round_prestart(e) 
    -- or use if cmd.chokedcommands == 1 then 
    if ui.get(fix) then
		console_cmd("cam_idealdist ", ui_get(fix_slider))
	end
end

local function set_event_on_checkbox(item)
    local value = ui.get(item)
    local set_callback = value and client.set_event_callback or client.unset_event_callback

    set_callback('round_start', on_round_prestart)
end

ui.set_callback(fix, set_event_on_checkbox)
