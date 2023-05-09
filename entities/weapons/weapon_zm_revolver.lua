AddCSLuaFile()

SWEP.HoldType              = "pistol"

if CLIENT then
   SWEP.PrintName          = "Deagle"
   SWEP.Slot               = 1

   SWEP.ViewModelFlip      = false
   SWEP.ViewModelFOV       = 54

   SWEP.Icon               = "vgui/ttt/icon_deagle"
end

SWEP.Base                  = "weapon_tttbase"

SWEP.Kind                  = WEAPON_PISTOL
SWEP.WeaponID              = AMMO_DEAGLE

SWEP.Primary.Ammo          = "AlyxGun" -- hijack an ammo type we don't use otherwise
SWEP.Primary.Recoil        = 6
SWEP.Primary.Damage        = 37
SWEP.Primary.Delay         = 0.6
SWEP.Primary.Cone          = 0.02
SWEP.Primary.ClipSize      = 8
SWEP.Primary.ClipMax       = 36
SWEP.Primary.DefaultClip   = 8
SWEP.Primary.Automatic     = true
SWEP.Primary.Sound         = Sound( "Weapon_Deagle.Single" )
SWEP.Secondary.Sound       = Sound("Default.Zoom")

SWEP.HeadshotMultiplier    = 4

SWEP.AutoSpawnable         = true
SWEP.Spawnable             = true
SWEP.AmmoEnt               = "item_ammo_revolver_ttt"

SWEP.UseHands              = true
SWEP.ViewModel             = "models/weapons/cstrike/c_pist_deagle.mdl"
SWEP.WorldModel            = "models/weapons/w_pist_deagle.mdl"

SWEP.IronSightsPos         = Vector(-6.361, -3.701, 2.15)
SWEP.IronSightsAng         = Vector(0, 0, 0)

local function drawCircle( x, y, radius, seg )
	local cir = {}

	table.insert( cir, { x = x, y = y, u = 0.5, v = 0.5 } )
	for i = 0, seg do
		local a = math.rad( ( i / seg ) * -360 )
		table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )
	end

	local a = math.rad( 0 ) -- This is needed for non absolute segment counts
	table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )

	surface.DrawPoly( cir )
end

function SWEP:SetZoom(state)
   if IsValid(self:GetOwner()) and self:GetOwner():IsPlayer() then
      if state then
         self:GetOwner():SetFOV(20, 0.3)
      else
         self:GetOwner():SetFOV(0, 0.2)
      end
   end
end

function SWEP:PrimaryAttack( worldsnd )
   self.BaseClass.PrimaryAttack( self.Weapon, worldsnd )
   self:SetNextSecondaryFire( CurTime() + 0.1 )
end

function SWEP:SecondaryAttack()
   if not self.IronSightsPos then return end
   if self:GetNextSecondaryFire() > CurTime() then return end

   local bIronsights = not self:GetIronsights()

   self:SetIronsights( bIronsights )

   self:SetZoom(bIronsights)
   if (CLIENT) then
      self:EmitSound(self.Secondary.Sound)
   end

   self:SetNextSecondaryFire( CurTime() + 0.3)
end

function SWEP:PreDrop()
   self:SetZoom(false)
   self:SetIronsights(false)
   return self.BaseClass.PreDrop(self)
end

function SWEP:Reload()
	if ( self:Clip1() == self.Primary.ClipSize or self:GetOwner():GetAmmoCount( self.Primary.Ammo ) <= 0 ) then return end
   self:DefaultReload( ACT_VM_RELOAD )
   self:SetIronsights( false )
   self:SetZoom( false )
end


function SWEP:Holster()
   self:SetIronsights(false)
   self:SetZoom(false)
   return true
end

if CLIENT then
   local scope = surface.GetTextureID("sprites/scope")
   local scrW = ScrW()
   local scrH = ScrH()
   function SWEP:DrawHUD()
      if self:GetIronsights() then
         draw.NoTexture()
         surface.SetDrawColor(245, 66, 233, 50)
         drawCircle(ScrW() / 2, ScrH() / 2, 500, 999)
         surface.SetDrawColor(0, 0, 0, 255)
         drawCircle(ScrW() / 2, ScrH() / 2, 20, math.sin( CurTime() ) * 20 + 25)
      else
         return self.BaseClass.DrawHUD(self)
      end
   end

   function SWEP:AdjustMouseSensitivity()
      return (self:GetIronsights() and 0.2) or nil
   end
end

--[[
surface.SetDrawColor( 0, 0, 0, 255 )

local scrW = ScrW()
local scrH = ScrH()

local x = scrW / 2.0
local y = scrH / 2.0
local scope_size = scrH

-- crosshair
local gap = 1000
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


-- cover edges
local sh = scope_size / 2
local w = (x - sh) + 2
surface.DrawRect(0, 0, w, scope_size)
surface.DrawRect(x + sh - 2, 0, w, scope_size)

-- cover gaps on top and bottom of screen
surface.DrawLine( 0, 0, scrW, 0 )
surface.DrawLine( 0, scrH - 1, scrW, scrH - 1 )

surface.SetDrawColor(255, 0, 0, 255)
surface.DrawLine(x, y, x + 1, y + 1)

-- scope
surface.SetTexture(scope)
surface.SetDrawColor(255, 255, 255, 255)

surface.DrawTexturedRectRotated(x, y, scope_size, scope_size, 0)
]]--