if SERVER then
   AddCSLuaFile("m9k_famas.lua")
   AddCSLuaFile("includes/modules/cl_m9k_famas.lua")
   resource.AddWorkshop("2743728984")
end

SWEP.HoldType = "ar2"

if CLIENT then

   SWEP.PrintName = "Famas"
   SWEP.Slot = 2

   SWEP.Icon = "vgui/hud/m9k_famas"

   require("cl_m9k_famas")
end


SWEP.Base = "weapon_tttbase"

SWEP.Kind = WEAPON_HEAVY

SWEP.Primary.DamageBase  = 20
SWEP.Primary.Damage      = SWEP.Primary.DamageBase
SWEP.HeadshotMultiplier  = 2
SWEP.Primary.Delay       = 0.30
SWEP.Primary.ConeBase    = 0.02
SWEP.Primary.Cone        = SWEP.Primary.ConeBase
SWEP.Primary.ClipSize    = 30
SWEP.Primary.ClipMax     = 60
SWEP.Primary.DefaultClip = 30
SWEP.Primary.Automatic   = true
SWEP.Primary.Ammo        = "pistol"
SWEP.Primary.Recoil      = 1.35
SWEP.Primary.Sound       = "weapons/fokku_tc_famas/shot-1.wav"

SWEP.AutoSpawnable = true

SWEP.AmmoEnt = "item_ammo_pistol_ttt"

SWEP.UseHands			= false
SWEP.ViewModelFlip		= false
SWEP.ViewModelFOV		= 70
SWEP.ViewModel  = "models/weapons/v_tct_famas.mdl"
SWEP.WorldModel = "models/weapons/w_tct_famas.mdl"

SWEP.IronSightsPos = Vector(-3.342, 0, 0.247)
SWEP.IronSightsAng = Vector(0.039, 0, 0)

SWEP.BurstDelay = 0.10
SWEP.BurstDelayTimer = 0
SWEP.BurstShotAmt = 2
SWEP.BurstShotsMade = 0
SWEP.BurstInProgress = false
SWEP.ReloadQueued = false

SWEP.KillClipActive = false
SWEP.KillClipReady = false
SWEP.KillClipPctIncrease = 0.5
SWEP.KillClipDelay = 10
SWEP.KillClipDelayTimer = 0

SWEP.RapidHitActive = false
SWEP.RapidHitReady = false
SWEP.RapidHitStacks = 0
SWEP.RapidHitStacksDelay = 5
SWEP.RapidHitStacksDelayTimer = 0
SWEP.RapidHitStackInfo = {
   [1] = {
      ReloadSpeed = 1.5,
      Cone = 0.01
   },
   [2] = {
      ReloadSpeed = 1.7,
      Cone = 0.008
   },
   [3] = {
      ReloadSpeed = 1.8,
      Cone = 0.006
   },
   [4] = {
      ReloadSpeed = 1.9,
      Cone = 0.004
   },
   [5] = {
      ReloadSpeed = 2,
      Cone = 0
   }
}

SWEP.DeploySpeed = 3
SWEP.ReloadSpeedBase = 1
SWEP.ReloadSpeed = SWEP.ReloadSpeedBase
SWEP.Reloading = false
SWEP.ReloadTimer = 0

if CLIENT then
   net.Receive("KillClipActive", function()
      ClientVars.KillClipActive = net.ReadBool()
   end)
   net.Receive("KillClipReady", function()
      ClientVars.KillClipReady = net.ReadBool()
   end)
   net.Receive("KillClipDelayTimer", function()
      ClientVars.KillClipDelayTimer = net.ReadInt(32)
   end)

   net.Receive("RapidHitActive", function()
      ClientVars.RapidHitActive = net.ReadBool()
   end)
   net.Receive("RapidHitStacks", function()
      ClientVars.RapidHitStacks = net.ReadInt(32)
   end)
   net.Receive("RapidHitStacksDelayTimer", function()
      ClientVars.RapidHitStacksDelayTimer = net.ReadInt(32)
   end)
end

if SERVER then
   util.AddNetworkString("KillClipActive")
   util.AddNetworkString("KillClipReady")
   util.AddNetworkString("KillClipDelayTimer")
   util.AddNetworkString("RapidHitActive")
   util.AddNetworkString("RapidHitStacks")
   util.AddNetworkString("RapidHitStacksDelayTimer")

   hook.Add("DoPlayerDeath", "KillClipReady", function(victim, attacker, dmginfo)
      local weapon = dmginfo:GetAttacker():GetActiveWeapon()

      if weapon:GetClass() == "m9k_famas" then
         weapon.KillClipReady = true

         net.Start("KillClipReady")
            net.WriteBool(weapon.KillClipReady)
         net.Broadcast()
      end
   end)

   hook.Add("ScalePlayerDamage", "RapidHit", function(target, hitgroup, dmginfo)
      local weapon = dmginfo:GetAttacker():GetActiveWeapon()

      if weapon:GetClass() == "m9k_famas" then
         if hitgroup == HITGROUP_HEAD then
            if not weapon.RapidHitActive and not weapon.RapidHitReady then
               weapon.RapidHitReady = true
               weapon.RapidHitStacks = weapon.RapidHitStacks + 1

               net.Start("RapidHitActive")
                  net.WriteBool(true)
               net.Broadcast()
               net.Start("RapidHitStacks")
                  net.WriteInt(weapon.RapidHitStacks, 32)
               net.Broadcast()
            elseif weapon.RapidHitActive then
               if weapon.RapidHitStacks < 5 then
                  weapon.RapidHitStacks = weapon.RapidHitStacks + 1
                  net.Start("RapidHitStacks")
                     net.WriteInt(weapon.RapidHitStacks, 32)
                  net.Broadcast()
               end
               weapon.RapidHitStacksDelayTimer = CurTime() + weapon.RapidHitStacksDelay
               net.Start("RapidHitStacksDelayTimer")
                  net.WriteInt(math.floor(weapon.RapidHitStacksDelayTimer), 32)
               net.Broadcast()
            end
         end
      end
   end)
end

function SWEP:Initialize()
   if CLIENT then
      ClientVars.KillClipReady = false
      ClientVars.KillClipActive = false
      ClientVars.KillClipDelayTimer = 0
   end
end

if CLIENT then
   function SWEP:DrawHUD()
      self.BaseClass.DrawHUD(self)

      local scrW = ScrW()
      local scrH = ScrH()

      local dropShadowPosKillClip = {w = scrW * 0.009, h = scrH * 0.8452}
      local textPosKillClip = {w = scrW * 0.0083, h = scrH * 0.843}
      local xOffsetKillClip = 3
      local numXOffsetKillClip = 105
      local numYOffsetKillClip = 1.15

      local dropShadowPosRapidHit = {w = scrW * 0.009, h = scrH * 0.8052}
      local textPosRapidHit = {w = scrW * 0.0083, h = scrH * 0.803}
      local xOffsetRapidHit = 3
      local numXOffsetRapidHit = 150
      local numYOffsetRapidHit = 1.15

      surface.SetFont("HealthAmmo")

      -- draw kill clip hud
      if ClientVars.KillClipActive then
         ClientVars.KillClipReady = false

         local KillClipTimer = tostring(math.floor(ClientVars.KillClipDelayTimer) - math.floor(CurTime()))

         surface.SetDrawColor(73, 75, 77, 150)
         draw.RoundedBox(10, scrW * 0.005, scrH * 0.84, 163, 35, Color(73, 75, 77, 150))
         surface.SetTextColor(0, 0, 0, 255)
         surface.SetTextPos(dropShadowPosKillClip.w + xOffsetKillClip, dropShadowPosKillClip.h)
         surface.DrawText("Kill Clip")
         if tonumber(KillClipTimer) < 10 then
            surface.SetTextColor(0, 0, 0, 255)
            surface.SetTextPos(dropShadowPosKillClip.w + numXOffsetKillClip, dropShadowPosKillClip.h + numYOffsetKillClip)
            surface.DrawText("0:0" .. KillClipTimer)
            surface.SetTextColor(255, 255, 255, 255)
            surface.SetTextPos(textPosKillClip.w + numXOffsetKillClip, textPosKillClip.h + numYOffsetKillClip)
            surface.DrawText("0:0" .. KillClipTimer)
         else
            surface.SetTextColor(0, 0, 0, 255)
            surface.SetTextPos(dropShadowPosKillClip.w + numXOffsetKillClip, dropShadowPosKillClip.h + numYOffsetKillClip)
            surface.DrawText("0:" .. KillClipTimer)
            surface.SetTextColor(255, 255, 255, 255)
            surface.SetTextPos(textPosKillClip.w + numXOffsetKillClip, textPosKillClip.h + numYOffsetKillClip)
            surface.DrawText("0:" .. KillClipTimer)
         end
         surface.SetTextColor(255, 255, 255, 255)
         surface.SetTextPos(textPosKillClip.w + xOffsetKillClip, textPosKillClip.h)
         surface.DrawText("Kill Clip")
      end
      if ClientVars.KillClipReady then 
         draw.RoundedBox(10, scrW * 0.005, scrH * 0.84, 163, 35, Color(73, 75, 77, 150))
         surface.SetTextColor(0, 0, 0, 255)
         surface.SetTextPos(dropShadowPosKillClip.w + xOffsetKillClip, dropShadowPosKillClip.h)
         surface.DrawText("Kill Clip Ready")
         surface.SetTextColor(255, 255, 255, 255)
         surface.SetTextPos(textPosKillClip.w + xOffsetKillClip, textPosKillClip.h)
         surface.DrawText("Kill Clip Ready")
      end

      --draw rapid hit hud
      if ClientVars.RapidHitActive then
         local RapidHitTimer = tostring(math.floor(ClientVars.RapidHitStacksDelayTimer) - math.floor(CurTime()))

         draw.RoundedBox(10, scrW * 0.005, scrH * 0.80, 209, 35, Color(73, 75, 77, 150))
         surface.SetTextColor(0, 0, 0, 255)
         surface.SetTextPos(dropShadowPosRapidHit.w + xOffsetRapidHit, dropShadowPosRapidHit.h)
         surface.DrawText("Rapid Hit x" .. ClientVars.RapidHitStacks)
         surface.SetTextColor(255, 255, 255, 255)
         surface.SetTextPos(textPosRapidHit.w + xOffsetRapidHit, textPosRapidHit.h)
         surface.DrawText("Rapid Hit x" .. ClientVars.RapidHitStacks)

         surface.SetTextColor(0, 0, 0, 255)
         surface.SetTextPos(dropShadowPosRapidHit.w + numXOffsetRapidHit, dropShadowPosRapidHit.h + numYOffsetRapidHit)
         surface.DrawText("0:0" .. RapidHitTimer)
         surface.SetTextColor(255, 255, 255, 255)
         surface.SetTextPos(textPosRapidHit.w + numXOffsetRapidHit, textPosRapidHit.h + numYOffsetRapidHit)
         surface.DrawText("0:0" .. RapidHitTimer)
      end
   end
end

function SWEP:CanPrimaryAttack()
	if self:Clip1() == 0 then
      self:EmitSound("weapons/shotgun/shotgun_empty.wav")
		self:SetNextPrimaryFire( CurTime() + 0.4)
		self:Reload()
		return false
   end
	if self.Reloading then
      return false
   end
	return true
end

function SWEP:PrimaryAttack()
   if self.BurstInProgress then
      return
   end
   self.BurstInProgress = true
   self.BurstDelayTimer = CurTime() + self.BurstDelay
end

function SWEP:Reload()
   if ( self:Clip1() == self.Primary.ClipSize or self:GetOwner():GetAmmoCount( self.Primary.Ammo ) <= 0 ) or self.Reloading then return end
   if self.BurstInProgress then
      self.ReloadQueued = true
      return
   end

   self.Reloading = true
   self:SendWeaponAnim(ACT_VM_RELOAD)
   self:GetOwner():GetViewModel():SetPlaybackRate(self.ReloadSpeed)
   self.ReloadTimer = CurTime() + (self:SequenceDuration() / self.ReloadSpeed)
end

function SWEP:Think()
   -- reload logic
   if self.Reloading then
      if CurTime() > self.ReloadTimer then
         local delta = self:GetMaxClip1() - self:Clip1()
         delta = math.min(delta, self:GetOwner():GetAmmoCount(self.Primary.Ammo))
         self:GetOwner():RemoveAmmo(self:Clip1() - delta, self.Primary.Ammo)
         self:SetClip1(self:Clip1() + delta)
         self.Reloading = false

         if self.KillClipReady then
            self.KillClipReady = false
            self.KillClipActive = true
         end
      end
   end

   -- burst logic
   if self.BurstInProgress then
      if self.BurstShotsMade == 0 then
         self.BaseClass.PrimaryAttack(self.Weapon, worldsnd)
         self.BurstShotsMade = self.BurstShotsMade + 1
         return
      end
      if CurTime() > self.BurstDelayTimer then
         if self.BurstShotAmt > self.BurstShotsMade then
            -- timer up AND the amount of shots fired is less than the amount we need to fire
            -- reset the timer, increment amount of shots fired, and fire another shot
            self.BurstDelayTimer = CurTime() + self.BurstDelay
            self.BurstShotsMade = self.BurstShotsMade + 1
            self.BaseClass.PrimaryAttack(self.Weapon, worldsnd)
         else
            -- this is our last shot of the burst
            -- fire the last shot, we are no longer in a burst
            self.BaseClass.PrimaryAttack(self.Weapon, worldsnd)
            self.BurstShotsMade = 0
            self.BurstDelayTimer = 0
            self.BurstInProgress = false

            -- was there a reload queued? if so, reload now
            if self.ReloadQueued then
               self:Reload()
               self.ReloadQueued = false
            end
            return
         end
      end
   end
   if SERVER then
      -- rapid hit logic
      if self.RapidHitReady then
         self.RapidHitReady = false
         self.RapidHitActive = true

         -- start timer
         self.RapidHitStacksDelayTimer = CurTime() + self.RapidHitStacksDelay

         -- apply correct weapon buff based on stack info table
         for StackNum, StackInfo in ipairs(self.RapidHitStackInfo) do
            if self.RapidHitStacks == StackNum then
               self.Primary.Cone = StackInfo.Cone
               self.ReloadSpeed = StackInfo.ReloadSpeed
            end
         end
      elseif self.RapidHitActive then
         -- apply correct weapon buff based on stack info table (done every Think(), bit performance intensive :/)
         for StackNum, StackInfo in ipairs(self.RapidHitStackInfo) do
            if self.RapidHitStacks == StackNum then
               self.Primary.Cone = StackInfo.Cone
               self.ReloadSpeed = StackInfo.ReloadSpeed
            end
         end
         net.Start("RapidHitStacksDelayTimer")
            net.WriteInt(math.floor(self.RapidHitStacksDelayTimer), 32)
         net.Broadcast()
      end

      -- check our timer, do we need to deactivate?
      if CurTime() > self.RapidHitStacksDelayTimer then
         self.RapidHitActive = false
         self.RapidHitStacksDelayTimer = 0
         self.RapidHitStacks = 0

         -- reset weapon buffs
         self.Primary.Cone = self.Primary.ConeBase
         self.Primary.ReloadSpeed = self.Primary.ReloadSpeedBase
         -- let client know rapid hit is over
         net.Start("RapidHitActive")
            net.WriteBool(false)
         net.Broadcast()
         net.Start("RapidHitStacksDelayTimer")
            net.WriteInt(0, 32)
         net.Broadcast()
      end
   end
   if SERVER then
      -- kill clip logic
      if self.KillClipActive then
         self.KillClipActive = false
         self.KillClipDelayTimer = CurTime() + self.KillClipDelay
         net.Start("KillClipDelayTimer")
            net.WriteInt(math.floor(self.KillClipDelayTimer), 32)
         net.Broadcast()
         self.Primary.Damage = tonumber(self.Primary.Damage) + (tonumber(self.Primary.Damage) * self.KillClipPctIncrease)
         net.Start("KillClipActive")
            net.WriteBool(true)
         net.Broadcast()
      end

      -- check our timer, do we need to deactivate?
      if CurTime() > self.KillClipDelayTimer then
         -- kill clip over
         self.KillClipDelayTimer = 0
         self.Primary.Damage = self.Primary.DamageBase
         -- let client know kc is over
         net.Start("KillClipActive")
            net.WriteBool(false)
         net.Broadcast()
         net.Start("KillClipDelayTimer")
            net.WriteInt(0, 32)
         net.Broadcast()
      end
   end
end