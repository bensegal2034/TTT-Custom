if ( SERVER ) then
AddCSLuaFile()
end
SWEP.Author		= "Engineer_ZY"
SWEP.Instructions	= ""
SWEP.Category		= "ULTRAKILL"
SWEP.Base = "weapon_tttbase"
SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"
SWEP.Kind = WEAPON_EQUIP2
SWEP.Secondary.ClipSize	= -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo	= "none"
if CLIENT then
	SWEP.PrintName          = "Whiplash"
	SWEP.Slot               = 8
	SWEP.Icon = "vgui/ttt/icon_whiplash"
end
	-- Text shown in the equip menu
SWEP.EquipMenuData = {
	type = "Weapon",
	desc = "MANKIND IS DEAD. \nBLOOD IS FUEL. \nHELL IS FULL.\n\nPress F to activate grappling hook"
};

SWEP.CanBuy = { ROLE_TRAITOR, ROLE_DETECTIVE }
SWEP.DrawAmmo			= false
SWEP.DrawCrosshair		= true

SWEP.ViewModelFOV		= 54
SWEP.ViewModel = ""
SWEP.WorldModel = ""
SWEP.UseHands   		= true 

SWEP.HitDistance = 40
SWEP.Damage = 0

if SERVER then
util.AddNetworkString( "grap" )
end



function SWEP:Think()
local owner = self:GetOwner()
end

function SWEP:Initialize()
self:SetHoldType( "normal" )
self.gra = nil
end 

function SWEP:PrimaryAttack()
 if SERVER then
  
 end


end

function SWEP:Holster( wep )
return true
end

function SWEP:SecondaryAttack()

end

function SWEP:Reload()

end

function SWEP:OnRemove()	
self.Owner = self:GetOwner()
end
	
function SWEP:OnDrop()
	self:Remove() -- You can't drop fists-
end