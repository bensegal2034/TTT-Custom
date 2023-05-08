ENT.Type = "anim"

if (CLIENT) then
killicon.Add( "needle_h3", "VGUI/hud/halo3_needler", color_white )
language.Add( "needle_h3", "Halo 3 Needler Bolt" )
end

if SERVER then

AddCSLuaFile( "needle_h3.lua" )

function ENT:Initialize()
	self:SetModel( "models/halo3/needlerbolt.mdl" )
	self:SetSolid(SOLID_VPHYSICS)
	self:PhysicsInit(MOVETYPE_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolidFlags(FSOLID_TRIGGER)

	local phys = self:GetPhysicsObject()
	if (IsValid(phys)) then
		phys:Wake()
		phys:EnableGravity(false)
		phys:SetDragCoefficient(0.75)
		phys:SetMass(1)
		phys:AddGameFlag(FVPHYSICS_NO_NPC_IMPACT_DMG)
	end

	Glow = ents.Create("env_sprite")
	Glow:SetKeyValue("model","orangecore2.vmt")
	Glow:SetKeyValue("rendercolor","250 104 191")
	Glow:SetKeyValue("scale","0.2")
	Glow:SetPos(self:GetPos())
	Glow:SetParent(self)
	Glow:Spawn()
	Glow:Activate()

	util.SpriteTrail( self, 0, Color(255,174,234,200), false, 5, 0, 0.5, 1, "trails/smoke" )

	self.NeedlerLifeTime = CurTime() + 8.9
	SafeRemoveEntityDelayed(self,9.1)
	self.NeedlerHoming = true
	self.NeedlerHomeTime = CurTime() + 2.5
	self.FakePredicted = false
	self.SizeEdit = true
	if IsValid(self:GetNW2Entity( "HomingTargetH3" )) and self:GetNW2Entity( "HomingTargetH3" ):GetClass() == "npc_madvehicle" and IsEntity(self:GetNW2Entity( "HomingTargetH3" ).v) and IsValid(self:GetNW2Entity( "HomingTargetH3" ).v) then
	self:SetNW2Entity( "HomingTargetH3", self:GetNW2Entity( "HomingTargetH3" ).v )
	end

end

function ENT:EntityIsVehicle(ent)
if IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "haloveh_base") or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "halohover_base") or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "halohover2_base") or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "lunasflightschool_basescript") or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "wac_hc_base") or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "wac_pl_base") or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "sent_sakarias_scar_base") or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "sent_sakarias_carwheel") and ent.IsDestroyed == false or IsValid(ent) and ent:GetClass() == "sent_sakarias_carwheel" and ent.IsDestroyed == false or IsValid(ent) and ent:GetClass() == "gmod_sent_vehicle_fphysics_wheel" then
return true
else
return false
end

end

function ENT:IsVehicleOccupied(ent)

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
return true
end
if istable(ent.Seats) then
for k,p in pairs(ent.Seats) do
if IsValid(p:GetDriver()) and p:GetDriver():IsPlayer() then
return true
end
end
end
end
if IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "lunasflightschool_basescript") and ent.GetAI and ent:GetAI() then
return true
end
if IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "lunasflightschool_basescript") and ent.GetAI and !ent:GetAI() then
if IsValid(ent:GetDriver()) and ent:GetDriver():IsPlayer() then
return true
end
for _, v in pairs( ent:GetPassengerSeats() ) do
if IsValid(v) and IsValid(v:GetDriver()) and v:GetDriver():IsPlayer() then
return true
end
end
end
if IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "wac_hc_base") and istable(ent.passengers) or IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "wac_pl_base") and istable(ent.passengers) then
for k,p in pairs(ent.passengers) do
if IsValid(p) and p:IsPlayer() then
return true
end
end
end
if IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "sent_sakarias_carwheel") or IsValid(ent) and ent:GetClass() == "sent_sakarias_carwheel" then
if IsEntity(ent.SCarOwner) and IsValid(ent.SCarOwner) and IsEntity(ent.SCarOwner.AIController) and IsValid(ent.SCarOwner.AIController) then
return true
end
if IsEntity(ent.SCarOwner) and IsValid(ent.SCarOwner) and !IsEntity(ent.AIController) and istable(ent.SCarOwner.Seats) then
for k,p in pairs(ent.SCarOwner.Seats) do
if IsValid(p:GetDriver()) and p:GetDriver():IsPlayer() then
return true
end
end
end
end
if IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "sent_sakarias_scar_base") and istable(ent.Seats) and !IsEntity(ent.AIController) then
for k,p in pairs(ent.Seats) do
if IsValid(p:GetDriver()) and p:GetDriver():IsPlayer() then
return true
end
end
end
if IsValid(ent) and scripted_ents.IsBasedOn(ent:GetClass(), "sent_sakarias_scar_base") and IsEntity(ent.AIController) and IsValid(ent.AIController) then
return true
end
if IsValid(ent) and ent:GetClass() == "gmod_sent_vehicle_fphysics_base" then
if IsValid(ent:GetDriver()) and ent:GetDriver():IsPlayer() then 
return true
end
if istable(ent.pSeat) then
for k,p in pairs(ent.pSeat) do
if IsValid(p:GetDriver()) and p:GetDriver():IsPlayer() then
return true
end
end
end
end
if IsValid(ent) and ent:IsVehicle() and !scripted_ents.IsBasedOn(ent:GetClass(), "sent_sakarias_scar_base") and IsValid(ent:GetDriver()) then
return true
end
if IsValid(ent) and ent:IsNPC() and VehicleEnts[ent:GetClass()] then
return true
end
if IsValid(ent) and IsEntity(ent.MadVehicle) and IsValid(ent.MadVehicle) and ent.MadVehicle:GetClass() == "npc_madvehicle" then
return true
end

end

function ENT:PhysicsCollide( data, physobj )

local target = data.HitEntity

local Trace = {}
	Trace.start = self:GetPos()
	Trace.endpos = Trace.start + (self:GetForward() * 100)
	Trace.filter = function( ent ) if ( IsEntity(ent) ) then return false end end
	Trace.mask = MASK_SHOT
	local tr = util.TraceLine(Trace)

if tr.HitSky then
local effectdata = EffectData()
					effectdata:SetOrigin(self:GetPos())
					effectdata:SetNormal(Vector(0,0,1))
					effectdata:SetEntity(self)
					effectdata:SetScale(1)
					util.Effect( "needler_pop_halo3", effectdata )
self:EmitSound("halo3/needler_burst_" .. math.random(1, 2) .. ".ogg")
self:Fire( "Kill","",0)
return end

if target:GetClass() == "func_breakable" and self.FakePredicted == false and IsValid(target) then
	self.FakePredicted = true
	if self.FakePredicted == false then SafeRemoveEntity(self) end
	target:TakeDamage(6.15,self:OwnerGet(),self)
	self:EmitSound("halo3/needler_impact_player_" .. math.random(1, 2) .. ".ogg")
	self:StopSound("Halo3_Needler.FlyBy")
	local needle = ents.Create( "needle_inactive_h3" )
	needle:SetPos( self:GetPos() + self:GetForward() * 13 )
	needle:SetAngles( self:GetAngles() )
	needle:SetParent(target)
	needle:Spawn()
	needle:Activate()
	SafeRemoveEntity(self)
elseif target:GetClass() == "func_breakable_surf" and self.FakePredicted == false and IsValid(target) then
	self.FakePredicted = true
	if self.FakePredicted == false then SafeRemoveEntity(self) end
	target:Fire("Shatter","",0)
	self:EmitSound("halo3/needler_impact_player_" .. math.random(1, 2) .. ".ogg")
	self:StopSound("Halo3_Needler.FlyBy")
	SafeRemoveEntity(self)
elseif !target:IsPlayer() and !target:IsNPC() and self.FakePredicted == false and target:IsWorld() then
	self.FakePredicted = true
	if self.FakePredicted == false then SafeRemoveEntity(self) end
	local needle = ents.Create( "needle_inactive_h3" )
	needle:SetPos( self:GetPos() + self:GetForward() * 13 )
	needle:SetAngles( self:GetAngles() )
	needle:Spawn()
	needle:Activate()
	self:EmitSound("halo3/needler_impact_" .. math.random(1, 2) .. ".ogg")
	SafeRemoveEntity(self)
elseif !target:IsPlayer() and !target:IsNPC() and self.FakePredicted == false and !target:IsWorld() then
	self.FakePredicted = true
	if self.FakePredicted == false then SafeRemoveEntity(self) end
	local needle = ents.Create( "needle_inactive_h3" )
	needle:SetPos( self:GetPos() + self:GetForward() * 13 )
	needle:SetAngles( self:GetAngles() )
	needle:SetParent(target)
	needle:Spawn()
	needle:Activate()
	self:EmitSound("halo3/needler_impact_" .. math.random(1, 2) .. ".ogg")
	target:TakeDamage(4.5,self:OwnerGet(),self)
	SafeRemoveEntity(self)
end
end

function ENT:SuperCombineH3()

		local effectdata = EffectData()
					effectdata:SetOrigin(self:GetPos())
					effectdata:SetNormal(Vector(0,0,1))
					effectdata:SetEntity(self)
					effectdata:SetScale(1.3)
					util.Effect( "supercombine_halo3", effectdata )

	local DistantFire = ents.Create("distant_weapon_gunfire_h3")
	if !IsValid(DistantFire) then return end
	DistantFire:SetAngles(Angle(90,90,0))
	DistantFire:SetPos(self:GetPos())
	DistantFire:SetOwner(self.Owner)
	DistantFire.Owner = self.Owner
	DistantFire:SetMaxHealth(95)
	DistantFire:Spawn()
	DistantFire:Activate()
	EmitSound( "Halo3_Needler.SuperCombine", self:GetPos(),  self:EntIndex(), CHAN_STATIC, 1, 82 )
	util.BlastDamage(self, self:OwnerGet(), self:GetPos(), 150, 150)
	util.ScreenShake(self:GetPos(), 250, 250, 1.25, 250)
	SafeRemoveEntity(self)
end

function ENT:OnTakeDamage( dmginfo )
end

function ENT:Touch(ent)
		if !self.Owner:IsPlayer() then
		targetforward = 12
		else
		targetforward = 0
		end
		if ent:IsNPC() and ent != self.Owner and ent:GetClass() != "npc_combinegunship" and ent:GetClass() != "npc_strider" and ent:GetClass() != "npc_turret_floor" and self.FakePredicted == false and ( ent:GetNW2Int( "Niko663HaloSWEPSNeedles" ) < 6 ) and IsValid(ent) then
		self.FakePredicted = true
		if self.FakePredicted == false then SafeRemoveEntity(self) end
		ent:TakeDamage(6.15,self:OwnerGet(),self)
		self:EmitSound("halo3/needler_impact_player_" .. math.random(1, 2) .. ".ogg")
		self:StopSound("Halo3_Needler.FlyBy")
		local needle = ents.Create( "needle_inactive_h3" )
		needle:SetPos( self:GetPos() + self:GetForward() * 5 )
		needle:SetAngles( self:GetAngles() )
		needle:SetParent(ent)
		ent:SetNW2Int( "Niko663HaloSWEPSNeedles", ent:GetNW2Int( "Niko663HaloSWEPSNeedles" ) + 1 )
		needle:Spawn()
		needle:Activate()
		SafeRemoveEntity(self)
		elseif ent:IsPlayer() and ent != self.Owner and self.FakePredicted == false and ( ent:GetNW2Int( "Niko663HaloSWEPSNeedles" ) < 6 )  and IsValid(ent) then
		self.FakePredicted = true
		if self.FakePredicted == false then SafeRemoveEntity(self) end
		ent:TakeDamage(6.25,self:OwnerGet(),self)
		self:EmitSound("halo3/needler_impact_player_" .. math.random(1, 2) .. ".ogg")
		self:StopSound("Halo3_Needler.FlyBy")
		local needle = ents.Create( "needle_inactive_h3" )
		needle:SetPos( self:GetPos() + self:GetForward() * targetforward )
		needle:SetAngles( self:GetAngles() )
		needle:SetParent(ent)
		if ent:LookupAttachment("chest") != 0 then
		needle:Fire("setparentattachmentmaintainoffset", "chest", 0.01)
		else
		needle:Fire("setparentattachmentmaintainoffset", "eyes", 0.01)
		end
		ent:SetNW2Int( "Niko663HaloSWEPSNeedles", ent:GetNW2Int( "Niko663HaloSWEPSNeedles" ) + 1 )
		needle:Spawn()
		needle:Activate()
		SafeRemoveEntity(self)
		elseif ent:IsNPC() and ent != self.Owner and self.FakePredicted == false and ( ent:GetNW2Int( "Niko663HaloSWEPSNeedles" ) >= 6 ) and IsValid(ent) then
		self.FakePredicted = true
		if self.FakePredicted == false then SafeRemoveEntity(self) end
		self:SuperCombineH3()
		self:StopSound("Halo3_Needler.FlyBy")
		elseif ent:IsPlayer() and ent != self.Owner and self.FakePredicted == false and ( ent:GetNW2Int( "Niko663HaloSWEPSNeedles" ) >= 6 ) and IsValid(ent) then
		self.FakePredicted = true
		if self.FakePredicted == false then SafeRemoveEntity(self) end
		self:SuperCombineH3()
		self:StopSound("Halo3_Needler.FlyBy")
		elseif ent:IsNextBot() and ent != self.Owner and ent:GetNW2Int( "Niko663HaloSWEPSNeedles" ) < 6 and IsValid(ent) and self.FakePredicted == false then
			self.FakePredicted = true
			if self.FakePredicted == false then SafeRemoveEntity(self) end
			ent:TakeDamage(6.15,self:OwnerGet(),self)
			self:EmitSound("halo3/needler_impact_player_" .. math.random(1, 2) .. ".ogg")
			self:StopSound("Halo3_Needler.FlyBy")
			local needle = ents.Create( "needle_inactive_h3" )
			needle:SetPos( self:GetPos() + self:GetForward() * 3 )
			needle:SetAngles( self:GetAngles() )
			needle:SetParent(ent)
			ent:SetNW2Int( "Niko663HaloSWEPSNeedles", ent:GetNW2Int( "Niko663HaloSWEPSNeedles" ) + 1 )
			needle:Spawn()
			needle:Activate()
			SafeRemoveEntity(self)
		elseif ent:IsNextBot() and ent != self.Owner and ent:GetNW2Int( "Niko663HaloSWEPSNeedles" ) >= 6 and IsValid(ent) and self.FakePredicted == false then
			self.FakePredicted = true
			if self.FakePredicted == false then SafeRemoveEntity(self) end
			self:SuperCombineH3()
			self:StopSound("Halo3_Needler.FlyBy")
			SafeRemoveEntity(self)

	end
end

function ENT:OwnerGet()
if IsValid(self.Owner) then
return self.Owner
else
return self
end

end


function ENT:Use( activator, caller )
end  

function ENT:OnRemove()
if self.NeedleLoop != nil then
self.NeedleLoop:ChangeVolume(0)
self.NeedleLoop:Stop()
end
if IsFirstTimePredicted() then
self:StopSound("Halo3_Needler.FlyBy")
end
end



function ENT:Think()

self.NeedleLoop = CreateSound( self, "Halo3_Needler.FlyBy" )
self.NeedleLoop:Play()

if self.SizeEdit == true then
self.SizeEdit = false
self:SetModelScale( self:GetModelScale() * 0.9, 0.001 )
end

if IsValid(self:GetNW2Entity("HomingTargetH3")) and self.NeedlerHoming == true then
   if self:GetPos():Distance(self:GetNW2Entity("HomingTargetH3"):GetPos()) < 250 then
	self.NeedlerHomeTime = CurTime() + 0.25
		self.NeedlerHoming = false
end	
end

if IsValid(self:GetNW2Entity("HomingTargetH3")) and self:EntityIsVehicle(self:GetNW2Entity("HomingTargetH3")) and !self:IsVehicleOccupied(self:GetNW2Entity("HomingTargetH3")) or IsValid(self:GetNW2Entity("HomingTargetH3")) and self:GetNW2Entity("HomingTargetH3"):GetClass() == "gmod_sent_vehicle_fphysics_base" and !self:IsVehicleOccupied(self:GetNW2Entity("HomingTargetH3")) then
self:SetNW2Entity( "HomingTargetH3", NULL )
end




if IsValid(self:GetNW2Entity("HomingTargetH3")) and self.NeedlerHomeTime > CurTime() then
	
	if !self:EntityIsVehicle(self:GetNW2Entity("HomingTargetH3")) and !self:GetNW2Entity("HomingTargetH3"):IsVehicle() and self:GetNW2Entity("HomingTargetH3"):GetClass() != "gmod_sent_vehicle_fphysics_base" and self:GetNW2Entity("HomingTargetH3"):Health() <= 0 then return end
	
	local TargetAngles = ((self:GetNW2Entity("HomingTargetH3"):GetPos() + self:GetNW2Entity("HomingTargetH3"):OBBCenter()) - self:GetPos()):Angle()

	HomingAngles = LerpAngle(0.68 / 2, self:GetAngles(), TargetAngles)
	

	self:SetAngles(HomingAngles)
	
		local phys = self:GetPhysicsObject()
		if IsValid(phys) then
			phys:ApplyForceCenter(self:GetForward() * 975)
	end
end

if self:GetVelocity():Length() < 450 then
		local effectdata = EffectData()
					effectdata:SetOrigin(self:GetPos())
					effectdata:SetNormal(Vector(0,0,1))
					effectdata:SetEntity(self)
					effectdata:SetScale(1)
					util.Effect( "needler_pop_halo3", effectdata )
self:EmitSound("halo3/needler_burst_" .. math.random(1, 2) .. ".ogg")
SafeRemoveEntity(self)
end

if self:WaterLevel() > 0 then
		local effectdata = EffectData()
					effectdata:SetOrigin(self:GetPos())
					effectdata:SetNormal(Vector(0,0,1))
					effectdata:SetEntity(self)
					effectdata:SetScale(1)
					util.Effect( "needler_pop_halo3", effectdata )
self:EmitSound("halo3/needler_burst_" .. math.random(1, 2) .. ".ogg")
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
end

end

end