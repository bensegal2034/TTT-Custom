if SERVER then
   AddCSLuaFile("weapon_ttt_awp_advanced_silenced.lua")
   resource.AddWorkshop("2058216025")
   resource.AddFile("materials/VGUI/ttt/icon_vanilla_ish_ttt_awp_advanced_silenced.vmt")
 end

if CLIENT then
   SWEP.PrintName = "Adv. Silenced AWP"
   SWEP.Slot = 6
   SWEP.Icon = "vgui/ttt/icon_vanilla_ish_ttt_awp_advanced_silenced"
   SWEP.EquipMenuData = {
      type = "Weapon",
      desc = "One shot, one kill. Victims will not scream when killed.\nProvides advanced HUD info. \n\nCreated by @josh_caratelli + Liam McLachlan."
   }
end

-- Always derive from weapon_tttbase
SWEP.Base = "weapon_tttbase"

-- Standard GMod values
SWEP.HoldType = "ar2"

SWEP.Primary.Ammo = "none"
SWEP.Primary.Delay = 2
SWEP.Primary.Recoil = 3
SWEP.Primary.Cone = 0.999
SWEP.Primary.Damage = 999999999
SWEP.Primary.Automatic = false
SWEP.Primary.ClipSize = 5
SWEP.Primary.ClipMax = 5
SWEP.Primary.DefaultClip = 5
SWEP.Primary.Sound = Sound( "Weapon_M4A1.Silenced" )
SWEP.Secondary.Sound = Sound( "Default.Zoom" )

--- Model settings
SWEP.UseHands = true
SWEP.ViewModelFlip = true
SWEP.ViewModelFOV = 64
SWEP.ViewModel = "models/weapons/v_vanilla_ish_ttt_awp_advanced_silenced.mdl"
SWEP.WorldModel = "models/weapons/w_vanilla_ish_ttt_awp_advanced_silenced.mdl"

--- TTT config values
SWEP.Kind = WEAPON_EQUIP1
SWEP.AutoSpawnable = false
SWEP.AmmoEnt = "none"
SWEP.CanBuy = { ROLE_TRAITOR }
SWEP.InLoadoutFor = { nil }
SWEP.LimitedStock = true
SWEP.AllowDrop = true
SWEP.IsSilent = true
SWEP.NoSights = false

SWEP.ZoomLevels = {
   0,
   30,
   10
};

SWEP.ZoomSensitivities = {
   nil,
   0.20,
   0.06
};

function SWEP:SetupDataTables()
   self:DTVar("Int", 1, "zoom")

   return self.BaseClass.SetupDataTables(self)
end

function SWEP:SetupDataTables()
   self:DTVar("Int",   1, "zoom")

   return self.BaseClass.SetupDataTables(self)
end

function SWEP:SetZoom(level)
   if SERVER then
      self.dt.zoom = level
      self:GetOwner():SetFOV(self.ZoomLevels[level], 0.3)
      
      if level > 1 then
        self:GetOwner():DrawViewModel(false)
      else
        self:GetOwner():DrawViewModel(true)
      end
      
   end
end

function SWEP:CycleZoom()
   self.dt.zoom = self.dt.zoom + 1
   if not self.ZoomLevels[self.dt.zoom] then
      self.dt.zoom = 1
   end

   self:SetZoom(self.dt.zoom)
end

function SWEP:PreDrop()
    self:SetZoom(1)
    return self.BaseClass.PreDrop(self)
end

function SWEP:Holster()
    self:SetZoom(1)
    return true
end

function SWEP:Equip()
    self:SetZoom(1)
    return self.BaseClass.Equip(self)
end


-- Add some zoom to ironsights for this gun
function SWEP:SecondaryAttack()
   if self:GetNextSecondaryFire() > CurTime() then return end

    self:CycleZoom()

   self:SetNextSecondaryFire( CurTime() + 0.1 )
end

function SWEP:Reload()
   if ( self:Clip1() == self.Primary.ClipSize or self.Owner:GetAmmoCount( self.Primary.Ammo ) <= 0 ) then return end
   
   self:DefaultReload( ACT_VM_RELOAD )
   self:SetZoom(1)
end


if CLIENT then
   local scope = surface.GetTextureID( "sprites/scope" )
   function SWEP:DrawHUD()
      if self.dt.zoom > 1 then
         surface.SetDrawColor( 0, 0, 0, 255 )

         local x = ScrW() / 2.0
         local y = ScrH() / 2.0
         local scope_size = ScrH()

         -- Crosshair
         local tr = self:GetOwner():GetEyeTrace(MASK_SHOT)
         local trPlayer = tr.HitNonWorld and IsValid(tr.Entity) and tr.Entity:IsPlayer() 
         
         local gap = 0
         local length = scope_size
         surface.DrawLine( x - length, y, x - gap, y )
         surface.DrawLine( x + length, y, x + gap, y )
         surface.DrawLine( x, y - length, x, y - gap )
         surface.DrawLine( x, y + length, x, y + gap )

         gap = 0
         length = 50
         surface.DrawLine( x - length, y, x - gap, y )
         surface.DrawLine( x + length, y, x + gap, y )
         surface.DrawLine( x, y - length, x, y - gap )
         surface.DrawLine( x, y + length, x, y + gap )

         -- Cover edges
         surface.SetDrawColor( 0, 0, 0, 255 )
         
         local sh = scope_size / 2
         local w = ( x - sh ) + 2
         surface.DrawRect( 0, 0, w, scope_size )
         surface.DrawRect( x + sh - 2, 0, w, scope_size )

         -- Scope
         surface.SetTexture( scope )
         surface.SetDrawColor( 255, 255, 255, 255 )

         surface.DrawTexturedRectRotated( x, y, scope_size, scope_size, 0 )
         
         -- Range marker - 1 Hammer Unit == 0.75" or 19.05mm
         local distance = tr.HitPos:Distance(self:GetPos())
         local meters = distance * 0.01905
         local distanceText = string.format( "%d", meters)
         draw.SimpleText(distanceText, "Trebuchet24", x + 30, y, COLOR_RED, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
         
         if trPlayer then
            -- Red X
            local outer = 10
            local inner = 5
            
            surface.SetDrawColor( 255, 0, 0, 255 )
            surface.DrawLine(x - outer, y - outer, x - inner, y - inner)
            surface.DrawLine(x + outer, y + outer, x + inner, y + inner)

            surface.DrawLine(x - outer, y + outer, x - inner, y + inner)
            surface.DrawLine(x + outer, y - outer, x + inner, y - inner)
            
            -- Health marker   
            local entityHealth = tr.Entity:Health()
            local healthText = string.format( "%d HP", entityHealth)
            draw.SimpleText(healthText, "Trebuchet22", x + 40, y + 20, C, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
         end         
      else
         return self.BaseClass.DrawHUD( self )
      end
   end

   function SWEP:AdjustMouseSensitivity()
      local zoomLevel = self.dt.zoom
  
      return zoomLevel > 1 and self.ZoomSensitivities[zoomLevel] or nil
   end
end