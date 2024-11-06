dofile(LockOn_Options.common_script_path.."devices_defs.lua")
dofile(LockOn_Options.common_script_path.."ViewportHandling.lua")
indicator_type = indicator_types.COMMON
purposes = {render_purpose.GENERAL,render_purpose.HUD_ONLY_VIEW}  -- HUD will be rendered on hud only view 


page_subsets = {
[1]			= LockOn_Options.script_path.."RWR/indicator/base_page.lua",
}
pages = {
[1]			= {1}
}

try_find_assigned_viewport("OH6A_RWR","RWR")

-- set this page on start 
init_pageID			= 1



