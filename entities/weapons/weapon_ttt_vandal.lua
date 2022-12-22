if SERVER then
   AddCSLuaFile("weapon_ttt_vandal.lua")

   resource.AddFile("sound/weapons/afterglow/boltpull.wav")
   resource.AddFile("sound/weapons/afterglow/equip_start.wav")
   resource.AddFile("sound/weapons/afterglow/equip_whiz.wav")
   resource.AddFile("sound/weapons/afterglow/grab.wav")
   resource.AddFile("sound/weapons/afterglow/fire_ambient.wav")
   resource.AddFile("sound/weapons/afterglow/vandal_fire.wav")
   resource.AddFile("sound/weapons/afterglow/killsound1.wav")
   resource.AddFile("sound/weapons/afterglow/killsound2.wav")
   resource.AddFile("sound/weapons/afterglow/killsound3.wav")
   resource.AddFile("sound/weapons/afterglow/killsound4.wav")
   resource.AddFile("sound/weapons/afterglow/killsound5.wav")
   resource.AddFile("sound/weapons/afterglow/reload_whiz.wav")
   resource.AddFile("sound/weapons/afterglow/reload_gunsound.wav")
   resource.AddFile("sound/weapons/afterglow/noammo_unk.wav")
   resource.AddFile("sound/weapons/afterglow/motor_rrr.wav")
   resource.AddFile("sound/weapons/afterglow/magin_end.wav")
   resource.AddFile("sound/weapons/afterglow/magin_start.wav")
   resource.AddFile("sound/weapons/afterglow/magout.wav")
   resource.AddFile("materials/vgui/killicons/killbanner.png")
   resource.AddWorkshop("2892783240")
   
   util.AddNetworkString("PlayerDeathVandal")
end

if CLIENT then
   SWEP.PrintName = "Vandal"
   SWEP.Slot = 2

   net.Receive("PlayerDeathVandal", function()
      weapon = net.ReadEntity()
      if IsValid(weapon) then
         weapon.KillCount = weapon.KillCount + 1
         weapon.KillEffectBuffer = true
      else
         print("An error occurred while handling incoming Vandal death event!")
      end
   end)
end

if SERVER then
   hook.Add("DoPlayerDeath", "PlayerDeathVandal", function(victim, attacker, dmginfo)
      local weapon = dmginfo:GetAttacker():GetActiveWeapon()

      if weapon:GetClass() == "weapon_ttt_vandal" then
         weapon.KillCount = weapon.KillCount + 1
         weapon.KillEffectBuffer = true

         net.Start("PlayerDeathVandal")
            net.WriteEntity(weapon)
         net.Broadcast()
      end
   end)
end
-- Always derive from weapon_tttbase
SWEP.Base = "weapon_tttbase"

-- Standard GMod values
SWEP.HoldType = "ar2"

SWEP.Primary.Ammo = "pistol"
SWEP.Primary.Delay = 0.095
SWEP.Primary.Recoil = 2.5
SWEP.Primary.Cone = 0.001
SWEP.Primary.Damage = 40
SWEP.Primary.Automatic = true
SWEP.Primary.ClipSize = 25
SWEP.Primary.ClipMax = 75
SWEP.Primary.DefaultClip = 35
SWEP.Primary.Sound = "weapons/afterglow/fire.wav"
SWEP.AutoSpawnable         = true
SWEP.Spawnable             = true
SWEP.HeadshotMultiplier    = 4
SWEP.FirstShotAccuracy = true
SWEP.FirstShotDelay = 1.5
SWEP.AccuracyTimer = 0

-- Model settings
SWEP.UseHands = true
SWEP.ViewModelFlip = false
SWEP.ViewModelFOV = 70
SWEP.ViewModel = "models/weapons/v_rif_rgxv.mdl"
SWEP.WorldModel = "models/weapons/w_rif_rgxv.mdl"
SWEP.InPulloutAnim = false
SWEP.IronSightsPos = Vector( -6.518, -4.646, 2.134 )
SWEP.IronSightsAng = Vector( 2.737, 0.158, 0 )

-- TTT settings
SWEP.Kind = WEAPON_HEAVY
SWEP.AmmoEnt = "item_ammo_pistol_ttt"
SWEP.CanBuy = {}
SWEP.InLoadoutFor = { nil }
SWEP.LimitedStock = true
SWEP.AllowDrop = true
SWEP.IsSilent = false
SWEP.NoSights = false

-- Kill banner settings
SWEP.KillCount = 0
SWEP.KillEffectBuffer = false
SWEP.DrawKillBanner = false
SWEP.KillBannerDelayTimer = 0
SWEP.KillBannerDelay = 2.5

function SWEP:Initialize()
   self.KillCount = 0
   self.KillEffectBuffer = false
   self.DrawKillBanner = false
   self.KillBannerDelayTimer = 0
end

if CLIENT then
   local killBanner = Material("vgui/killicons/killbanner.png", "noclamp smooth")
   
   function SWEP:DrawHUD()
      local scrW = ScrW()
      local scrH = ScrH()

      if self.DrawKillBanner then
         surface.SetMaterial(killBanner)
         surface.SetDrawColor(255, 255, 255, 255)
         surface.DrawTexturedRect(scrW * 0.4485, scrH * 0.65, 200, 256)
      end

      self.BaseClass.DrawHUD(self)
   end
end

function SWEP:Think()
   if CLIENT then
      if self.KillEffectBuffer == true then
         if self.KillCount == 1 then
            EmitSound(Sound("weapons/afterglow/killsound1.wav"), self:GetOwner():GetPos(), -2, CHAN_STATIC, 1, SNDLVL_STATIC, SND_NOFLAGS, 100, 0)
         elseif self.KillCount == 2 then
            EmitSound(Sound("weapons/afterglow/killsound2.wav"), self:GetOwner():GetPos(), -2, CHAN_STATIC, 1, SNDLVL_STATIC, SND_NOFLAGS, 100, 0)
         elseif self.KillCount == 3 then
            EmitSound(Sound("weapons/afterglow/killsound3.wav"), self:GetOwner():GetPos(), -2, CHAN_STATIC, 1, SNDLVL_STATIC, SND_NOFLAGS, 100, 0)
         elseif self.KillCount == 4 then
            EmitSound(Sound("weapons/afterglow/killsound4.wav"), self:GetOwner():GetPos(), -2, CHAN_STATIC, 1, SNDLVL_STATIC, SND_NOFLAGS, 100, 0)
         elseif self.KillCount >= 5 then
            EmitSound(Sound("weapons/afterglow/killsound5.wav"), self:GetOwner():GetPos(), -2, CHAN_STATIC, 1, SNDLVL_STATIC, SND_NOFLAGS, 100, 0)
         end
         self.DrawKillBanner = true
         self.KillBannerDelayTimer = CurTime() + self.KillBannerDelay

         self.KillEffectBuffer = false
      end

      if self.DrawKillBanner then
         if CurTime() > self.KillBannerDelayTimer then
            self.DrawKillBanner = false
            self.KillBannerDelayTimer = 0
         end
      end
   end

   if CurTime() > self.AccuracyTimer then
      self.FirstShotAccuracy = true
   end
   
   if self.FirstShotAccuracy then
      self.Primary.Cone = 0.001
   else
      self.Primary.Cone = 1
   end
end

function SWEP:PrimaryAttack(worldsnd)
   if self.InPulloutAnim then
      return
   end
   self.BaseClass.PrimaryAttack( self.Weapon, worldsnd )
   if self:Clip1() > 0 then
      self.FirstShotAccuracy = false
      self.AccuracyTimer = CurTime() + self.FirstShotDelay
   end
   self:SetNextSecondaryFire( CurTime() + 0.1 )
end

function SWEP:Reload()
   local reloadSoundVol = 0.2
	if ( self:Clip1() == self.Primary.ClipSize or self:GetOwner():GetAmmoCount( self.Primary.Ammo ) <= 0 ) then return end
   self:DefaultReload( ACT_VM_RELOAD )
   if CLIENT then
      timer.Simple(0.013,function()
         EmitSound(Sound("weapons/afterglow/reload_whiz.wav"), self:GetOwner():GetPos(), -1, CHAN_STATIC, reloadSoundVol, SNDLVL_STATIC, SND_NOFLAGS, 100, 0)
      end)
      timer.Simple(0.02,function()
         EmitSound(Sound("weapons/afterglow/reload_gunsound.wav"), self:GetOwner():GetPos(), -1, CHAN_STATIC, reloadSoundVol, SNDLVL_STATIC, SND_NOFLAGS, 100, 0)
      end)
      timer.Simple(0.486,function()
         EmitSound(Sound("weapons/afterglow/magout.wav"), self:GetOwner():GetPos(), -1, CHAN_STATIC, reloadSoundVol, SNDLVL_STATIC, SND_NOFLAGS, 100, 0)
      end)
      timer.Simple(1.138,function()
         EmitSound(Sound("weapons/afterglow/magin_start.wav"), self:GetOwner():GetPos(), -1, CHAN_STATIC, reloadSoundVol, SNDLVL_STATIC, SND_NOFLAGS, 100, 0)
      end)
      timer.Simple(1.236,function()
         EmitSound(Sound("weapons/afterglow/magin_end.wav"), self:GetOwner():GetPos(), -1, CHAN_STATIC, reloadSoundVol, SNDLVL_STATIC, SND_NOFLAGS, 100, 0)
      end)
      timer.Simple(1.456,function()
         EmitSound(Sound("weapons/afterglow/boltpull.wav"), self:GetOwner():GetPos(), -1, CHAN_STATIC, reloadSoundVol, SNDLVL_STATIC, SND_NOFLAGS, 100, 0)
      end)
      timer.Simple(1.597,function()
         EmitSound(Sound("weapons/afterglow/grab.wav"), self:GetOwner():GetPos(), -1, CHAN_STATIC, reloadSoundVol, SNDLVL_STATIC, SND_NOFLAGS, 100, 0)
      end)
   end
end

function SWEP:Deploy()
   self:GetOwner():GetViewModel():SetPlaybackRate(0.8)
   self.InPulloutAnim = true
   timer.Simple(0.83, function()
      self.InPulloutAnim = false
   end)

   local pulloutSoundVol = 0.3
   if CLIENT then
      timer.Simple(0.01, function()
         if IsValid(self.Owner) and self.Owner:IsPlayer() then
            EmitSound(Sound("weapons/afterglow/equip_start.wav"), self:GetOwner():GetPos(), -1, CHAN_STATIC, pulloutSoundVol, SNDLVL_STATIC, SND_NOFLAGS, 100, 0)
         end
      end)
      timer.Simple(0.03,function()
         if IsValid(self.Owner) and self.Owner:IsPlayer() then
            EmitSound(Sound("weapons/afterglow/equip_whiz.wav"), self:GetOwner():GetPos(), -1, CHAN_STATIC, pulloutSoundVol, SNDLVL_STATIC, SND_NOFLAGS, 100, 0)
         end
      end)
      timer.Simple(0.35,function()
         if IsValid(self.Owner) and self.Owner:IsPlayer() then
            EmitSound(Sound("weapons/afterglow/boltpull.wav"), self:GetOwner():GetPos(), -1, CHAN_STATIC, pulloutSoundVol, SNDLVL_STATIC, SND_NOFLAGS, 100, 0)
         end
      end)
      timer.Simple(0.83,function()
         if IsValid(self.Owner) and self.Owner:IsPlayer() then
            EmitSound(Sound("weapons/afterglow/grab.wav"), self:GetOwner():GetPos(), -1, CHAN_STATIC, pulloutSoundVol, SNDLVL_STATIC, SND_NOFLAGS, 100, 0)
         end
      end)
   end
end

function SWEP:CanPrimaryAttack()
   if self.InPulloutAnim then
      return false
   end
   if self:Clip1() <= 0 then
      EmitSound(Sound("weapons/afterglow/noammo_unk.wav"), self:GetOwner():GetPos(), self:GetOwner():EntIndex(), CHAN_STATIC, 0.3, SNDLEVEL_STATIC, SND_NOFLAGS, 100, 0)self:SetNextPrimaryFire( CurTime() + 0.3 )
      return false
   end
   return true
end