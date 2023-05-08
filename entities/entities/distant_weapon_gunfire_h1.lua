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
if self:GetMaxHealth() == 78 then
EmitSound( Sound("halo1/ar_fire_dist_" .. math.random(1,4) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 95 )
elseif self:GetMaxHealth() == 79 then
EmitSound( Sound("halo1/fuelrod_fire_dist.ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 95 )
elseif self:GetMaxHealth() == 80 then
EmitSound( Sound("halo1/needler_fire_dist_" .. math.random(1,2) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 95 )
elseif self:GetMaxHealth() == 81 then
EmitSound( Sound("halo1/pistol_fire_dist.ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 95 )
elseif self:GetMaxHealth() == 82 then
EmitSound( Sound("halo1/ppistol_fire_dist_" .. math.random(1,2) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 95 )
elseif self:GetMaxHealth() == 83 then
EmitSound( Sound("halo1/ppistol_chargeshot_dist.ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 95 )
elseif self:GetMaxHealth() == 84 then
EmitSound( Sound("halo1/prifle_fire_dist_" .. math.random(1,2) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 95 )
elseif self:GetMaxHealth() == 85 then
EmitSound( Sound("halo1/rocket_fire_dist_" .. math.random(1,2) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 95 )
elseif self:GetMaxHealth() == 86 then
EmitSound( Sound("halo1/shotgun_fire_dist.ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 95 )
elseif self:GetMaxHealth() == 87 then
EmitSound( Sound("halo1/sniper_fire_dist.ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 95 )
end
end
end
if (GetViewEntity():GetPos()-self:GetPos()):Length() >= 1500 then
if self:GetMaxHealth() == 88 then
EmitSound( Sound("halo1/fuelrod_expl_dist_" .. math.random(1,2) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 116 )
elseif self:GetMaxHealth() == 89 then
EmitSound( Sound("halo1/grenade_expl_dist_" .. math.random(1,3) .. ".ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 116 )
elseif self:GetMaxHealth() == 90 then
EmitSound( Sound("halo1/needler_expl_dist.ogg"), self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 110 )
end
end
end
end

if SERVER then

AddCSLuaFile( "distant_weapon_gunfire_h1.lua" )

function ENT:Initialize()
	self:SetModel( "models/halo1/meleehitbox.mdl" )
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