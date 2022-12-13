//GeneralSettings\\
SWEP.Base = "weapon_tttbase"
SWEP.Spawnable = true
SWEP.AutoSpawnable = true
SWEP.HoldType = "pistol"
SWEP.AdminSpawnable = true
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.Kind = WEAPON_PISTOL

//Serverside\\
if SERVER then
  AddCSLuaFile("weapon_ttt_a3000.lua")
  resource.AddWorkshop("609125395")
  resource.AddFile("materials/VGUI/ttt/icon_a300.vmt")
end

//Clientside\\
if CLIENT then

  SWEP.PrintName = "A-3000"
  SWEP.Slot = 1

  SWEP.ViewModelFOV = 90
  SWEP.ViewModelFlip = true

  SWEP.Icon = "VGUI/ttt/icon_a3000"
end

//Damage\\
SWEP.Primary.Delay = 0.1125
SWEP.Primary.Recoil = 3
SWEP.Primary.Automatic = true
SWEP.Primary.NumShots = 1
SWEP.Primary.Damage = 26
SWEP.Primary.Cone = 0.01
SWEP.Primary.Ammo = "Pistol"
SWEP.Primary.ClipSize = 12
SWEP.Primary.ClipMax = 36
SWEP.Primary.DefaultClip = 12
SWEP.AmmoEnt = "item_ammo_pistol_ttt"

//Verschiedenes\\
SWEP.InLoadoutFor = nil
SWEP.AllowDrop = true
SWEP.IsSilent = false
SWEP.NoSights = false
SWEP.UseHands = true
SWEP.HeadshotMultiplier = 3

//Sounds/Models\\
SWEP.ViewModel = "models/weapons/gamefreak/v_pist_glock66.mdl"
SWEP.WorldModel = "models/weapons/gamefreak/w_pist_glock66.mdl"
SWEP.Weight = 5
SWEP.Primary.Sound = Sound( "weapons/gamefreak/glock/glock18-1.wav" )
SWEP.IronSightsPos = Vector(2.634, -0.805, 0.75)
SWEP.IronSightsAng = Vector(0, 0, 0)

function SWEP:Reload()
  if ( self:Clip1() == self.Primary.ClipSize or self.Owner:GetAmmoCount( self.Primary.Ammo ) <= 0 ) then return end

  self.Weapon:DefaultReload( ACT_VM_RELOAD );

  self:SetIronsights( false )
end

function SWEP:SecondaryAttack()
  self.Primary.NumShots = 3
  self.Primary.Delay = 0.1125
  self.Primary.Cone     = 0.10
  self:TakePrimaryAmmo(2)
  self.BaseClass.PrimaryAttack( self.Weapon, worldsnd )
  self:SetNextSecondaryFire(CurTime() + 0.4)
end

function SWEP:PrimaryAttack()
  
  self.Primary.Cone     = 0.01
  self.Primary.NumShots = 1
  self.Primary.Delay = 0.3375
  self.BaseClass.PrimaryAttack( self.Weapon, worldsnd )

end