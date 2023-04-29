AddCSLuaFile()

ENT.Type = "anim"
-- solution for multiple gasterblaster in minigame
ENT.Editable		= false
ENT.PrintName		= "effect"
ENT.Spawnable 		= false
ENT.AdminSpawnable 	= false

--[[if SERVER then
util.AddNetworkString( "Sans Game" )

util.AddNetworkString( "sans stop" )
util.AddNetworkString( "sans win" )
end
if SERVER then
util.AddNetworkString("SansGameUpCoordinate")
end
net.Receive("SansGameUpCoordinate", function(_, ply)
  local gametag1 = net.ReadFloat()
  local sans = net.ReadEntity()
  local enemy = net.ReadEntity()
  local gametag = sans:Name()..enemy:Name()
  SetGlobalFloat("posy"..gametag,gametag1+10)
end)

]]
local HookCable = Material( "cable/cable2" )
function ENT:Draw()
self:DrawModel()
render.SetMaterial( HookCable )
render.DrawBeam( self:GetPos(), self:GetOwner():EyePos() + self:GetOwner():GetRight() * -5 + self:GetOwner():GetUp() * -4 + self:GetOwner():GetForward() * 2, 1, 0, 2, Color(255,255,255,255) )
end

function ENT:SetupDataTables()
	self:NetworkVar( "Vector", 0, "ShootDir" )
end


function ENT:Initialize()
self.Owner = self:GetOwner()
self.toc = false
self.f = false
	if SERVER then
	self:SetModel( "models/kerosenn/ultrakill/npc/boss/v2/prop/whiplash_hook.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetCollisionGroup( COLLISION_GROUP_WORLD )
	local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
		phys:EnableGravity(false)
		phys:EnableDrag(false)
		phys:EnableCollisions(true)
	end

	local phys = self:GetPhysicsObject()
	if IsValid(phys) then
			if SERVER then
				self:SetShootDir( self.Owner:GetAimVector() * 1500	)
			end
			phys:SetVelocity( self:GetShootDir() )
		end
end
end
local NoHitEnts = { ["func_breakable_surf"] = true, ["ent_fres_lina"] = true, } // This is stuff we shouldn't attach to, glitches out

function ENT:PhysicsCollide( data, phys )
 if self.toc == false and self.f == false then
	if IsValid(data.HitEntity) and NoHitEnts[data.HitEntity:GetClass()] then // Something that'll bug out, eg a window
		self:Remove()
		return
	end
	self.toc = true
	local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:SetVelocity(Vector(0,0,0))
	end
	self:SetMoveType(MOVETYPE_NONE)
	self.sound = self.Owner:EmitSound( "loops.wav", 75, 100, 1, CHAN_AUTO )
	self.tim = CurTime() + 1.1
	
	end
end

function ENT:Think()
if SERVER then

local owner = self:GetOwner()
if owner:GetNWBool("blinking",false) == true and SERVER then self:Remove() end
local a = owner:EyePos()
local b = self:GetPos()
local c = a:Distance(b)

if c > GetConVar("frest_range"):GetInt() and self.toc == false then
	self.f = true
end

if self.f == true then
	
	if c < 250 then
		self:Remove()
	end
	
	if self:GetMoveType() != MOVETYPE_VPHYSICS then
		self:SetMoveType( MOVETYPE_VPHYSICS )
	end
	local d =  a - b
	local phys = self:GetPhysicsObject()
	if IsValid(phys) then
		phys:EnableGravity(false)
		phys:EnableDrag(true)
		phys:EnableCollisions(false)
	phys:SetVelocity( d:GetNormalized() * 2500 )
	end
	
end



if self.toc == true then
			if c < 200 then self:Remove() end
			if c > GetConVar("frest_range"):GetInt() or self.tim <= CurTime() then self.f = true self.toc = false end 
			
			local d =  b - a
			self:SetAngles(d:Angle())
			owner:SetVelocity( d:GetNormalized() * 320 )
			
	local tr1 = util.TraceLine({
        start = self:GetPos(),
        endpos = self:GetOwner():EyePos(),
        filter = self.Owner,
        mask = MASK_NPCWORLDSTATIC,
		ignoreworld = false,
	},self.Owner)
	if tr1.Hit then
		self.f = true self.toc = false
	end	
		end


end




end
	
 
function ENT:OnRemove()
owner = self:GetOwner()
	if SERVER then
	owner:StopSound("loops.wav")
	owner:EmitSound( "grabgraple.wav", 50, 100, 1, CHAN_AUTO )
	end
end

 
 
 
 
 
 
 
 
 
 
 
 
 