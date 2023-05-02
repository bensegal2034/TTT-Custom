if SERVER then
	resource.AddFile("materials/VGUI/ttt/r8causeofdeath.vmt")
	resource.AddFile("materials/VGUI/ttt/r8causeofdeath.vtf")
	resource.AddFile("materials/csgo/econ/weapons/base_weapons/weapon_revolver.vmt")
	resource.AddFile("materials/csgo/econ/weapons/base_weapons/weapon_revolver.vtf")
	resource.AddFile("materials/csgo/models/weapons/v_models/arms/ct_arms.vmt")
	resource.AddFile("materials/csgo/models/weapons/v_models/arms/ct_arms.vtf")
	resource.AddFile("materials/csgo/models/weapons/v_models/arms/ct_arms_normal.vtf")
	resource.AddFile("materials/csgo/models/weapons/v_models/arms/ct_base_glove.vmt")
	resource.AddFile("materials/csgo/models/weapons/v_models/arms/ct_base_glove_color.vtf")
	resource.AddFile("materials/csgo/models/weapons/v_models/arms/ct_base_glove_exp.vtf")
	resource.AddFile("materials/csgo/models/weapons/v_models/arms/ct_base_glove_normal.vtf")
	resource.AddFile("materials/csgo/models/weapons/v_models/pist_revolver/pist_revolver.vmt")
	resource.AddFile("materials/csgo/models/weapons/v_models/pist_revolver/pist_revolver.vtf")
	resource.AddFile("materials/csgo/models/weapons/v_models/pist_revolver/pist_revolver_exponent.vtf")
	resource.AddFile("materials/csgo/models/weapons/w_models/w_pist_revolver/pist_revolver.vmt")
	resource.AddFile("materials/csgo/models/weapons/w_models/w_pist_revolver/pist_revolver.vtf")
	resource.AddFile("materials/csgo/models/weapons/w_models/w_pist_revolver/pist_revolver_exponent.vtf")
	resource.AddFile("materials/entities/weapon_csgo_revolver.png")
	resource.AddFile("materials/models/weapons/v_models/csgo/pist_revolver/pist_revolver.vmt")
	resource.AddFile("materials/models/weapons/v_models/csgo/pist_revolver/pist_revolver.vtf")
	resource.AddFile("materials/models/weapons/v_models/csgo/pist_revolver/pist_revolver_exponent.vtf")
	resource.AddFile("models/csgo/weapons/v_pist_revolver.dx80.vtx")
	resource.AddFile("models/csgo/weapons/v_pist_revolver.dx90.vtx")
	resource.AddFile("models/csgo/weapons/v_pist_revolver.mdl")
	resource.AddFile("models/csgo/weapons/v_pist_revolver.sw.vtx")
	resource.AddFile("models/csgo/weapons/v_pist_revolver.vvd")
	resource.AddFile("models/csgo/weapons/w_pist_revolver.dx80.vtx")
	resource.AddFile("models/csgo/weapons/w_pist_revolver.dx90.vtx")
	resource.AddFile("models/csgo/weapons/w_pist_revolver.mdl")
	resource.AddFile("models/csgo/weapons/w_pist_revolver.phy")
	resource.AddFile("models/csgo/weapons/w_pist_revolver.sw.vtx")
	resource.AddFile("models/csgo/weapons/w_pist_revolver.vvd")
	resource.AddFile("sound/csgo/weapons/auto_semiauto_switch.wav")
	resource.AddFile("sound/csgo/weapons/lowammo_01.wav")
	resource.AddFile("sound/csgo/weapons/movement1.wav")
	resource.AddFile("sound/csgo/weapons/movement2.wav")
	resource.AddFile("sound/csgo/weapons/movement3.wav")
	resource.AddFile("sound/csgo/weapons/revolver/revolver_clipin.wav")
	resource.AddFile("sound/csgo/weapons/revolver/revolver_clipout.wav")
	resource.AddFile("sound/csgo/weapons/revolver/revolver_draw.wav")
	resource.AddFile("sound/csgo/weapons/revolver/revolver_hammer.wav")
	resource.AddFile("sound/csgo/weapons/revolver/revolver_prepare.wav")
	resource.AddFile("sound/csgo/weapons/revolver/revolver_sideback.wav")
	resource.AddFile("sound/csgo/weapons/revolver/revolversiderelease.wav")
	resource.AddFile("sound/csgo/weapons/revolver/revolver-1_01.wav")
	resource.AddFile("sound/weapons/csgo/revolver/revolver_clipin.wav")
	resource.AddFile("sound/weapons/csgo/revolver/revolver_clipout.wav")
	resource.AddFile("sound/weapons/csgo/revolver/revolver_draw.wav")
	resource.AddFile("sound/weapons/csgo/revolver/revolver_hammer.wav")
	resource.AddFile("sound/weapons/csgo/revolver/revolver_prepare.wav")
	resource.AddFile("sound/weapons/csgo/revolver/revolver_sideback.wav")
	resource.AddFile("sound/weapons/csgo/revolver/revolversiderelease.wav")
	resource.AddFile("sound/weapons/csgo/revolver/revolver-1_01.wav")
	resource.AddFile("sound/weapons/csgo/revolver/revolver-1_distant.wav")
	resource.AddWorkshop("2903604575")
end

if CLIENT then
SWEP.WepSelectIcon = surface.GetTextureID( "csgo/econ/weapons/base_weapons/weapon_revolver" )
SWEP.DrawWeaponInfoBox	= false
SWEP.BounceWeaponIcon = false
killicon.Add( "weapon_csgo_revolver", "csgo/econ/weapons/base_weapons/weapon_revolver", Color( 255, 255, 255, 255 ) )
end

SWEP.PrintName = "R8 Revolver"
-- my edits
SWEP.Base = "weapon_tttbase"
SWEP.Kind = WEAPON_PISTOL
SWEP.Primary.Ammo = "AlyxGun"
SWEP.AutoSpawnable = true
SWEP.InLoadoutFor = nil
SWEP.Icon = "VGUI/ttt/r8causeofdeath.vmt"
SWEP.AmmoEnt = "item_ammo_revolver_ttt"
SWEP.AllowDrop = true
SWEP.IsSilent = false
SWEP.NoSights = true
SWEP.Primary.ClipMax = 8
SWEP.ViewModelFOV = 75
-- end of my edits

SWEP.ViewModelFOV = 80
SWEP.ViewModel = "models/csgo/weapons/v_pist_revolver.mdl"
SWEP.WorldModel = "models/csgo/weapons/w_pist_revolver.mdl"
SWEP.ViewModelFlip = false
SWEP.BobScale = 0.4
SWEP.SwayScale = 0.75

SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.Weight = 7
SWEP.Slot = 1
SWEP.SlotPos = 0

SWEP.UseHands = true
SWEP.HoldType = "revolver"
SWEP.FiresUnderwater = true
SWEP.DrawCrosshair = true
SWEP.DrawAmmo = true
SWEP.CSMuzzleFlashes = 1

SWEP.Hammer = 0
SWEP.HammerTimer = CurTime()
SWEP.InspectTimer = CurTime()
SWEP.ShotTimer = CurTime()
SWEP.Reloading = 0
SWEP.ReloadingTimer = CurTime()
SWEP.ReloadingTime = 1.97
SWEP.ReloadingStage = 0
SWEP.ReloadingStageTimer = CurTime()
SWEP.Idle = 0
SWEP.IdleTimer = CurTime()

--SWEP.Speed = 176
SWEP.CrosshairDistance = 24

SWEP.Primary.Sound = Sound( "Weapon_CSGO_Revolver.Single" )
SWEP.Primary.ClipSize = 8
SWEP.Primary.DefaultClip = 8
SWEP.Primary.Automatic = false
SWEP.Primary.Damage = 50
SWEP.Primary.TakeAmmo = 1
SWEP.Primary.Spread = 0.002
SWEP.Primary.SpreadMin = 0.002
SWEP.Primary.SpreadMax = 0.065
SWEP.Primary.SpreadKick = 0.05
SWEP.Primary.SpreadMove = 0.065
SWEP.Primary.SpreadAir = 0.065
SWEP.Primary.SpreadAlt = 0.08
SWEP.Primary.SpreadTimer = CurTime()
SWEP.Primary.SpreadTime = 0.9
SWEP.Primary.NumberofShots = 1
SWEP.Primary.Delay = 0.5
SWEP.Primary.Force = 3

SWEP.Secondary.ClipSize = 0
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"
SWEP.Secondary.Delay = 0.4

---------sounds-----------------------------------------------------------
sound.Add({
	name = "Weapon_Revolver_CSGO.Single",
	channel = CHAN_STATIC,
	level = 79,
	sound = Sound")weapons/csgo/revolver/revolver-1_01.wav"
})
sound.Add({
	name = "Weapon_Revolver_CSGO.Prepare",
	channel = CHAN_ITEM,
	level = 65,
	volume = {0.9, 1.0},
	sound = Sound"weapons/csgo/revolver/revolver_prepare.wav"
})
sound.Add({
	name = "Weapon_Revolver_CSGO.Draw",
	channel = CHAN_STATIC,
	level = 65,
	volume = 0.3,
	pitch = {97, 105},
	sound = Sound"weapons/csgo/revolver/revolver_draw.wav"
})
sound.Add({
	name = "Weapon_Revolver_CSGO.Clipout",
	channel = CHAN_ITEM,
	level = 65,
	pitch = {97, 105},
	volume = {0.5, 1.0},
	sound = Sound"weapons/csgo/revolver/revolver_clipout.wav"
})
sound.Add({
	name = "Weapon_Revolver_CSGO.Clipin",
	channel = CHAN_ITEM,
	level = 65,
	pitch = {97, 105},
	volume = {0.5, 1.0},
	sound = Sound"weapons/csgo/revolver/revolver_clipin.wav"
})
sound.Add({
	name = "Weapon_Revolver_CSGO.Sideback",
	channel = CHAN_ITEM,
	level = 65,
	pitch = {97, 105},
	volume = {0.5, 1.0},
	sound = Sound"weapons/csgo/revolver/revolver_sideback.wav"
})
sound.Add({
	name = "Weapon_Revolver_CSGO.Siderelease",
	channel = CHAN_ITEM,
	level = 65,
	pitch = {97, 105},
	volume = {0.5, 1.0},
	sound = Sound"weapons/csgo/revolver/revolver_siderelease.wav"
})
sound.Add({
	name = "Weapon_Revolver_CSGO.BarrelRoll",
	channel = CHAN_ITEM,
	level = 65,
	pitch = 120,
	volume = 0.2,
	sound = Sound"weapons/csgo/revolver/revolver_prepare.wav"
})
-------------------------------------------------------------------------------

function SWEP:Initialize()
self:SetWeaponHoldType( self.HoldType )
self.Idle = 0
self.IdleTimer = CurTime() + 0.5
end

function SWEP:Deploy()
self:SetWeaponHoldType( self.HoldType )
self.Weapon:SendWeaponAnim( ACT_VM_DRAW )
self:SetNextPrimaryFire( CurTime() + self.Owner:GetViewModel():SequenceDuration() )
self:SetNextSecondaryFire( CurTime() + self.Owner:GetViewModel():SequenceDuration() )
self.Hammer = 0
self.HammerTimer = CurTime()
self.InspectTimer = CurTime() + self.Owner:GetViewModel():SequenceDuration()
self.ShotTimer = CurTime()
self.Reloading = 0
self.ReloadingTimer = CurTime() + self.Owner:GetViewModel():SequenceDuration()
self.ReloadingStage = 0
self.ReloadingStageTimer = CurTime()
self.Idle = 0
self.IdleTimer = CurTime() + self.Owner:GetViewModel():SequenceDuration()
return true
end

function SWEP:Holster()
self.Hammer = 0
self.HammerTimer = CurTime()
self.InspectTimer = CurTime()
self.ShotTimer = CurTime()
self.Reloading = 0
self.ReloadingTimer = CurTime()
self.ReloadingStage = 0
self.ReloadingStageTimer = CurTime()
self.Idle = 0
self.IdleTimer = CurTime()
return true
end

function SWEP:PrimaryAttack()
if self.Reloading == 1 then return end
if ( self.Weapon:Clip1() <= 0 and self.Weapon:Ammo1() <= 0 ) || ( self.FiresUnderwater == false and self.Owner:WaterLevel() == 3 ) then
if SERVER then
self.Owner:EmitSound( "Default.ClipEmpty_Pistol" )
end
self:SetNextPrimaryFire( CurTime() + 0.2 )
end
if self.Weapon:Clip1() <= 0 and self.Weapon:Ammo1() > 0 then
self:Reload()
end
if self.Weapon:Clip1() <= 0 || ( self.FiresUnderwater == false and self.Owner:WaterLevel() == 3 ) then return end
self.Weapon:SendWeaponAnim( ACT_VM_HAULBACK )
self:SetNextPrimaryFire( CurTime() + 0.2 )
self:SetNextSecondaryFire( CurTime() + 0.2 )
self.Hammer = 1
self.HammerTimer = CurTime() + 0.2
self.Idle = 0
self.IdleTimer = CurTime() + self.Owner:GetViewModel():SequenceDuration()
end

function SWEP:ShootEffects()
self.Owner:SetAnimation( PLAYER_ATTACK1 )
self.Owner:MuzzleFlash()
end

function SWEP:SecondaryAttack()
	if self.InspectTimer <= CurTime() and self.ReloadingTimer <= CurTime() and self.Owner:KeyDown( IN_USE ) then
		self.Weapon:SendWeaponAnim( ACT_VM_IDLE_DEPLOYED )
		self.InspectTimer = CurTime() + self.Owner:GetViewModel():SequenceDuration()
		self.Idle = 0
		self.IdleTimer = CurTime() + self.Owner:GetViewModel():SequenceDuration()
	end
	if !self.Owner:KeyDown( IN_USE ) then
	if self.Reloading == 1 then return end
	if ( self.Weapon:Clip1() <= 0 and self.Weapon:Ammo1() <= 0 ) || ( self.FiresUnderwater == false and self.Owner:WaterLevel() == 3 ) then
	if SERVER then
		self.Owner:EmitSound( "Default.ClipEmpty_Pistol" )
	end
		self:SetNextPrimaryFire( CurTime() + 0.2 )
	end
		if self.Weapon:Clip1() <= 0 and self.Weapon:Ammo1() > 0 then
		self:Reload()
	end
	if self.Weapon:Clip1() <= 0 || ( self.FiresUnderwater == false and self.Owner:WaterLevel() == 3 ) then return end
		local bullet = {}
		bullet.Num = self.Primary.NumberofShots
		bullet.Src = self.Owner:GetShootPos()
		bullet.Dir = self.Owner:GetAimVector() - self.Owner:EyeAngles():Right() * self.Owner:GetViewPunchAngles().y * 0.03 - self.Owner:EyeAngles():Up() * self.Owner:GetViewPunchAngles().x * 0.03
		bullet.Spread = Vector( self.Primary.SpreadAlt, self.Primary.SpreadAlt, 0 )
		bullet.Tracer = 1
		bullet.Force = self.Primary.Force
		bullet.Distance = 4096
		bullet.Damage = self.Primary.Damage
		bullet.AmmoType = self.Primary.Ammo
		self.Owner:FireBullets( bullet )
		self:EmitSound( self.Primary.Sound )
		self.Weapon:SendWeaponAnim( ACT_VM_SECONDARYATTACK )
		self:ShootEffects()
		self.Owner:ViewPunch( Angle( -0.5, -0.5, 0 ) )
		self:TakePrimaryAmmo( self.Primary.TakeAmmo )
		self:SetNextPrimaryFire( CurTime() + self.Secondary.Delay )
		self:SetNextSecondaryFire( CurTime() + self.Secondary.Delay )
	if self.Primary.Spread < self.Primary.SpreadMax then
		self.Primary.Spread = self.Primary.Spread + self.Primary.SpreadAlt
	end
		self.Primary.SpreadTimer = CurTime() + self.Primary.SpreadTime
		self.InspectTimer = CurTime() + self.Primary.Delay
		self.ShotTimer = CurTime() + self.Primary.Delay
		self.ReloadingTimer = CurTime() + self.Primary.Delay
		self.Idle = 0
		self.IdleTimer = CurTime() + self.Owner:GetViewModel():SequenceDuration()
	end
end


function SWEP:Reload()
	if self.Reloading == 0 and self.ReloadingTimer <= CurTime() and self.Weapon:Clip1() < self.Primary.ClipSize and self.Weapon:Ammo1() > 0 then
		self.Weapon:SendWeaponAnim( ACT_VM_RELOAD )
		self.Owner:SetAnimation( PLAYER_RELOAD )
		self:SetNextPrimaryFire( CurTime() + self.Owner:GetViewModel():SequenceDuration() )
		self:SetNextSecondaryFire( CurTime() + self.Owner:GetViewModel():SequenceDuration() )
		self.Hammer = 0
		self.HammerTimer = CurTime()
		self.InspectTimer = CurTime() + self.Owner:GetViewModel():SequenceDuration()
		self.Reloading = 1
		self.ReloadingTimer = CurTime() + self.ReloadingTime
		self.ReloadingStage = 1
		self.ReloadingStageTimer = CurTime() + 1.033333
		self.Idle = 0
		self.IdleTimer = CurTime() + self.Owner:GetViewModel():SequenceDuration()
	end
end

function SWEP:ReloadEnd()
	if self.Weapon:Ammo1() > ( self.Primary.ClipSize - self.Weapon:Clip1() ) then
		self.Owner:SetAmmo( self.Weapon:Ammo1() - self.Primary.ClipSize + self.Weapon:Clip1(), self.Primary.Ammo )
		self.Weapon:SetClip1( self.Primary.ClipSize )
	end
	if ( self.Weapon:Ammo1() - self.Primary.ClipSize + self.Weapon:Clip1() ) + self.Weapon:Clip1() < self.Primary.ClipSize then
		self.Weapon:SetClip1( self.Weapon:Clip1() + self.Weapon:Ammo1() )
		self.Owner:SetAmmo( 0, self.Primary.Ammo )
	end
	self.Reloading = 0
end

function SWEP:IdleAnimation()
	if self.Idle == 0 then
		self.Idle = 1
	end
	if SERVER and self.Idle == 1 then
		self.Weapon:SendWeaponAnim( ACT_VM_IDLE )
	end
	self.IdleTimer = CurTime() + self.Owner:GetViewModel():SequenceDuration()
end

function SWEP:Think()
	if self.Hammer == 1 then
		if !self.Owner:KeyDown( IN_ATTACK ) then
			self.Hammer = 0
			self.HammerTimer = CurTime()
			self.Idle = 0
			self.IdleTimer = CurTime()
		end
	if self.HammerTimer <= CurTime() and self.Owner:KeyDown( IN_ATTACK ) then
	if ( self.Weapon:Clip1() <= 0 and self.Weapon:Ammo1() <= 0 ) || ( self.FiresUnderwater == false and self.Owner:WaterLevel() == 3 ) then
	if SERVER then
		self.Owner:EmitSound( "Default.ClipEmpty_Pistol" )
	end
		self:SetNextPrimaryFire( CurTime() + 0.2 )
	end
	if self.Weapon:Clip1() <= 0 || ( self.FiresUnderwater == false and self.Owner:WaterLevel() == 3 ) then return end
		local bullet = {}
		bullet.Num = self.Primary.NumberofShots
		bullet.Src = self.Owner:GetShootPos()
		bullet.Dir = self.Owner:GetAimVector() - self.Owner:EyeAngles():Right() * self.Owner:GetViewPunchAngles().y * 0.03 - self.Owner:EyeAngles():Up() * self.Owner:GetViewPunchAngles().x * 0.03
		bullet.Spread = Vector( self.Primary.Spread, self.Primary.Spread, 0 )
		bullet.Tracer = 1
		bullet.Force = self.Primary.Force
		bullet.Distance = 4096
		bullet.Damage = self.Primary.Damage
		bullet.AmmoType = self.Primary.Ammo
		self.Owner:FireBullets( bullet )
		self:EmitSound( self.Primary.Sound )
		self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
		self:ShootEffects()
		self.Owner:ViewPunch( Angle( -0.5, -0.5, 0 ) )
		self:TakePrimaryAmmo( self.Primary.TakeAmmo )
		self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
		self:SetNextSecondaryFire( CurTime() + self.Primary.Delay )
		if self.Primary.Spread < self.Primary.SpreadMax then
			self.Primary.Spread = self.Primary.Spread + self.Primary.SpreadKick
		end
		self.Primary.SpreadTimer = CurTime() + self.Primary.SpreadTime
		self.InspectTimer = CurTime() + self.Primary.Delay
		self.ShotTimer = CurTime() + self.Primary.Delay + 0.2
		self.ReloadingTimer = CurTime() + self.Primary.Delay
		self.Hammer = 0
		self.HammerTimer = CurTime()
		self.Idle = 0
		self.IdleTimer = CurTime() + self.Owner:GetViewModel():SequenceDuration()
		end
	end
	if self.Reloading == 1 then
		if self.ReloadingTimer <= CurTime() + self.ReloadingTime and self.ReloadingTimer > CurTime() + 1.75 then
			self.Owner:ViewPunch( Angle( -0.025, 0, 0 ) )
		end
		if self.ReloadingTimer <= CurTime() + 1.75 and self.ReloadingTimer > CurTime() + 1.5 then
			self.Owner:ViewPunch( Angle( -0.05, -0.025, 0 ) )
		end
		if self.ReloadingTimer <= CurTime() + 1.5 and self.ReloadingTimer > CurTime() + 1.25 then
			self.Owner:ViewPunch( Angle( 0.05, -0.05, 0 ) )
		end
		if self.ReloadingTimer <= CurTime() + 1.25 and self.ReloadingTimer > CurTime() + 1 then
			self.Owner:ViewPunch( Angle( 0.1, -0.075, 0 ) )
		end
		if self.ReloadingTimer <= CurTime() + 1 and self.ReloadingTimer > CurTime() + 0.75 then
			self.Owner:ViewPunch( Angle( 0.075, -0.1, 0 ) )
		end
		if self.ReloadingTimer <= CurTime() + 0.75 and self.ReloadingTimer > CurTime() + 0.5 then
			self.Owner:ViewPunch( Angle( 0.05, -0.1, 0 ) )
		end
		if self.ReloadingTimer <= CurTime() + 0.5 and self.ReloadingTimer > CurTime() + 0.25 then
			self.Owner:ViewPunch( Angle( -0.05, -0.075, 0 ) )
		end
		if self.ReloadingTimer <= CurTime() + 0.25 and self.ReloadingTimer > CurTime() then
			self.Owner:ViewPunch( Angle( -0.025, 0.025, 0 ) )
		end
	end
	if self.ShotTimer > CurTime() then
		self.Primary.SpreadTimer = CurTime() + self.Primary.SpreadTime
	end
	if self.Owner:IsOnGround() then
		if self.Owner:GetVelocity():Length() <= 100 then
		if self.Primary.SpreadTimer <= CurTime() then
			self.Primary.Spread = self.Primary.SpreadMin
		end
		if self.Primary.Spread > self.Primary.SpreadMin then
			self.Primary.Spread = ( ( self.Primary.SpreadTimer - CurTime() ) / self.Primary.SpreadTime ) * self.Primary.Spread
		end
	end
	if self.Owner:GetVelocity():Length() <= 100 and self.Primary.Spread > self.Primary.SpreadMax then
		self.Primary.Spread = self.Primary.SpreadMax
	end
		if self.Owner:GetVelocity():Length() > 100 then
			self.Primary.Spread = self.Primary.SpreadMove
			self.Primary.SpreadTimer = CurTime() + self.Primary.SpreadTime
			if self.Primary.Spread > self.Primary.SpreadMin then
			self.Primary.Spread = ( ( self.Primary.SpreadTimer - CurTime() ) / self.Primary.SpreadTime ) * self.Primary.SpreadMove
			end
		end
	end
	if !self.Owner:IsOnGround() then
		self.Primary.Spread = self.Primary.SpreadAir
		self.Primary.SpreadTimer = CurTime() + self.Primary.SpreadTime
		if self.Primary.Spread > self.Primary.SpreadMin then
			self.Primary.Spread = ( ( self.Primary.SpreadTimer - CurTime() ) / self.Primary.SpreadTime ) * self.Primary.SpreadAir
		end
	end
	if self.Reloading == 1 and self.ReloadingTimer <= CurTime() then
		self:ReloadEnd()
	end
	if self.IdleTimer <= CurTime() then
		self:IdleAnimation()
	end
end