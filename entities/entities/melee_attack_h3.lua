ENT.Type = "anim"

if SERVER then

AddCSLuaFile( "melee_attack_h3.lua" )

function ENT:Initialize()
	self:SetModel( "models/halo3/meleehitbox.mdl" )
	self:SetSolid(SOLID_VPHYSICS)
	self:PhysicsInit(MOVETYPE_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolidFlags( FSOLID_CUSTOMRAYTEST )
	self:DrawShadow(false)

	local phys = self:GetPhysicsObject()
	if (IsValid(phys)) then
		phys:Wake()
		phys:EnableGravity(false)
		phys:SetMass(1)
end
	self:Fire("kill","",0.1)
	self.FakePredicted = false
end

function ENT:EntityIsVehicle(ent)
if IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "haloveh_base") or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "halohover_base") or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "halohover2_base") or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "lunasflightschool_basescript") or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "wac_hc_base") or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "wac_pl_base") or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "sent_sakarias_scar_base") or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "sent_sakarias_carwheel") and ent.IsDestroyed == false or IsValid(ent) and ent:GetClass() == "sent_sakarias_carwheel" and ent.IsDestroyed == false or IsValid(ent) and ent:GetClass() == "gmod_sent_vehicle_fphysics_base" or IsValid(ent) and ent:GetClass() == "gmod_sent_vehicle_fphysics_wheel" then
return true
else
return false
end

end

function ENT:PhysicsCollide( data, physobj )

 local HaloMelees = {
	melee_attack_h1 = true,
	melee_attack_h2 = true,
	melee_attack_h2_bruteshot = true,
	melee_attack_h2_sword = true,
	melee_attack_h2_sword_powerful = true,
	melee_attack_h3 = true,
	melee_attack_h3_powerful = true,
	melee_attack_h3_sword = true,
	melee_attack_h3o = true,
	melee_attack_hreach = true,
	melee_attack_hreach_powerful = true,
	melee_attack_hreach_sword = true,
	melee_attack_fortnite_pickaxe = true,
	melee_attack_fortnite_infblade = true
}

local target = data.HitEntity

	if target:IsNPC() and target:GetClass() != "npc_turret_floor" and self.FakePredicted == false and IsValid(target) and IsValid(self.Owner) then
	self.FakePredicted = true
	if self.FakePredicted == false then SafeRemoveEntity(self) end
	target:TakeDamage(25,self.Owner,self.Owner)
	target:EmitSound("halo3/melee_hit_" .. math.random(1,2) .. ".ogg")
	SafeRemoveEntity(self)
	elseif target:IsNextBot() and self.FakePredicted == false and IsValid(target) and IsValid(self.Owner) then
	self.FakePredicted = true
	if self.FakePredicted == false then SafeRemoveEntity(self) end
	target:TakeDamage(25,self.Owner,self.Owner)
	target:EmitSound("halo3/melee_hit_" .. math.random(1,2) .. ".ogg")
	SafeRemoveEntity(self)
	elseif target:IsPlayer() and self.FakePredicted == false and IsValid(target) and IsValid(self.Owner) then
	self.FakePredicted = true
	if self.FakePredicted == false then SafeRemoveEntity(self) end
	target:TakeDamage(25,self.Owner,self.Owner)
	target:EmitSound("halo3/melee_hit_" .. math.random(1,2) .. ".ogg")
	SafeRemoveEntity(self)
	elseif target:GetClass() == "func_breakable" and self.FakePredicted == false and IsValid(target) and IsValid(self.Owner) then
	self.FakePredicted = true
	if self.FakePredicted == false then SafeRemoveEntity(self) end
	target:TakeDamage(25,self.Owner,self.Owner)
	self:EmitSound("physics/concrete/rock_impact_hard4.wav", 80)
	SafeRemoveEntity(self)
	elseif target:GetClass() == "func_breakable_surf" and self.FakePredicted == false and IsValid(target) and IsValid(self.Owner) then
	self.FakePredicted = true
	if self.FakePredicted == false then SafeRemoveEntity(self) end
	target:Fire("Shatter","",0)
	self:EmitSound("physics/concrete/rock_impact_hard4.wav", 80)
	SafeRemoveEntity(self)
	elseif HaloMelees[target:GetClass()] and self.FakePredicted == false and IsValid(target) and IsValid(target.Owner) and IsValid(self.Owner) then
	self.FakePredicted = true
	if self.FakePredicted == false then SafeRemoveEntity(self) end
	target.Owner:TakeDamage(25,self.Owner,self.Owner)
	target.Owner:EmitSound("halo3/melee_hit_" .. math.random(1,2) .. ".ogg")
	SafeRemoveEntity(self)
	elseif self:EntityIsVehicle(target) and self.FakePredicted == false and IsValid(target) and IsValid(self.Owner) then
	self.FakePredicted = true
	if self.FakePredicted == false then SafeRemoveEntity(self) end
	target:TakeDamage(35,self.Owner,self.Owner)
	self:EmitSound("physics/concrete/rock_impact_hard4.wav", 80)
	SafeRemoveEntity(self)
elseif self.FakePredicted == false and IsValid(self.Owner) then
	self.FakePredicted = true
	if self.FakePredicted == false then SafeRemoveEntity(self) end
	if !target:IsWorld() then
	target:TakeDamage(25,self.Owner,self.Owner)
	end
	self:EmitSound("physics/concrete/rock_impact_hard4.wav", 80)
	SafeRemoveEntity(self)
end
end

function ENT:OnTakeDamage( dmginfo )
end

function ENT:Use( activator, caller )
end

function ENT:HurtNextBot(ent)
			self.FakePredicted = true
					if self.FakePredicted == false then SafeRemoveEntity(self) end
					ent:TakeDamage(25,self.Owner,self.Owner)
					ent:EmitSound("halo3/melee_hit_" .. math.random(1,2) .. ".ogg")
					SafeRemoveEntity(self)

	end

function ENT:Think()

local HitEntity = ents.FindInSphere( self:GetPos(), 16 )
	if HitEntity then
				for i = 1, #HitEntity do
					local hit = HitEntity[ i ]
					if hit:IsNextBot() and self.FakePredicted == false and IsValid(hit) and IsValid(self.Owner) then
					self:HurtNextBot(hit)
		end

	local HitPlayerWhenMoving = ents.FindInSphere( self:GetPos(), 34 )
	if HitPlayerWhenMoving then
				for i = 1, #HitPlayerWhenMoving do
					local hit = HitPlayerWhenMoving[ i ]
					if hit:IsPlayer() and hit != self.Owner and hit:GetVelocity():Length() > 60 and self.FakePredicted == false and IsValid(hit) and IsValid(self.Owner) then
					self:HurtNextBot(hit)
		end
end
end
end
end
end

end