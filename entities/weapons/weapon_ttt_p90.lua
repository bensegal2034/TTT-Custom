if SERVER then
   AddCSLuaFile( "weapon_ttt_p90.lua" )
   resource.AddWorkshop("337050759")
end

if CLIENT then
   SWEP.PrintName = "FN P90"
   SWEP.Slot = 2
   SWEP.Icon = "vgui/ttt/icon_p90"
end

-- Always derive from weapon_tttbase
SWEP.Base = "weapon_tttbase"

-- Standard GMod values
SWEP.HoldType = "smg"

SWEP.Primary.Ammo = "SMG1"
SWEP.Primary.Delay = 0.07
SWEP.Primary.Recoil = 0.8
SWEP.Primary.Cone = 0.043
SWEP.Primary.Damage = 12
SWEP.Primary.Automatic = true
SWEP.Primary.ClipSize = 50
SWEP.Primary.ClipMax = 100
SWEP.Primary.DefaultClip = 50
SWEP.Primary.Sound = Sound( "Weapon_P90.Single" )
SWEP.Secondary.Sound = Sound( "Default.Zoom" )
SWEP.SpeedBoost = 55
SWEP.Reloaded = false
SWEP.SpeedBoostRemoved = false

-- Model settings
SWEP.UseHands = true
SWEP.ViewModelFlip = false
SWEP.ViewModelFOV = 60
SWEP.ViewModel = "models/weapons/cstrike/c_smg_p90.mdl"
SWEP.WorldModel	= "models/weapons/w_smg_p90.mdl"

SWEP.IronSightsPos = Vector( 5, -15, -2 )
SWEP.IronSightsAng = Vector( 2.6, 1.37, 3.5 )

--- TTT config values

-- Kind specifies the category this weapon is in. Players can only carry one of
-- each. Can be: WEAPON_... MELEE, PISTOL, HEAVY, NADE, CARRY, EQUIP1, EQUIP2 or ROLE.
-- Matching SWEP.Slot values: 0      1       2     3      4      6       7        8
SWEP.Kind = WEAPON_HEAVY

-- If AutoSpawnable is true and SWEP.Kind is not WEAPON_EQUIP1/2, then this gun can
-- be spawned as a random weapon.
SWEP.AutoSpawnable = true

-- The AmmoEnt is the ammo entity that can be picked up when carrying this gun.
SWEP.AmmoEnt = "item_ammo_smg1_ttt"

-- CanBuy is a table of ROLE_* entries like ROLE_TRAITOR and ROLE_DETECTIVE. If
-- a role is in this table, those players can buy this.
SWEP.CanBuy = { }

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

function SWEP:Initialize()
   if SERVER then
      hook.Add("TTTPrepareRound", "ResetSpeed", function()
         local rf = RecipientFilter()
         rf:AddAllPlayers()
         players = rf:GetPlayers()
         for i = 1, #players do
            players[i]:SetWalkSpeed(220)
         end
      end)
   end
end

function SWEP:PreDrop()
   return self.BaseClass.PreDrop( self )
end

function SWEP:Reload()
   if ( self:Clip1() == self.Primary.ClipSize or self.Owner:GetAmmoCount( self.Primary.Ammo ) <= 0 ) then return end
   self:DefaultReload( ACT_VM_RELOAD )
   if self.Owner:GetWalkSpeed() == 220 then
      self.Reloaded = true
      timer.Simple(2,function()
         self.Owner:SetWalkSpeed(self.Owner:GetWalkSpeed() + self.SpeedBoost)
      end)
      timer.Simple(5,function()
         self.Reloaded = false
         self.SpeedBoostRemoved = false
      end)
   end
end

function SWEP:Holster()
   if IsValid(self.Owner) and self.Owner:IsPlayer() then
      if self.SpeedBoostRemoved == false then
         self.Owner:SetWalkSpeed(self.Owner:GetWalkSpeed() - self.SpeedBoost)
      end
   end
   return true
end

function SWEP:Deploy()
   if IsValid(self.Owner) and self.Owner:IsPlayer() then
      local rand = math.random(1, 10000)
      if rand == 9999 then
         self.Owner:SetWalkSpeed(3500)
         timer.Simple(3, function()
            util.BlastDamage(self.Owner, self, self.Owner:GetPos(), 500, 200)
            local effectdata = EffectData()
            effectdata:SetOrigin(self:GetOwner():GetPos())
            util.Effect("Explosion", effectdata, true, true)
         end)
         return
      end

      if (self:Clip1() >= 1) then
         self.Owner:SetWalkSpeed(self.Owner:GetWalkSpeed() + self.SpeedBoost)
      end
   end
end

function SWEP:Think()
   if ((self:Clip1() <= 1) and self.Reloaded == false) then
      if self.SpeedBoostRemoved == false then
         self.Owner:SetWalkSpeed(self.Owner:GetWalkSpeed() - self.SpeedBoost)
         self.SpeedBoostRemoved = true
      end
   end
end


-- Equipment menu information is only needed on the client
if CLIENT then
   -- Text shown in the equip menu
   SWEP.EquipMenuData = {
   type = "Weapon",
   desc = "Extremely fast firing SMG.\n\nComes with a mounted scope."
   }
end
