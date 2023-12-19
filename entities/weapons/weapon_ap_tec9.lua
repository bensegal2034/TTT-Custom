if SERVER then
	AddCSLuaFile()
   resource.AddFile( "materials/models/weapons/v_models/teckg9/gun.vmt" )
   resource.AddFile( "materials/models/weapons/v_models/teckg9/gun.vtf" )
   resource.AddFile( "materials/models/weapons/v_models/teckg9/gun_norm.vtf" )
   resource.AddFile( "materials/models/weapons/v_models/teckg9/mag.vmt" )
   resource.AddFile( "materials/models/weapons/v_models/teckg9/mag.vtf" )
   resource.AddFile( "materials/models/weapons/v_models/teckg9/mag_norm.vtf" )
   resource.AddFile( "materials/models/weapons/x_models/teckg9/gun.vmt" )
   resource.AddFile( "materials/models/weapons/x_models/teckg9/mag.vmt" )
   resource.AddFile( "materials/models/vgui/ttt/lykrast/icon_ap_tec9.vmt" )
   resource.AddFile( "materials/models/vgui/ttt/lykrast/icon_ap_tec9.vtf" )
   resource.AddFile( "models/weapons/v_tec_9_smg.dx80.vtx" )
   resource.AddFile( "models/weapons/v_tec_9_smg.dx90.vtx" )
   resource.AddFile( "models/weapons/v_tec_9_smg.mdl" )
   resource.AddFile( "models/weapons/v_tec_9_smg.sw.vtx" )
   resource.AddFile( "models/weapons/v_tec_9_smg.vvd" )
   resource.AddFile( "models/weapons/w_intratec_tec9.dx80.vtx" )
   resource.AddFile( "models/weapons/w_intratec_tec9.dx90.vtx" )
   resource.AddFile( "models/weapons/w_intratec_tec9.mdl" )
   resource.AddFile( "models/weapons/w_intratec_tec9.phy" )
   resource.AddFile( "models/weapons/w_intratec_tec9.sw.vtx" )
   resource.AddFile( "models/weapons/w_intratec_tec9.vvd" )
   resource.AddFile( "sound/weapons/tec9/tec9_charge.mp3" )
   resource.AddFile( "sound/weapons/tec9/tec9_magin.mp3" )
   resource.AddFile( "sound/weapons/tec9/tec9_magout.mp3" )
   resource.AddFile( "sound/weapons/tec9/tec9_newmag.mp3" )
   resource.AddFile( "sound/weapons/tec9/ump45-1.wav" )
   resource.AddWorkshop("375675017")
end

SWEP.HoldType = "ar2"

if CLIENT then

   SWEP.PrintName = "TEC-9"
   SWEP.Slot = 1

   SWEP.Icon = "vgui/ttt/lykrast/icon_ap_tec9"
end


SWEP.Base = "weapon_tttbase"

SWEP.Kind = WEAPON_PISTOL

SWEP.Primary.Damage      = 1
SWEP.Primary.Delay       = 0.60
SWEP.Primary.Cone        = 0.40
SWEP.Primary.ClipSize    = 2
SWEP.Primary.ClipMax     = 60
SWEP.Primary.DefaultClip = 60
SWEP.Primary.Automatic   = true
SWEP.Primary.Ammo        = "smg1"
SWEP.Primary.Recoil      = 7
SWEP.Primary.Sound       = "weapons/tec9/ump45-1.wav"
SWEP.Primary.DamageMod   = 0
SWEP.Primary.ConeMod     = 0
SWEP.Primary.DelayMod    = 0
SWEP.Primary.ClipSizeMod = 0
SWEP.Primary.RecoilMod   = 0

SWEP.Tokens              = 60
SWEP.SwitchVal           = 0

SWEP.AutoSpawnable = true

SWEP.AmmoEnt = "item_ammo_smg1_ttt"

SWEP.UseHands			= false
SWEP.ViewModelFlip		= true
SWEP.ViewModelFOV		= 70
SWEP.ViewModel  = "models/weapons/v_tec_9_smg.mdl"
SWEP.WorldModel = "models/weapons/w_intratec_tec9.mdl"

SWEP.IronSightsPos = Vector(4.314, -1.216, 2.135)
SWEP.IronSightsAng = Vector(0, 0, 0)

SWEP.DeploySpeed = 3

function SWEP:SetupDataTables()
	self:NetworkVar( "Int", 0, "WeaponDamage" )
 	self:NetworkVar( "Float", 1, "WeaponDelay" )
   self:NetworkVar( "Float", 2, "WeaponCone" )
   self:NetworkVar( "Int", 3, "WeaponClipSize" )
   self:NetworkVar( "Float", 4, "WeaponRecoil" )
end



function SWEP:GetHeadshotMultiplier(victim, dmginfo)
   local att = dmginfo:GetAttacker()
   if not IsValid(att) then return 2 end

   local dist = victim:GetPos():Distance(att:GetPos())
   local d = math.max(0, dist - 150)

   -- decay from 3.2 to 1.7
   return 1.7 + math.max(0, (1.5 - 0.002 * (d ^ 1.25)))
end

function SWEP:Initialize()
   if CLIENT and self:Clip1() == -1 then
	   self:SetClip1(self.Primary.DefaultClip)
	elseif SERVER then
	   self.fingerprints = {}
 
	   self:SetIronsights(false)
	end
 
	self:SetDeploySpeed(self.DeploySpeed)
 
	-- compat for gmod update
	if self.SetHoldType then
	   self:SetHoldType(self.HoldType or "pistol")
	end
   if SERVER then
      while (self.Tokens > 0) do
         self.SwitchVal = math.random(1,5)
         if (self.SwitchVal == 1) then
            if self.Primary.DamageMod < 39 then
               self.Primary.DamageMod = self.Primary.DamageMod + 1.5
               self.Tokens = self.Tokens - 1
            else

            end
         end
         if (self.SwitchVal == 2) then
            if self.Primary.DelayMod < .56 then
               self.Primary.DelayMod = self.Primary.DelayMod + 0.03
               self.Tokens = self.Tokens - 1
            else

            end
         end
         if (self.SwitchVal == 3) then
            if self.Primary.ConeMod < .4 then
               self.Primary.ConeMod = self.Primary.ConeMod + 0.02
               self.Tokens = self.Tokens - 1
            else

            end
         end
         if (self.SwitchVal == 4) then
            if self.Primary.ClipSizeMod < 28 then
               self.Primary.ClipSizeMod = self.Primary.ClipSizeMod + 2
               self.Tokens = self.Tokens - 1
            else

            end
         end
         if (self.SwitchVal == 5) then
            if (self.Primary.RecoilMod < 4.8) then
               self.Primary.RecoilMod = self.Primary.RecoilMod + 0.2
               self.Tokens = self.Tokens - 1
            else
            
            end
         end
      end
   end

   if SERVER then
      self:SetWeaponDamage(self.Primary.DamageMod)
      self:SetWeaponDelay(self.Primary.DelayMod)
      self:SetWeaponCone(self.Primary.ConeMod)
      self:SetWeaponClipSize(self.Primary.ClipSizeMod)
      self:SetWeaponRecoil(self.Primary.RecoilMod)
   end
   self.Primary.Damage = self.Primary.Damage + self:GetWeaponDamage()
   self.Primary.Delay = self.Primary.Delay - self:GetWeaponDelay()
   self.Primary.Cone = self.Primary.Cone - self:GetWeaponCone()
   self.Primary.ClipSize = self.Primary.ClipSize + self:GetWeaponClipSize()
   self.Primary.Recoil = self.Primary.Recoil - self:GetWeaponRecoil()
end

function SWEP:Reload()
	if ( self:Clip1() == self.Primary.ClipSize or self:GetOwner():GetAmmoCount( self.Primary.Ammo ) <= 0 ) then return end
	self:DefaultReload(self.ReloadAnim)
	self:SetIronsights( false )
end