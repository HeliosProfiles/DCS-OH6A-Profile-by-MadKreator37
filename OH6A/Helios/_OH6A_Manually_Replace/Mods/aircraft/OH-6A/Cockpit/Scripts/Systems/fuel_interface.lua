dofile(LockOn_Options.script_path.."command_defs.lua")

local fuel_valve_open = false


local dev = GetSelf()
local sensor_data = get_base_data()
local update_time_step = 0.1  
make_default_activity(update_time_step)

local LOW_FUEL = get_param_handle("LOW_FUEL")
local dc_elec = get_param_handle("DC_POWER_AVAIL")

local WARNING_FUEL_LOW  = get_param_handle("Warning_Fuel_Low")

local dc_ok = false

dev:listen_command(EFM_commands.fuelsystem_fuel_valve)
dev:listen_command(Keys.fuel_valve_on)
dev:listen_command(Keys.fuel_valve_off)
dev:listen_command(Keys.fuel_valve_toggle)


function post_initialize()
	local birth = LockOn_Options.init_conditions.birth_place
	if birth=="GROUND_HOT" or birth=="AIR_HOT" then 			  
		dev:performClickableAction(EFM_commands.fuelsystem_fuel_valve,0.0,true)
        dispatch_action(nil, EFM_commands.fuelsystem_fuel_valve,0.0)
        fuel_valve_open = true
    elseif birth=="GROUND_COLD" then
		dev:performClickableAction(EFM_commands.fuelsystem_fuel_valve,1.0,true)
        dispatch_action(nil, EFM_commands.fuelsystem_fuel_valve,1.0)
		fuel_valve_open = false
    end
end

function SetCommand(command,value)
    if command == EFM_commands.fuelsystem_fuel_valve then 
        if value < 0.5 then 
            dispatch_action(nil, EFM_commands.fuelsystem_fuel_valve,0.0)
            fuel_valve_open =true
        else
            dispatch_action(nil, EFM_commands.fuelsystem_fuel_valve,1.0)
            fuel_valve_open =false
        end
    end
    if command == Keys.fuel_valve_on then 
		dev:performClickableAction(EFM_commands.fuelsystem_fuel_valve,0.0,true)
        dispatch_action(nil, EFM_commands.fuelsystem_fuel_valve,0.0)
	end
	if command == Keys.fuel_valve_off then 
		dev:performClickableAction(EFM_commands.fuelsystem_fuel_valve,1.0,true)
        dispatch_action(nil, EFM_commands.fuelsystem_fuel_valve,1.0)
	end
	if command == Keys.fuel_valve_toggle then
		if fuel_valve_open then 
			dev:performClickableAction(EFM_commands.fuelsystem_fuel_valve,1.0,true)
            dispatch_action(nil, EFM_commands.fuelsystem_fuel_valve,1.0)
		else
			dev:performClickableAction(EFM_commands.fuelsystem_fuel_valve,0.0,true)
            dispatch_action(nil, EFM_commands.fuelsystem_fuel_valve,0.0)
		end
	end
	
end

function update()
    dc_ok = dc_elec:get() > 0.5
    if LOW_FUEL:get() >0.5 and dc_ok then 
        WARNING_FUEL_LOW:set(1.0)
    else
        WARNING_FUEL_LOW:set(0.0)
    end   
end

need_to_be_closed = false 