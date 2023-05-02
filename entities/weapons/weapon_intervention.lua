if SERVER then
   AddCSLuaFile( "weapon_intervention.lua" )
   resource.AddWorkshop("334016220")
end

SWEP.HoldType           = "ar2"

if CLIENT then
   SWEP.PrintName          = "Intervention"
   SWEP.Slot               = 2
   SWEP.Icon = "vgui/ttt/icon_scout"
end

SWEP.Base               = "weapon_tttbase"
SWEP.Spawnable = true

SWEP.Kind = WEAPON_HEAVY
SWEP.WeaponID = AMMO_RIFLE

SWEP.Primary.Delay          = 1.5
SWEP.Primary.Recoil         = 7
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "357"
SWEP.Primary.Damage = 50
SWEP.Primary.Cone = 0.005
SWEP.Primary.ClipSize = 10
SWEP.Primary.ClipMax = 20 -- keep mirrored to ammo
SWEP.Primary.DefaultClip = 10

SWEP.HeadshotMultiplier = 4

SWEP.AutoSpawnable      = true
SWEP.AmmoEnt = "item_ammo_357_ttt"

SWEP.UseHands			= true
SWEP.ViewModelFlip		= true
SWEP.ViewModelFOV		= 54
SWEP.ViewModel				= "models/weapons/intervention/v_snip_int.mdl"
SWEP.WorldModel				= "models/weapons/intervention/w_snip_int.mdl"

SWEP.Primary.Sound = Sound("weapons/scout/scout_fire-1.wav")

SWEP.Secondary.Sound = Sound("Default.Zoom")

SWEP.IronSightsPos      = Vector( 5, -15, -2 )
SWEP.IronSightsAng      = Vector( 2.6, 1.37, 3.5 )

SWEP.ReloadFiringDelay = 2
SWEP.ReloadFiringDelayTimer = 0
SWEP.IsReloading = false

SWEP.AllowedShootDelay = 1.5
SWEP.AllowedShootDelayTimer = 0

SWEP.PreviousScopeState = false

SWEP.OldYaw = 0
SWEP.OldYawTimer = 0

function SWEP:Initialize()
   if SERVER then
      local phys = self:GetPhysicsObject()
      phys:EnableGravity(true)
      phys:AddVelocity(Vector(500, 500, 500))

      local rf = RecipientFilter()
      rf:AddAllPlayers()
      players = rf:GetPlayers()
      for i = 1, #players do
         players[i]:SetGravity(1)
      end
   end
end

function SWEP:SetZoom(state)
    if CLIENT then
       return
    elseif IsValid(self.Owner) and self.Owner:IsPlayer() then
       if state then
          self.Owner:SetFOV(20, 0.3)
       else
          self.Owner:SetFOV(0, 0.2)
       end
    end
end

-- Add some zoom to ironsights for this gun
function SWEP:SecondaryAttack()
    if not self.IronSightsPos then return end
    if self:GetNextSecondaryFire() > CurTime() then return end

    local bIronsights = not self:GetIronsights()

    self:SetIronsights( bIronsights )

    if SERVER then
        self:SetZoom(bIronsights)
     else
        self:EmitSound(self.Secondary.Sound)
    end

    self:SetNextSecondaryFire( CurTime() + 0.3)
end

function SWEP:PreDrop()
   if CLIENT then
      return
   elseif IsValid(self.Owner) and self.Owner:IsPlayer() then
      self.Owner:SetGravity(1)
   end

   self:SetZoom(false)
   self:SetIronsights(false)
   return self.BaseClass.PreDrop(self)
end

function SWEP:OnDrop()
   local phys = self:GetPhysicsObject()
   phys:AddVelocity(Vector(400, 0, 400))
end

function SWEP:Reload()
	if ( self:Clip1() == self.Primary.ClipSize or self.Owner:GetAmmoCount( self.Primary.Ammo ) <= 0 ) then return end

   self.ReloadFiringDelayTimer = CurTime() + self.ReloadFiringDelay
   self.IsReloading = true

   self:DefaultReload( ACT_VM_RELOAD )
   self:SetIronsights( false )
   self:SetZoom( false )
end

function SWEP:Deploy()
   if IsValid(self.Owner) and self.Owner:IsPlayer() then
      self.Owner:SetGravity(0.2)
   end
end

function SWEP:Holster()
   if IsValid(self.Owner) and self.Owner:IsPlayer() then
      self.Owner:SetGravity(1)
   end
    self:SetIronsights(false)
    self:SetZoom(false)
    return true
end

if CLIENT then
   local scope = surface.GetTextureID("sprites/scope")
   function SWEP:DrawHUD()
      if self:GetIronsights() then
         
         local x = ScrW() / 2.0
         local y = ScrH() / 2.0
         local scope_size = ScrH()
         surface.SetDrawColor( 0, 0, 0, 255 )
         -- timer
         surface.SetFont("HealthAmmo")
         surface.SetTextPos(x, y + 55)
         if(CurTime() < self.AllowedShootDelayTimer) then
            surface.SetTextColor(0, 255, 0, 255)
            surface.DrawText("WEAPON READY")
         else
            surface.SetTextColor(255, 0, 0, 255)
            surface.DrawText("WEAPON OVERHEAT")
         end

         -- crosshair
         local gap = 80
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

         surface.SetDrawColor(255, 0, 0, 255)
         surface.DrawLine(x, y, x + 1, y + 1)

         -- scope
         surface.SetTexture(scope)
         surface.SetDrawColor(255, 255, 255, 255)

         surface.DrawTexturedRectRotated(x, y, scope_size, scope_size, 0)

      else
         return self.BaseClass.DrawHUD(self)
      end
   end

function SWEP:AdjustMouseSensitivity()
      return (self:GetIronsights() and 0.2) or nil
   end
end

function SWEP:PrimaryAttack(worldsnd)
   if CurTime() < self.ReloadFiringDelayTimer and self.IsReloading then
      -- we are still reloading and the timer isn't up yet!
      return
   elseif CurTime() < self.AllowedShootDelayTimer then
      -- shoot delay timer not up, allowed to shoot
      if self:GetIronsights() then
         self.BaseClass.PrimaryAttack( self.Weapon, worldsnd )
         self.ReloadFiringDelayTimer = 0
         self.IsReloading = false
      end
   else
      -- shoot delay timer expired, can't shoot
      return
   end
end

function SWEP:Think()
   if self:GetIronsights() and self.PreviousScopeState == false then
      -- we weren't scoped in on the last frame and now we are scoped in
      self.AllowedShootDelayTimer = CurTime() + self.AllowedShootDelay
   end
   -- math.abs(self.OldYaw - current)


   self.PreviousScopeState = self:GetIronsights()
   local angles = self.Owner:GetAngles()
   --if CLIENT then print(angles.yaw) end

   
end