ENT.Type = "anim"

if SERVER then

AddCSLuaFile( "needle_inactive_h3.lua" )

function ENT:Initialize()
	self:SetModel( "models/halo3/needlerbolt.mdl" )
	self:SetSolid(SOLID_NONE)
	self:PhysicsInit(MOVETYPE_NONE)
	self:SetMoveType(MOVETYPE_NONE)

	local phys = self:GetPhysicsObject()
	if (IsValid(phys)) then
		phys:EnableMotion( false )
	end

Glow = ents.Create("env_sprite")
Glow:SetKeyValue("model","orangecore2.vmt")
Glow:SetKeyValue("rendercolor","250 104 191")
Glow:SetKeyValue("scale","0.2")
Glow:SetPos(self:GetPos())
Glow:SetParent(self)
Glow:Spawn()
Glow:Activate()

self.NeedlerLifeTime = CurTime() + 11.9
end

function ENT:PhysicsCollide( data, physobj )
end

function ENT:OnTakeDamage( dmginfo )

local HaloNeedlers = {
	needle_h1 = true,
	needle_h2 = true,
	needle_h3 = true,
	needle_hreach = true,
	haloreach_needlerifle = true,
	hreach_needlerifle_swep_ai = true
}

if dmginfo:GetDamageType() == DMG_BLAST or DMG_BLAST_SURFACE then
if IsValid(dmginfo:GetAttacker()) and IsValid(dmginfo:GetInflictor()) and HaloNeedlers[dmginfo:GetInflictor():GetClass()] then
self.NeedlerLifeTime = CurTime()
end

end

end

function ENT:Use( activator, caller )
end  

function ENT:Think()

if self:WaterLevel() > 0 then
	local effectdata = EffectData()
					effectdata:SetOrigin(self:GetPos())
					effectdata:SetNormal(Vector(0,0,1))
					effectdata:SetEntity(self)
					effectdata:SetScale(1)
					util.Effect( "needler_pop_halo3", effectdata )
self:EmitSound("halo3/needler_burst_" .. math.random(1, 2) .. ".ogg")
if IsValid(self:GetParent()) and self:GetParent():IsNPC() or self:GetParent():IsPlayer() or self:GetParent():IsNextBot() then self:GetParent():SetNW2Int( "Niko663HaloSWEPSNeedles", self:GetParent():GetNW2Int( "Niko663HaloSWEPSNeedles" ) -1 )
end
SafeRemoveEntity(self)
	end


if self.NeedlerLifeTime < CurTime() then
		local effectdata = EffectData()
					effectdata:SetOrigin(self:GetPos())
					effectdata:SetNormal(Vector(0,0,1))
					effectdata:SetEntity(self)
					effectdata:SetScale(1)
					util.Effect( "needler_pop_halo3", effectdata )
self:EmitSound("halo3/needler_burst_" .. math.random(1, 2) .. ".ogg")
if IsValid(self:GetParent()) and self:GetParent():IsNPC() or self:GetParent():IsPlayer() or self:GetParent():IsNextBot() then self:GetParent():SetNW2Int( "Niko663HaloSWEPSNeedles", self:GetParent():GetNW2Int( "Niko663HaloSWEPSNeedles" ) -1 )
end
SafeRemoveEntity(self)
end
if self:GetParent():IsNextBot() and self:GetParent():Health() <= 0 then
SafeRemoveEntity(self)
end
if IsValid(self:GetParent()) and self:GetParent().DeadByNeedlerH3 == true then
self.NeedlerLifeTime = CurTime()
end

end

end