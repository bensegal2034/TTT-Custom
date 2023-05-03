---- Example TTT custom weapon

-- First some standard GMod stuff
if SERVER then
   AddCSLuaFile( "weapon_ttt_g36c.lua" )
   resource.AddFile("sound/weapons/g36/boltpull.wav")
   resource.AddFile("sound/weapons/g36/magdrop.wav")
   resource.AddFile("sound/weapons/g36/cloth.wav")
   resource.AddFile("sound/weapons/g36/magin.wav")
   resource.AddFile("sound/weapons/g36/magout.wav")
   resource.AddFile("sound/weapons/g36/select.wav")
   resource.AddFile("sound/weapons/g36/shoot.wav")
   resource.AddFile("materials/models/weapons/v_models/g36c/g36c_d.vmt")
   resource.AddFile("materials/models/weapons/v_models/g36c/g36c_n.vtf")
   resource.AddFile("materials/models/weapons/v_models/g36c/g36c_s.vtf")
   resource.AddFile("materials/models/weapons/v_models/g36c/sleeve_diffuse.vtf")
   resource.AddFile("materials/models/weapons/v_models/g36c/sleeve_diffuse_normal.vtf")
   resource.AddFile("materials/models/weapons/w_models/g36c/g36c_d.vmt")
   resource.AddFile("materials/vgui/gfx/vgui/aug.vtf")
   resource.AddFile("models/weapons/v_rif_kiw.mdl")
   resource.AddFile("models/weapons/w_rif_kiw.mdl")
   resource.AddWorkshop("403979337")
end

sound.Add({
	name = 			"weapon_aug.single",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/g36/shoot.wav"
})

sound.Add({
	name = 			"g36.boltpull",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/g36/boltpull.wav"
})

sound.Add({
	name = 			"g36.magout",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			"weapons/g36/magout.wav"
})

sound.Add({
	name = 			"g36.magin",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			 "weapons/g36/magin.wav"
})

sound.Add({
	name = 			"g36.select",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			 "weapons/g36/select.wav"
})

sound.Add({
	name = 			"g36.magdrop",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			 "weapons/g36/magdrop.wav"
})

sound.Add({
	name = 			"g36.cloth",
	channel = 		CHAN_ITEM,
	volume = 		1.0,
	sound = 			 "weapons/g36/cloth.wav"
})


if CLIENT then
 

   SWEP.ViewModelFOV  = 78
   SWEP.ViewModelFlip = false
   
	SWEP.PrintName				= "G36c"			// 'Nice' Weapon name (Shown on HUD)	
	SWEP.Slot				= 2				// Slot in the weapon selection menu
	SWEP.SlotPos				= 1				// Position in the slot

end

-- Always derive from weapon_tttbase.
SWEP.Base				= "weapon_tttbase"

--- Standard GMod values

SWEP.NextReloadTime = 0;

SWEP.HoldType			= "ar2"


SWEP.DrawCrosshair			= false	
SWEP.Primary.Delay       = 0.08
SWEP.Primary.Recoil      = 1.9
SWEP.Primary.Automatic   = true
SWEP.Primary.Damage      = 25
SWEP.Primary.Cone        = 0
SWEP.Primary.Ammo        = "smg1"
SWEP.Primary.ClipSize    = 30
SWEP.Primary.ClipMax     = 90
SWEP.Primary.DefaultClip = 30
SWEP.Primary.Sound 		= Sound("weapon_aug.single")


--nopls
SWEP.IronSightsPos = Vector(-2.605, -3.268, 2.63)
SWEP.IronSightsAng = Vector(0, 0, 0)

SWEP.ViewModel				= "models/weapons/v_rif_kiw.mdl"
SWEP.WorldModel				= "models/weapons/w_rif_kiw.mdl"

--- TTT config values

-- Kind specifies the category this weapon is in. Players can only carry one of
-- each. Can be: WEAPON_... MELEE, PISTOL, HEAVY, NADE, CARRY, EQUIP1, EQUIP2 or ROLE.
-- Matching SWEP.Slot values: 0      1       2     3      4      6       7        8
SWEP.Kind = WEAPON_HEAVY

-- If AutoSpawnable is true and SWEP.Kind is not WEAPON_EQUIP1/2, then this gun can
-- be spawned as a random weapon. Of course this AK is special equipment so it won't,
-- but for the sake of example this is explicitly set to false anyway.
SWEP.AutoSpawnable = true

-- The AmmoEnt is the ammo entity that can be picked up when carrying this gun.
SWEP.AmmoEnt = "item_ammo_smg1_ttt"

-- If IsSilent is true, victims will not scream upon death.
SWEP.IsSilent = false

-- If NoSights is true, the weapon won't have ironsights
SWEP.NoSights = false





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

function SWEP:Deploy()
   self.Owner:SetJumpPower(0)
   self:SetIronsights(false)
   return true
end

function SWEP:Holster()
   self.Owner:SetJumpPower(160)
   return true
end

function SWEP:DrawWorldModel( )
   local hand, offset, rotate

   if not IsValid( self.Owner ) then
      self:DrawModel( )
   return
end

if not self.Hand then
   self.Hand = self.Owner:LookupAttachment( "anim_attachment_rh" )
end

hand = self.Owner:GetAttachment( self.Hand )

if not hand then
   self:DrawModel( )
   return
end

offset = hand.Ang:Right( ) * self.Offset.Pos.Right + hand.Ang:Forward( ) * self.Offset.Pos.Forward + hand.Ang:Up( ) * self.Offset.Pos.Up

hand.Ang:RotateAroundAxis( hand.Ang:Right( ), self.Offset.Ang.Right )
hand.Ang:RotateAroundAxis( hand.Ang:Forward( ), self.Offset.Ang.Forward )
hand.Ang:RotateAroundAxis( hand.Ang:Up( ), self.Offset.Ang.Up )

self:SetRenderOrigin( hand.Pos + offset )
self:SetRenderAngles( hand.Ang )

self:DrawModel( )
end
