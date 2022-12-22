if SERVER then
	AddCSLuaFile("weapon_ttt_marksman.lua")
	resource.AddFile("materials/models/c_revolver.vtf")
	resource.AddFile("materials/models/ukcoin.vtf")
	resource.AddFile("materials/vgui/ttt/uk/icon_marksman.vtf")
	resource.AddFile("sound/weapons/revolver/coinflip.wav")
	resource.AddFile("sound/weapons/revolver/fuckingcunt.wav")
	resource.AddFile("sound/weapons/revolver/revolverfire.wav")
	resource.AddFile("sound/weapons/revolver/revolverfire2.wav")
	resource.AddFile("sound/weapons/revolver/revolverfire3.wav")
	resource.AddFile("sound/weapons/revolver/revolverfire4.wav")
	resource.AddFile("sound/weapons/revolver/revolverfire5.wav")
	resource.AddWorkshop("2824736215")
end
SWEP.HoldType = "revolver"
SWEP.PrintName		= "Marksman" -- 'Nice' Weapon name (Shown on HUD)
SWEP.Author			= "Renniren"
SWEP.Contact		= "None"
SWEP.Purpose		= "Murder"
SWEP.Instructions	= "Point at target. Pull trigger. Maximize style. Repeat until target is dead."
SWEP.Category = "ULTRAKILL"

SWEP.ViewModelFOV	= 98
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/c_revolver_green.mdl"
SWEP.WorldModel		= "models/weapons/w_357.mdl"
SWEP.UseHands = true
SWEP.DrawAmmo = false
SWEP.BounceWeaponIcon = false
SWEP.Primary.Delay = 0.55
SWEP.BobScale = 0.8
SWEP.AutoSpawnable      = true
SWEP.Spawnable		= true
SWEP.AdminOnly		= false
SWEP.Base               = "weapon_tttbase"
SWEP.Slot = 6
SWEP.SlotPos = 6
SWEP.Kind = WEAPON_EQUIP1
SWEP.CoinTimer = 0
SWEP.CoinDelay = 3
SWEP.AmmoEnt = "item_ammo_smg1_ttt"

local maxCoins = 4
local ccoins = 4
local regenInterval = 1.5
local cr = 0

SWEP.CanBuy = { ROLE_DETECTIVE }

if CLIENT then
	-- Path to the icon material
	SWEP.Icon = "vgui/ttt/uk/icon_marksman"
	
	-- Text shown in the equip menu
	SWEP.EquipMenuData = {
	   type = "Weapon",
	   desc = "MANKIND IS DEAD. BLOOD IS FUEL. HELL IS FULL."
	};
 end

SWEP.Reloadable = false;
SWEP.Primary.ClipSize		= 32			-- Size of a clip
SWEP.Primary.DefaultClip	= 32		-- Default number of bullets in a clip
SWEP.Primary.Automatic		= true		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "AlyxGun"


SWEP.Secondary.ClipSize		= 4		-- Size of a clip
SWEP.Secondary.DefaultClip	= 4		-- Default number of bullets in a clip
SWEP.Secondary.Automatic	= false		-- Automatic/Semi Auto
SWEP.Secondary.Ammo			= "AlyxGun"
local FireSound = "weapons/revolver/revolverFire.wav"
--[[---------------------------------------------------------
	Name: SWEP:Initialize()
	Desc: Called when the weapon is first loaded
-----------------------------------------------------------]]
function SWEP:Initialize()
	
end

concommand.Add("ultrakill_max_coins", function(ply, cmd, args, argStr)
	for k, v in pairs(args) do
		maxCoins = tonumber(v)
	end
	end, nil, "Maximum amount of coins any one player can have.", 32)

--[[---------------------------------------------------------
	Name: SWEP:PrimaryAttack()
	Desc: +attack1 has been pressed
-----------------------------------------------------------]]
function SWEP:PrimaryAttack()

	-- Make sure we can shoot first
	if ( !self:CanPrimaryAttack()) then
	return
	end

	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay) -- this is how you delay something

	-- Play shoot sound
	self:EmitSound('weapons/revolver/fuckingcunt.wav')
	-- Shoot 9 bullets, 150 damage, 0.75 aimcone
	self:ShootBullet( 20, 1, 0, self.Primary.Ammo )

	-- Remove 1 bullet from our clip
	self:TakePrimaryAmmo(1)
	local e = Angle(-0.2, 0, 0.0)
	-- Punch the player's view
	if ( !self.Owner:IsNPC() ) then
	self.Owner:ViewPunch( e )
	self.Owner:SetViewPunchAngles(e)
	-- util.ParticleTracer("test", self.Owner:GetShootPos(), )
	end

end

--[[---------------------------------------------------------
	Name: SWEP:SecondaryAttack()
	Desc: +attack2 has been pressed
-----------------------------------------------------------]]
function SWEP:SecondaryAttack()

	-- Make sure we can shoot first
	if ( !self:CanSecondaryAttack() ) then return end
	-- Play shoot sound
	if SERVER then
		local coin = ents.Create("uk_coin")
		coin:Spawn()
		coin:Activate()
		local offset = Vector(0, 0, 62) + (self.Owner:GetForward() * 52)
		coin:SetPos(self.Owner:GetViewEntity():GetPos() + offset)
		coin:GetPhysicsObject():SetVelocity(((self.Owner:GetForward() * 1620) + self.Owner:GetUp() * 360) + self.Owner:GetVelocity())
		coin:SetOwner(self)
		local tbl = coin:GetTable()
		tbl.OwningPlayer = self.Owner
		coin:SetTable(tbl)
	end

	self:EmitSound("weapons/revolver/coinflip.wav")
	self:SendWeaponAnim( ACT_VM_SECONDARYATTACK )	
	
	-- Shoot 9 bullets, 150 damage, 0.75 aimcone
	--self:ShootBullet( 478444545684568586, 99999999, 0.2, self.Secondary.Ammo )

	-- Remove 1 bullet from our clip
	self:TakeSecondaryAmmo( 1 )
	self.CoinTimer = CurTime() + self.CoinDelay
	-- Punch the player's view
	--if ( !self.Owner:IsNPC() ) then self.Owner:ViewPunch( Angle( -3, 0, 0 ) ) end

end

--[[---------------------------------------------------------
	Name: SWEP:Reload()
	Desc: Reload is being pressed
-----------------------------------------------------------]]
function SWEP:Reload()
	self:DefaultReload( ACT_VM_RELOAD )
end

--[[---------------------------------------------------------
	Name: SWEP:Think()
	Desc: Called every frame
-----------------------------------------------------------]]
function SWEP:Think()
	if CurTime() > self.CoinTimer then
		self:SetClip2(4)
	end
	self:SetHoldType( "revolver" )
end

--[[---------------------------------------------------------
	Name: SWEP:Holster( weapon_to_swap_to )
	Desc: Weapon wants to holster
	RetV: Return true to allow the weapon to holster
-----------------------------------------------------------]]
function SWEP:Holster( wep )
	return true
end

--[[---------------------------------------------------------
	Name: SWEP:Deploy()
	Desc: Whip it out
-----------------------------------------------------------]]
function SWEP:Deploy()
	return true
end

--[[---------------------------------------------------------
	Name: SWEP:ShootEffects()
	Desc: A convenience function to create shoot effects
-----------------------------------------------------------]]
function SWEP:ShootEffects()

	self:SendWeaponAnim( ACT_VM_PRIMARYATTACK )		-- View model animation
	self.Owner:MuzzleFlash()						-- Crappy muzzle light
	self.Owner:SetAnimation( PLAYER_ATTACK1 )		-- 3rd Person Animation

end

--[[---------------------------------------------------------
	Name: SWEP:ShootBullet()
	Desc: A convenience function to shoot bullets
-----------------------------------------------------------]]
function SWEP:ShootBullet( damage, num_bullets, aimcone, ammo_type, force, tracer )

	local bullet = {}
	bullet.Num		= num_bullets
	bullet.Src		= self.Owner:GetShootPos()			-- Source
	bullet.Dir		= self.Owner:GetAimVector()			-- Dir of bullet
	bullet.Spread	= Vector( aimcone, aimcone, 0 )		-- Aim Cone
	bullet.Tracer	= tracer || 1						-- Show a tracer on every x bullets
	bullet.Force	= force || 1						-- Amount of force to give to phys objects
	bullet.Damage	= damage
	bullet.AmmoType = ammo_type || self.Primary.Ammo

	self.Owner:FireBullets( bullet )

	self:ShootEffects()

end

--[[---------------------------------------------------------
	Name: SWEP:TakePrimaryAmmo()
	Desc: A convenience function to remove ammo
-----------------------------------------------------------]]
function SWEP:TakePrimaryAmmo( num )

	-- Doesn't use clips
	if ( self:Clip1() <= 0 ) then

		if ( self:Ammo1() <= 0 ) then return end

		self.Owner:RemoveAmmo( num, self:GetPrimaryAmmoType() );

	return end

	self:SetClip1( self:Clip1() - num )

end

--[[---------------------------------------------------------
	Name: SWEP:TakeSecondaryAmmo()
	Desc: A convenience function to remove ammo
-----------------------------------------------------------]]
function SWEP:TakeSecondaryAmmo( num )

	-- Doesn't use clips
	if ( self:Clip2() <= 0 ) then

		if ( self:Ammo2() <= 0 ) then return end

		self.Owner:RemoveAmmo( num, self:GetSecondaryAmmoType() )

	return end

	self:SetClip2( self:Clip2() - num )

end

--[[---------------------------------------------------------
	Name: SWEP:CanPrimaryAttack()
	Desc: Helper function for checking for no ammo
-----------------------------------------------------------]]
function SWEP:CanPrimaryAttack()

	if ( self:Clip1() <= 0 ) then

		self:EmitSound( "Weapon_Pistol.Empty" )
		self:SetNextPrimaryFire( CurTime() + 0.2 )
		self:Reload()
		return false

	end

	return true

end

--[[---------------------------------------------------------
	Name: SWEP:CanSecondaryAttack()
	Desc: Helper function for checking for no ammo
-----------------------------------------------------------]]
function SWEP:CanSecondaryAttack()

	if ( self:Clip2() <= 0 ) then

		self:EmitSound( "Weapon_Pistol.Empty" )
		self:SetNextSecondaryFire( CurTime() + 0.2 )
		return false

	end
	return true
end

--[[---------------------------------------------------------
	Name: OnRemove
	Desc: Called just before entity is deleted
-----------------------------------------------------------]]
function SWEP:OnRemove()
end

--[[---------------------------------------------------------
	Name: OwnerChanged
	Desc: When weapon is dropped or picked up by a new player
-----------------------------------------------------------]]
function SWEP:OwnerChanged()
end

--[[---------------------------------------------------------
	Name: Ammo1
	Desc: Returns how much of ammo1 the player has
-----------------------------------------------------------]]
function SWEP:Ammo1()
	return self.Owner:GetAmmoCount( self:GetPrimaryAmmoType() )
end

--[[---------------------------------------------------------
	Name: Ammo2
	Desc: Returns how much of ammo2 the player has
-----------------------------------------------------------]]
function SWEP:Ammo2()
	return self.Owner:GetAmmoCount( self:GetSecondaryAmmoType() )
end

--[[---------------------------------------------------------
	Name: SetDeploySpeed
	Desc: Sets the weapon deploy speed.
		 This value needs to match on client and server.
-----------------------------------------------------------]]
function SWEP:SetDeploySpeed( speed )
	self.m_WeaponDeploySpeed = tonumber( speed )
end

--[[---------------------------------------------------------
	Name: DoImpactEffect
	Desc: Callback so the weapon can override the impact effects it makes
		 return true to not do the default thing - which is to call UTIL_ImpactTrace in c++
-----------------------------------------------------------]]
function SWEP:DoImpactEffect( tr, nDamageType )

	if tr["Hit"] then
		

		local spark = EffectData()
		spark:SetOrigin(tr["HitPos"])
		spark:SetNormal(tr["HitNormal"])
		spark:SetMagnitude(2)
		spark:SetRadius(2)
		spark:SetScale(2)
		util.Effect("Sparks", spark)
	end

	--util.ParticleTracer("AR2Impact", tr["StartPos"], tr["HitPos"], true)
	--util.ParticleTracer("GaussTracer", tr["StartPos"], tr["HitPos"], true)

	return false

end
