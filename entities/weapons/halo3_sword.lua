/*---------------------------------
H A L O 3 E N E R G Y S W O R D
---------------------------------*/
if SERVER then
	AddCSLuaFile( "halo3_sword.lua" )
	AddCSLuaFile( "entities/melee_attack_h3_sword.lua" )
	AddCSLuaFile( "autorun/h3sweps_autorun.lua" )
	AddCSLuaFile( "effects/flash_sworddraw_halo3/init.lua" )
	AddCSLuaFile( "effects/flash_swordfx_halo3/init.lua" )
	resource.AddFile("materials/effects/halo3/electric_arcs.vmt")
	resource.AddFile("materials/effects/halo3/electric_bolts.vmt")
	resource.AddFile("materials/effects/halo3/energyswordscorch.vmt")
	resource.AddFile("materials/effects/halo3/flare_generic.vmt")
	resource.AddFile("materials/effects/halo3/flare_generic2.vmt")
	resource.AddFile("materials/effects/halo3/flare_generic2a.vmt")
	resource.AddFile("materials/effects/halo3/flare_generic2b.vmt")
	resource.AddFile("materials/effects/halo3/flare_generic2c.vmt")
	resource.AddFile("materials/effects/halo3/flare_pr_overcharge.vmt")
	resource.AddFile("materials/effects/halo3/flare_soft.vmt")
	resource.AddFile("materials/effects/halo3/flare1.vmt")
	resource.AddFile("materials/effects/halo3/flash_large.vmt")
	resource.AddFile("materials/effects/halo3/flash_soft.vmt")
	resource.AddFile("materials/models/chief_armsh3/plasma_smokeh3.vmt")
	resource.AddFile("materials/models/chief_armsh3/spartan_arm.vmt")
	resource.AddFile("materials/models/chief_armsh3/spartan_arm_normal.vtf")
	resource.AddFile("materials/models/energyswordh3/energy_blade_handle_bump.vtf")
	resource.AddFile("materials/models/energyswordh3/energy_blade_handle_illum.vtf")
	resource.AddFile("materials/models/energyswordh3/energy_sword_blade_mask.vmt")
	resource.AddFile("materials/models/energyswordh3/energy_sword_blade_mask_3rd.vmt")
	resource.AddFile("materials/models/energyswordh3/energy_sword_blade_mask_off.vmt")
	resource.AddFile("materials/models/energyswordh3/energy_sword_handle.vmt")
	resource.AddFile("materials/models/flamethrowerh3/flames_render.vmt")
	resource.AddFile("materials/models/flamethrowerh3/flamethrower.vmt")
	resource.AddFile("materials/models/flamethrowerh3/flamethrower_bump.vtf")
	resource.AddFile("materials/models/flamethrowerh3/flamethrower_illum.vtf")
	resource.AddFile("materials/vgui/entities/halo3_sword.vmt")
	resource.AddFile("materials/vgui/halohud/h3/h3sword.vmt")
	resource.AddFile("materials/vgui/hud/halo3_sword.vmt")
	resource.AddFile("materials/vgui/ttt/icon_esword.vmt")
	resource.AddFile("models/halo3/meleehitbox.mdl")
	resource.AddFile("models/halo3/v_energysword.mdl")
	resource.AddFile("models/halo3/w_energysword.mdl")
	resource.AddFile("sound/halo3/sword_deploy.ogg")
	resource.AddFile("sound/halo3/sword_deploy2.ogg")
	resource.AddFile("sound/halo3/sword_draw.ogg")
	resource.AddFile("sound/halo3/sword_hit_1.ogg")
	resource.AddFile("sound/halo3/sword_hit_2.ogg")
	resource.AddFile("sound/halo3/sword_loop.ogg")
	resource.AddFile("sound/halo3/sword_melee.ogg")
	resource.AddFile("sound/halo3/sword_melee_empty_1.ogg")
	resource.AddFile("sound/halo3/sword_melee_empty_2.ogg")
	resource.AddFile("sound/halo3/sword_swing_1.ogg")
	resource.AddFile("sound/halo3/sword_swing_2.ogg")
	resource.AddWorkshop("1981371407")
end

SWEP.PrintName = "Energy Sword"
    
SWEP.Author = "[BoZ]Niko663"
SWEP.Contact = "MasterChief@halo.com"
SWEP.Purpose = "Halo 3 Energy Sword ported to Garry's Mod."
SWEP.Instructions = "Primary to swing, Hold use and press Primary to throw grenades, Secondary to melee."

SWEP.Category = "Halo 3 Tags"

SWEP.Spawnable= true
SWEP.AdminSpawnable= true
SWEP.AdminOnly = false
SWEP.Primary.Damage = 200
SWEP.ViewModelFOV = 64
SWEP.ViewModel = "models/halo3/v_energysword.mdl" 
SWEP.WorldModel = "models/halo3/w_energysword.mdl"
SWEP.ViewModelFlip = false

SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false

SWEP.SlotPos = 0
SWEP.LungeDistance = 200000
SWEP.UseHands = false

SWEP.HoldType = "knife" 

SWEP.FiresUnderwater = false
SWEP.Icon = "VGUI/ttt/icon_esword"
SWEP.DrawCrosshair = false
SWEP.CanBuy = { ROLE_DETECTIVE }
SWEP.DrawAmmo = true
SWEP.Kind = WEAPON_EQUIP1
SWEP.Base = "weapon_base"
SWEP.EquipMenuData = {
	type = "Weapon",
	desc = "ENERGY SWORD SUNDAY"
 };
SWEP.SwordIdleSound = Sound("halo3/sword_loop.wav")
SWEP.Slot = 6
SWEP.Primary.ClipSize = 100
SWEP.Primary.DefaultClip = 100
SWEP.Primary.Ammo = ""
SWEP.Primary.Automatic = false
SWEP.GrenadeEnabled = false
SWEP.Secondary.ClipSize = 0
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "Niko663HaloSWEPS.Grenades"
SWEP.InLoadoutFor = nil
SWEP.IsEquipment = true


if (CLIENT) then
	SWEP.WepSelectIcon = surface.GetTextureID( "vgui/entities/halo3_sword" )
	killicon.Add( "halo3_sword", "VGUI/hud/halo3_sword", color_white )
end

sound.Add(
{
    name = "Halo3_ES.Deploy",
    channel = CHAN_STATIC,
    volume = 0.5,
    soundlevel = 1,
    sound = "halo3/sword_deploy.ogg"
})

sound.Add(
{
    name = "Halo3_ES.DeployAlt",
    channel = CHAN_STATIC,
    volume = 0.5,
    soundlevel = 1,
    sound = "halo3/sword_deploy2.ogg"
})

sound.Add(
{
    name = "Halo3_ES.Draw",
    channel = CHAN_STATIC,
    volume = 0.5,
    soundlevel = 80,
    sound = "halo3/sword_draw.ogg"
})

sound.Add(
{
    name = "Halo3_ES.Melee",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo3/sword_melee.ogg"
})

sound.Add({
	name =				"Halo3_ES.Melee_Empty",
	channel =			CHAN_STATIC,
	volume =			1.0,
	soundlevel =			80,
	sound =				{"halo3/sword_melee_empty_1.ogg", "halo3/sword_melee_empty_2.ogg"}
})

sound.Add({
	name =				"Halo3_ES.Swing",
	channel =			CHAN_STATIC,
	volume =			0.5,
	soundlevel =			80,
	sound =				{"halo3/sword_swing_1.ogg", "halo3/sword_swing_2.ogg"}
})

sound.Add({
	name =				"Halo3_ES.Impact",
	channel =			CHAN_STATIC,
	volume =			1.0,
	soundlevel =			80,
	sound =				{"halo3/sword_hit_1.ogg", "halo3/sword_hit_2.ogg"}
})


function SWEP:SetupDataTables()
self:NetworkVar( "Float", 0, "NextIdle" )
self:NetworkVar( "Float", 0, "NextSwordEffect" )
end

function SWEP:Initialize()
	self:SetNW2Int( "DrawSound", 1 )
	self.EnergyPos = 1
	self.Dropped = false
	self.SwordFX = CurTime() + 0.1
	self:SetNextIdle(0)
	self:SetNextSwordEffect(0)
        self:SetHoldType( self.HoldType )
	self:SetNW2Bool( "FreshSword", true )
	self:SetNW2Int( "NPCClipH3", -1 )
	self.FirstDraw = true
end 

function SWEP:EntityIsVehicle(ent)
local VehicleEnts = {
npc_cscanner = true,
npc_combinedropship = true,
npc_combinegunship = true,
npc_dog = true,
npc_helicopter = true,
npc_manhack = true,
npc_clawscanner = true,
npc_rollermine = true,
npc_strider = true,
npc_turret_floor = true
}
if IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "haloveh_base") or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "halohover_base") or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "halohover2_base") or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "lunasflightschool_basescript") or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "wac_hc_base") or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "wac_pl_base") or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "sent_sakarias_scar_base") or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "sent_sakarias_carwheel") or IsValid(ent) and ent:GetClass() == "sent_sakarias_carwheel" or IsValid(ent) and ent:GetClass() == "gmod_sent_vehicle_fphysics_base" or IsValid(ent) and ent:GetClass() == "gmod_sent_vehicle_fphysics_wheel" or IsValid(ent) and ent:IsVehicle() or IsValid(ent) and ent:IsNPC() and VehicleEnts[ent:GetClass()] then
return true
else
return false
end

end

function SWEP:IsEntVisible(ent)

	local LookTrace = {}
	LookTrace.start = self.Owner:GetShootPos()
	LookTrace.endpos = LookTrace.start + (self.Owner:GetAimVector() * 119)
	LookTrace.filter = function( ent ) if ( ent == self or ent == self.Owner or ent:GetClass() == "melee_attack_h3_sword" or ent:GetClass() == "melee_attack_h3" or ent:GetClass() == "flamethrower_fire_h3" or ent:GetClass() == "flamethrower_fire_h1" ) then return false elseif ( ent:IsNPC() or ent:IsPlayer() or ent:IsNextBot() or self:EntityIsVehicle(ent) or self.Owner:GetEyeTrace().SurfaceFlags != SURF_TRANS and self.Owner:GetEyeTrace().MatType != MAT_GLASS and self.Owner:GetEyeTrace().Contents != 268435458 ) then return true end end
	LookTrace.mask = MASK_SHOT
	self.Owner:LagCompensation(true)
	local looktr = util.TraceLine(LookTrace)
	self.Owner:LagCompensation(false)
if IsValid(ent) and ent:IsPlayer() and looktr.Entity == ent then self:SetNW2Bool( "HaloSWEPSEntIsVisible", true )  timer.Create( "WallTimeOut" .. self:EntIndex(), 0.05, 1, function() if IsValid(self) then self:SetNW2Bool( "HaloSWEPSEntIsVisible", false ) end end ) return true end
if IsValid(ent) and ent:IsNPC() and looktr.Entity == ent then self:SetNW2Bool( "HaloSWEPSEntIsVisible", true )  timer.Create( "WallTimeOut" .. self:EntIndex(), 0.05, 1, function() if IsValid(self) then self:SetNW2Bool( "HaloSWEPSEntIsVisible", false ) end end ) return true end
if IsValid(ent) and ent:IsNextBot() and looktr.Entity == ent then self:SetNW2Bool( "HaloSWEPSEntIsVisible", true )  timer.Create( "WallTimeOut" .. self:EntIndex(), 0.05, 1, function() if IsValid(self) then self:SetNW2Bool( "HaloSWEPSEntIsVisible", false ) end end ) return true end
if IsValid(ent) and self:EntityIsVehicle(ent) and looktr.Entity == ent then self:SetNW2Bool( "HaloSWEPSEntIsVisible", true )  timer.Create( "WallTimeOut" .. self:EntIndex(), 0.05, 1, function() if IsValid(self) then self:SetNW2Bool( "HaloSWEPSEntIsVisible", false ) end end ) return true end
	local WallTrace = {}
	WallTrace.start = self.Owner:GetShootPos()
	WallTrace.endpos = WallTrace.start + (self.Owner:GetAimVector() * 119)
	WallTrace.filter = function( ent ) if ( ent == self or ent == self.Owner or ent:GetClass() == "melee_attack_h3_sword" or ent:GetClass() == "melee_attack_h3" or ent:GetClass() == "flamethrower_fire_h3" or ent:GetClass() == "flamethrower_fire_h1" ) then return false elseif ( ent:IsNPC() or ent:IsPlayer() or ent:IsNextBot() or self:EntityIsVehicle(ent) or IsValid(ent) or self.Owner:GetEyeTrace().SurfaceFlags != SURF_TRANS and self.Owner:GetEyeTrace().MatType != MAT_GLASS and self.Owner:GetEyeTrace().Contents != 268435458 ) then return true end end
	WallTrace.mask = MASK_VISIBLE_AND_NPCS
	self.Owner:LagCompensation(true)
	local walltr = util.TraceLine(WallTrace)
	self.Owner:LagCompensation(false)

	if IsValid(ent) and ent:IsPlayer() and looktr.SurfaceFlags == SURF_TRANS and !walltr.HitWorld and walltr.Entity == ent or IsValid(ent) and ent:IsPlayer() and looktr.MatType == MAT_GLASS and !walltr.HitWorld and walltr.Entity == ent or IsValid(ent) and ent:IsPlayer() and looktr.Contents == 268435458 and !walltr.HitWorld and walltr.Entity == ent then
	self:SetNW2Bool( "HaloSWEPSEntIsVisible", true )
	timer.Create( "WallTimeOut" .. self:EntIndex(), 0.05, 1, function() if IsValid(self) then self:SetNW2Bool( "HaloSWEPSEntIsVisible", false ) end end )
	end
	if IsValid(ent) and ent:IsNPC() and looktr.SurfaceFlags == SURF_TRANS and !walltr.HitWorld and walltr.Entity == ent or IsValid(ent) and ent:IsNPC() and looktr.MatType == MAT_GLASS and !walltr.HitWorld and walltr.Entity == ent or IsValid(ent) and ent:IsNPC() and looktr.Contents == 268435458 and !walltr.HitWorld and walltr.Entity == ent then
	self:SetNW2Bool( "HaloSWEPSEntIsVisible", true )
	timer.Create( "WallTimeOut" .. self:EntIndex(), 0.05, 1, function() if IsValid(self) then self:SetNW2Bool( "HaloSWEPSEntIsVisible", false ) end end )
	end
	if IsValid(ent) and ent:IsNextBot() and looktr.SurfaceFlags == SURF_TRANS and !walltr.HitWorld and walltr.Entity == ent or IsValid(ent) and ent:IsNextBot() and looktr.MatType == MAT_GLASS and !walltr.HitWorld and walltr.Entity == ent or IsValid(ent) and ent:IsNextBot() and looktr.Contents == 268435458 and !walltr.HitWorld and walltr.Entity == ent then
	self:SetNW2Bool( "HaloSWEPSEntIsVisible", true )
	timer.Create( "WallTimeOut" .. self:EntIndex(), 0.05, 1, function() if IsValid(self) then self:SetNW2Bool( "HaloSWEPSEntIsVisible", false ) end end )
	end
	if IsValid(ent) and ent:IsVehicle() and !scripted_ents.IsBasedOn(ent:GetClass(), "sent_sakarias_scar_base") and ent:GetClass() != "gmod_sent_vehicle_fphysics_base" and walltr.HitWorld then return end
	for id, v in ipairs( ents.FindAlongRay(self.Owner:EyePos(),self.Owner:EyePos() + (self.Owner:EyeAngles()+Angle(0,0,0) ):Forward()*(self.Owner:EyePos() - walltr.HitPos):Length() * 0.92,Vector(0,0,0), Vector(0,0,0) ) ) do
	if self:EntityIsVehicle(v) and v == ent then
	self:SetNW2Bool( "HaloSWEPSEntIsVisible", true ) 
	timer.Create( "WallTimeOut" .. self:EntIndex(), 0.05, 1, function() if IsValid(self) then self:SetNW2Bool( "HaloSWEPSEntIsVisible", false ) end end ) 
	end
	end
	for id, v in ipairs( ents.FindInSphere(walltr.HitPos,1) ) do
	if self:EntityIsVehicle(v) and v == ent or self:EntityIsVehicle(v) and IsEntity(ent.SCarOwner) and IsValid(ent.ScarOwner) and v == ent.SCarOwner then
	self:SetNW2Bool( "HaloSWEPSEntIsVisible", true ) 
	timer.Create( "WallTimeOut" .. self:EntIndex(), 0.05, 1, function() if IsValid(self) then self:SetNW2Bool( "HaloSWEPSEntIsVisible", false ) end end ) 
	return true
	end
	end
end

function SWEP:IsVehicleOccupied(ent)

local VehicleEnts = {
npc_cscanner = true,
npc_combinedropship = true,
npc_combinegunship = true,
npc_dog = true,
npc_helicopter = true,
npc_manhack = true,
npc_clawscanner = true,
npc_rollermine = true,
npc_strider = true,
npc_turret_floor = true
}
if IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "haloveh_base") or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "halohover_base") or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "halohover2_base") then
if IsEntity(ent.Pilot) and IsValid(ent.Pilot) or IsEntity(ent.Passenger) and IsValid(ent.Passenger) or IsEntity(ent.LeftGunner) and IsValid(ent.LeftGunner) or IsEntity(ent.RightGunner) and IsValid(ent.RightGunner) then
self:SetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle", true )
timer.Create( "VehicleTimeOut" .. self:EntIndex(), 0.05, 1, function() if IsValid(self) then self:SetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle", false ) end end )
return true
end
if istable(ent.Seats) then
for k,p in pairs(ent.Seats) do
if IsValid(p:GetDriver()) and p:GetDriver():IsPlayer() then
self:SetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle", true )
timer.Create( "VehicleTimeOut" .. self:EntIndex(), 0.05, 1, function() if IsValid(self) then self:SetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle", false ) end end )
return true
end
end
end
end
if IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "lunasflightschool_basescript") and ent.GetAI and ent:GetAI() then
self:SetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle", true )
timer.Create( "VehicleTimeOut" .. self:EntIndex(), 0.05, 1, function() if IsValid(self) then self:SetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle", false ) end end )
return true
end
if IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "lunasflightschool_basescript") and ent.GetAI and !ent:GetAI() then
if IsValid(ent:GetDriver()) and ent:GetDriver():IsPlayer() then
self:SetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle", true )
timer.Create( "VehicleTimeOut" .. self:EntIndex(), 0.05, 1, function() if IsValid(self) then self:SetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle", false ) end end )
return true
end
for _, v in pairs( ent:GetPassengerSeats() ) do
if IsValid(v) and IsValid(v:GetDriver()) and v:GetDriver():IsPlayer() then
self:SetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle", true )
timer.Create( "VehicleTimeOut" .. self:EntIndex(), 0.05, 1, function() if IsValid(self) then self:SetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle", false ) end end )
return true
end
end
end
if IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "wac_hc_base") and istable(ent.passengers) or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "wac_pl_base") and istable(ent.passengers) then
for k,p in pairs(ent.passengers) do
if IsValid(p) and p:IsPlayer() then
self:SetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle", true )
timer.Create( "VehicleTimeOut" .. self:EntIndex(), 0.05, 1, function() if IsValid(self) then self:SetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle", false ) end end )
return true
end
end
end
if IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "sent_sakarias_carwheel") or IsValid(ent) and ent:GetClass() == "sent_sakarias_carwheel" then
if IsEntity(ent.SCarOwner) and IsValid(ent.SCarOwner) and IsEntity(ent.SCarOwner.AIController) and IsValid(ent.SCarOwner.AIController) then
self:SetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle", true )
timer.Create( "VehicleTimeOut" .. self:EntIndex(), 0.05, 1, function() if IsValid(self) then self:SetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle", false ) end end )
return true
end
if IsEntity(ent.SCarOwner) and IsValid(ent.SCarOwner) and !IsEntity(ent.AIController) and istable(ent.SCarOwner.Seats) then
for k,p in pairs(ent.SCarOwner.Seats) do
if IsValid(p:GetDriver()) and p:GetDriver():IsPlayer() then
self:SetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle", true )
timer.Create( "VehicleTimeOut" .. self:EntIndex(), 0.05, 1, function() if IsValid(self) then self:SetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle", false ) end end )
return true
end
end
end
end
if IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "sent_sakarias_scar_base") and istable(ent.Seats) and !IsEntity(ent.AIController) then
for k,p in pairs(ent.Seats) do
if IsValid(p:GetDriver()) and p:GetDriver():IsPlayer() then
self:SetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle", true )
timer.Create( "VehicleTimeOut" .. self:EntIndex(), 0.05, 1, function() if IsValid(self) then self:SetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle", false ) end end )
return true
end
end
end
if IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "sent_sakarias_scar_base") and IsEntity(ent.AIController) and IsValid(ent.AIController) then
self:SetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle", true )
timer.Create( "VehicleTimeOut" .. self:EntIndex(), 0.05, 1, function() if IsValid(self) then self:SetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle", false ) end end )
return true
end
if IsValid(ent) and ent:GetClass() == "gmod_sent_vehicle_fphysics_base" then
if IsValid(ent:GetDriver()) and ent:GetDriver():IsPlayer() then 
self:SetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle", true )
timer.Create( "VehicleTimeOut" .. self:EntIndex(), 0.05, 1, function() if IsValid(self) then self:SetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle", false ) end end )
return true
end
if istable(ent.pSeat) then
for k,p in pairs(ent.pSeat) do
if IsValid(p:GetDriver()) and p:GetDriver():IsPlayer() then
self:SetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle", true )
timer.Create( "VehicleTimeOut" .. self:EntIndex(), 0.05, 1, function() if IsValid(self) then self:SetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle", false ) end end )
return true
end
end
end
end
if IsValid(ent) and ent:GetClass() == "gmod_sent_vehicle_fphysics_wheel" and IsValid(ent:GetBaseEnt()) then
if IsValid(ent:GetBaseEnt():GetDriver()) then 
self:SetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle", true )
timer.Create( "VehicleTimeOut" .. self:EntIndex(), 0.05, 1, function() if IsValid(self) then self:SetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle", false ) end end )
return true
end
if istable(ent:GetBaseEnt().pSeat) then
for k,p in pairs(ent:GetBaseEnt().pSeat) do
if IsValid(p:GetDriver()) and p:GetDriver():IsPlayer() then
self:SetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle", true )
timer.Create( "VehicleTimeOut" .. self:EntIndex(), 0.05, 1, function() if IsValid(self) then self:SetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle", false ) end end )
return true
end
end
end
end
if IsValid(ent) and ent:IsVehicle() and !scripted_ents.IsBasedOn(ent:GetClass(), "sent_sakarias_scar_base") and IsValid(ent:GetDriver()) then
self:SetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle", true )
timer.Create( "VehicleTimeOut" .. self:EntIndex(), 0.05, 1, function() if IsValid(self) then self:SetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle", false ) end end )
return true
end
if IsValid(ent) and ent:IsNPC() and VehicleEnts[ent:GetClass()] then
return true
end
if IsValid(ent) and IsEntity(ent.MadVehicle) and IsValid(ent.MadVehicle) and ent.MadVehicle:GetClass() == "npc_madvehicle" or IsValid(ent) and ent:GetClass() == "gmod_sent_vehicle_fphysics_wheel" and IsValid(ent:GetBaseEnt()) and IsEntity(ent:GetBaseEnt().MadVehicle) and IsValid(ent:GetBaseEnt().MadVehicle) and ent:GetBaseEnt().MadVehicle:GetClass() == "npc_madvehicle" or IsValid(ent) and IsEntity(ent.SCarOwner) and IsValid(ent.SCarOwner) and IsEntity(ent.SCarOwner.MadVehicle) and IsValid(ent.SCarOwner.MadVehicle) and ent.SCarOwner.MadVehicle:GetClass() == "npc_madvehicle" then
self:SetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle", true )
timer.Create( "VehicleTimeOut" .. self:EntIndex(), 0.05, 1, function() if IsValid(self) then self:SetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle", false ) end end )
return true
end

end

function SWEP:HasHostilesInVehicle(ent)
if IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "haloveh_base") then
if IsEntity(ent.Pilot) and IsValid(ent.Pilot) and ent.Pilot:IsPlayer() and ent.Pilot:Team() != self.Owner:Team() and ent.Pilot:Team() != TEAM_UNASSIGNED or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "haloveh_base") and IsEntity(ent.Pilot) and IsValid(ent.Pilot) and ent.Pilot:IsPlayer() and ent.Pilot:Team() == TEAM_UNASSIGNED or IsEntity(ent.LeftGunner) and IsValid(ent.LeftGunner) and ent.LeftGunner:IsPlayer() and ent.LeftGunner:Team() != self.Owner:Team() and ent.LeftGunner:Team() != TEAM_UNASSIGNED or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "haloveh_base") and IsEntity(ent.LeftGunner) and IsValid(ent.LeftGunner) and ent.LeftGunner:IsPlayer() and ent.LeftGunner:Team() == TEAM_UNASSIGNED or IsEntity(ent.RightGunner) and IsValid(ent.RightGunner) and ent.RightGunner:IsPlayer() and ent.RightGunner:Team() != self.Owner:Team() and ent.RightGunner:Team() != TEAM_UNASSIGNED or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "haloveh_base") and IsEntity(ent.RightGunner) and IsValid(ent.RightGunner) and ent.RightGunner:IsPlayer() and ent.RightGunner:Team() == TEAM_UNASSIGNED then
return true
end
if istable(ent.Seats) then
for k,p in pairs(ent.Seats) do
if IsValid(p:GetDriver()) and p:GetDriver():IsPlayer() and p:GetDriver():Team() != self.Owner:Team() and p:GetDriver():Team() != TEAM_UNASSIGNED or IsValid(p:GetDriver()) and p:GetDriver():IsPlayer() and p:GetDriver():Team() == TEAM_UNASSIGNED then
return true
end
end
end
end
if IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "halohover_base") or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "halohover2_base") then
if IsEntity(ent.Pilot) and IsValid(ent.Pilot) and ent.Pilot:IsPlayer() and ent.Pilot:Team() != self.Owner:Team() and ent.Pilot:Team() != TEAM_UNASSIGNED or IsEntity(ent.Pilot) and IsValid(ent.Pilot) and ent.Pilot:IsPlayer() and ent.Pilot:Team() == TEAM_UNASSIGNED or IsEntity(ent.Passenger) and IsValid(ent.Passenger) and ent.Passenger:IsPlayer() and ent.Passenger:Team() != self.Owner:Team() and ent.Passenger:Team() != TEAM_UNASSIGNED or IsEntity(ent.Passenger) and IsValid(ent.Passenger) and ent.Passenger:IsPlayer() and ent.Passenger:Team() == TEAM_UNASSIGNED then
return true
end
if istable(ent.Seats) then
for k,p in pairs(ent.Seats) do
if IsValid(p:GetDriver()) and p:GetDriver():IsPlayer() and p:GetDriver():Team() != self.Owner:Team() and p:GetDriver():Team() != TEAM_UNASSIGNED or IsValid(p:GetDriver()) and p:GetDriver():IsPlayer() and p:GetDriver():Team() == TEAM_UNASSIGNED then
return true
end
end
end
end
if IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "lunasflightschool_basescript") and ent.GetAI and ent.GetAITEAM then
if ent:GetAI() and ent:GetAITEAM() != self.Owner:lfsGetAITeam() and self.Owner:lfsGetAITeam() != 0 and ent:GetAITEAM() != 0 and GetConVar("ai_ignoreplayers"):GetInt() == 0 then
return true
end
if IsValid(ent:GetDriver()) and ent:GetDriver():IsPlayer() and ent:GetDriver():Team() != self.Owner:Team() and ent:GetDriver():Team() != TEAM_UNASSIGNED or IsValid(ent:GetDriver()) and ent:GetDriver():IsPlayer() and ent:GetDriver():Team() == TEAM_UNASSIGNED then
return true
end
for _, v in pairs( ent:GetPassengerSeats() ) do
			if IsValid(v) and IsValid(v:GetDriver()) and v:GetDriver():IsPlayer() and v:GetDriver():Team() != self.Owner:Team() and v:GetDriver():Team() != TEAM_UNASSIGNED or IsValid(v) and IsValid(v:GetDriver()) and v:GetDriver():IsPlayer() and v:GetDriver():Team() == TEAM_UNASSIGNED then
			return true
			end
end
end
if IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "wac_hc_base") and istable(ent.passengers) or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "wac_pl_base") and istable(ent.passengers) then
for k,p in pairs(ent.passengers) do
if IsValid(p) and p:IsPlayer() and p:Team() != self.Owner:Team() and p:Team() != TEAM_UNASSIGNED or IsValid(p) and p:IsPlayer() and p:Team() == TEAM_UNASSIGNED then
return true
end
end
end
if IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "sent_sakarias_scar_base") and istable(ent.Seats) then
for k,p in pairs(ent.Seats) do
if IsValid(p:GetDriver()) and p:GetDriver():IsPlayer() and p:GetDriver():Team() != self.Owner:Team() and p:GetDriver():Team() != TEAM_UNASSIGNED or IsValid(p:GetDriver()) and p:GetDriver():IsPlayer() and p:GetDriver():Team() == TEAM_UNASSIGNED then
return true
end
end
end
if IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "sent_sakarias_carwheel") or IsValid(ent) and ent:GetClass() == "sent_sakarias_carwheel" then
if IsEntity(ent.SCarOwner) and IsValid(ent.SCarOwner) and istable(ent.SCarOwner.Seats) then
for k,p in pairs(ent.SCarOwner.Seats) do
if IsValid(p:GetDriver()) and p:GetDriver():IsPlayer() and p:GetDriver():Team() != self.Owner:Team() and p:GetDriver():Team() != TEAM_UNASSIGNED or IsValid(p:GetDriver()) and p:GetDriver():IsPlayer() and p:GetDriver():Team() == TEAM_UNASSIGNED or IsEntity(ent.SCarOwner.MadVehicle) and IsValid(ent.SCarOwner.MadVehicle) and GetConVar("ai_ignoreplayers"):GetInt() == 0 and GetConVar("madvehicle_targetplayer"):GetInt() == 1 then
return true
end
end
end
end
if IsValid(ent) and ent:GetClass() == "gmod_sent_vehicle_fphysics_wheel" and IsValid(ent:GetBaseEnt()) then
if IsValid(ent:GetBaseEnt():GetDriver()) and ent:GetBaseEnt():GetDriver():IsPlayer() and ent:GetBaseEnt():GetDriver():Team() != self.Owner:Team() and ent:GetBaseEnt():GetDriver():Team() != TEAM_UNASSIGNED or IsValid(ent:GetBaseEnt():GetDriver()) and ent:GetBaseEnt():GetDriver():IsPlayer() and ent:GetBaseEnt():GetDriver():Team() == TEAM_UNASSIGNED or IsValid(ent:GetBaseEnt()) and IsEntity(ent:GetBaseEnt().MadVehicle) and IsValid(ent:GetBaseEnt().MadVehicle) and GetConVar("ai_ignoreplayers"):GetInt() == 0 and GetConVar("madvehicle_targetplayer"):GetInt() == 1 then 
return true
end
if istable(ent:GetBaseEnt().pSeat) then
for k,p in pairs(ent:GetBaseEnt().pSeat) do
if IsValid(p:GetDriver()) and p:GetDriver():IsPlayer() and p:GetDriver():Team() != self.Owner:Team() and p:GetDriver():Team() != TEAM_UNASSIGNED or IsValid(p:GetDriver()) and p:GetDriver():IsPlayer() and p:GetDriver():Team() == TEAM_UNASSIGNED then
return true
end
end
end
end
if IsValid(ent) and ent:GetClass() == "gmod_sent_vehicle_fphysics_base" then
if IsValid(ent:GetDriver()) and ent:GetDriver():IsPlayer() and ent:GetDriver():Team() != self.Owner:Team() and ent:GetDriver():Team() != TEAM_UNASSIGNED or IsValid(ent:GetDriver()) and ent:GetDriver():IsPlayer() and ent:GetDriver():Team() == TEAM_UNASSIGNED then 
return true
end
if istable(ent.pSeat) then
for k,p in pairs(ent.pSeat) do
if IsValid(p:GetDriver()) and p:GetDriver():IsPlayer() and p:GetDriver():Team() != self.Owner:Team() and p:GetDriver():Team() != TEAM_UNASSIGNED or IsValid(p:GetDriver()) and p:GetDriver():IsPlayer() and p:GetDriver():Team() == TEAM_UNASSIGNED then
return true
end
end
end
end
if IsValid(ent) and ent:IsVehicle() and !scripted_ents.IsBasedOn(ent:GetClass(), "sent_sakarias_scar_base") then
if IsValid(ent:GetDriver()) and ent:GetDriver():IsPlayer() and ent:GetDriver():Team() != self.Owner:Team() and ent:GetDriver():Team() != TEAM_UNASSIGNED or IsValid(ent:GetDriver()) and ent:GetDriver():IsPlayer() and ent:GetDriver():Team() == TEAM_UNASSIGNED then
return true
end
end
end

function SWEP:EntityIsEnemyVehicle(ent)
local VehicleEnts = {
npc_cscanner = true,
npc_combinedropship = true,
npc_combinegunship = true,
npc_dog = true,
npc_helicopter = true,
npc_manhack = true,
npc_clawscanner = true,
npc_rollermine = true,
npc_strider = true,
npc_turret_floor = true
}
if IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "haloveh_base") and self:HasHostilesInVehicle(ent) or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "halohover_base") and self:HasHostilesInVehicle(ent) or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "halohover2_base") and self:HasHostilesInVehicle(ent) or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "lunasflightschool_basescript") and self:HasHostilesInVehicle(ent) or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "wac_hc_base") and self:HasHostilesInVehicle(ent) or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "wac_pl_base") and self:HasHostilesInVehicle(ent) or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "sent_sakarias_scar_base") and self:HasHostilesInVehicle(ent) or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "sent_sakarias_carwheel") and self:HasHostilesInVehicle(ent) or IsValid(ent) and ent:GetClass() == "sent_sakarias_carwheel" and self:HasHostilesInVehicle(ent) or IsValid(ent) and ent:GetClass() == "gmod_sent_vehicle_fphysics_base" and self:HasHostilesInVehicle(ent) or IsValid(ent) and ent:GetClass() == "gmod_sent_vehicle_fphysics_wheel" and self:HasHostilesInVehicle(ent) or IsValid(ent) and ent:IsVehicle() and !scripted_ents.IsBasedOn(ent:GetClass(), "sent_sakarias_scar_base") and self:HasHostilesInVehicle(ent) or SERVER and IsValid(ent) and ent:IsNPC() and VehicleEnts[ent:GetClass()] and ent:Disposition(self.Owner) == 1 or SERVER and IsValid(ent) and ent:IsNPC() and VehicleEnts[ent:GetClass()] and ent:Disposition(self.Owner) == 2 or IsValid(ent) and IsEntity(ent.MadVehicle) and IsValid(ent.MadVehicle) and ent.MadVehicle:GetClass() == "npc_madvehicle" and GetConVar("ai_ignoreplayers"):GetInt() == 0 and GetConVar("madvehicle_targetplayer"):GetInt() == 1 then
self:SetNW2Bool( "HaloSWEPSEntIsEnemyVehicle", true )
return true
else
self:SetNW2Bool( "HaloSWEPSEntIsEnemyVehicle", false )
return false
end

end

function SWEP:HaloReticle(tr)

	surface.SetTexture(surface.GetTextureID("vgui/halohud/h3/h3sword"))
	if IsValid(tr.Entity) and tr.Entity:IsNPC() and self:GetNW2Bool( "HaloSWEPSEntIsFriendly" ) == true and self:GetNW2Bool( "HaloSWEPSEntIsVisible" ) == true or IsValid(tr.Entity) and tr.Entity:IsPlayer() and tr.Entity:Team() == self.Owner:Team() and tr.Entity:Team() != TEAM_UNASSIGNED and self:GetNW2Bool( "HaloSWEPSEntIsVisible" ) == true or IsValid(tr.Entity) and tr.Entity:GetNW2Bool( "HaloSWEPSEntIsNextBot" ) == true and self:GetNW2Bool( "HaloSWEPSEntIsFriendlyNB" ) == true and self:GetNW2Bool( "HaloSWEPSEntIsVisible" ) == true or IsValid(tr.Entity) and self:EntityIsVehicle(tr.Entity) and self:GetNW2Bool( "HaloSWEPSEntIsEnemyVehicle" ) == false and self:GetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle" ) == true and self:GetNW2Bool( "HaloSWEPSEntIsVisible" ) == true then
	surface.SetDrawColor( 255, 0, 0, 255 )
	elseif IsValid(tr.Entity) and tr.Entity:IsNPC() and self:GetNW2Bool( "HaloSWEPSEntIsFriendly" ) == false and self:GetNW2Bool( "HaloSWEPSEntIsVisible" ) == true or tr.Entity:IsPlayer() and tr.Entity:Team() != self.Owner:Team() and self:GetNW2Bool( "HaloSWEPSEntIsVisible" ) == true or IsValid(tr.Entity) and tr.Entity:IsPlayer() and tr.Entity:Team() == TEAM_UNASSIGNED and self:GetNW2Bool( "HaloSWEPSEntIsVisible" ) == true or IsValid(tr.Entity) and tr.Entity:GetNW2Bool( "HaloSWEPSEntIsNextBot" ) == true and self:GetNW2Bool( "HaloSWEPSEntIsFriendlyNB" ) == false and self:GetNW2Bool( "HaloSWEPSEntIsVisible" ) == true or IsValid(tr.Entity) and self:EntityIsVehicle(tr.Entity) and self:GetNW2Bool( "HaloSWEPSEntIsEnemyVehicle" ) == true and self:GetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle" ) == true and self:GetNW2Bool( "HaloSWEPSEntIsVisible" ) == true then
	surface.SetDrawColor( 255, 0, 0, 255 )
	else
	surface.SetDrawColor( 141, 192, 235, 255 )
	end
	surface.DrawTexturedRect( ScrW()/2 - 80, ScrH()/2 - 80, 160, 160 )

end

function SWEP:DrawHUD()

	if self.Owner:InVehicle() and self.Owner:GetAllowWeaponsInVehicle() == false or GetViewEntity() != self.Owner then return end

		local LookTrace = {}
	LookTrace.start = self.Owner:GetShootPos()
	LookTrace.endpos = LookTrace.start + (self.Owner:GetAimVector() * 88)
	LookTrace.filter = function( ent ) if ( ent == self or ent == self.Owner or ent:GetClass() == "melee_attack_h3_sword" or ent:GetClass() == "melee_attack_h3" or ent:GetClass() == "flamethrower_fire_h3" or ent:GetClass() == "flamethrower_fire_h1" ) then return false elseif ( ent:IsNPC() or ent:IsPlayer() or ent:IsNextBot() or self:EntityIsVehicle(ent) or self.Owner:GetEyeTrace().SurfaceFlags != SURF_TRANS and self.Owner:GetEyeTrace().MatType != MAT_GLASS and self.Owner:GetEyeTrace().Contents != 268435458 ) then return true end end
	LookTrace.mask = MASK_SHOT
	self.Owner:LagCompensation(true)
	local looktr = util.TraceLine(LookTrace)
	self.Owner:LagCompensation(false)

	if looktr.SurfaceFlags == SURF_TRANS or looktr.MatType == MAT_GLASS or looktr.Contents == 268435458 or looktr.Entity:IsNPC() or looktr.Entity:IsPlayer() or looktr.Entity:IsNextBot() or self:EntityIsVehicle(looktr.Entity) then

		local Trace = {}
	Trace.start = self.Owner:GetShootPos()
	Trace.endpos = Trace.start + (self.Owner:GetAimVector() * 87)
	Trace.filter = function( ent ) if ( ent == self or ent == self.Owner or ent:GetClass() == "melee_attack_h3_sword" or ent:GetClass() == "melee_attack_h3" or ent:GetClass() == "flamethrower_fire_h3" or ent:GetClass() == "flamethrower_fire_h1" ) then return false elseif ( ent:IsNPC() or ent:IsPlayer() or ent:IsNextBot() or self:EntityIsVehicle(ent) or self.Owner:GetEyeTrace().SurfaceFlags != SURF_TRANS and self.Owner:GetEyeTrace().MatType != MAT_GLASS and self.Owner:GetEyeTrace().Contents != 268435458 ) then return true end end
	Trace.mask = MASK_SHOT
	Trace.ignoreworld = true
	self.Owner:LagCompensation(true)
	local tr = util.TraceLine(Trace)
	self.Owner:LagCompensation(false)
	
	self:HaloReticle(tr)
	else
		local Trace = {}
	Trace.start = self.Owner:GetShootPos()
	Trace.endpos = Trace.start + (self.Owner:GetAimVector() * 88)
	Trace.filter = function( ent ) if ( IsEntity(ent) ) then return false end end
	Trace.mask = MASK_SHOT
	self.Owner:LagCompensation(true)
	local tr = util.TraceLine(Trace)
	self.Owner:LagCompensation(false)
	
	self:HaloReticle(tr)
	end
end

function SWEP:CanBePickedUpByNPCs()
if self:Clip1() > 0 and GetGlobalBool( "H3SWEPSMounted" ) == true then
return true
else
return false
end
end

function SWEP:CustomAmmoDisplay()

self.AmmoDisplay = self.AmmoDisplay or {}

self.AmmoDisplay.PrimaryClip = self:Clip1()
self.AmmoDisplay.SecondaryAmmo = self:Ammo2()

return self.AmmoDisplay

end

function SWEP:MeleeHit()

	if IsFirstTimePredicted() then

	local aim = self.Owner:GetAimVector()
	local side = aim:Cross(Vector(0,0,1))
	local up = side:Cross(aim)
	local pos = self.Owner:GetShootPos() + side * 0 + up * 0

	if SERVER then
	local melee = ents.Create("melee_attack_h3")
	if !IsValid(melee) then return end
	melee:SetAngles(self.Owner:GetAimVector():Angle(90,90,0))
	melee:SetPos(pos)
	melee:SetOwner(self.Owner)
	melee:Spawn()
	melee.Owner = self.Owner
	melee:Activate()
		local phys = melee:GetPhysicsObject()
			phys:SetVelocity(self.Owner:GetAimVector() * 390)
	end
		if SERVER and IsValid(self.Owner) then
		local anglo = Angle(-3, 0, 0)		
		self.Owner:ViewPunch(anglo)
		end
		
end

end

function SWEP:MeleeHitSword()

	if IsFirstTimePredicted() then

	local aim = self.Owner:GetAimVector()
	local side = aim:Cross(Vector(0,0,1))
	local up = side:Cross(aim)
	local pos = self.Owner:GetShootPos() + side * 0 + up * 0

	if SERVER then
	local melee = ents.Create("melee_attack_h3_sword")
	if !IsValid(melee) then return end
	melee:SetAngles(self.Owner:GetAimVector():Angle(90,90,0))
	melee:SetPos(pos)
	melee:SetOwner(self.Owner)
	melee:Spawn()
	melee.Owner = self.Owner
	melee:Activate()
		local phys = melee:GetPhysicsObject()
			phys:SetVelocity(self.Owner:GetAimVector() * 420)
	end
		if SERVER and IsValid(self.Owner) then
		local anglo = Angle(-3, 0, 0)		
		self.Owner:ViewPunch(anglo)
		end
		
end

end

function SWEP:SecondaryAttack()

if self:Clip1() > 0 then

	if IsValid(self:GetNW2Entity("MeleeTargetH3")) then
		LungeRange = (self:GetNW2Entity("MeleeTargetH3"):GetPos()-self.Owner:GetPos()):Length()
	end

	if IsValid(self:GetNW2Entity("MeleeTargetH3")) and LungeRange <= self.LungeDistance then
		self.Owner:SetVelocity(self.Owner:GetForward() * 460 )
		timer.Create( "MeleeAttack" .. self:EntIndex(), 0.1, 1, function() self:MeleeHitSword() end )
	end

	if !IsValid(self:GetNW2Entity("MeleeTargetH3")) or LungeRange > self.LungeDistance then
		self:MeleeHitSword()
	end

	self:SetNextIdle(0)
	timer.Stop( "GrenadeThrow" .. self:EntIndex() )
	timer.Stop( "weapon_idle" .. self:EntIndex() )
	self:SendWeaponAnim(ACT_VM_HITCENTER)
	self:SetNextPrimaryFire(CurTime() + 0.9)
	self:SetNextSecondaryFire(CurTime() + 0.9)
	self.Owner:DoAnimationEvent(ACT_GMOD_GESTURE_MELEE_SHOVE_2HAND);
	self:EmitSound("Halo3_ES.Melee")
	if IsFirstTimePredicted() and SERVER and !self.Owner:IsListenServerHost()  then
		timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration() / self.Owner:GetViewModel():GetPlaybackRate(), 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
		elseif IsFirstTimePredicted() and SERVER and self.Owner:IsListenServerHost() and !game.SinglePlayer()  then
		timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration() / self.Owner:GetViewModel():GetPlaybackRate() - 0.25, 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
		elseif IsFirstTimePredicted() and game.SinglePlayer() then
		timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration(), 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
		end 
	elseif self:Clip1() <= 0 then

	if IsValid(self:GetNW2Entity("MeleeTargetH3")) then
	LungeRange = (self:GetNW2Entity("MeleeTargetH3"):GetPos()-self.Owner:GetPos()):Length()
	end

	if IsValid(self:GetNW2Entity("MeleeTargetH3")) and LungeRange <= self.LungeDistance then
	self.Owner:SetVelocity(self.Owner:GetForward() * 460 )
	timer.Create( "MeleeAttack" .. self:EntIndex(), 0.1, 1, function() self:MeleeHit() end )
	end

	if !IsValid(self:GetNW2Entity("MeleeTargetH3")) or LungeRange > self.LungeDistance then
	self:MeleeHit()
	end

	self:SetNextIdle(0)
	timer.Stop( "GrenadeThrow" .. self:EntIndex() )
	timer.Stop( "weapon_idle" .. self:EntIndex() )
	self:SendWeaponAnim(ACT_VM_HITCENTER)
	self:SetNextPrimaryFire(CurTime() + 0.9)
	self:SetNextSecondaryFire(CurTime() + 0.9)
	self.Owner:DoAnimationEvent(ACT_GMOD_GESTURE_MELEE_SHOVE_2HAND);
	self:EmitSound("Halo3_ES.Melee_Empty")
	if IsFirstTimePredicted() and SERVER and !self.Owner:IsListenServerHost()  then
		timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration() / self.Owner:GetViewModel():GetPlaybackRate(), 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
		elseif IsFirstTimePredicted() and SERVER and self.Owner:IsListenServerHost() and !game.SinglePlayer()  then
			timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration() / self.Owner:GetViewModel():GetPlaybackRate() - 0.25, 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
		elseif IsFirstTimePredicted() and game.SinglePlayer() then
			timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration(), 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
		end 
	end

end

function SWEP:Reload()

if self.Dropped == false then

	if self:Clip1() <= 0 and IsFirstTimePredicted() then
	self.Dropped = true
	self.Owner.DroppedObjWeaponH3 = true
	self:EmitSound("Weapon.ImpactSoft", 75, 100, 1, CHAN_STATIC)
	if (SERVER) and IsFirstTimePredicted() then
	local drop = ents.Create("prop_physics_multiplayer")
	drop:SetModel("models/halo3/w_energysword.mdl")
	drop:SetPos(self:GetPos()+self:GetUp()*50)
	drop:SetAngles(self:GetAngles() + Angle(0,180,0))
	drop:SetCollisionGroup(COLLISION_GROUP_WEAPON)
	drop:SetSkin(1)
	drop:Spawn()
	drop:Activate()
	SafeRemoveEntityDelayed(drop,30)
	SafeRemoveEntity(self)
end

end

end

end

function SWEP:ThrowGrenade()

	if IsFirstTimePredicted() then

	self.Owner:RemoveAmmo( 1, self.Secondary.Ammo )
	local aim = self.Owner:GetAimVector()
	local side = aim:Cross(Vector(0,0,1))
	local up = side:Cross(aim)
	local pos = self.Owner:GetShootPos() + side * -10 + up * 0

	if SERVER then
	local grenade = ents.Create("frag_grenade_h3")
	if !IsValid(grenade) then return end
	grenade:SetAngles(self.Owner:GetAimVector():Angle(90,90,0))
	grenade:SetPos(pos)
	grenade:SetOwner(self.Owner)
	grenade:Spawn()
	grenade.Owner = self.Owner
	grenade:Activate()
		local phys = grenade:GetPhysicsObject()
			phys:SetVelocity(self.Owner:GetAimVector() * 900)
	end
		if SERVER and IsValid(self.Owner) then
		local anglo = Angle(-3, 0, 0)		
		self.Owner:ViewPunch(anglo)
		end

end

end

function SWEP:Deploy()
	if self:GetNW2Int( "NPCClipH3" ) != -1 and self:GetNW2Int( "NPCClipH3" ) < self.Primary.ClipSize then
	self:SetClip1(self:GetNW2Int("NPCClipH3"))
	end
	if self.FirstDraw == true then
	self:SetClip1(self.Primary.ClipSize - 1)
	timer.Simple( 0, function() if IsValid(self) and IsFirstTimePredicted() then self:SetClip1(self.Primary.ClipSize) end end )
	self.FirstDraw = false
	end
	self:SetNW2Int( "NPCClipH3", -1 )
	if (IsValid(self.Owner:GetViewModel())) then
	self.Owner:GetViewModel():SetWeaponModel( self.ViewModel, self )
	end
	timer.Stop( "GrenadeThrow" .. self:EntIndex() )
	timer.Stop( "MeleeAttack" .. self:EntIndex() )
	timer.Stop( "weapon_idle" .. self:EntIndex() )
	self:SetNextIdle(0)
	local effectdata = EffectData()
	effectdata:SetOrigin( self.Owner:GetShootPos() )
	effectdata:SetStart( self.Owner:GetShootPos() )
	effectdata:SetAttachment( 2 )
	effectdata:SetEntity( self )
	if self:GetNW2Bool( "FreshSword" ) == true then
	self:SetNW2Bool( "FreshSword", false )
	end
	self:SetSkin(1)
	self.Owner:GetViewModel():SetSkin(1)
	self:StopSound(self.SwordIdleSound)
	self:SendWeaponAnim( ACT_VM_DRAW )
	self:StopSound("Halo3_ES.Deploy")
	self:StopSound("Halo3_ES.DeployAlt")
	self:SetNextPrimaryFire( CurTime() + self:SequenceDuration() )
	self:SetNextSecondaryFire( CurTime() + self:SequenceDuration() ) 
	if IsFirstTimePredicted() and SERVER and !self.Owner:IsListenServerHost()  then
	timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration() / self.Owner:GetViewModel():GetPlaybackRate() - 0.1, 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
	elseif IsFirstTimePredicted() and SERVER and self.Owner:IsListenServerHost() and !game.SinglePlayer()  then
	timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration() / self.Owner:GetViewModel():GetPlaybackRate() - 0.15, 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
	elseif IsFirstTimePredicted() and game.SinglePlayer() then
	timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration(), 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
	end 
	if self:Clip1() <= 0 then
	self.Owner:GetViewModel():SetSkin(1)
	end
	if self:Clip1() > 0 and game.SinglePlayer() == false and IsFirstTimePredicted() then
	if self:GetNW2Int( "DrawSound" ) == 1 then
	self:EmitSound("Halo3_ES.Deploy")
	self:SetNW2Int( "DrawSound", 2 )
	elseif self:GetNW2Int( "DrawSound" ) == 2 then
	self:EmitSound("Halo3_ES.DeployAlt")
	self:SetNW2Int( "DrawSound", 1 )
	end
	self.SwordFX = CurTime() + 0.55
	timer.Create( "SwordActivation" .. self:EntIndex(), 0.56, 1, function() if IsFirstTimePredicted() then self.Owner:GetViewModel():SetSkin(0) self:SetSkin( 0 ) self:EmitSound("Halo3_ES.Draw") util.Effect( "flash_sworddraw_halo3", effectdata ) util.Effect( "flash_sworddraw_halo3", effectdata ) end end )
	elseif self:Clip1() > 0 and game.SinglePlayer() == true and IsFirstTimePredicted() then
	if self:GetNW2Int( "DrawSound" ) == 1 then
	self:EmitSound("Halo3_ES.Deploy")
	self:SetNW2Int( "DrawSound", 2 )
	elseif self:GetNW2Int( "DrawSound" ) == 2 then
	self:EmitSound("Halo3_ES.DeployAlt")
	self:SetNW2Int( "DrawSound", 1 )
	end
	self.SwordFX = CurTime() + 0.65
	timer.Create( "SwordActivation" .. self:EntIndex(), 0.66, 1, function() if IsFirstTimePredicted() then self.Owner:GetViewModel():SetSkin(0) self:SetSkin( 0 ) self:EmitSound("Halo3_ES.Draw") util.Effect( "flash_sworddraw_halo3", effectdata ) util.Effect( "flash_sworddraw_halo3", effectdata ) end end )
	end
	timer.Create( "FakeThink" .. self:EntIndex(), 0, 0, function()
	if !IsValid(self) or !IsValid(self.Owner) then return end

	local LookTrace = {}
	LookTrace.start = self.Owner:GetShootPos()
	LookTrace.endpos = LookTrace.start + (self.Owner:GetAimVector() * 130)
	LookTrace.filter = function( ent ) if ( ent == self or ent == self.Owner or ent:GetClass() == "melee_attack_h3_sword" or ent:GetClass() == "melee_attack_h3" or ent:GetClass() == "flamethrower_fire_h3" or ent:GetClass() == "flamethrower_fire_h1" ) then return false elseif ( ent:IsNPC() or ent:IsPlayer() or ent:IsNextBot() or self:EntityIsVehicle(ent) or self.Owner:GetEyeTrace().SurfaceFlags != SURF_TRANS and self.Owner:GetEyeTrace().MatType != MAT_GLASS and self.Owner:GetEyeTrace().Contents != 268435458 ) then return true end end
	LookTrace.mask = MASK_SHOT
	self.Owner:LagCompensation(true)
	local looktr = util.TraceLine(LookTrace)
	self.Owner:LagCompensation(false)

	if SERVER and IsValid(looktr.Entity) and looktr.Entity:IsNPC() and looktr.Entity:Disposition(self.Owner) == 1 or SERVER and IsValid(looktr.Entity) and looktr.Entity:IsNPC() and looktr.Entity:Disposition(self.Owner) == 2 or SERVER and looktr.Entity:IsPlayer() and looktr.Entity:Team() != self.Owner:Team() or SERVER and looktr.Entity:IsPlayer() and looktr.Entity:Team() == TEAM_UNASSIGNED or looktr.Entity:IsNextBot() and looktr.Entity.Enemy == self.Owner or self:EntityIsVehicle(looktr.Entity) and self:EntityIsEnemyVehicle(looktr.Entity) and self:IsVehicleOccupied(looktr.Entity) then
	if IsValid(self.Owner:GetEyeTrace().Entity) and self.Owner:GetEyeTrace().Entity == looktr.Entity and self.Owner:GetEyeTrace().MatType != MAT_GRATE then
	self:SetNW2Entity( "MeleeTargetH3", looktr.Entity )
	end
	else
	self:SetNW2Entity( "MeleeTargetH3", NULL )
	end

	self:IsVehicleOccupied(looktr.Entity)
	self:EntityIsEnemyVehicle(looktr.Entity)
	self:IsEntVisible(looktr.Entity)

	if looktr.SurfaceFlags == SURF_TRANS or looktr.MatType == MAT_GLASS or looktr.Contents == 268435458 or looktr.Entity:IsNPC() or looktr.Entity:IsPlayer() or looktr.Entity:IsNextBot() then

		local Trace = {}
	Trace.start = self.Owner:GetShootPos()
	Trace.endpos = Trace.start + (self.Owner:GetAimVector() * 130)
	Trace.filter = function( ent ) if ( ent == self or ent == self.Owner or ent:GetClass() == "melee_attack_h3_sword" or ent:GetClass() == "melee_attack_h3" or ent:GetClass() == "flamethrower_fire_h3" or ent:GetClass() == "flamethrower_fire_h1" ) then return false elseif ( ent:IsNPC() or ent:IsPlayer() or ent:IsNextBot() or self:EntityIsVehicle(ent) or self.Owner:GetEyeTrace().SurfaceFlags != SURF_TRANS and self.Owner:GetEyeTrace().MatType != MAT_GLASS and self.Owner:GetEyeTrace().Contents != 268435458 ) then return true end end
	Trace.mask = MASK_SHOT
	Trace.ignoreworld = true
	self.Owner:LagCompensation(true)
	local tr = util.TraceLine(Trace)
	self.Owner:LagCompensation(false)
	self:IsVehicleOccupied(tr.Entity)
	self:EntityIsEnemyVehicle(tr.Entity)
	self:IsEntVisible(tr.Entity)

	if SERVER and IsValid(tr.Entity) and tr.Entity:IsNPC() and tr.Entity:Disposition(self.Owner) == 3 and self:GetNW2Bool( "HaloSWEPSEntIsFriendly" ) != true then
	self:SetNW2Bool( "HaloSWEPSEntIsFriendly", true )
	elseif SERVER and IsValid(tr.Entity) and tr.Entity:IsNPC() and tr.Entity:Disposition(self.Owner) == 4 and self:GetNW2Bool( "HaloSWEPSEntIsFriendly" ) != true then
	self:SetNW2Bool( "HaloSWEPSEntIsFriendly", true )
	end

	if SERVER and IsValid(tr.Entity) and tr.Entity:IsNPC() and tr.Entity:Disposition(self.Owner) == 2 and self:GetNW2Bool( "HaloSWEPSEntIsFriendly" ) != false then
	self:SetNW2Bool( "HaloSWEPSEntIsFriendly", false )
	elseif SERVER and IsValid(tr.Entity) and tr.Entity:IsNPC() and tr.Entity:Disposition(self.Owner) == 1 and self:GetNW2Bool( "HaloSWEPSEntIsFriendly" ) != false then
	self:SetNW2Bool( "HaloSWEPSEntIsFriendly", false )
	end

	if SERVER and IsValid(tr.Entity) and tr.Entity:IsNextBot() and tr.Entity.Enemy == self.Owner and self:GetNW2Bool( "HaloSWEPSEntIsFriendlyNB" ) != false then
	self:SetNW2Bool( "HaloSWEPSEntIsFriendlyNB", false )
	elseif SERVER and IsValid(tr.Entity) and tr.Entity:IsNextBot() and tr.Entity.Enemy != self.Owner and self:GetNW2Bool( "HaloSWEPSEntIsFriendlyNB" ) != true then
	self:SetNW2Bool( "HaloSWEPSEntIsFriendlyNB", true )
	end
end end )
	return true
end 

function SWEP:IsEquipment()
	return WEPS.IsEquipment(self)
end

function SWEP:PrimaryAttack()

if IsValid(self.Owner) and self.Owner:IsNPC() then return end
	
	if self.Owner:KeyDown(IN_USE) and self:Ammo2() > 0 and self.GrenadeEnabled then  

		self:SetNextIdle(0)
		timer.Stop( "MeleeAttack" .. self:EntIndex() )
		timer.Stop( "weapon_idle" .. self:EntIndex() )
		self:SendWeaponAnim(ACT_VM_SECONDARYATTACK)
		self:SetNextPrimaryFire(CurTime() + 1.3)
		self:SetNextSecondaryFire(CurTime() + 1)
		timer.Create( "GrenadeThrow" .. self:EntIndex(), 0.2, 1, function() self:ThrowGrenade() end )
		self.Owner:DoAnimationEvent(ACT_GMOD_GESTURE_ITEM_THROW);
		self:EmitSound("Halo3_Nade.Throw")
		if IsFirstTimePredicted() and SERVER and !self.Owner:IsListenServerHost()  then
			timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration() / self.Owner:GetViewModel():GetPlaybackRate() - 0.1, 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
			elseif IsFirstTimePredicted() and SERVER and self.Owner:IsListenServerHost() and !game.SinglePlayer()  then
			timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration() / self.Owner:GetViewModel():GetPlaybackRate() - 0.2, 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
			elseif IsFirstTimePredicted() and game.SinglePlayer() then
			timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration(), 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
			end 

				else

			if self:Clip1() <= 0 then 
			self:SecondaryAttack()
			return end

			if IsValid(self:GetNW2Entity("MeleeTargetH3")) then
			LungeRange = (self:GetNW2Entity("MeleeTargetH3"):GetPos()-self.Owner:GetPos()):Length()
			end

	if IsValid(self:GetNW2Entity("MeleeTargetH3")) and LungeRange <= self.LungeDistance and self.Owner:OnGround() and self:Clip1() > 0 then
		self:SetNextIdle(0)
		timer.Stop( "GrenadeThrow" .. self:EntIndex() )
		timer.Stop( "weapon_idle" .. self:EntIndex() )
		self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
		self.Owner:SetAnimation(PLAYER_ATTACK1)
		if IsFirstTimePredicted() and SERVER and !self.Owner:IsListenServerHost()  then
		timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration() / self.Owner:GetViewModel():GetPlaybackRate() - 0.1, 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
		elseif IsFirstTimePredicted() and SERVER and self.Owner:IsListenServerHost() and !game.SinglePlayer()  then
		timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration() / self.Owner:GetViewModel():GetPlaybackRate() - 0.17, 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
		elseif IsFirstTimePredicted() and game.SinglePlayer() then
		timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration(), 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
		end 
		self:SetNextPrimaryFire(CurTime() + 1.4)
		self:SetNextSecondaryFire(CurTime() + 1.4)
		GAMEMODE:SetPlayerSpeed(self.Owner, 1, 1)
		if LungeRange > self.LungeDistance and game.SinglePlayer() == true then
		self.Owner:SetVelocity(self.Owner:GetForward() * 1000 )
		elseif LungeRange > self.LungeDistance and game.SinglePlayer() == false then
		self.Owner:SetVelocity(self.Owner:GetForward() * 880 )
		elseif LungeRange <= self.LungeDistance then
		self.Owner:SetVelocity(self.Owner:GetForward() * 365 )
		end
		timer.Create( "MeleeAttack" .. self:EntIndex(), 0.13, 1, function() self:MeleeHitSword() self.Owner:SetRunSpeed( baseclass.Get( player_manager.GetPlayerClass(self.Owner) ).RunSpeed ) self.Owner:SetWalkSpeed(  baseclass.Get( player_manager.GetPlayerClass(self.Owner) ).WalkSpeed ) end )
		end

	if IsValid(self:GetNW2Entity("MeleeTargetH3")) and LungeRange <= self.LungeDistance and !self.Owner:OnGround() and self:Clip1() > 0 then
		self:SetNextIdle(0)
		timer.Stop( "GrenadeThrow" .. self:EntIndex() )
		timer.Stop( "weapon_idle" .. self:EntIndex() )
		self:SendWeaponAnim(ACT_VM_MISSCENTER)
		self.Owner:SetAnimation(PLAYER_ATTACK1)
		if IsFirstTimePredicted() and SERVER and !self.Owner:IsListenServerHost()  then
		timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration() / self.Owner:GetViewModel():GetPlaybackRate() - 0.1, 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
		elseif IsFirstTimePredicted() and SERVER and self.Owner:IsListenServerHost() and !game.SinglePlayer()  then
		timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration() / self.Owner:GetViewModel():GetPlaybackRate() - 0.05, 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
		elseif IsFirstTimePredicted() and game.SinglePlayer() then
		timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration(), 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
		end 
		self:SetNextPrimaryFire(CurTime() + 1.4)
		self:SetNextSecondaryFire(CurTime() + 1.4)
		GAMEMODE:SetPlayerSpeed(self.Owner, 1, 1)
		self.Owner:SetVelocity(self.Owner:GetForward() * 500 )
		timer.Create( "MeleeAttack" .. self:EntIndex(), 0.15, 1, function() self:MeleeHitSword() self.Owner:SetRunSpeed( baseclass.Get( player_manager.GetPlayerClass(self.Owner) ).RunSpeed ) self.Owner:SetWalkSpeed(  baseclass.Get( player_manager.GetPlayerClass(self.Owner) ).WalkSpeed ) end )
		end

	if !IsValid(self:GetNW2Entity("MeleeTargetH3")) and self:Clip1() > 0 or IsValid(self:GetNW2Entity("MeleeTargetH3")) and LungeRange > self.LungeDistance and self:Clip1() > 0 then
		self:SetNextIdle(0)
		timer.Stop( "GrenadeThrow" .. self:EntIndex() )
		timer.Stop( "weapon_idle" .. self:EntIndex() )
		self:MeleeHitSword()
		self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
		if IsFirstTimePredicted() and SERVER and !self.Owner:IsListenServerHost()  then
		timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration() / self.Owner:GetViewModel():GetPlaybackRate() - 0.1, 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
		elseif IsFirstTimePredicted() and SERVER and self.Owner:IsListenServerHost() and !game.SinglePlayer()  then
		timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration() / self.Owner:GetViewModel():GetPlaybackRate() - 0.17, 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
		elseif IsFirstTimePredicted() and game.SinglePlayer() then
		timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration(), 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
		end 
		self:SetNextPrimaryFire(CurTime() + 1.4)
		self:SetNextSecondaryFire(CurTime() + 1.4)
		self.Owner:SetAnimation(PLAYER_ATTACK1)
		end

	if !IsValid(self:GetNW2Entity("MeleeTargetH3")) and self:Clip1() > 0 and !self.Owner:OnGround() then
		self:SetNextIdle(0)
		timer.Stop( "GrenadeThrow" .. self:EntIndex() )
		timer.Stop( "weapon_idle" .. self:EntIndex() )
		self:MeleeHitSword()
		self:SendWeaponAnim(ACT_VM_MISSCENTER)
		if IsFirstTimePredicted() and SERVER and !self.Owner:IsListenServerHost()  then
		timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration() / self.Owner:GetViewModel():GetPlaybackRate() - 0.1, 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
		elseif IsFirstTimePredicted() and SERVER and self.Owner:IsListenServerHost() and !game.SinglePlayer()  then
		timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration() / self.Owner:GetViewModel():GetPlaybackRate() - 0.25, 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
		elseif IsFirstTimePredicted() and game.SinglePlayer() then
		timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration(), 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
		end 
		self:SetNextPrimaryFire(CurTime() + 1.4)
		self:SetNextSecondaryFire(CurTime() + 1.4)
		self.Owner:SetAnimation(PLAYER_ATTACK1)
		end

	self:EmitSound("Halo3_ES.Swing")

	end

end

function SWEP:Holster()
	if IsValid(self.Owner) and self.Owner:IsNPC() then return end
		if self.FirstDraw == false then
			self:StopSound(self.SwordIdleSound)
		end
	if self:GetNW2Bool( "FreshSwordH3" ) == false then
		self:SetNW2Bool( "FreshSwordH3", nil )
		self:SetSkin( 1 ) 
	end
	timer.Stop( "weapon_idle" .. self:EntIndex() )
	timer.Stop( "GrenadeThrow" .. self:EntIndex() )
	timer.Stop( "MeleeAttack" .. self:EntIndex() )
	timer.Stop( "SwordActivation" .. self:EntIndex() )
	timer.Stop( "FakeThink" .. self:EntIndex() )
	self:SetNW2Bool("HaloSWEPSEntIsEnemyVehicle", false )
	self:SetNW2Bool("HaloSWEPSEntIsOccupiedVehicle", false )
	self:StopSound("Halo3_ES.Melee")
	self:StopSound("Halo3_ES.Swing")
	self:StopSound("Halo3_ES.Melee_Empty")
	if self:GetNW2Int( "DrawSound" ) == 1 and IsFirstTimePredicted() then
		self:StopSound("Halo3_ES.DeployAlt")
	elseif self:GetNW2Int( "DrawSound" ) == 2 and IsFirstTimePredicted() then
		self:StopSound("Halo3_ES.Deploy")
	end
	if game.SinglePlayer() == true then
		self:StopSound("Halo3_ES.Deploy")
		self:StopSound("Halo3_ES.DeployAlt")
	end
	if IsValid(self.Owner) and self.Owner:IsBot() and self.Owner:GetActiveWeapon() == self then
		self.Owner.SetBotSpeedH3 = true
	end
	if IsValid(self.Owner) and self.Owner:GetActiveWeapon() == "halo3_sword" then
		if IsValid(self.Owner:GetViewModel()) then
			self.Owner:GetViewModel():SetSkin(0)
			self.Owner:SetRunSpeed( baseclass.Get( player_manager.GetPlayerClass(self.Owner) ).RunSpeed )
			self.Owner:SetWalkSpeed( baseclass.Get( player_manager.GetPlayerClass(self.Owner) ).WalkSpeed )
		end
	end
	return true
end

function SWEP:OnRemove()
self:Holster()
self:StopSound("Halo3_ES.Deploy")
self:StopSound("Halo3_ES.DeployAlt")
return true
end

function SWEP:OnDrop()
self:StopSound(self.SwordIdleSound)
self:Holster()
return true
end

function SWEP:OwnerChanged()
self:Holster()
if IsValid(self.Owner) and self.Owner:IsNPC() and SERVER then
self:SetSkin(1)
self:StopSound("Player.PickupWeapon")
timer.Simple( 1, function() if IsValid(self) and IsValid(self.Owner) then self.Owner:Give("h3_energysword_swep_ai") if IsValid(self.Owner:GetWeapon("h3_energysword_swep_ai")) then if self:Clip1() < self.Primary.ClipSize or self:GetNW2Int( "NPCClipH3" ) != -1 then self.Owner:GetWeapon("h3_energysword_swep_ai").Used = true end if self:GetNW2Int( "NPCClipH3" ) != -1 then self.Owner:GetWeapon("h3_energysword_swep_ai"):SetClip1(self:GetNW2Int("NPCClipH3")) else self.Owner:GetWeapon("h3_energysword_swep_ai"):SetClip1(self:Clip1()) end end SafeRemoveEntity(self) end end )
end
return true
end

function SWEP:Equip()
if IsValid(self.Owner) and self.Owner:IsNPC() then
self:StopSound("Player.PickupWeapon")
end
end

function SWEP:IdleFX()
if self.SwordFX < CurTime() then

	if self.EnergyPos == 1 then
		self.EnergyPos = 2
	elseif self.EnergyPos == 2 then
		self.EnergyPos = 3
	elseif self.EnergyPos == 3 then
		self.EnergyPos = 1
	end

	local effectdata = EffectData()
	effectdata:SetOrigin( self.Owner:GetShootPos() )
	effectdata:SetStart( self.Owner:GetShootPos() )
	effectdata:SetAttachment( self.EnergyPos )
	effectdata:SetEntity( self )

	if IsFirstTimePredicted() then
		util.Effect( "flash_swordfx_halo3", effectdata )
		self.SwordFX = CurTime() + 0.03
	end

end

end

function SWEP:Think()

if self.Owner:InVehicle() and self.Owner:GetAllowWeaponsInVehicle() == false then self:StopSound(self.SwordIdleSound) return end

if !IsValid(self) or !IsValid(self.Owner) then return end

if IsValid(self) and self:Clip1() > 0 and self:GetNextSwordEffect() < CurTime() and IsFirstTimePredicted() then
self.Owner:GetViewModel():SetSkin(0)
self:SetSkin(0)
elseif IsValid(self) and self:Clip1() <= 0 and IsFirstTimePredicted() then
timer.Stop( "SwordActivation" .. self:EntIndex() )
self:StopSound(self.SwordIdleSound)
self:SetSkin(1)
self.Owner:GetViewModel():SetSkin(1)
end

if IsValid(self) and IsValid(self.Owner) and self:GetSkin() == 0 and self:Clip1() > 0 and IsFirstTimePredicted() then
self:EmitSound(self.SwordIdleSound)
end

if IsValid(self) and IsValid(self.Owner) and self:GetSkin() == 0 and self:Clip1() > 0 and IsFirstTimePredicted() then
self:IdleFX()
if SERVER then

	local dynamicLight = ents.Create("light_dynamic")
	dynamicLight:SetColor(Color(93,73,236,255))
	dynamicLight:SetKeyValue("brightness", "4.5")
	dynamicLight:SetKeyValue("distance", "65")
	dynamicLight:SetPos(self:GetPos())
	dynamicLight:SetParent(self)
	dynamicLight:Spawn()
	dynamicLight:Activate()
	dynamicLight:Fire("TurnOn", "", 0)
	dynamicLight:Fire("TurnOff", "", 0.1)
	dynamicLight:Fire("Kill", "", 0.1)
	self:DeleteOnRemove(dynamicLight)
end

end

if self:GetNextIdle() != 0 and self:GetNextIdle() < CurTime() then
	self:SendWeaponAnim(ACT_VM_IDLE)
	self:SetNextIdle(0)
end

end