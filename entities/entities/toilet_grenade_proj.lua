AddCSLuaFile()

ENT.Type = "anim"
ENT.Model = Model("models/weapons/w_eq_fraggrenade_thrown.mdl")

AccessorFunc(ENT, "radius", "Radius", FORCE_NUMBER)
AccessorFunc(ENT, "dmg", "Dmg", FORCE_NUMBER)
AccessorFunc(ENT, "thrower", "Thrower")

function ENT:SetupDataTables()
   self:NetworkVar("Float", 0, "ExplodeTime")
end

function ENT:Initialize()
	if not self:GetRadius() then self:SetRadius(256) end
	if not self:GetDmg() then self:SetDmg(25) end

	self:SetModel(self.Model)

	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_BBOX)
	self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)

	if SERVER then
		self:SetExplodeTime(0)
	end
end

function ENT:SetDetonateTimer(length)
	self:SetDetonateExact( CurTime() + length )
end

function ENT:SetDetonateExact(t)
	self:SetExplodeTime(t or CurTime())
end

function ENT:Explode(tr)
	if SERVER then
		self:SetNoDraw(true)
		self:SetSolid(SOLID_NONE)

		if tr.Fraction != 1.0 then
			self:SetPos(tr.HitPos + tr.HitNormal * 0.6)
		end

		local pos = self:GetPos()

		if util.PointContents(pos) == CONTENTS_WATER then
			self:Remove()
			return
		end

		local effect = EffectData()
		effect:SetStart(pos)
		effect:SetOrigin(pos)
		effect:SetScale(self:GetRadius() * 0.3)
		effect:SetRadius(self:GetRadius())
		effect:SetMagnitude(self.dmg)

		if tr.Fraction != 1.0 then
			effect:SetNormal(tr.HitNormal)
		end
		
		util.Effect("Explosion", effect, true, true)

		util.BlastDamage(self, self:GetThrower(), pos, self:GetRadius(), self:GetDmg())

		self:SetDetonateExact(0)

		self:Remove()
	else
		local spos = self:GetPos()
		local trs = util.TraceLine({start=spos + Vector(0,0,64), endpos=spos + Vector(0,0,-128), filter=self})
		util.Decal("Scorch", trs.HitPos + trs.HitNormal, trs.HitPos - trs.HitNormal)      

		self:SetDetonateExact(0)
   end
end

function ENT:PhysicsCollide(data, phys)
	local spos = self:GetPos()
	local tr = util.TraceLine({start=spos, endpos=spos + Vector(0,0,-32), mask=MASK_SHOT_HULL, filter=self.thrower})
	local success, err = pcall(self.Explode, self, tr)
	if not success then
		self:Remove()
		ErrorNoHalt("ERROR CAUGHT: toilet_grenade_proj: " .. err .. "\n")
	end
end

function ENT:Think()
	local etime = self:GetExplodeTime() or 0
	if etime != 0 and etime < CurTime() then
		if SERVER and (not IsValid(self:GetThrower())) then
			self:Remove()
			etime = 0
			return
		end

		local spos = self:GetPos()
		local tr = util.TraceLine({start=spos, endpos=spos + Vector(0,0,-32), mask=MASK_SHOT_HULL, filter=self.thrower})

		local success, err = pcall(self.Explode, self, tr)
		if not success then
			self:Remove()
			ErrorNoHalt("ERROR CAUGHT: toilet_grenade_proj: " .. err .. "\n")
		end
	end
end
