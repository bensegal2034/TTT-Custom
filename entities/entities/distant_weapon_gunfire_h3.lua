ENT.Type = "anim"

if CLIENT then
function ENT:Initialize()
if IsValid(self.Owner) then
local Trace = {}
	if !IsValid(self.Owner:GetActiveWeapon()) or IsValid(self.Owner:GetActiveWeapon()) and self.Owner:GetActiveWeapon():LookupAttachment("1") == 0 then
	Trace.start = self.Owner:EyePos()
	else
	Trace.start = self.Owner:GetActiveWeapon():GetAttachment(1).Pos
	end
	Trace.endpos = GetViewEntity():GetPos()
	Trace.filter = { self.Owner, self }
	Trace.mask = MASK_SOLID_BRUSHONLY
	local tr = util.TraceLine(Trace)

if (GetViewEntity():GetPos()-self:GetPos()):Length() >= 750 or (GetViewEntity():GetPos()-self:GetPos()):Length() < 750 and (GetViewEntity():GetPos()-self:GetPos()):Length() >= 200 and tr.HitWorld and tr.MatType != MAT_GRATE then
if self:GetMaxHealth() == 71 then
EmitSound( Sound("halo3/ar_fire_dist_" .. math.random(1,2) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 95 )
elseif self:GetMaxHealth() == 72 then
EmitSound( Sound("halo3/br_fire_dist_" .. math.random(1,2) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 95 )
elseif self:GetMaxHealth() == 73 then
EmitSound( Sound("halo3/beamrifle_fire_dist_" .. math.random(1,2) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 95 )
elseif self:GetMaxHealth() == 74 then
EmitSound( Sound("halo3/bruteshot_fire_dist_" .. math.random(1,2) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 95 )
elseif self:GetMaxHealth() == 75 then
EmitSound( Sound("halo3/carbine_fire_dist_" .. math.random(1,2) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 95 )
elseif self:GetMaxHealth() == 76 then
EmitSound( Sound("halo3/fuelrod_fire_dist_" .. math.random(1,2) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 95 )
elseif self:GetMaxHealth() == 77 then
EmitSound( Sound("halo3/lazer_fire_dist_" .. math.random(1,2) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 95 )
elseif self:GetMaxHealth() == 78 then
EmitSound( Sound("halo3/magnum_fire_dist_" .. math.random(1,2) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 95 )
elseif self:GetMaxHealth() == 79 then
EmitSound( Sound("halo3/mauler_fire_dist_" .. math.random(1,2) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 95 )
elseif self:GetMaxHealth() == 80 then
EmitSound( Sound("halo3/needler_fire_dist_" .. math.random(1,2) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 95 )
elseif self:GetMaxHealth() == 81 then
EmitSound( Sound("halo3/ppistol_fire_dist_" .. math.random(1,2) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 95 )
elseif self:GetMaxHealth() == 82 then
EmitSound( Sound("halo3/ppistol_chargeshot_dist_" .. math.random(1,2) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 95 )
elseif self:GetMaxHealth() == 83 then
EmitSound( Sound("halo3/pr_shoot_dist_" .. math.random(1,2) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 95 )
elseif self:GetMaxHealth() == 84 then
EmitSound( Sound("halo3/plasmaturret_fire_dist_" .. math.random(1,2) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 95 )
elseif self:GetMaxHealth() == 85 then
EmitSound( Sound("halo3/rocket_fire_dist_" .. math.random(1,2) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 95 )
elseif self:GetMaxHealth() == 86 then
EmitSound( Sound("halo3/shotgun_fire_dist_" .. math.random(1,2) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 95 )
elseif self:GetMaxHealth() == 87 then
EmitSound( Sound("halo3/smg_fire_dist_" .. math.random(1,2) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 95 )
elseif self:GetMaxHealth() == 88 then
EmitSound( Sound("halo3/sniper_fire_dist_" .. math.random(1,2) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 95 )
elseif self:GetMaxHealth() == 89 then
EmitSound( Sound("halo3/spiker_fire_dist_" .. math.random(1,2) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 95 )
elseif self:GetMaxHealth() == 90 then
EmitSound( Sound("halo3/turret_fire_dist_" .. math.random(1,2) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 95 )
end
end
end
if (GetViewEntity():GetPos()-self:GetPos()):Length() >= 1500 then
if self:GetMaxHealth() == 91 then
EmitSound( Sound("halo3/mpod_expl_dist_" .. math.random(1,2) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 122 )
elseif self:GetMaxHealth() == 92 then
EmitSound( Sound("halo3/bruteshot_expl_dist_" .. math.random(1,2) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 0.8, 107 )
elseif self:GetMaxHealth() == 93 then
EmitSound( Sound("halo3/grenade_expl_dist_" .. math.random(1,2) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 112 )
elseif self:GetMaxHealth() == 94 then
EmitSound( Sound("halo3/fuelrod_expl_dist_" .. math.random(1,2) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 120 )
elseif self:GetMaxHealth() == 95 then
EmitSound( Sound("halo3/needler_expl_dist_" .. math.random(1,2) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 110 )
elseif self:GetMaxHealth() == 96 then
EmitSound( Sound("halo3/rocket_expl_dist_" .. math.random(1,2) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 120 )
end
end
end
end

if SERVER then

AddCSLuaFile( "distant_weapon_gunfire_h3.lua" )

function ENT:Initialize()
	self:SetModel( "models/halo3/meleehitbox.mdl" )
	self:SetSolid(SOLID_NONE)
	self:PhysicsInit(MOVETYPE_NONE)
	self:SetMoveType(MOVETYPE_NONE)
	self:SetSolidFlags( FSOLID_CUSTOMRAYTEST )
	self:SetCollisionGroup( COLLISION_GROUP_IN_VEHICLE )
	self:DrawShadow(false)
	SafeRemoveEntityDelayed(self,0.125)
end


function ENT:PhysicsCollide( data, physobj )
end

function ENT:OnTakeDamage( dmginfo )
end

function ENT:Use( activator, caller )
end

function ENT:Think()
end

function ENT:UpdateTransmitState()
return TRANSMIT_ALWAYS
end

end