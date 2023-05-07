ENT.Type = "anim"

if (CLIENT) then
killicon.Add( "melee_attack_h3_sword", "VGUI/hud/halo3_sword", color_white )
end

if SERVER then

AddCSLuaFile( "melee_attack_h3_sword.lua" )

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
		if IsValid(self.Owner:GetWeapon( "halo3_sword" )) and self.Owner:GetWeapon( "halo3_sword" ):Clip1() >= 6 then
			self.Owner:GetWeapon( "halo3_sword" ):TakePrimaryAmmo( math.random(3,6) )
		elseif IsValid(self.Owner:GetWeapon( "halo3_sword" )) and self.Owner:GetWeapon( "halo3_sword" ):Clip1() < 6 then
			self.Owner:GetWeapon( "halo3_sword" ):TakePrimaryAmmo( self.Owner:GetWeapon( "halo3_sword" ):Clip1() )
		end
		target:TakeDamage(105,self.Owner,self)
		target:EmitSound("Halo3_ES.Impact")
		if game.SinglePlayer() == true then
			util.ScreenShake( self.Owner:GetPos(), math.random(0.65,0.95), 0.3, math.random(0.85, 1), 0 )
		elseif game.SinglePlayer() == false then
			self.Owner:SetNW2Bool( "ScreenShakeSwordH3", true )
		end
		SafeRemoveEntity(self)
		elseif target:GetClass() == "func_breakable" and self.FakePredicted == false and IsValid(target) and IsValid(self.Owner) then
			self.FakePredicted = true
		if self.FakePredicted == false then SafeRemoveEntity(self) end
		if IsValid(self.Owner:GetWeapon( "halo3_sword" )) and self.Owner:GetWeapon( "halo3_sword" ):Clip1() >= 3 then
			self.Owner:GetWeapon( "halo3_sword" ):TakePrimaryAmmo( math.random(1,3) )
		elseif IsValid(self.Owner:GetWeapon( "halo3_sword" )) and self.Owner:GetWeapon( "halo3_sword" ):Clip1() < 3 then
			self.Owner:GetWeapon( "halo3_sword" ):TakePrimaryAmmo( self.Owner:GetWeapon( "halo3_sword" ):Clip1() )
		end
		target:TakeDamage(105,self.Owner,self)
		target:EmitSound("Halo3_ES.Impact")
		if game.SinglePlayer() == true then
			util.ScreenShake( self.Owner:GetPos(), math.random(0.65,0.95), 0.3, math.random(0.85, 1), 0 )
		elseif game.SinglePlayer() == false then
			self.Owner:SetNW2Bool( "ScreenShakeSwordH3", true )
		end
		elseif target:GetClass() == "func_breakable_surf" and self.FakePredicted == false and IsValid(target) and IsValid(self.Owner) then
			self.FakePredicted = true
		if self.FakePredicted == false then SafeRemoveEntity(self) end
		if IsValid(self.Owner:GetWeapon( "halo3_sword" )) and self.Owner:GetWeapon( "halo3_sword" ):Clip1() >= 3 then
			self.Owner:GetWeapon( "halo3_sword" ):TakePrimaryAmmo( math.random(1,3) )
		elseif IsValid(self.Owner:GetWeapon( "halo3_sword" )) and self.Owner:GetWeapon( "halo3_sword" ):Clip1() < 3 then
			self.Owner:GetWeapon( "halo3_sword" ):TakePrimaryAmmo( self.Owner:GetWeapon( "halo3_sword" ):Clip1() )
		end
		target:Fire("Shatter","",0)
		target:EmitSound("Halo3_ES.Impact")
		if game.SinglePlayer() == true then
			util.ScreenShake( self.Owner:GetPos(), math.random(0.65,0.95), 0.3, math.random(0.85, 1), 0 )
		elseif game.SinglePlayer() == false then
			self.Owner:SetNW2Bool( "ScreenShakeSwordH3", true )
		end
		SafeRemoveEntity(self)
		elseif target:IsNextBot() and self.FakePredicted == false and IsValid(target) and IsValid(self.Owner) then
			self.FakePredicted = true
		if self.FakePredicted == false then SafeRemoveEntity(self) end
		if IsValid(self.Owner:GetWeapon( "halo3_sword" )) and self.Owner:GetWeapon( "halo3_sword" ):Clip1() >= 6 then
			self.Owner:GetWeapon( "halo3_sword" ):TakePrimaryAmmo( math.random(3,6) )
		elseif IsValid(self.Owner:GetWeapon( "halo3_sword" )) and self.Owner:GetWeapon( "halo3_sword" ):Clip1() < 6 then
			self.Owner:GetWeapon( "halo3_sword" ):TakePrimaryAmmo( self.Owner:GetWeapon( "halo3_sword" ):Clip1() )
		end
		target:TakeDamage(105,self.Owner,self)
		target:EmitSound("Halo3_ES.Impact")
		if game.SinglePlayer() == true then
			util.ScreenShake( self.Owner:GetPos(), math.random(0.65,0.95), 0.3, math.random(0.85, 1), 0 )
		elseif game.SinglePlayer() == false then
			self.Owner:SetNW2Bool( "ScreenShakeSwordH3", true )
		end
		SafeRemoveEntity(self)
		elseif target:IsPlayer() and self.FakePredicted == false and IsValid(target) and IsValid(self.Owner) then
			self.FakePredicted = true
		if self.FakePredicted == false then SafeRemoveEntity(self) end
		if IsValid(self.Owner:GetWeapon( "halo3_sword" )) and self.Owner:GetWeapon( "halo3_sword" ):Clip1() >= 10 then
			self.Owner:GetWeapon( "halo3_sword" ):TakePrimaryAmmo( 10 )
		elseif IsValid(self.Owner:GetWeapon( "halo3_sword" )) and self.Owner:GetWeapon( "halo3_sword" ):Clip1() < 10 then
			self.Owner:GetWeapon( "halo3_sword" ):TakePrimaryAmmo( self.Owner:GetWeapon( "halo3_sword" ):Clip1() )
		end
		target:TakeDamage(105,self.Owner,self)
		target:EmitSound("Halo3_ES.Impact")
		if game.SinglePlayer() == true then
			util.ScreenShake( self.Owner:GetPos(), math.random(0.65,0.95), 0.3, math.random(0.85, 1), 0 )
		elseif game.SinglePlayer() == false then
		self.Owner:SetNW2Bool( "ScreenShakeSwordH3", true )
		end
		SafeRemoveEntity(self)
		elseif HaloMelees[target:GetClass()] and self.FakePredicted == false and IsValid(target) and IsValid(target.Owner) and IsValid(self.Owner) then
			self.FakePredicted = true
		if self.FakePredicted == false then SafeRemoveEntity(self) end
		if IsValid(self.Owner:GetWeapon( "halo3_sword" )) and self.Owner:GetWeapon( "halo3_sword" ):Clip1() >= 10 then
			self.Owner:GetWeapon( "halo3_sword" ):TakePrimaryAmmo( 10 )
		elseif IsValid(self.Owner:GetWeapon( "halo3_sword" )) and self.Owner:GetWeapon( "halo3_sword" ):Clip1() < 10 then
		self.Owner:GetWeapon( "halo3_sword" ):TakePrimaryAmmo( self.Owner:GetWeapon( "halo3_sword" ):Clip1() )
		end
		target:TakeDamage(105,self.Owner,self)
		target:EmitSound("Halo3_ES.Impact")
		if game.SinglePlayer() == true then
			util.ScreenShake( self.Owner:GetPos(), math.random(0.65,0.95), 0.3, math.random(0.85, 1), 0 )
		elseif game.SinglePlayer() == false then
			self.Owner:SetNW2Bool( "ScreenShakeSwordH3", true )
		end
		SafeRemoveEntity(self)
		elseif self:EntityIsVehicle(target) and self.FakePredicted == false and IsValid(target) and IsValid(self.Owner) then
			self.FakePredicted = true
		if self.FakePredicted == false then SafeRemoveEntity(self) end
		if IsValid(self.Owner:GetWeapon( "halo3_sword" )) and self.Owner:GetWeapon( "halo3_sword" ):Clip1() >= 3 then
			self.Owner:GetWeapon( "halo3_sword" ):TakePrimaryAmmo( math.random(1,3) )
		elseif IsValid(self.Owner:GetWeapon( "halo3_sword" )) and self.Owner:GetWeapon( "halo3_sword" ):Clip1() < 3 then
			self.Owner:GetWeapon( "halo3_sword" ):TakePrimaryAmmo( self.Owner:GetWeapon( "halo3_sword" ):Clip1() )
		end
		if game.SinglePlayer() == true then
			util.ScreenShake( self.Owner:GetPos(), math.random(0.65,0.95), 0.3, math.random(0.85, 1), 0 )
		elseif game.SinglePlayer() == false then
			self.Owner:SetNW2Bool( "ScreenShakeSwordH3", true )
		end
		target:TakeDamage(120,self.Owner,self.Owner)
		target:EmitSound("Halo3_ES.Impact")
		SafeRemoveEntity(self)
	elseif self.FakePredicted == false and IsValid(self.Owner) then
		self.FakePredicted = true
		if self.FakePredicted == false then SafeRemoveEntity(self) end
		if !target:IsWorld() then
			target:TakeDamage(120,self.Owner,self.Owner)
		end
			self:EmitSound("Halo3_ES.Impact")
		if game.SinglePlayer() == true then
			util.ScreenShake( self.Owner:GetPos(), math.random(0.65,0.95), 0.3, math.random(0.85, 1), 0 )
		elseif game.SinglePlayer() == false then
			self.Owner:SetNW2Bool( "ScreenShakeSwordH3", true )
		end
		
		data.HitNormal = data.HitNormal * -1
		local start = data.HitPos + data.HitNormal
		local endpos = data.HitPos - data.HitNormal

		util.Decal( "ESScorchH3",start,endpos)
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
			ent:TakeDamage(105,self.Owner,self)
			ent:EmitSound("Halo3_ES.Impact")
		if game.SinglePlayer() == true then
			util.ScreenShake( self.Owner:GetPos(), math.random(0.65,0.95), 0.3, math.random(0.85, 1), 0 )
		elseif game.SinglePlayer() == false then
			self.Owner:SetNW2Bool( "ScreenShakeSwordH3", true )
		end
		if ent:IsPlayer() and IsValid(self.Owner:GetWeapon( "halo3_sword" )) and self.Owner:GetWeapon( "halo3_sword" ):Clip1() >= 10 then
			self.Owner:GetWeapon( "halo3_sword" ):TakePrimaryAmmo( 10 )
		elseif ent:IsPlayer() and IsValid(self.Owner:GetWeapon( "halo3_sword" )) and self.Owner:GetWeapon( "halo3_sword" ):Clip1() < 10 then
			self.Owner:GetWeapon( "halo3_sword" ):TakePrimaryAmmo( self.Owner:GetWeapon( "halo3_sword" ):Clip1() )
		end
		if ent:IsNextBot() and IsValid(self.Owner:GetWeapon( "halo3_sword" )) and self.Owner:GetWeapon( "halo3_sword" ):Clip1() >= 6 then
			self.Owner:GetWeapon( "halo3_sword" ):TakePrimaryAmmo( math.random(3,6) )
		elseif ent:IsNextBot() and IsValid(self.Owner:GetWeapon( "halo3_sword" )) and self.Owner:GetWeapon( "halo3_sword" ):Clip1() < 6 then
			self.Owner:GetWeapon( "halo3_sword" ):TakePrimaryAmmo( self.Owner:GetWeapon( "halo3_sword" ):Clip1() )
		end
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

	local HitPlayerWhenMoving = ents.FindInSphere( self:GetPos(), 36 )
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