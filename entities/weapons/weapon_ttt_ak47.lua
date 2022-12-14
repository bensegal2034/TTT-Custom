AddCSLuaFile()

if CLIENT then
   SWEP.PrintName = "AK47"
   SWEP.Slot = 2
   SWEP.Icon = "vgui/ttt/icon_ak47"
end

-- Always derive from weapon_tttbase
SWEP.Base = "weapon_tttbase"

-- Standard GMod values
SWEP.HoldType = "ar2"

SWEP.Primary.Ammo = "pistol"
SWEP.Primary.Delay = 0.095
SWEP.Primary.Recoil = 1.7
SWEP.Primary.Cone = 0.02
SWEP.Primary.Damage = 25
SWEP.Primary.Automatic = true
SWEP.Primary.ClipSize = 30
SWEP.Primary.ClipMax = 90
SWEP.Primary.DefaultClip = 35
SWEP.Primary.Sound = Sound( "Weapon_AK47.Single" )
SWEP.AutoSpawnable         = true
SWEP.Spawnable             = true
SWEP.HeadshotMultiplier    = 5.2
SWEP.AccuracyTimer = 0
SWEP.AccuracyDelay = 0.2
SWEP.MovementInaccuracy = false

SWEP.FirstShotAccuracy = true
SWEP.FirstShotDelay = 0.5
SWEP.FSAccuracyTimer = 0

-- Model settings
SWEP.UseHands = true
SWEP.ViewModelFlip = false
SWEP.ViewModelFOV = 50
SWEP.ViewModel = "models/weapons/cstrike/c_rif_ak47.mdl"
SWEP.WorldModel = "models/weapons/w_rif_ak47.mdl"

SWEP.IronSightsPos = Vector( -6.518, -4.646, 2.134 )
SWEP.IronSightsAng = Vector( 2.737, 0.158, 0 )

--- TTT config values

-- Kind specifies the category this weapon is in. Players can only carry one of
-- each. Can be: WEAPON_... MELEE, PISTOL, HEAVY, NADE, CARRY, EQUIP1, EQUIP2 or ROLE.
-- Matching SWEP.Slot values: 0      1       2     3      4      6       7        8
SWEP.Kind = WEAPON_HEAVY

-- The AmmoEnt is the ammo entity that can be picked up when carrying this gun.
SWEP.AmmoEnt = "item_ammo_pistol_ttt"

-- CanBuy is a table of ROLE_* entries like ROLE_TRAITOR and ROLE_DETECTIVE. If
-- a role is in this table, those players can buy this.
SWEP.CanBuy = {}

-- InLoadoutFor is a table of ROLE_* entries that specifies which roles should
-- receive this weapon as soon as the round starts. In this case, none.
SWEP.InLoadoutFor = { nil }

-- If LimitedStock is true, you can only buy one per round.
SWEP.LimitedStock = true

-- If AllowDrop is false, players can't manually drop the gun with Q
SWEP.AllowDrop = true

-- If IsSilent is true, victims will not scream upon death.
SWEP.IsSilent = false

-- If NoSights is true, the weapon won't have ironsights
SWEP.NoSights = false

-- Equipment menu information is only needed on the client
if CLIENT then
   -- Text shown in the equip menu
   SWEP.EquipMenuData = {
      type = "Weapon",
      desc = "Assault rifle with very high damage.\n\nHas very high recoil."
   }
end

function SWEP:Think()
   if self.Owner:KeyDown(IN_FORWARD) then
      self.Primary.Cone = 0.5
      self.MovementInaccuracy = true
      self.AccuracyTimer = CurTime() + self.AccuracyDelay
   elseif self.Owner:KeyDown(IN_BACK) then
      self.Primary.Cone = 0.5
      self.MovementInaccuracy = true
      self.AccuracyTimer = CurTime() + self.AccuracyDelay
   elseif self.Owner:KeyDown(IN_MOVELEFT) then
      self.Primary.Cone = 0.5
      self.MovementInaccuracy = true
      self.AccuracyTimer = CurTime() + self.AccuracyDelay
   elseif self.Owner:KeyDown(IN_MOVERIGHT) then
      self.Primary.Cone = 0.5
      self.MovementInaccuracy = true
      self.AccuracyTimer = CurTime() + self.AccuracyDelay
   elseif CurTime() > self.AccuracyTimer then
      self.Primary.Cone = 0.02
      self.MovementInaccuracy = false
   end

   if self.FirstShotAccuracy == true and self.MovementInaccuracy == false then
      self.Primary.Cone = 0.02
   elseif self.MovementInaccuracy != true then
      self.Primary.Cone = 0.1
   end
   if CurTime() > self.FSAccuracyTimer then
      self.FirstShotAccuracy = true
   end

end

function SWEP:PrimaryAttack()
   self.BaseClass.PrimaryAttack( self.Weapon, worldsnd )
   if self:Clip1() > 0 then
      self.FirstShotAccuracy = false
      self.FSAccuracyTimer = CurTime() + self.FirstShotDelay
   end
   self:SetNextSecondaryFire( CurTime() + 0.1 )
end