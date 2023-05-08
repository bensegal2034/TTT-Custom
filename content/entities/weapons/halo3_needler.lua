/*---------------------------------
H A L O 3 N E E D L E R
---------------------------------*/
if SERVER then
	AddCSLuaFile( "halo3_needler.lua" )
	AddCSLuaFile("entities/distant_weapon_gunfire_h3.lua")
	AddCSLuaFile("entities/melee_attack_h3.lua")
	AddCSLuaFile("entities/needle_h3.lua")
	AddCSLuaFile("entities/needle_inactive_h3.lua")
	AddCSLuaFile("effects/needler_pop_halo3/init.lua")
	AddCSLuaFile("effects/supercombine_halo3/init.lua")
	resource.AddFile("materials/effects/halo3/electric_arcs.vmt")
	resource.AddFile("materials/effects/halo3/explosive_burst.vmt")
	resource.AddFile("materials/effects/halo3/flash_large.vmt")
	resource.AddFile("materials/effects/halo3/muzzle_flash_round_gaseous.vmt")
	resource.AddFile("materials/models/chief_armsh3/plasma_smokeh3.vmt")
	resource.AddFile("materials/models/chief_armsh3/spartan_arm.vmt")
	resource.AddFile("materials/models/chief_armsh3/spartan_arm_normal.vtf")
	resource.AddFile("materials/models/needlerh3/crystal.vmt")
	resource.AddFile("materials/models/needlerh3/needler.vmt")
	resource.AddFile("materials/models/needlerh3/needler_bump.vtf")
	resource.AddFile("materials/models/needlerh3/needler_crystal_illum.vmt")
	resource.AddFile("materials/models/needlerh3/needler_crystal_illum_third.vmt")
	resource.AddFile("materials/models/needlerh3/needler_current.vmt")
	resource.AddFile("materials/models/needlerh3/needler_illum.vtf")
	resource.AddFile("materials/vgui/entities/halo3_needler.vmt")
	resource.AddFile("materials/vgui/halohud/h3/h3needler.vmt")
	resource.AddFile("materials/vgui/hud/halo3_needler.vmt")
	resource.AddFile("materials/vgui/ttt/icon_needler.vmt")
	resource.AddFile("models/halo3/needlerbolt.mdl")
	resource.AddFile("models/halo3/v_needler.mdl")
	resource.AddFile("models/halo3/w_needler.mdl")
	resource.AddFile("sound/halo3/needler_burst_1.ogg")
	resource.AddFile("sound/halo3/needler_burst_2.ogg")
	resource.AddFile("sound/halo3/needler_deploy.ogg")
	resource.AddFile("sound/halo3/needler_dryfire.ogg")
	resource.AddFile("sound/halo3/needler_expl.ogg")
	resource.AddFile("sound/halo3/needler_expl_dist_1.ogg")
	resource.AddFile("sound/halo3/needler_expl_dist_2.ogg")
	resource.AddFile("sound/halo3/needler_fire_1.ogg")
	resource.AddFile("sound/halo3/needler_fire_2.ogg")
	resource.AddFile("sound/halo3/needler_fire_dist_1.ogg")
	resource.AddFile("sound/halo3/needler_fire_dist_2.ogg")
	resource.AddFile("sound/halo3/needler_flyby.wav")
	resource.AddFile("sound/halo3/needler_impact_1.ogg")
	resource.AddFile("sound/halo3/needler_impact_2.ogg")
	resource.AddFile("sound/halo3/needler_impact_player_1.ogg")
	resource.AddFile("sound/halo3/needler_impact_player_2.ogg")
	resource.AddFile("sound/halo3/needler_melee_1.ogg")
	resource.AddFile("sound/halo3/needler_melee_2.ogg")
	resource.AddFile("sound/halo3/needler_reload.ogg")
	resource.AddWorkshop("1981371407")
end

SWEP.PrintName = "Needler"
    
SWEP.Author = "[BoZ]Niko663"
SWEP.Contact = "MasterChief@halo.com"
SWEP.Purpose = "Halo 3 Needler ported to Garry's Mod"
SWEP.Instructions = "Primary to shoot, Hold use and press Primary to throw grenades. Secondary to melee."

SWEP.Category = "Halo 3 Tags"

SWEP.Spawnable= true
SWEP.AutoSpawnable = false
SWEP.AdminSpawnable= true
SWEP.AdminOnly = false
SWEP.Kind = WEAPON_EQUIP2
SWEP.Icon = "vgui/ttt/icon_needler.mdl"
SWEP.ViewModelFOV = 60
SWEP.ViewModel = "models/halo3/v_needler.mdl" 
SWEP.WorldModel = "models/halo3/w_needler.mdl"
SWEP.ViewModelFlip = false
SWEP.CanBuy = { ROLE_TRAITOR }
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false

SWEP.EquipMenuData = {
	type = "Weapon",
	desc = "Hit multiple shots to trigger a large explosion"
};
SWEP.AllowDrop = true
SWEP.Slot = 1
SWEP.SlotPos = 1
 
SWEP.UseHands = false
SWEP.HoldType = "Revolver" 

SWEP.FiresUnderwater = false

SWEP.DrawCrosshair = false

SWEP.DrawAmmo = true

SWEP.Base = "weapon_base"


SWEP.GrenadeActive = false
SWEP.Primary.TakeAmmo = 1
SWEP.Primary.ClipSize = 19
SWEP.Primary.DefaultClip = 76
SWEP.Primary.MaxClip = 76
SWEP.Primary.Ammo = "AlyxGun"
SWEP.Primary.Automatic = true
SWEP.Primary.Recoil = 0.15
SWEP.Primary.Delay = 0.13

SWEP.Secondary.ClipSize = 0
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "Niko663HaloSWEPS.Grenades"
if (CLIENT) then
SWEP.WepSelectIcon = surface.GetTextureID( "vgui/entities/halo3_needler" )
killicon.Add( "halo3_needler", "VGUI/hud/halo3_needler", color_white )
end
SWEP.IsEquipment = true
SWEP.CSMuzzleFlashes = false

sound.Add(
{
    name = "Halo3_Needler.Deploy",
    channel = CHAN_WEAPON,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo3/needler_deploy.ogg"
})

sound.Add(
{
    name = "Halo3_Needler.SuperCombine",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo3/needler_expl.ogg"
})

sound.Add(
{
    name = "Halo3_Needler.FlyBy",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo3/needler_flyby.wav"
})

sound.Add({
	name =				"Halo3_Needler.Fire",
	channel =			CHAN_STATIC,
	volume =			1.0,
	soundlevel =			90,
	sound =				{"halo3/needler_fire_1.ogg", "halo3/needler_fire_2.ogg"}
})

sound.Add({
	name =				"Halo3_Needler.Melee",
	channel =			CHAN_STATIC,
	volume =			1.0,
	soundlevel =			80,
	sound =				{"halo3/needler_melee_1.ogg", "halo3/needler_melee_2.ogg"}
})

sound.Add(
{
    name = "Halo3_Needler.Reload",
    channel = CHAN_WEAPON,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo3/needler_reload.ogg"
})

sound.Add(
{
    name = "Halo3_Needler.DryFire",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo3/needler_dryfire.ogg"
})

function SWEP:IsEquipment()
	return WEPS.IsEquipment(self)
end

function SWEP:SetupDataTables()
self:NetworkVar( "Float", 0, "NextIdle" )
self:NetworkVar( "Float", 1, "NextNeedlerFireRateH3" )
end

function SWEP:Initialize()
        self:SetHoldType( self.HoldType )
	self:SetNextIdle(0)
	self:SetNextNeedlerFireRateH3(0)
	self:SetNW2Int( "NPCClipH3", -1 )
	self:SetNW2Bool( "DrawnNeedlerH3", false )
	self:SetNW2Int( "DisplayClipH3", 19 )
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
	LookTrace.endpos = LookTrace.start + (self.Owner:GetAimVector() * 500)
	LookTrace.filter = function( ent ) if ( ent == self or ent == self.Owner or ent:GetClass() == "melee_attack_h3" or ent:GetClass() == "flamethrower_fire_h3" or ent:GetClass() == "flamethrower_fire_h1" ) then return false elseif ( ent:IsNPC() or ent:IsPlayer() or ent:IsNextBot() or self:EntityIsVehicle(ent) or self.Owner:GetEyeTrace().SurfaceFlags != SURF_TRANS and self.Owner:GetEyeTrace().MatType != MAT_GLASS and self.Owner:GetEyeTrace().Contents != 268435458 ) then return true end end
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
	WallTrace.endpos = WallTrace.start + (self.Owner:GetAimVector() * 500)
	WallTrace.filter = function( ent ) if ( ent == self or ent == self.Owner or ent:GetClass() == "melee_attack_h3" or ent:GetClass() == "flamethrower_fire_h3" or ent:GetClass() == "flamethrower_fire_h1" ) then return false elseif ( ent:IsNPC() or ent:IsPlayer() or ent:IsNextBot() or self:EntityIsVehicle(ent) or IsValid(ent) or self.Owner:GetEyeTrace().SurfaceFlags != SURF_TRANS and self.Owner:GetEyeTrace().MatType != MAT_GLASS and self.Owner:GetEyeTrace().Contents != 268435458 ) then return true end end
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

function SWEP:CanBePickedUpByNPCs()
if GetGlobalBool( "H3SWEPSMounted" ) == true then
return true
else
return false
end
end

function SWEP:HaloReticle(tr)

	surface.SetTexture( surface.GetTextureID("vgui/halohud/h3/h3needler" ))
	if IsValid(tr.Entity) and tr.Entity:IsNPC() and self:GetNW2Bool( "HaloSWEPSEntIsFriendly" ) == true and self:GetNW2Bool( "HaloSWEPSEntIsVisible" ) == true or IsValid(tr.Entity) and tr.Entity:IsPlayer() and tr.Entity:Team() == self.Owner:Team() and tr.Entity:Team() != TEAM_UNASSIGNED and self:GetNW2Bool( "HaloSWEPSEntIsVisible" ) == true or IsValid(tr.Entity) and tr.Entity:GetNW2Bool( "HaloSWEPSEntIsNextBot" ) == true and self:GetNW2Bool( "HaloSWEPSEntIsFriendlyNB" ) == true and self:GetNW2Bool( "HaloSWEPSEntIsVisible" ) == true or IsValid(tr.Entity) and self:EntityIsVehicle(tr.Entity) and self:GetNW2Bool( "HaloSWEPSEntIsEnemyVehicle" ) == false and self:GetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle" ) == true and self:GetNW2Bool( "HaloSWEPSEntIsVisible" ) == true then
	surface.SetDrawColor( 0, 255, 0, 255 )
	elseif IsValid(tr.Entity) and tr.Entity:IsNPC() and self:GetNW2Bool( "HaloSWEPSEntIsFriendly" ) == false and self:GetNW2Bool( "HaloSWEPSEntIsVisible" ) == true or tr.Entity:IsPlayer() and tr.Entity:Team() != self.Owner:Team() and self:GetNW2Bool( "HaloSWEPSEntIsVisible" ) == true or IsValid(tr.Entity) and tr.Entity:IsPlayer() and tr.Entity:Team() == TEAM_UNASSIGNED and self:GetNW2Bool( "HaloSWEPSEntIsVisible" ) == true or IsValid(tr.Entity) and tr.Entity:GetNW2Bool( "HaloSWEPSEntIsNextBot" ) == true and self:GetNW2Bool( "HaloSWEPSEntIsFriendlyNB" ) == false and self:GetNW2Bool( "HaloSWEPSEntIsVisible" ) == true or IsValid(tr.Entity) and self:EntityIsVehicle(tr.Entity) and self:GetNW2Bool( "HaloSWEPSEntIsEnemyVehicle" ) == true and self:GetNW2Bool( "HaloSWEPSEntIsOccupiedVehicle" ) == true and self:GetNW2Bool( "HaloSWEPSEntIsVisible" ) == true then
	surface.SetDrawColor( 255, 0, 0, 255 )
	else
	surface.SetDrawColor( 141, 192, 235, 255 )
	end
	surface.DrawTexturedRect( ScrW()/2 - 110, ScrH()/2 - 74, 220, 150 )

end

function SWEP:DrawHUD()
	
	if self.Owner:InVehicle() and self.Owner:GetAllowWeaponsInVehicle() == false or GetViewEntity() != self.Owner then return end

		local LookTrace = {}
	LookTrace.start = self.Owner:GetShootPos()
	LookTrace.endpos = LookTrace.start + (self.Owner:GetAimVector() * 550)
	LookTrace.filter = function( ent ) if ( ent == self or ent == self.Owner or ent:GetClass() == "melee_attack_h3" or ent:GetClass() == "flamethrower_fire_h3" or ent:GetClass() == "flamethrower_fire_h1" ) then return false elseif ( ent:IsNPC() or ent:IsPlayer() or ent:IsNextBot() or self:EntityIsVehicle(ent) or self.Owner:GetEyeTrace().SurfaceFlags != SURF_TRANS and self.Owner:GetEyeTrace().MatType != MAT_GLASS and self.Owner:GetEyeTrace().Contents != 268435458 ) then return true end end
	LookTrace.mask = MASK_SHOT
	self.Owner:LagCompensation(true)
	local looktr = util.TraceLine(LookTrace)
	self.Owner:LagCompensation(false)

	if looktr.SurfaceFlags == SURF_TRANS or looktr.MatType == MAT_GLASS or looktr.Contents == 268435458 or looktr.Entity:IsNPC() or looktr.Entity:IsPlayer() or looktr.Entity:IsNextBot() or self:EntityIsVehicle(looktr.Entity) then

		local Trace = {}
	Trace.start = self.Owner:GetShootPos()
	Trace.endpos = Trace.start + (self.Owner:GetAimVector() * 550)
	Trace.filter = function( ent ) if ( ent == self or ent == self.Owner or ent:GetClass() == "melee_attack_h3" or ent:GetClass() == "flamethrower_fire_h3" or ent:GetClass() == "flamethrower_fire_h1" ) then return false elseif ( ent:IsNPC() or ent:IsPlayer() or ent:IsNextBot() or self:EntityIsVehicle(ent) or self.Owner:GetEyeTrace().SurfaceFlags != SURF_TRANS and self.Owner:GetEyeTrace().MatType != MAT_GLASS and self.Owner:GetEyeTrace().Contents != 268435458 ) then return true end end
	Trace.mask = MASK_SHOT
	Trace.ignoreworld = true
	self.Owner:LagCompensation(true)
	local tr = util.TraceLine(Trace)
	self.Owner:LagCompensation(false)
	
	self:HaloReticle(tr)
	else
		local Trace = {}
	Trace.start = self.Owner:GetShootPos()
	Trace.endpos = Trace.start + (self.Owner:GetAimVector() * 550)
	Trace.filter = function( ent ) if ( IsEntity(ent) ) then return false end end
	Trace.mask = MASK_SHOT
	self.Owner:LagCompensation(true)
	local tr = util.TraceLine(Trace)
	self.Owner:LagCompensation(false)
	
	self:HaloReticle(tr)
	end

end

function SWEP:Reload()
       if ( self:Clip1() ~= self.Primary.ClipSize and self:Ammo1() ~= 0 ) then
			self:SetHoldType("pistol")
			self:SetNextNeedlerFireRateH3(0)
			self:SetNextIdle(0)
			timer.Stop( "weapon_idle" .. self:EntIndex() )
			timer.Stop( "MeleeAttack" .. self:EntIndex() )
			timer.Stop( "GrenadeThrow" .. self:EntIndex() )
		        self:DefaultReload( ACT_VM_RELOAD )
			if IsFirstTimePredicted() and SERVER and !self.Owner:IsListenServerHost()  then
			timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration() / self.Owner:GetViewModel():GetPlaybackRate() - 0.1, 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
			elseif IsFirstTimePredicted() and SERVER and self.Owner:IsListenServerHost() and !game.SinglePlayer()  then
			timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration() / self.Owner:GetViewModel():GetPlaybackRate() - 0.17, 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
			elseif IsFirstTimePredicted() and game.SinglePlayer() then
			timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration(), 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
			end 
			self:EmitSound("Halo3_Needler.Reload")
			self:StopSound("Halo3_Needler.Deploy")
			self:StopSound("Halo3_Needler.Melee")
			timer.Create( "ReloadAnim" .. self:EntIndex(), 1, 1, function() if IsValid(self) then self:SetHoldType( self.HoldType ) end end )                                        
			timer.Create( "ReloadAnimFP" .. self:EntIndex(), 0.67, 1, function() if IsValid(self) then if self:Ammo1() >= 19 then self:SetNW2Int( "DisplayClipH3", 19 ) else self:SetNW2Int( "DisplayClipH3", self:Ammo1() ) end end end )
			self.Primary.Delay = 0.13
	end
end

function SWEP:Deploy()
	if self:GetNW2Int( "NPCClipH3" ) != -1 and self:GetNW2Int( "NPCClipH3" ) < self.Primary.ClipSize then
	self:SetClip1(self:GetNW2Int("NPCClipH3"))
	end
	self:SetNW2Int( "NPCClipH3", -1 )
	if (IsValid(self.Owner:GetViewModel())) then
	self.Owner:GetViewModel():SetWeaponModel( self.ViewModel, self )
	end
	self:SetNW2Bool( "DrawnNeedlerH3", true )
	self:SetNextNeedlerFireRateH3(0)
	timer.Stop( "weapon_idle" .. self:EntIndex() )
	timer.Stop( "ReloadAnimFP" .. self:EntIndex() )
	self:SetNextIdle(0)
	self:SendWeaponAnim( ACT_VM_DRAW )
	self:SetNextPrimaryFire( CurTime() + self:SequenceDuration() )
	self:EmitSound("Halo3_Needler.Deploy")
	if IsFirstTimePredicted() and SERVER and !self.Owner:IsListenServerHost()  then
	timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration() / self.Owner:GetViewModel():GetPlaybackRate() - 0.07, 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
	elseif IsFirstTimePredicted() and SERVER and self.Owner:IsListenServerHost() and !game.SinglePlayer()  then
	timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration() / self.Owner:GetViewModel():GetPlaybackRate() - 0.17, 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
	elseif IsFirstTimePredicted() and game.SinglePlayer() then
	timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration(), 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
	end
	self.Primary.Delay = 0.13
	timer.Create( "FakeThink" .. self:EntIndex(), 0, 0, function()
	if !IsValid(self) or !IsValid(self.Owner) then return end

	if self:GetSequenceActivity(self:GetSequence()) != ACT_VM_RELOAD then
	self:SetNW2Int( "DisplayClipH3", self:Clip1() )
	end
	
	if self:GetNW2Int("DisplayClipH3") >= 19 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0,0,0) )
	elseif self:GetNW2Int("DisplayClipH3") == 18 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0,0,-0.1) )
	elseif self:GetNW2Int("DisplayClipH3") == 17 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0,0,-0.15) )
	elseif self:GetNW2Int("DisplayClipH3") == 16 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0,0,-0.2) )
	elseif self:GetNW2Int("DisplayClipH3") == 15 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0,0,-0.25) )
	elseif self:GetNW2Int("DisplayClipH3") == 14 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0.1,0,-0.3) )
	elseif self:GetNW2Int("DisplayClipH3") == 13 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0.1,-0.28,-0.35) )
	elseif self:GetNW2Int("DisplayClipH3") == 12 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0.25,-0.2,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0.25,-0.32,-0.45) )
	elseif self:GetNW2Int("DisplayClipH3") == 11 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0.25,-0.25,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0.25,-0.35,-0.5) )
	elseif self:GetNW2Int("DisplayClipH3") == 10 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0.25,-0.3,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0.38,-0.35,-0.55) )
	elseif self:GetNW2Int("DisplayClipH3") == 9 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0.25,-0.3,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0.5,-0.4,-0.6) )
	elseif self:GetNW2Int("DisplayClipH3") == 8 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0.25,-0.3,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0.5,-0.2,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0.8,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0.6,-0.43,-0.7) )
	elseif self:GetNW2Int("DisplayClipH3") == 7 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0.5,-0.4,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0.5,-0.2,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(1,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0.9,-0.5,-0.85) )
	elseif self:GetNW2Int("DisplayClipH3") == 6 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0.7,-0.5,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0.5,-0.2,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(1.2,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(1.1,-0.7,-1.05) )
	elseif self:GetNW2Int("DisplayClipH3") == 5 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,-0.1,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,-0.5,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(1.4,-0.5,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(1,-0.5,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(1.4,0,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(1.5,-0.75,-1.3) )
	elseif self:GetNW2Int("DisplayClipH3") == 4 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,-0.2,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,-0.75,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0.2,0,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(1,-0.7,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(1.3,-0.2,-1.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(1.5,0,-1.5)	)
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(1.6,-0.85,-1.5) )
	elseif self:GetNW2Int("DisplayClipH3") == 3 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0.5,0,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,-0.9,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0.7,0,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(1.3,-0.9,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(1.9,-0.7,-1.86) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(1.7,0,-1.75)	)
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(1.85,-0.85,-1.75) )
	elseif self:GetNW2Int("DisplayClipH3") == 2 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0.5,0,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,-0.5,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,-1.2,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0.8,0,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(1.5,-0.8,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(2.2,-1,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(2.1,0,-2)	)
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(2.25,-1.1,-2) )
	elseif self:GetNW2Int("DisplayClipH3") == 1 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(1.1,0,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,-0.7,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,-1.4,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(1.85,-0.5,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(2,0,-3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(1,-1.05,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(5,2,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(3,0,-2.6)	)
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(5,-0.8,-2.6) )
	elseif self:GetNW2Int("DisplayClipH3") <= 0 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(-1000,5000,-1000) )
	end

		local HomingTrace = {}
	HomingTrace.start = self.Owner:GetShootPos()
	HomingTrace.endpos = HomingTrace.start + (self.Owner:GetAimVector() * 550)
	HomingTrace.filter = { self.Owner, self, 0 }
	HomingTrace.mask = MASK_SHOT
	self.Owner:LagCompensation(true)
	local homingtr = util.TraceLine(HomingTrace)
	self.Owner:LagCompensation(false)

		local LookTrace = {}
	LookTrace.start = self.Owner:GetShootPos()
	LookTrace.endpos = LookTrace.start + (self.Owner:GetAimVector() * 550)
	LookTrace.filter = function( ent ) if ( ent == self or ent == self.Owner or ent:GetClass() == "melee_attack_h3" or ent:GetClass() == "flamethrower_fire_h3" or ent:GetClass() == "flamethrower_fire_h1" ) then return false elseif ( ent:IsNPC() or ent:IsPlayer() or ent:IsNextBot() or self:EntityIsVehicle(ent) or self.Owner:GetEyeTrace().SurfaceFlags != SURF_TRANS and self.Owner:GetEyeTrace().MatType != MAT_GLASS and self.Owner:GetEyeTrace().Contents != 268435458 ) then return true end end
	LookTrace.mask = MASK_SHOT
	self.Owner:LagCompensation(true)
	local looktr = util.TraceLine(LookTrace)
	self.Owner:LagCompensation(false)

	if SERVER and IsValid(looktr.Entity) and looktr.Entity:IsNPC() and looktr.Entity:Disposition(self.Owner) == 1 or SERVER and IsValid(looktr.Entity) and looktr.Entity:IsNPC() and looktr.Entity:Disposition(self.Owner) == 2 or SERVER and looktr.Entity:IsPlayer() and looktr.Entity:Team() != self.Owner:Team() or SERVER and looktr.Entity:IsPlayer() and looktr.Entity:Team() == TEAM_UNASSIGNED or looktr.Entity:IsNextBot() and looktr.Entity.Enemy == self.Owner or self:EntityIsVehicle(looktr.Entity) and self:EntityIsEnemyVehicle(looktr.Entity) and self:IsVehicleOccupied(looktr.Entity) then
	if IsValid(self.Owner:GetEyeTrace().Entity) and self.Owner:GetEyeTrace().Entity == looktr.Entity and self.Owner:GetEyeTrace().MatType != MAT_GRATE then
	self:SetNW2Entity("NeedlerTargetH3", looktr.Entity )
	end
	else
	self:SetNW2Entity("NeedlerTargetH3", NULL )
	end

	self:IsVehicleOccupied(looktr.Entity)
	self:EntityIsEnemyVehicle(looktr.Entity)
	self:IsEntVisible(looktr.Entity)

	if looktr.SurfaceFlags == SURF_TRANS or looktr.MatType == MAT_GLASS or looktr.Contents == 268435458 or looktr.Entity:IsNPC() or looktr.Entity:IsPlayer() or looktr.Entity:IsNextBot() then
	
		local Trace = {}
	Trace.start = self.Owner:GetShootPos()
	Trace.endpos = Trace.start + (self.Owner:GetAimVector() * 550)
	Trace.filter = function( ent ) if ( ent == self or ent == self.Owner or ent:GetClass() == "melee_attack_h3" or ent:GetClass() == "flamethrower_fire_h3" or ent:GetClass() == "flamethrower_fire_h1" ) then return false elseif ( ent:IsNPC() or ent:IsPlayer() or ent:IsNextBot() or self:EntityIsVehicle(ent) or self.Owner:GetEyeTrace().SurfaceFlags != SURF_TRANS and self.Owner:GetEyeTrace().MatType != MAT_GLASS and self.Owner:GetEyeTrace().Contents != 268435458 ) then return true end end
	Trace.mask = MASK_SHOT
	Trace.ignoreworld = true
	self.Owner:LagCompensation(true)
	local tr = util.TraceLine(Trace)
	self.Owner:LagCompensation(false)
	self:IsVehicleOccupied(tr.Entity)
	self:EntityIsEnemyVehicle(tr.Entity)
	self:IsEntVisible(tr.Entity)

	if SERVER and IsValid(tr.Entity) and tr.Entity:IsNPC() and tr.Entity:Disposition(self.Owner) == 3 and self:GetNW2Bool( "HaloSWEPSEntIsFriendly" ) != true then
	self:SetNW2Bool( "HaloSWEPSEntIsFriendly", false )
	elseif SERVER and IsValid(tr.Entity) and tr.Entity:IsNPC() and tr.Entity:Disposition(self.Owner) == 4 and self:GetNW2Bool( "HaloSWEPSEntIsFriendly" ) != true then
	self:SetNW2Bool( "HaloSWEPSEntIsFriendly", false )
	end

	if SERVER and IsValid(tr.Entity) and tr.Entity:IsNPC() and tr.Entity:Disposition(self.Owner) == 2 and self:GetNW2Bool( "HaloSWEPSEntIsFriendly" ) != false then
	self:SetNW2Bool( "HaloSWEPSEntIsFriendly", false )
	elseif SERVER and IsValid(tr.Entity) and tr.Entity:IsNPC() and tr.Entity:Disposition(self.Owner) == 1 and self:GetNW2Bool( "HaloSWEPSEntIsFriendly" ) != false then
	self:SetNW2Bool( "HaloSWEPSEntIsFriendly", false )
	end

	if SERVER and IsValid(tr.Entity) and tr.Entity:IsNextBot() and tr.Entity.Enemy == self.Owner and self:GetNW2Bool( "HaloSWEPSEntIsFriendlyNB" ) != false then
	self:SetNW2Bool( "HaloSWEPSEntIsFriendlyNB", false )
	elseif SERVER and IsValid(tr.Entity) and tr.Entity:IsNextBot() and tr.Entity.Enemy != self.Owner and self:GetNW2Bool( "HaloSWEPSEntIsFriendlyNB" ) != true then
	self:SetNW2Bool( "HaloSWEPSEntIsFriendlyNB", false )
	end

end end )
	return true
end 

function SWEP:PrimaryAttack()
 
	if IsValid(self.Owner) and self.Owner:IsNPC() then return end

	if self.Owner:KeyDown(IN_USE) and self.GrenadeActive == true then

		self:SetNextIdle(0)
		self.Primary.Delay = 0.13
		timer.Stop( "weapon_idle" .. self:EntIndex() )
		timer.Stop( "MeleeAttack" .. self:EntIndex() )
		timer.Stop( "ReloadAnimFP" .. self:EntIndex() )
		self:SetNextNeedlerFireRateH3(0)
		self:SendWeaponAnim(ACT_VM_SECONDARYATTACK)
		self:SetNextPrimaryFire( CurTime() + 1.35 )
		self:SetNextSecondaryFire(CurTime() + 1.05)
		timer.Create( "GrenadeThrow" .. self:EntIndex(), 0.2, 1, function() self:ThrowGrenade() end )
		self.Owner:DoAnimationEvent(ACT_GMOD_GESTURE_ITEM_THROW);
		self:EmitSound("Halo3_Nade.Throw")
		if IsFirstTimePredicted() and SERVER and !self.Owner:IsListenServerHost()  then
			timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration() / self.Owner:GetViewModel():GetPlaybackRate() - 0.05, 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
		elseif IsFirstTimePredicted() and SERVER and self.Owner:IsListenServerHost() and !game.SinglePlayer()  then
			timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration() / self.Owner:GetViewModel():GetPlaybackRate() - 0.17, 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
		elseif IsFirstTimePredicted() and game.SinglePlayer() then
			timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration(), 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
		end 

	else
 
	if ( !self:CanPrimaryAttack() ) then return end

	if game.SinglePlayer() == true then
	self.ShakeStrength = 0.5
	self.ShakeDuration = 0.4
	self.ShakeDist = 0
	else
	self.ShakeDist = 1
	self.ShakeStrength = 0.08
	self.ShakeDuration = 0.25
	end

	self:SetNextIdle(0)
	timer.Stop( "weapon_idle" .. self:EntIndex() )
	self:FireNeedle()
	self:Muzzle()
	if SERVER then
	local DistantFire = ents.Create("distant_weapon_gunfire_h3")
		if !IsValid(DistantFire) then return end
		DistantFire:SetAngles(self.Owner:GetAimVector():Angle(90,90,0))
		DistantFire:SetPos(self:GetPos())
		DistantFire:SetOwner(self.Owner)
		DistantFire.Owner = self.Owner
		DistantFire:SetMaxHealth(80)
		DistantFire:Spawn()
		DistantFire:Activate()
	end
	self:EmitSound("Halo3_Needler.Fire")
	self:ShootEffects()
	self:SetNW2Int( "DisplayClipH3", self:GetNW2Int( "DisplayClipH3" ) - 1 )
	if IsFirstTimePredicted() and SERVER and !self.Owner:IsListenServerHost()  then
		timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration() / self.Owner:GetViewModel():GetPlaybackRate() - 0.1, 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
	elseif IsFirstTimePredicted() and SERVER and self.Owner:IsListenServerHost() and !game.SinglePlayer()  then
		timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration() / self.Owner:GetViewModel():GetPlaybackRate() - 0.13, 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
	elseif IsFirstTimePredicted() and game.SinglePlayer() then
		timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration(), 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
	end 
	self:TakePrimaryAmmo(1)

	if (CLIENT and IsFirstTimePredicted()) then
		self.Owner:SetEyeAngles( self.Owner:EyeAngles() + Angle(-0.05,0,0) )	
	end
	if game.SinglePlayer() == true then
		self.Owner:SetEyeAngles( self.Owner:EyeAngles() + Angle(-0.05,0,0) )
	end
	util.ScreenShake( self.Owner:GetPos(), self.ShakeStrength, 0.3, self.ShakeDuration, self.ShakeDist )
	self.Owner:ViewPunch( Angle( self.Primary.Recoil * -1, 0, 0 ) )

	if self:GetNextNeedlerFireRateH3() == 0 then
		self:SetNextNeedlerFireRateH3(CurTime() + 0.5)
	end

		self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
		self:SetNextSecondaryFire( CurTime() + self.Primary.Delay ) 
	end 
end

function SWEP:SecondaryAttack()

if IsValid(self:GetNW2Entity("NeedlerTargetH3")) then
LungeRange = (self:GetNW2Entity("NeedlerTargetH3"):GetPos()-self.Owner:GetPos()):Length()
end

if IsValid(self:GetNW2Entity("NeedlerTargetH3")) and LungeRange <= 95 then
self.Owner:SetVelocity(self.Owner:GetForward() * 460 )
timer.Create( "MeleeAttack" .. self:EntIndex(), 0.1, 1, function() self:MeleeHit() end )
end

if !IsValid(self:GetNW2Entity("NeedlerTargetH3")) or LungeRange > 95 then
self:MeleeHit()
end

self:SetNextIdle(0)
timer.Stop( "GrenadeThrow" .. self:EntIndex() )
timer.Stop( "weapon_idle" .. self:EntIndex() )
timer.Stop( "ReloadAnimFP" .. self:EntIndex() )
self:SetNextNeedlerFireRateH3(0)
self.Primary.Delay = 0.13
self:SendWeaponAnim(ACT_VM_HITCENTER)
self:SetNextSecondaryFire(CurTime() + 1)
self:SetNextPrimaryFire( CurTime() + 1 )
if IsFirstTimePredicted() and SERVER and !self.Owner:IsListenServerHost()  then
	timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration() / self.Owner:GetViewModel():GetPlaybackRate() - 0.05, 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
	elseif IsFirstTimePredicted() and SERVER and self.Owner:IsListenServerHost() and !game.SinglePlayer()  then
	timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration() / self.Owner:GetViewModel():GetPlaybackRate() - 0.17, 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
	elseif IsFirstTimePredicted() and game.SinglePlayer() then
	timer.Create( "weapon_idle" .. self:EntIndex(), self.Owner:GetViewModel():SequenceDuration(), 1, function() if ( IsValid( self ) ) then self:SetNextIdle(CurTime()) end end )
	end 
self.Owner:DoAnimationEvent(ACT_GMOD_GESTURE_MELEE_SHOVE_2HAND);
self:EmitSound("Halo3_Needler.Melee")
self:StopSound("Halo3_Needler.Deploy")


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

function SWEP:Muzzle()
local effectdata = EffectData()
effectdata:SetAttachment( 1 )
effectdata:SetEntity( self )
effectdata:SetFlags(0)
if IsFirstTimePredicted() then
util.Effect( "flash_muzzle_halo3", effectdata )
end

if SERVER then

	local muzzleEffect = ents.Create("light_dynamic")
	muzzleEffect:SetColor(Color(254,50,227,255))
	muzzleEffect:SetKeyValue("brightness", "3")
	muzzleEffect:SetKeyValue("distance", "102")
	muzzleEffect:SetPos(self:GetPos())
	muzzleEffect:SetParent(self)
	muzzleEffect:Spawn()
	muzzleEffect:Activate()
	muzzleEffect:Fire("TurnOn", "", 0)
	muzzleEffect:Fire("TurnOff", "", 0.1)
	muzzleEffect:Fire("Kill", "", 0.1)
	self:DeleteOnRemove(muzzleEffect)
end

end

function SWEP:FireNeedle()

	if IsFirstTimePredicted() then
	
	local aim = self.Owner:GetAimVector()
	local side = aim:Cross(Vector(0,0,1))
	local up = side:Cross(aim)
	local pos = self.Owner:GetShootPos() + side * 8.5 + up * -5

	if SERVER then
	local needle = ents.Create("needle_h3")
	if !IsValid(needle) then return end
	needle:SetAngles(self.Owner:GetAimVector():Angle(90,90,0))
	needle:SetPos(pos)
	needle:SetOwner(self.Owner)
	needle:Spawn()
	needle.Owner = self.Owner
	needle:Activate()
	if IsValid(self:GetNW2Entity("NeedlerTargetH3")) and self.Owner:GetEyeTrace().Entity == self:GetNW2Entity("NeedlerTargetH3") then
	if scripted_ents.IsBasedOn( self:GetNW2Entity("NeedlerTargetH3"):GetClass(), "sent_sakarias_carwheel" ) and IsEntity(self:GetNW2Entity("NeedlerTargetH3").SCarOwner) and IsValid(self:GetNW2Entity("NeedlerTargetH3").SCarOwner) or self:GetNW2Entity("NeedlerTargetH3"):GetClass() == "sent_sakarias_carwheel" and IsEntity(self:GetNW2Entity("NeedlerTargetH3").SCarOwner) and IsValid(self:GetNW2Entity("NeedlerTargetH3").SCarOwner) then
	needle:SetNW2Entity( "HomingTargetH3", self:GetNW2Entity("NeedlerTargetH3").SCarOwner )
	elseif self:GetNW2Entity("NeedlerTargetH3"):GetClass() == "gmod_sent_vehicle_fphysics_wheel" and IsValid(self:GetNW2Entity("NeedlerTargetH3"):GetBaseEnt()) then
	needle:SetNW2Entity( "HomingTargetH3", self:GetNW2Entity("NeedlerTargetH3"):GetBaseEnt() )
	else
	needle:SetNW2Entity( "HomingTargetH3", self:GetNW2Entity("NeedlerTargetH3") )
	end
	end
		local phys = needle:GetPhysicsObject()
			phys:SetVelocity(self.Owner:GetAimVector() * 1700 + self.Owner:GetUp() * math.random(-22,22) + self.Owner:GetRight() * math.random(-21,21) )
	end

end

end

function SWEP:Holster()
if IsValid(self.Owner) and self.Owner:IsNPC() then self:StopSound("Halo3_Needler.Deploy") return end
self:SetHoldType( self.HoldType )
if IsFirstTimePredicted() and IsValid(self.Owner) and self.Owner:GetActiveWeapon() == self then
self:EmitSound("Halo3_Weapon.StopSound")
end
timer.Stop( "weapon_idle" .. self:EntIndex() )
timer.Stop( "ReloadAnim" .. self:EntIndex() )
timer.Stop( "ReloadAnimFP" .. self:EntIndex() )
timer.Stop( "MeleeAttack" .. self:EntIndex() )
timer.Stop( "GrenadeThrow" .. self:EntIndex() )
timer.Stop( "FakeThink" .. self:EntIndex() )
timer.Stop( "NeedleThink" .. self:EntIndex() )
if IsValid(self.Owner) and IsValid(self.Owner:GetViewModel()) and self.Owner:GetActiveWeapon() == self and self:GetNW2Bool( "DrawnNeedlerH3" ) == true and game.SinglePlayer() == false then
self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,0) )
self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,0) )
self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,0) )
self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,0) )
self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,0) )
self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,0) )
self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,0) )
self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,0) )
self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,0) )
self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,0) )
self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0,0,0) )
self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,0) )
self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,0) )
self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0,0,0) )
end
self:SetNW2Bool("HaloSWEPSEntIsEnemyVehicle", false )
self:SetNW2Bool("HaloSWEPSEntIsOccupiedVehicle", false )
self:StopSound("Halo3_Needler.Reload")
self:StopSound("Halo3_Needler.Melee")
self:SetNextNeedlerFireRateH3(0)
return true
end

function SWEP:CanPrimaryAttack()

	if ( self:Clip1() <= 0 ) then
	
		self:EmitSound( "Halo3_Needler.DryFire" )
		self:SetNextPrimaryFire( CurTime() + 0.3 )
		self:Reload()
		return false
		
	end

	return true

end

function SWEP:OnRemove()
self:Holster()
end

function SWEP:OnDrop()
self:Holster()
end

function SWEP:OwnerChanged()
self:Holster()
if !IsValid(self.Owner) then
self:StopSound("Halo3_Needler.Deploy")
end
if IsValid(self.Owner) and self.Owner:IsNPC() and SERVER then
self:StopSound("Player.PickupWeapon")
self:EmitSound("Halo3_Needler.Deploy")
timer.Simple( 1, function() if IsValid(self) and IsValid(self.Owner) then self.Owner:Give("h3_needler_swep_ai") if IsValid(self.Owner:GetWeapon("h3_needler_swep_ai")) then self.Owner:GetWeapon("h3_needler_swep_ai").PickedUp = true if self:GetNW2Int( "NPCClipH3" ) != -1 then self.Owner:GetWeapon("h3_needler_swep_ai"):SetClip1(self:GetNW2Int("NPCClipH3")) else self.Owner:GetWeapon("h3_needler_swep_ai"):SetClip1(self:Clip1()) end end SafeRemoveEntity(self) end end )
end
end

function SWEP:Equip()
if IsValid(self.Owner) and self.Owner:IsNPC() then
self:StopSound("Player.PickupWeapon")
end
end

function SWEP:SetNeedlePos()
	timer.Create( "NeedleThink" .. self:EntIndex(), 0, 0, function()
	if !IsValid(self) or !IsValid(self.Owner) then return end
	if self:GetSequenceActivity(self:GetSequence()) != ACT_VM_RELOAD then
	self:SetNW2Int( "DisplayClipH3", self:Clip1() )
	end
	if self:GetNW2Int("DisplayClipH3") >= 19 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0,0,0) )
	elseif self:GetNW2Int("DisplayClipH3") == 18 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0,0,-0.1) )
	elseif self:GetNW2Int("DisplayClipH3") == 17 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0,0,-0.15) )
	elseif self:GetNW2Int("DisplayClipH3") == 16 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0,0,-0.2) )
	elseif self:GetNW2Int("DisplayClipH3") == 15 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0,0,-0.25) )
	elseif self:GetNW2Int("DisplayClipH3") == 14 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0.1,0,-0.3) )
	elseif self:GetNW2Int("DisplayClipH3") == 13 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0.1,-0.28,-0.35) )
	elseif self:GetNW2Int("DisplayClipH3") == 12 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0.25,-0.2,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0.25,-0.32,-0.45) )
	elseif self:GetNW2Int("DisplayClipH3") == 11 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0.25,-0.25,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0.25,-0.35,-0.5) )
	elseif self:GetNW2Int("DisplayClipH3") == 10 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0.25,-0.3,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0.38,-0.35,-0.55) )
	elseif self:GetNW2Int("DisplayClipH3") == 9 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0.25,-0.3,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0.5,-0.4,-0.6) )
	elseif self:GetNW2Int("DisplayClipH3") == 8 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0.25,-0.3,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0.5,-0.2,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0.8,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0.6,-0.43,-0.7) )
	elseif self:GetNW2Int("DisplayClipH3") == 7 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0.5,-0.4,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0.5,-0.2,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(1,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0.9,-0.5,-0.85) )
	elseif self:GetNW2Int("DisplayClipH3") == 6 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0.7,-0.5,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0.5,-0.2,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(1.2,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(1.1,-0.7,-1.05) )
	elseif self:GetNW2Int("DisplayClipH3") == 5 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,-0.1,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,-0.5,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(1.4,-0.5,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(1,-0.5,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(1.4,0,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(1.5,-0.75,-1.3) )
	elseif self:GetNW2Int("DisplayClipH3") == 4 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,-0.2,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,-0.75,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0.2,0,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(1,-0.7,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(1.3,-0.2,-1.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(1.5,0,-1.5)	)
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(1.6,-0.85,-1.5) )
	elseif self:GetNW2Int("DisplayClipH3") == 3 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0.5,0,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,-0.9,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0.7,0,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(1.3,-0.9,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(1.9,-0.7,-1.86) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(1.7,0,-1.75)	)
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(1.85,-0.85,-1.75) )
	elseif self:GetNW2Int("DisplayClipH3") == 2 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0.5,0,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,-0.5,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,-1.2,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0.8,0,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(1.5,-0.8,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(2.2,-1,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(2.1,0,-2)	)
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(2.25,-1.1,-2) )
	elseif self:GetNW2Int("DisplayClipH3") == 1 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(1.1,0,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,-0.7,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,-1.4,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(1.85,-0.5,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(2,0,-3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(1,-1.05,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(5,2,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(3,0,-2.6)	)
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(5,-0.8,-2.6) )
	elseif self:GetNW2Int("DisplayClipH3") <= 0 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(-1000,5000,-1000) )
	end
	end )
end

function SWEP:Think()

	if self.Owner:InVehicle() and self.Owner:GetAllowWeaponsInVehicle() == false then return end

	if self:GetNextIdle() ~= 0 and self:GetNextIdle() < CurTime() then
		self:SendWeaponAnim( ACT_VM_IDLE )
		self:SetNextIdle(0)
	end

	if self.Owner:KeyReleased(IN_ATTACK) then
	self:SetNextNeedlerFireRateH3(0)
	self.Primary.Delay = 0.13
	end

	if self:GetNextNeedlerFireRateH3() ~= 0 and self:GetNextNeedlerFireRateH3() < CurTime() then
	self:SetNextNeedlerFireRateH3(0)
	self.Primary.Delay = 0.08
	end

	if self:GetSequenceActivity(self:GetSequence()) != ACT_VM_RELOAD then
	self:SetNW2Int( "DisplayClipH3", self:Clip1() )
	end
	
	if self.NeedlePosThink != true then
	self.NeedlePosThink = true
	self:SetNeedlePos()
	end

	if self:GetNW2Int("DisplayClipH3") >= 19 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,0) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0,0,0) )
	elseif self:GetNW2Int("DisplayClipH3") == 18 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,-0.1) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0,0,-0.1) )
	elseif self:GetNW2Int("DisplayClipH3") == 17 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,-0.15) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0,0,-0.15) )
	elseif self:GetNW2Int("DisplayClipH3") == 16 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,-0.2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0,0,-0.2) )
	elseif self:GetNW2Int("DisplayClipH3") == 15 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,-0.25) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0,0,-0.25) )
	elseif self:GetNW2Int("DisplayClipH3") == 14 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,-0.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0.1,0,-0.3) )
	elseif self:GetNW2Int("DisplayClipH3") == 13 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,-0.35) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0.1,-0.28,-0.35) )
	elseif self:GetNW2Int("DisplayClipH3") == 12 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0.25,-0.2,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,-0.45) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0.25,-0.32,-0.45) )
	elseif self:GetNW2Int("DisplayClipH3") == 11 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0.25,-0.25,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,-0.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0.25,-0.35,-0.5) )
	elseif self:GetNW2Int("DisplayClipH3") == 10 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0.25,-0.3,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,-0.55) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0.38,-0.35,-0.55) )
	elseif self:GetNW2Int("DisplayClipH3") == 9 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0.25,-0.3,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0,0,-0.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0.5,-0.4,-0.6) )
	elseif self:GetNW2Int("DisplayClipH3") == 8 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0.25,-0.3,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0.5,-0.2,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(0.8,0,-0.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0.6,-0.43,-0.7) )
	elseif self:GetNW2Int("DisplayClipH3") == 7 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0.5,-0.4,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0.5,-0.2,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(1,0,-0.85) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(0.9,-0.5,-0.85) )
	elseif self:GetNW2Int("DisplayClipH3") == 6 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(0.7,-0.5,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(0.5,-0.2,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(1.2,0,-1.05) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(1.1,-0.7,-1.05) )
	elseif self:GetNW2Int("DisplayClipH3") == 5 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,-0.1,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,-0.5,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0,0,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(1.4,-0.5,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(1,-0.5,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(1.4,0,-1.3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(1.5,-0.75,-1.3) )
	elseif self:GetNW2Int("DisplayClipH3") == 4 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0,0,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,-0.2,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,-0.75,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0.2,0,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(1,-0.7,-1.5) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(1.3,-0.2,-1.7) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(1.5,0,-1.5)	)
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(1.6,-0.85,-1.5) )
	elseif self:GetNW2Int("DisplayClipH3") == 3 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0.5,0,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,0,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,-0.9,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0.7,0,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(1.3,-0.9,-1.75) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(1.9,-0.7,-1.86) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(1.7,0,-1.75)	)
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(1.85,-0.85,-1.75) )
	elseif self:GetNW2Int("DisplayClipH3") == 2 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(0.5,0,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,-0.5,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,-1.2,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(0.8,0,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(0,0,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(1.5,-0.8,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(2.2,-1,-2) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(2.1,0,-2)	)
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(2.25,-1.1,-2) )
	elseif self:GetNW2Int("DisplayClipH3") == 1 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(1.1,0,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(0,-0.7,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(0,0,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(0,0,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(0,-1.4,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(0,0,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(0,0,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(1.85,-0.5,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(0,0,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(2,0,-3) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(1,-1.05,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(5,2,-2.6) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(3,0,-2.6)	)
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(5,-0.8,-2.6) )
	elseif self:GetNW2Int("DisplayClipH3") <= 0 then
	self.Owner:GetViewModel():ManipulateBonePosition( 38, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 39, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 40, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 41, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 42, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 43, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 44, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 45, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 46, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 47, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 48, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 49, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 50, Vector(-1000,5000,-1000) )
	self.Owner:GetViewModel():ManipulateBonePosition( 51, Vector(-1000,5000,-1000) )
	end

end