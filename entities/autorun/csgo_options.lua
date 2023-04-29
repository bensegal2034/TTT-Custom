CreateClientConVar( "csgo_vm_hands", 0, { FCVAR_ARCHIVE, FCVAR_REPLICATED } )
CreateClientConVar( "csgo_vm_x", 1, { FCVAR_ARCHIVE, FCVAR_REPLICATED } )
CreateClientConVar( "csgo_vm_y", 1, { FCVAR_ARCHIVE, FCVAR_REPLICATED } )
CreateClientConVar( "csgo_vm_z", -1, { FCVAR_ARCHIVE, FCVAR_REPLICATED } )
CreateClientConVar( "csgo_vm_fov", 75, { FCVAR_ARCHIVE, FCVAR_REPLICATED } )
CreateClientConVar( "csgo_crosshair_red", 0, { FCVAR_ARCHIVE, FCVAR_REPLICATED } )
CreateClientConVar( "csgo_crosshair_green", 255, { FCVAR_ARCHIVE, FCVAR_REPLICATED } )
CreateClientConVar( "csgo_crosshair_blue", 0, { FCVAR_ARCHIVE, FCVAR_REPLICATED } )
CreateClientConVar( "csgo_crosshair_alpha", 255, { FCVAR_ARCHIVE, FCVAR_REPLICATED } )
hook.Add( "PopulateToolMenu", "CSGOVModel", function()
spawnmenu.AddToolMenuOption( "Options", "Counter-Strike: Global Offensive", "csgo_vm", "View Model", "", "", function( panel )
local combobox, label = panel:ComboBox( "Hands", "csgo_vm_hands" )
combobox:AddChoice( "Counter-Terrorist", 0, false )
combobox:AddChoice( "Terrorist", 1, false )
panel:AddControl( "Slider", {
Label = "View Model X",
Command = "csgo_vm_x",
Type = "Float",
Min = "-2",
Max = "2"
} )
panel:AddControl( "Slider", {
Label = "View Model Y",
Command = "csgo_vm_y",
Type = "Float",
Min = "-2",
Max = "2"
} )
panel:AddControl( "Slider", {
Label = "View Model Z",
Command = "csgo_vm_z",
Type = "Float",
Min = "-2",
Max = "2"
} )
panel:AddControl( "Slider", {
Label = "View Model FOV",
Command = "csgo_vm_fov",
Type = "Float",
Min = "54",
Max = "68"
} )
end )
spawnmenu.AddToolMenuOption( "Options", "Counter-Strike: Global Offensive", "csgo_hud", "HUD", "", "", function( panel )
panel:AddControl( "Color", {
Label = "Crosshair Color",
Red = "csgo_crosshair_red",
Green = "csgo_crosshair_green",
Blue = "csgo_crosshair_blue",
Alpha = "csgo_crosshair_alpha"
} )
end )
end )