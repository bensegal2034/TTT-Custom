if SERVER then
AddCSLuaFile()
	resource.AddFile( "sound/weapons/kitchen_gun/bang.wav" )
	resource.AddFile( "sound/weapons/kitchen_gun/iloveu.wav" )
	resource.AddFile( "sound/weapons/kitchen_gun/ofas1.wav" )
	resource.AddFile( "sound/weapons/kitchen_gun/ofas2.wav" )
	resource.AddFile( "sound/weapons/kitchen_gun/ofas3.wav" )
	resource.AddFile( "sound/weapons/kitchen_gun/ofas4.wav" )
	resource.AddFile( "sound/weapons/toilet_grenade/bang.wav" )
	resource.AddFile( "sound/weapons/toilet_grenade/fire1.wav" )
	resource.AddFile( "sound/weapons/toilet_grenade/fire2.wav" )
	resource.AddWorkshop("641721506")
end
SWEP.HoldType = "pistol"

if CLIENT then
   SWEP.PrintName = "Kitchen gun"			
   SWEP.Author = "Snektron"

   SWEP.Slot = 6
   SWEP.SlotPos	= 1

   SWEP.Icon = "vgui/ttt/icon_deagle"
end

//SWEP.Base = "weapon_tttbase"
SWEP.Base = "weapon_base"
SWEP.Category = "Kitchen gun"
SWEP.PrimaryAnim = ACT_VM_PRIMARYATTACK
SWEP.ReloadAnim = ACT_VM_RELOAD
SWEP.Slot = 2

SWEP.Spawnable = true
SWEP.Kind = WEAPON_EQUIP2
SWEP.CanBuy = {ROLE_DETECTIVE}
SWEP.WeaponID = AMMO_KITCHEN

SWEP.Primary.Ammo = "357"
SWEP.Primary.Recoil = 6
SWEP.Primary.Damage = 40
SWEP.Primary.Delay = 0.52
SWEP.Primary.Cone = 0.02
SWEP.Primary.ClipSize = 10
SWEP.Primary.ClipMax = 50
SWEP.Primary.DefaultClip = 50
SWEP.Primary.Automatic = true
SWEP.Primary.Spread = 0.1
SWEP.Primary.Sound = Sound("weapons/kitchen_gun/bang.wav")
SWEP.Primary.NumShots = 1

SWEP.Secondary.ClipSize = 0
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"
SWEP.Secondary.Delay = 2.2
SWEP.Secondary.SoundLevel = SWEP.Primary.SoundLevel

SWEP.HeadshotMultiplier = 2.5

SWEP.AutoSpawnable = true
SWEP.AmmoEnt = "item_ammo_revolver_ttt"

SWEP.UseHands = true
SWEP.ViewModelFlip = false
SWEP.ViewModelFOV = 54
SWEP.ViewModel = "models/weapons/cstrike/c_pist_deagle.mdl"
SWEP.WorldModel = "models/weapons/w_pist_deagle.mdl"

SWEP.IronSightsPos = Vector(-6.361, -3.701, 2.15)
SWEP.IronSightsAng = Vector(0, 0, 0)

SWEP.EquipMenuData = {
   type = "Weapon",
   desc = "BANG BANG BANG BANG"
};

CreateConVar("kitchen_enablegrenades", "1", 0, "enable grenades")

function SWEP:killSounds()
	if (self.dirtOnMe) then
		self.dirtOnMe:Stop()
		self.dirtOnMe = nil
	end
end

function SWEP:Deploy()
	if (CLIENT) then return true end
	if (self.dirtOnMe) then
		self.dirtOnMe:Play()
		self.dirtOnMe:ChangeVolume(0.35, 0.1)
	end
	return true
end

function SWEP:PrimaryAttack()
	self:SetNextSecondaryFire( CurTime() + self.Primary.Delay )
	self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )

	if not self:CanPrimaryAttack() then return end
	self.nextShot = CurTime() + self.Primary.Delay + 0.1
	
	if not worldsnd then
		self:EmitSound( self.Primary.Sound, self.Primary.SoundLevel )
	elseif SERVER then
		sound.Play(self.Primary.Sound, self:GetPos(), self.Primary.SoundLevel)
	end
	
	self:ShootBullet(self.Primary.Damage, self.Primary.Recoil, self.Primary.NumShots, self:GetPrimaryCone())

	self:TakePrimaryAmmo(1)

	local owner = self.Owner
	if not IsValid(owner) or owner:IsNPC() or (not owner.ViewPunch) then return end

	owner:ViewPunch(Angle(math.Rand(-0.2, -0.1) * self.Primary.Recoil, math.Rand(-0.1, 0.1) * self.Primary.Recoil, 0))
end

function SWEP:OnFireAutomationStop()
	self:EmitSound(Sound("weapons/kitchen_gun/ofas"..math.random(1, 4)..".wav"), self.Secondary.SoundLevel)
end

function SWEP:Think()
	if CLIENT then return end
	if not self.nextShot then return end
	if self.nextShot < CurTime() then
		self.nextShot = nil
		self:OnFireAutomationStop()
	end
end

function SWEP:SecondaryAttack()
	if not GetConVar("kitchen_enablegrenades"):GetBool() then return end
	self:ThrowNade()
	self:EmitSound(Sound("weapons/toilet_grenade/fire"..math.random(1, 2)..".wav"), self.Secondary.SoundLevel)
	self:SetNextSecondaryFire(CurTime() + self.Secondary.Delay)
end

function SWEP:Reload()
	self.nextShot = nil
	if (self:Clip1() == self.Primary.ClipSize or self.Owner:GetAmmoCount(self.Primary.Ammo ) <= 0) then return end
	self:DefaultReload(self.ReloadAnim)
	self:EmitSound(Sound("weapons/kitchen_gun/iloveu.wav"), self.Secondary.SoundLevel)
end

function SWEP:ThrowNade()
	if SERVER then
		local ply = self.Owner
		if not IsValid(ply) then return end

		local ang = ply:EyeAngles()
		local src = ply:GetPos() + (ply:Crouching() and ply:GetViewOffsetDucked() or ply:GetViewOffset()) + (ang:Forward() * 8) + (ang:Right() * 10)
		local target = ply:GetEyeTraceNoCursor().HitPos
		local tang = (target-src):Angle()
	
		if tang.p < 90 then
			tang.p = -10 + tang.p * ((90 + 10) / 90)
		else
			tang.p = 360 - tang.p
			tang.p = -10 + tang.p * -((90 + 10) / 90)
		end
		tang.p = math.Clamp(tang.p,-90,90)
		local vel = math.min(800, (90 - tang.p) * 6)
		local thr = tang:Forward() * vel + ply:GetVelocity()
		self:CreateGrenade(src, Angle(0,0,0), thr, Vector(600, math.random(-1200, 1200), 0), ply)
	end
end

function SWEP:CreateGrenade(src, ang, vel, angimp, ply)
	local gren = ents.Create("toilet_grenade_proj")
	if not IsValid(gren) then return end

	gren:SetPos(src)
	gren:SetAngles(ang)

	gren:SetOwner(ply)
	gren:SetThrower(ply)

	gren:SetGravity(0.4)
	gren:SetFriction(0.2)
	gren:SetElasticity(0.45)

	gren:Spawn()

	gren:PhysWake()

	local phys = gren:GetPhysicsObject()
	if IsValid(phys) then
		phys:SetVelocity(vel)
		phys:AddAngleVelocity(angimp)
	end

	gren:SetDetonateTimer(10)

	return gren
end

function SWEP:Holster()
	self:killSounds()
	return true
end

function SWEP:OnRemove()
	self:killSounds()
end

function SWEP:OnDrop()
	self:killSounds()
end

function SWEP:ShootBullet( dmg, recoil, numbul, cone )
   self:SendWeaponAnim(self.PrimaryAnim)

   self.Owner:MuzzleFlash()
   self.Owner:SetAnimation(PLAYER_ATTACK1)

   if not IsFirstTimePredicted() then return end

   numbul = numbul or 1
   cone   = cone   or 0.01

   local bullet = {}
   bullet.Num    = numbul
   bullet.Src    = self.Owner:GetShootPos()
   bullet.Dir    = self.Owner:GetAimVector()
   bullet.Spread = Vector(cone, cone, 0)
   bullet.Tracer = 1
   bullet.TracerName = self.Tracer or "Tracer"
   bullet.Force  = 10000
   bullet.Damage = dmg

   self.Owner:FireBullets(bullet)

   -- Owner can die after firebullets
   if (not IsValid(self.Owner)) or (not self.Owner:Alive()) or self.Owner:IsNPC() then return end

   if ((game.SinglePlayer() and SERVER) or
       ((not game.SinglePlayer()) and CLIENT and IsFirstTimePredicted())) then

      local eyeang = self.Owner:EyeAngles()
      eyeang.pitch = eyeang.pitch - recoil
      self.Owner:SetEyeAngles( eyeang )
   end
end

function SWEP:GetPrimaryCone()
   return self.Primary.Cone or 0.2
end