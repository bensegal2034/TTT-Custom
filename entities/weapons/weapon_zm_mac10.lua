AddCSLuaFile()

SWEP.HoldType            = "ar2"

if CLIENT then
   SWEP.PrintName        = "MAC10"
   SWEP.Slot             = 2

   SWEP.ViewModelFlip    = false
   SWEP.ViewModelFOV     = 54

   SWEP.Icon             = "vgui/ttt/icon_mac"
   SWEP.IconLetter       = "l"
end

SWEP.Base                = "weapon_tttbase_nofalloff"

SWEP.Kind                = WEAPON_HEAVY
SWEP.WeaponID            = AMMO_MAC10

SWEP.Primary.Damage      = 10
DAMAGE = SWEP.Primary.Damage
SWEP.Primary.Delay       = 0.065
SWEP.Primary.Cone        = 0
SWEP.Primary.ClipSize    = 30
SWEP.Primary.ClipMax     = 90
SWEP.Primary.DefaultClip = 30
SWEP.Primary.Automatic   = true
SWEP.Primary.Ammo        = "smg1"
SWEP.Primary.Recoil      = 0
SWEP.Primary.Sound       = Sound( "Weapon_mac10.Single" )
SWEP.Primary.HeadshotMultiplier = 2

SWEP.AutoSpawnable       = true
SWEP.AmmoEnt             = "item_ammo_smg1_ttt"

SWEP.UseHands            = true
SWEP.ViewModel           = "models/weapons/cstrike/c_smg_mac10.mdl"
SWEP.WorldModel          = "models/weapons/w_smg_mac10.mdl"

SWEP.IronSightsPos       = Vector(-8.921, -9.528, 2.9)
SWEP.IronSightsAng       = Vector(0.699, -5.301, -7)

SWEP.DeploySpeed         = 3