if SERVER then
   AddCSLuaFile( "weapon_ttt_negev.lua" )
   resource.AddWorkshop("2048214607")
end


SWEP.HoldType 				= "crossbow"	

if (CLIENT) then
	SWEP.PrintName			= "Negev"		
	SWEP.Slot				= 2
	SWEP.ViewModelFlip			= false	
	SWEP.ViewModelFOV	    = 56
	
	SWEP.Icon = "vgui/ttt/icon_negev"
end

SWEP.Base = "weapon_tttbase"

SWEP.Kind = WEAPON_HEAVY

SWEP.Primary.Sound 			 = Sound("weapons/tfa_csgo/negev/negev-x-1.wav")
SWEP.Primary.Recoil 		    = 2.4
SWEP.Primary.Damage 		    = 15
SWEP.Primary.Cone 		    = 0.1
SWEP.Primary.ClipSize       = 300
SWEP.Primary.DefaultClip    = 600
SWEP.Primary.ClipMax        = 900
SWEP.Primary.Delay 		    = 0.075
SWEP.Primary.Automatic 		 = true
SWEP.Primary.Ammo           = "SMG1"
SWEP.RandomatSpawn          = true
SWEP.HeadshotMultiplier     = 2.2
SWEP.SpeedMultiplier        = 0.832
SWEP.DynamicSpread          = true
SWEP.ModulationRecoil       = 1
SWEP.ModulationCone			= 1
SWEP.ModulationSpeed   = 220
SWEP.ModulationTime			= nil
SWEP.AmmoEnt = "item_ammo_smg1_ttt"
--SWEP.OriginalSpeed = 0
SWEP.IsFiring = false
SWEP.FiringTimer = 0
SWEP.FiringDelay = 0.2

SWEP.UseHands = true 
SWEP.ViewModel = "models/weapons/tfa_csgo/c_mach_negev.mdl"
SWEP.WorldModel	= "models/weapons/tfa_csgo/w_negev.mdl"

SWEP.AutoSpawnable = true
SWEP.AllowDrop = true
SWEP.UseHands = true
SWEP.IronSightsPos = Vector(-7.9, -4, 2.32)
SWEP.IronSightsAng = Vector(-0.538, -0.43, -1.5)

SWEP.Offset = {
		Pos = {
		Up = 0.5,
		Right = 1,
		Forward = 3
		},
		Ang = {
		Up = 4,
		Right = -3,
		Forward = 180
		},
		Scale = 1
}

--[[
function SWEP:Initialize()
   self.OriginalSpeed = self.Owner:GetWalkSpeed()
end
]]--
function SWEP:DrawWorldModel( )
        local hand, offset, rotate

        local pl = self:GetOwner()

        if IsValid( pl ) then
                        local boneIndex = pl:LookupBone( "ValveBiped.Bip01_R_Hand" )
                        if boneIndex then
                                local pos, ang = pl:GetBonePosition( boneIndex )
                                pos = pos + ang:Forward() * self.Offset.Pos.Forward + ang:Right() * self.Offset.Pos.Right + ang:Up() * self.Offset.Pos.Up

                                ang:RotateAroundAxis( ang:Up(), self.Offset.Ang.Up)
                                ang:RotateAroundAxis( ang:Right(), self.Offset.Ang.Right )
                                ang:RotateAroundAxis( ang:Forward(),  self.Offset.Ang.Forward )

                                self:SetRenderOrigin( pos )
                                self:SetRenderAngles( ang )
                                self:DrawModel()
                        end
        else
                self:SetRenderOrigin( nil )
                self:SetRenderAngles( nil )
                self:DrawModel()
        end
end

function SWEP:PrimaryAttack(worldsnd)

   local recoil = self.Primary.Recoil * self.ModulationRecoil
   self.ModulationTime = CurTime() + 0.5
   self.ModulationRecoil = math.max(0.2, self.ModulationRecoil * 0.96)
   self.ModulationCone = math.max(0.01, self.ModulationCone * 0.97)
   self.ModulationSpeed = math.max(0.1, self.ModulationSpeed * 0.98)

   self:SetNextSecondaryFire( CurTime() + self.Primary.Delay )
   self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )

   if not self:CanPrimaryAttack() then return end

   if not worldsnd then
      self:EmitSound( self.Primary.Sound, self.Primary.SoundLevel )
   elseif SERVER then
      sound.Play(self.Primary.Sound, self:GetPos(), self.Primary.SoundLevel)
   end

   self:ShootBullet( self.Primary.Damage, recoil, self.Primary.NumShots, self:GetPrimaryCone() )

   self:TakePrimaryAmmo( 1 )
   self.Owner:SetWalkSpeed(self.ModulationSpeed)
   self.IsFiring = true
   local owner = self.Owner
   if not IsValid(owner) or owner:IsNPC() or (not owner.ViewPunch) then return end

   owner:ViewPunch( Angle( math.Rand(-0.2,-0.1) * recoil, math.Rand(-0.1,0.1) * recoil, 0 ) )
end

function SWEP:GetPrimaryCone()
   local cone = self.Primary.Cone or 0.2
   cone = cone * self.ModulationCone
   -- 10% accuracy bonus when sighting
   return self:GetIronsights() and (cone * 0.85) or cone
end

function SWEP:Think()
   if self.IsFiring then
      self.IsFiring = false
      self.FiringTimer = CurTime() + self.FiringDelay
   end
	if self.ModulationTime and CurTime() > self.ModulationTime then
		self.Owner:SetWalkSpeed(220)
      self.ModulationTime = nil
		self.ModulationRecoil = 1
		self.ModulationCone = 1
      self.ModulationSpeed = 220
	end
end

function SWEP:SetZoom(state)
   if not (IsValid(self:GetOwner()) and self:GetOwner():IsPlayer()) then return end
   if state then
      self:GetOwner():SetFOV(60, 0.5)
   else
      self:GetOwner():SetFOV(0, 0.2)
   end
end

-- Add some zoom to ironsights for this gun
function SWEP:SecondaryAttack()
   if not self.IronSightsPos then return end
   if self:GetNextSecondaryFire() > CurTime() then return end

   local bIronsights = not self:GetIronsights()

   self:SetIronsights( bIronsights )

   self:SetZoom( bIronsights )

   self:SetNextSecondaryFire( CurTime() + 0.3 )
end

function SWEP:PreDrop()
   self:SetZoom(false)
   self:SetIronsights(false)
   return self.BaseClass.PreDrop(self)
end

function SWEP:Reload()
   self.Owner:SetWalkSpeed(220)
    if (self:Clip1() == self.Primary.ClipSize or
        self:GetOwner():GetAmmoCount(self.Primary.Ammo) <= 0) then
       return
    end
    self:DefaultReload(ACT_VM_RELOAD)
    self:SetIronsights(false)
    self:SetZoom(false)
end

function SWEP:Holster()
   self.Owner:SetWalkSpeed(220)
   self:SetIronsights(false)
   self:SetZoom(false)
   return true
end
