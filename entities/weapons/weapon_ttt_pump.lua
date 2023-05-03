if SERVER then
	AddCSLuaFile( "weapon_ttt_pump.lua" )
	resource.AddFile("materials/models/weapons/v_models/yog/icarus.vmt")
	resource.AddFile("materials/models/weapons/v_models/yog/icarus_diffuse.vtf")
	resource.AddFile("materials/models/weapons/v_models/yog/icarus_exponent.vtf")
	resource.AddFile("materials/models/weapons/v_models/yog/icarus_normal.vtf")
	resource.AddFile("materials/models/weapons/v_models/yog/yoglight.vmt")
	resource.AddFile("materials/models/weapons/v_models/yog/yoglight_normal.vtf")
	resource.AddFile("materials/models/weapons/v_models/yog/yoglight_diffuse.vtf")
	resource.AddFile("materials/models/weapons/v_models/yog/yoglight_exponent.vtf")
	resource.AddFile("materials/models/weapons/v_models/yog/yogshell.vmt")
	resource.AddFile("materials/models/weapons/v_models/yog/yogshell_diffuse.vtf")
	resource.AddFile("materials/models/weapons/v_models/yog/yogshell_exponent.vtf")
	resource.AddFile("materials/models/weapons/v_models/yog/yogshell_normal.vtf")
	resource.AddFile("materials/models/weapons/w_models/yog/icarus.vmt")
	resource.AddFile("materials/models/weapons/w_models/yog/yoglight.vmt")
	resource.AddFile("materials/models/weapons/w_models/yog/yogshell.vmt")
	resource.AddFile("materials/vgui/entities/notmic_icarus.vmt")
	resource.AddFile("materials/vgui/hud/notmic_icarus.vmt")
	resource.AddFile("models/weapons/v_notmic_icarus.mdl")
	resource.AddFile("models/weapons/w_notmic_icarus.mdl")
	resource.AddFile("sound/weapons/37/deploy.wav")
	resource.AddFile("sound/weapons/37/fire.wav")
	resource.AddFile("sound/weapons/37/insert1.wav")
	resource.AddFile("sound/weapons/37/insert2.wav")
	resource.AddFile("sound/weapons/37/insert3.wav")
	resource.AddFile("sound/weapons/37/insert4.wav")
	resource.AddFile("sound/weapons/37/pump.wav")
	resource.AddWorkshop("1088359186")
end


-- Variables that are used on both client and server
SWEP.Gun = ("weapon_ttt_pump") -- must be the name of your swep but NO CAPITALS!
SWEP.Category				= "Not Micro's Heavy Weapons"
SWEP.Author				= ""
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.PrintName				= "Pump Shotgun"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2			-- Slot in the weapon selection menu
SWEP.SlotPos				= 30			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.Weight				= 25			-- rank relative ot other weapons. bigger is better
SWEP.HoldType 				= "ar2"	-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_notmic_icarus.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_notmic_icarus.mdl"	-- Weapon world model
SWEP.Base 				= "weapon_tttbase"
SWEP.Primary.Sound			= Sound("weapons/37/fire.wav")		-- script that calls the primary fire sound
SWEP.Primary.Delay = .5
SWEP.Primary.ClipSize			= 6			-- Size of a clip
SWEP.Primary.DefaultClip			= 24	-- Default number of bullets in a clip
SWEP.Primary.Automatic			= false		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "buckshot"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets
SWEP.ViewModelFOV		= 65
SWEP.Primary.ClipMax = 24
SWEP.reloadtimer = 0
SWEP.Primary.Cone = 0.02
SWEP.HeadshotMultiplier = 1
SWEP.data 				= {}				--The starting firemode

SWEP.Primary.NumShots	= 8		-- How many bullets to shoot per trigger pull, AKA pellets
SWEP.Primary.Damage		= 5	-- Base damage per bullet

-- Enter iron sight info and bone mod info below


--- TTT config values

-- Kind specifies the category this weapon is in. Players can only carry one of
-- each. Can be: WEAPON_... MELEE, PISTOL, HEAVY, NADE, CARRY, EQUIP1, EQUIP2 or ROLE.
-- Matching SWEP.Slot values: 0      1       2     3      4      6       7        8
SWEP.Kind = WEAPON_HEAVY

-- If AutoSpawnable is true and SWEP.Kind is not WEAPON_EQUIP1/2, then this gun can
-- be spawned as a random weapon.
SWEP.AutoSpawnable = true

-- The AmmoEnt is the ammo entity that can be picked up when carrying this gun.
SWEP.AmmoEnt = "item_box_buckshot_ttt"

-- CanBuy is a table of ROLE_* entries like ROLE_TRAITOR and ROLE_DETECTIVE. If
-- a role is in this table, those players can buy this.
SWEP.CanBuy = { }

-- InLoadoutFor is a table of ROLE_* entries that specifies which roles should
-- receive this weapon as soon as the round starts. In this case, none.
SWEP.InLoadoutFor = { nil }

-- If LimitedStock is true, you can only buy one per round.
SWEP.LimitedStock = true

-- If AllowDrop is false, players can't manually drop the gun with Q
SWEP.AllowDrop = true

-- If IsSilent is true, victims will not scream upon death.
SWEP.IsSilent = false

-- If NoSights is true, the weapon won't have ironsights
SWEP.NoSights = false

SWEP.Secondary.IronFOV			= 50
SWEP.IronSightsPos = Vector(-1.8, 0, 0)
SWEP.IronSightsAng = Vector(0.3, 0.128, 0)
SWEP.SightsPos = Vector(-3.55, -4.268, 0.79)
SWEP.SightsAng = Vector(0, 0.15, 0)
SWEP.RunSightsPos = Vector(2.829, -2.926, -2.301)
SWEP.RunSightsAng = Vector(-19.361, 64.291, -32.039)

SWEP.Offset = {
Pos = {
Up = -0.7,
Right = 1.0,
Forward = -3.0,
},
Ang = {
Up = 0,
Right = 6.5,
Forward = 0,
}
}



sound.Add({
	name = 			"Icarus37.Insert",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			{"weapons/37/insert1.wav",
					"weapons/37/insert2.wav",
					"weapons/37/insert3.wav"}
})

sound.Add({
	name = 			"Icarus37.Draw",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/37/draw.wav"
})

sound.Add({
	name = 			"Icarus37.Pump",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/37/pump.wav"
})

sound.Add({
	name = 			"Icarus37.Deploy",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/37/deploy.wav"
})

function SWEP:SecondaryAttack()

end

function SWEP:SetupDataTables()
	self:NetworkVar("Bool", 3, "IronsightsPredicted")
    self:NetworkVar("Float", 3, "IronsightsTime")
	self:NetworkVar("Bool", 0, "Reloading")
	self:NetworkVar("Float", 0, "ReloadTimer")
end

function SWEP:CanPrimaryAttack()
	if self:Clip1() <= 0 then
	   self:EmitSound( "Weapon_Shotgun.Empty" )
	   self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
	   self:SetNextSecondaryFire( CurTime() + self.Primary.Delay )
	   return false
	end
	if self:GetReloading() then return end
	return true
end

function SWEP:Reload()

	if self:GetReloading() then return end
 
	if self:Clip1() < self.Primary.ClipSize and self:GetOwner():GetAmmoCount( self.Primary.Ammo ) > 0 then
 
	   if self:StartReload() then
		  return
	   end
	end
 
end
 

function SWEP:StartReload()
	if self:GetReloading() then
	   return false
	end
 
	self:SetIronsights( false )
 
	self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
	local ply = self:GetOwner()
 
	if not ply or ply:GetAmmoCount(self.Primary.Ammo) <= 0 then
	   return false
	end
 
	local wep = self
 
	if wep:Clip1() >= self.Primary.ClipSize then
	   return false
	end
 
	wep:SendWeaponAnim(ACT_SHOTGUN_RELOAD_START)
 
	self:SetReloadTimer(CurTime() + wep:SequenceDuration())
 
	self:SetReloading(true)
 
	return true
end

function SWEP:PerformReload()
	local ply = self:GetOwner()

	-- prevent normal shooting in between reloads
	self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
	if not ply or ply:GetAmmoCount(self.Primary.Ammo) <= 0 then return end
 
	if self:Clip1() >= self.Primary.ClipSize then return end
 
	self:GetOwner():RemoveAmmo( 1, self.Primary.Ammo, false )
	self:SetClip1( self:Clip1() + 1 )
 
	self:DefaultReload(self.ReloadAnim)
 
	self:SetReloadTimer(CurTime() + self:SequenceDuration())
end
 
function SWEP:FinishReload()
	self:SetReloading(false)
	self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
	self:SendWeaponAnim(ACT_SHOTGUN_RELOAD_FINISH)
	self:SetReloadTimer(CurTime() + self:SequenceDuration())
end



function SWEP:Deploy()
	self:SetReloadTimer(0)
	self:SetIronsights(false)
	self:SetReloading(false)
end

function SWEP:DrawWorldModel()

	local hand, offset, rotate

	if not IsValid(self.Owner) then
		self:DrawModel()
		return
	end

	hand = self.Owner:GetAttachment(self.Owner:LookupAttachment("anim_attachment_rh"))

	offset = hand.Ang:Right() * -1 + hand.Ang:Forward() * 6 + hand.Ang:Up() * 0

	hand.Ang:RotateAroundAxis(hand.Ang:Right(), 10)
	hand.Ang:RotateAroundAxis(hand.Ang:Forward(), 10)
	hand.Ang:RotateAroundAxis(hand.Ang:Up(), 0)

	self:SetRenderOrigin(hand.Pos + offset)
	self:SetRenderAngles(hand.Ang)

	self:DrawModel()

	if (CLIENT) then
		self:SetModelScale(1,1,1)
	end
end


function SWEP:Think()
	if self:GetReloading() then
	   
 
	   if self:GetReloadTimer() <= CurTime() then
 
		  if self:GetOwner():GetAmmoCount(self.Primary.Ammo) <= 0 then
			 self:FinishReload()
		  elseif self:Clip1() < self.Primary.ClipSize then
			 self:PerformReload()
		  else
			 self:FinishReload()
		  end
		  return
	   end
	end
end

local ttt_lowered = CreateConVar("ttt_ironsights_lowered", "1", FCVAR_ARCHIVE)
local host_timescale = GetConVar("host_timescale")

local LOWER_POS = Vector(0, 0, -2)

local IRONSIGHT_TIME = 0.25
function SWEP:GetViewModelPosition( pos, ang )
   local mul = 1.0
   local offset = self.IronSightsPos + (ttt_lowered:GetBool() and LOWER_POS or vector_origin)

	ang:RotateAroundAxis( ang:Right(),    self.IronSightsAng.x * mul )
    ang:RotateAroundAxis( ang:Up(),       self.IronSightsAng.y * mul )
    ang:RotateAroundAxis( ang:Forward(),  self.IronSightsAng.z * mul )


   pos = pos + offset.x * ang:Right() * mul
   pos = pos + offset.y * ang:Forward() * mul
   pos = pos + offset.z * ang:Up() * mul

   return pos, ang
end