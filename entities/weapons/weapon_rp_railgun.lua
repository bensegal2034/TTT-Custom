CreateConVar("ttt_rp_railgun_sound",0,{FCVAR_SERVER_CAN_EXECUTE},"Makes the Railgun emit a sound to indicate its current charge level")
if SERVER then
	AddCSLuaFile()
	resource.AddFile( "sound/weapons/aw50/awp_boltback.mp3" )
	resource.AddFile( "sound/weapons/aw50/awp_boltforward.mp3" )
	resource.AddFile( "sound/weapons/aw50/awp_magin.mp3" )
	resource.AddFile( "sound/weapons/aw50/awp_magout.mp3" )
	resource.AddFile( "sound/weapons/aw50/barret50-1.wav" )
	resource.AddFile( "sound/weapons/aw50/bfg_explode1.wav" )
	resource.AddFile( "sound/weapons/aw50/bfg_explode2.wav" )
	resource.AddFile( "sound/weapons/aw50/bfg_explode3.wav" )
	resource.AddFile( "sound/weapons/aw50/bfg_explode4.wav" )
	resource.AddFile( "sound/weapons/aw50/bfg_firebegin.wav" )
   resource.AddFile( "sound/weapons/aw50/railcannonfire.wav" )
	resource.AddFile( "sound/weapons/aw50/m24_boltback.mp3" )
	resource.AddFile( "sound/weapons/aw50/m24_boltforward.mp3" )
	resource.AddFile( "models/weapons/v_aw50_awp.mdl" )
	resource.AddFile( "models/weapons/w_acc_int_aw50.mdl" )
	resource.AddFile( "materials/vgui/ttt/lykrast/icon_rp_railgun.vmt" )
	resource.AddFile( "materials/vgui/ttt/lykrast/icon_rp_railgun.vtf" )
	resource.AddFile( "materials/models/weapons/x_models/aw50/body.vmt" )
	resource.AddFile( "materials/models/weapons/x_models/aw50/extra.vmt" )
	resource.AddFile( "materials/models/weapons/x_models/aw50/g22_base.vmt" )
	resource.AddFile( "materials/models/weapons/x_models/aw50/g22_parts.vmt" )
	resource.AddFile( "materials/models/weapons/x_models/aw50/m82.vmt" )
	resource.AddFile( "materials/models/weapons/x_models/aw50/stuff.vmt" )
	resource.AddFile( "materials/models/weapons/v_models/aw50/body.vmt" )
	resource.AddFile( "materials/models/weapons/v_models/aw50/body.vtf" )
	resource.AddFile( "materials/models/weapons/v_models/aw50/extra.vmt" )
	resource.AddFile( "materials/models/weapons/v_models/aw50/extra.vtf" )
	resource.AddFile( "materials/models/weapons/v_models/aw50/g22_base.vmt" )
	resource.AddFile( "materials/models/weapons/v_models/aw50/g22_base.vtf" )
	resource.AddFile( "materials/models/weapons/v_models/aw50/g22_base_ref.vtf" )
	resource.AddFile( "materials/models/weapons/v_models/aw50/g22_parts.vmt" )
	resource.AddFile( "materials/models/weapons/v_models/aw50/g22_parts.vtf" )
	resource.AddFile( "materials/models/weapons/v_models/aw50/m82.vmt" )
	resource.AddFile( "materials/models/weapons/v_models/aw50/stuff.vmt" )
	resource.AddFile( "materials/models/weapons/v_models/aw50/stuff.vtf" )
	resource.AddFile( "materials/models/weapons/c_ukrailcannon.dx80.vtx" )
	resource.AddFile( "materials/models/weapons/c_ukrailcannon.dx90.vtx" )
	resource.AddFile( "materials/models/weapons/c_ukrailcannon.mdl" )
	resource.AddFile( "materials/models/weapons/c_ukrailcannon.sw.vtx" )
	resource.AddFile( "materials/models/weapons/c_ukrailcannon.vvd" )
	resource.AddWorkshop("2824736215")
end

SWEP.HoldType           = "ar2"

if CLIENT then
   SWEP.PrintName          = "Electric Railcannon"
   SWEP.Slot               = 7
   SWEP.Icon = "vgui/ttt/lykrast/icon_rp_railgun"
end

SWEP.EquipMenuData = {
   type = "Weapon",
   desc = "Long cooldown weapon with the potential to deal \nmassive damage. \n\nKeep held out to recharge ammo."
};

SWEP.Base               = "weapon_tttbase"
SWEP.Spawnable = false 

SWEP.Kind = WEAPON_HEAVY

SWEP.Primary.Delay          = 2.5
SWEP.Primary.Recoil         = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "alyxgun"
SWEP.Primary.Damage = 20
SWEP.Primary.Cone = 0.005
SWEP.Primary.ClipSize = 4
SWEP.Primary.ClipMax = 4 -- keep mirrored to ammo
SWEP.Primary.DefaultClip = 4
SWEP.ReloadTimer = 0
SWEP.ReloadDelay = 2
SWEP.TraceStartPos = Vector(0,0,0)
SWEP.HeadshotMultiplier = 4
SWEP.AutoSpawnable      = false
SWEP.AmmoEnt = "item_ammo_357_ttt"
SWEP.Tracer = "ToolTracer"
SWEP.UseHands			= false
SWEP.ViewModelFlip   = false
SWEP.ViewModelFOV		= 70
SWEP.ViewModel          = "models/weapons/c_ukrailcannon.mdl"
SWEP.WorldModel         = "models/weapons/c_ukrailcannon.mdl"
SWEP.CanBuy = { ROLE_TRAITOR , ROLE_DETECTIVE}
SWEP.Primary.Sound = "weapons/aw50/railcannonfire.wav"
SWEP.Primary.Special1 = "weapons/aw50/bfg_firebegin.wav"
SWEP.Primary.Special2 = Sound("Buttons.snd3")
SWEP.Kind = WEAPON_EQUIP1
SWEP.Secondary.Sound = Sound("Default.Zoom")
SWEP.AllowDrop = false

function SWEP:ShootBullet( dmg, recoil, numbul, cone )

   self:SendWeaponAnim(self.PrimaryAnim)

   self.Owner:MuzzleFlash()
   self.Owner:SetAnimation( PLAYER_ATTACK1 )

   if not IsFirstTimePredicted() then return end

   numbul = numbul or 1
   cone   = cone   or 0.01

   local bullet = {}
   bullet.Num    = numbul
   bullet.Src    = self.Owner:GetShootPos()
   bullet.Dir    = self.Owner:GetAimVector()
   bullet.Spread = Vector( cone, cone, 0 )
   bullet.Tracer = 1
   bullet.TracerName = "ToolTracer"
   bullet.Force  = 10
   bullet.Damage = dmg

   self.Owner:FireBullets( bullet )

   -- Owner can die after firebullets
   if (not IsValid(self.Owner)) or (not self.Owner:Alive()) or self.Owner:IsNPC() then return end

   if ((game.SinglePlayer() and SERVER) or
       ((not game.SinglePlayer()) and CLIENT and IsFirstTimePredicted())) then

      -- reduce recoil if ironsighting
      recoil = sights and (recoil * 0.6) or recoil

      local eyeang = self.Owner:EyeAngles()
      eyeang.pitch = eyeang.pitch - recoil
      self.Owner:SetEyeAngles( eyeang )
   end

end

function SWEP:PrimaryAttack(worldsnd)
   if ( self:Clip1() == 0 ) then return end
   self.InAttack = true
   self:SetNextSecondaryFire( CurTime() + self.Primary.Delay )
   self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )

   if SERVER then
       self.ChargeSound = CreateSound(self.Owner, self.Primary.Special1)
       self.ChargeSound:SetSoundLevel(90)
       self.ChargeSound:Play()
   end

   self.mode1 = CurTime() +.05
   if ( self:Clip1() > 1 ) then
       self.mode2 = CurTime() +.6
   end
   if ( self:Clip1() > 2 ) then
        self.mode3 = CurTime() +1.2
   end
   if ( self:Clip1() > 3 ) then
       self.mode4 = CurTime() +1.8
   end
   self.overcharge = CurTime() +2.3
end

function SWEP:Shake()
	if SERVER then
		local shake = ents.Create( "env_shake" )
			shake:SetOwner( self.Owner )
			shake:SetPos( self:GetPos() )
			shake:SetKeyValue( "amplitude", "5" )
			shake:SetKeyValue( "radius", "64" )
			shake:SetKeyValue( "duration", "1.5" )
			shake:SetKeyValue( "frequency", "255" )
			shake:SetKeyValue( "spawnflags", "4" )
			shake:Spawn()
			shake:Activate()
			shake:Fire( "StartShake", "", 0 )
	end
end
function SWEP:BfgFire(worldsnd)

   self:SetNextSecondaryFire( CurTime() + 0.5 )
   self:SetNextPrimaryFire( CurTime() + 0.5 )

   if not worldsnd then
      self:EmitSound( self.Primary.Sound, self.Primary.SoundLevel )
   elseif SERVER then
      sound.Play(self.Primary.Sound, self:GetPos(), self.Primary.SoundLevel)
   end

	local recoil, damage
	if self.mode == "single" then
		self:TakePrimaryAmmo( 1 )
		recoil = 7
		damage = 20
	end
		
	if self.mode == "2" then
		self:TakePrimaryAmmo( 2 )
		recoil = 12
		damage = 40
	end
		
	if self.mode == "3" then
		self:TakePrimaryAmmo( 3 )
		recoil = 16
		damage = 80
	end
			
	if self.mode == "4" then
		self:TakePrimaryAmmo( 4 )
		recoil = 24
		damage = 160
	end

   self:ShootBullet( damage, recoil, self.Primary.NumShots, self:GetPrimaryCone() )
   self.ReloadTimer = CurTime()
   local owner = self.Owner
   if not IsValid(owner) or owner:IsNPC() or (not owner.ViewPunch) then return end

   owner:ViewPunch( Angle( math.Rand(-0.2,-0.1) * recoil, math.Rand(-0.1,0.1) *recoil, 0 ) )

	if self.ChargeSound then self.ChargeSound:Stop() end
end

function SWEP:Think()
   if CurTime() > (self.ReloadTimer + self.ReloadDelay) then
      if self:Clip1() < self.Primary.ClipSize then
         self.ReloadTimer = CurTime()
         self:SetClip1(self:Clip1() + 1)
         if CLIENT then
            self:EmitSound( self.Primary.Special2, self.Primary.SoundLevel )
         end
      end
   end


	if self.mode1 and CurTime() > self.mode1 then
		self.mode1 = nil
      self.ReloadTimer = CurTime()
		if !self.Owner:KeyDown(IN_ATTACK) then return end
		self.mode = "single"
		self:Shake()
   		if (ConVarExists("ttt_rp_railgun_sound")) then
		      if GetConVar("ttt_rp_railgun_sound"):GetBool() then self:EmitSound( self.Primary.Special2, self.Primary.SoundLevel ) end
		end
	end
	
	if self.mode2 and CurTime() > self.mode2 then
		self.mode2 = nil
      self.ReloadTimer = CurTime()
		if !self.Owner:KeyDown(IN_ATTACK) then return end
		self.mode = "2"
		self:Shake()
   		if (ConVarExists("ttt_rp_railgun_sound")) then
		      if GetConVar("ttt_rp_railgun_sound"):GetBool() then self:EmitSound( self.Primary.Special2, self.Primary.SoundLevel ) end
		end
	end
	
	if self.mode3 and CurTime() > self.mode3 then
		self.mode3 = nil
      self.ReloadTimer = CurTime()
		if !self.Owner:KeyDown(IN_ATTACK) then return end
		self.mode = "3"
		self:Shake()
   		if (ConVarExists("ttt_rp_railgun_sound")) then
		      if GetConVar("ttt_rp_railgun_sound"):GetBool() then self:EmitSound( self.Primary.Special2, self.Primary.SoundLevel ) end
		end
	end
	
	if self.mode4 and CurTime() > self.mode4 then
		self.mode4 = nil
      self.ReloadTimer = CurTime()
		if !self.Owner:KeyDown(IN_ATTACK) then return end
		self.mode = "4"
		self:Shake()
   		if (ConVarExists("ttt_rp_railgun_sound")) then
		      if GetConVar("ttt_rp_railgun_sound"):GetBool() then self:EmitSound( self.Primary.Special2, self.Primary.SoundLevel ) end
		end
	end
	
	if self.overcharge and CurTime() > self.overcharge then
		self.InAttack = nil
      self:BfgFire(true)
      self.mode = "single"
      
      self.mode1 = nil
      self.mode2 = nil
      self.mode3 = nil
      self.mode4 = nil
      self.overcharge = nil
	end
	
	if !self.InAttack or self.Owner:KeyDown(IN_ATTACK) then return end
	self.InAttack = nil
	self:BfgFire(true)
	self.mode = "single"
	
	self.mode1 = nil
	self.mode2 = nil
	self.mode3 = nil
	self.mode4 = nil
	self.overcharge = nil
   
end

function SWEP:PreDrop()
	self.InAttack = nil
    self.mode1 = nil
    self.mode2 = nil
    self.mode3 = nil
    self.mode4 = nil
    self.overcharge = nil
    self.mode = "single"
    if self.ChargeSound then self.ChargeSound:Stop() end
    return self.BaseClass.PreDrop(self)
end

function SWEP:Holster()
    self.InAttack = nil
    self.mode1 = nil
    self.mode2 = nil
    self.mode3 = nil
    self.mode4 = nil
    self.overcharge = nil
    self.mode = "single"
    if self.ChargeSound then self.ChargeSound:Stop() end
    return true
end

function SWEP:Reload()

end
