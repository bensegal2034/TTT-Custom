if CLIENT then

	language.Add("Niko663HaloSWEPS.ARRounds_ammo", "AR Rounds")
	language.Add("Niko663HaloSWEPS.MagnumRounds_ammo", "Magnum Rounds")
	language.Add("Niko663HaloSWEPS.ShotgunShells_ammo", "Shotgun Shells")
	language.Add("Niko663HaloSWEPS.FlamethrowerCannisters_ammo", "Flamethrower Fuel")
	language.Add("Niko663HaloSWEPS.SniperRounds_ammo", "Sniper Rounds")
	language.Add("Niko663HaloSWEPS.Rockets_ammo", "Rockets")
	language.Add("Niko663HaloSWEPS.Needles_ammo", "Needler Rounds")
	language.Add("Niko663HaloSWEPS.Grenades_ammo", "Frag Grenades" )

end

CreateConVar("halo1_grenade","1",{FCVAR_ARCHIVE,FCVAR_REPLICATED,FCVAR_CHEAT,FCVAR_NOTIFY})
CreateConVar("halosweps_objweaponspeedloss","1",{FCVAR_ARCHIVE,FCVAR_REPLICATED,FCVAR_CHEAT,FCVAR_NOTIFY})
CreateConVar("halosweps_givegrenades","1",{FCVAR_ARCHIVE,FCVAR_REPLICATED,FCVAR_NOTIFY})
CreateConVar("halosweps_9999nades","0",{FCVAR_ARCHIVE,FCVAR_REPLICATED,FCVAR_CHEAT,FCVAR_NOTIFY})
CreateConVar("halosweps_shelleffects","1",{FCVAR_ARCHIVE,FCVAR_REPLICATED,FCVAR_CHEAT,FCVAR_NOTIFY})
game.AddDecal( "PPScorchH1", "effects/halo1/plasmapistolscorch.vmt" )
game.AddDecal( "PPChargeScorchH1", "effects/halo1/plasmapistolchargescorch.vmt" )
game.AddDecal( "PRScorchH1", "effects/halo1/plasmariflescorch.vmt" )
game.AddParticles( "particles/halo1_effects.pcf" )
PrecacheParticleSystem( "halo1_muzzle_assaultrifle" )
PrecacheParticleSystem( "halo1_muzzle_assaultrifle_fp" )
PrecacheParticleSystem( "halo1_muzzle_fuelrodgun" )
PrecacheParticleSystem( "halo1_muzzle_fuelrodgun_fp" )
PrecacheParticleSystem( "halo1_muzzle_plasmapistol" )
PrecacheParticleSystem( "halo1_muzzle_plasmapistol_fp" )
PrecacheParticleSystem( "halo1_muzzle_plasmarifle" )
PrecacheParticleSystem( "halo1_muzzle_plasmarifle_fp" )
PrecacheParticleSystem( "halo1_energysword_disintegrate" )
PrecacheParticleSystem( "halo1_muzzle_needler" )
PrecacheParticleSystem( "halo1_muzzle_needler_fp" )
PrecacheParticleSystem( "halo1_muzzle_pistol" )
PrecacheParticleSystem( "halo1_muzzle_pistol_fp" )
PrecacheParticleSystem( "halo1_muzzle_shotgun" )
PrecacheParticleSystem( "halo1_muzzle_shotgun_fp" )
PrecacheParticleSystem( "halo1_muzzle_sniper" )
PrecacheParticleSystem( "halo1_muzzle_sniper_fp" )
PrecacheParticleSystem( "halo1_muzzle_plasmapistolcharged" )
PrecacheParticleSystem( "halo1_muzzle_plasmapistolcharged_fp" )
PrecacheParticleSystem( "smoke_plasmapistol_halo1" )
PrecacheParticleSystem( "smoke_plasmapistol_halo1_third" )
PrecacheParticleSystem( "smoke_plasmarifle_halo1" )
PrecacheParticleSystem( "smoke_plasmarifle_halo1_third" )
PrecacheParticleSystem( "smoke_fuelrodgun_halo1" )
PrecacheParticleSystem( "smoke_fuelrodgun_halo1_third" )
PrecacheParticleSystem( "smoke_unsc_halo1" )
PrecacheParticleSystem( "halo1_unsc_flame" )
PrecacheParticleSystem( "halo1_unsc_flame_third" )

local function HaloSWEPSAmmoInit()
game.AddAmmoType( {
	name = "Niko663HaloSWEPS.ARRounds",
	dmgtype = DMG_BULLET,
	tracer = TRACER_LINE_AND_WHIZ,
	maxsplash = 7,
	minsplash = 5
} )

game.AddAmmoType( {
	name = "Niko663HaloSWEPS.MagnumRounds",
	dmgtype = DMG_BULLET,
	tracer = TRACER_LINE_AND_WHIZ,
	maxsplash = 7,
	minsplash = 5
} )

game.AddAmmoType( {
	name = "Niko663HaloSWEPS.ShotgunShells",
	dmgtype = DMG_BULLET,
	tracer = TRACER_LINE_AND_WHIZ,
	maxsplash = 7,
	minsplash = 5
} )

game.AddAmmoType( {
	name = "Niko663HaloSWEPS.SniperRounds",
	dmgtype = DMG_BULLET,
	tracer = TRACER_LINE_AND_WHIZ,
	maxsplash = 7,
	minsplash = 5
} )

game.AddAmmoType( {
	name = "Niko663HaloSWEPS.Rockets",
	dmgtype = DMG_BLAST
} )

game.AddAmmoType( {
	name = "Niko663HaloSWEPS.FlamethrowerCannisters",
	dmgtype = DMG_BURN
} )

game.AddAmmoType( {
	name = "Niko663HaloSWEPS.Needles",
	dmgtype = DMG_BULLET
} )

game.AddAmmoType( {
	name = "Niko663HaloSWEPS.Grenades",
	dmgtype = DMG_BLAST
} )
end
hook.Add( "Initialize", "GiveHaloSWEPSAmmoH1", HaloSWEPSAmmoInit )

local function ResetNeedlesSpawn(ply)
	if IsValid(ply) then
 	ply:SetNW2Bool( "Niko663HaloSWEPSNeedles", 0 )
	ply.DeadByNeedlerH1 = false
	end
end

local function ResetNeedlesDeath(victim, attacker, inflictor)
	if IsValid(victim) then
 	victim:SetNW2Bool( "Niko663HaloSWEPSNeedles", 0 )
	victim.DeadByNeedlerH1 = true
	end
end

local function GrenadesHalo1(ply)
	if IsValid(ply) and GetConVar("halosweps_givegrenades"):GetInt() == 1 and GetConVar("halosweps_9999nades"):GetInt() == 0 then
 	timer.Simple( 0.1, function() if IsValid(ply) and ply:GetAmmoCount( "Niko663HaloSWEPS.Grenades" ) <= 0 then ply:GiveAmmo( 4, "Niko663HaloSWEPS.Grenades", true ) end end )
	elseif IsValid(ply) and GetConVar("halosweps_givegrenades"):GetInt() == 1 and GetConVar("halosweps_9999nades"):GetInt() == 1 then
	timer.Simple( 0.1, function() if IsValid(ply) and ply:GetAmmoCount( "Niko663HaloSWEPS.Grenades" ) <= 0 then ply:GiveAmmo( 9999, "Niko663HaloSWEPS.Grenades", true ) end end )
	end
end

hook.Add( "PlayerDeath", "ResetNeedlesOneH1", ResetNeedlesDeath )

hook.Add( "PlayerSpawn", "ResetNeedlesTwoH1", ResetNeedlesSpawn )

hook.Add( "PlayerInitialSpawn", "ResetNeedlesThreeH1", ResetNeedlesSpawn )

hook.Add( "PlayerSpawn", "GiveGrenadesH1", GrenadesHalo1 )

hook.Add( "PlayerSpawnedSWEP", "SwapObjWeaponsHalo1", function( ply, ent )
	if ( ent:GetClass() == "halo1_redflag" ) then
		if (SERVER) and IsFirstTimePredicted() then
		local RedFlag = ents.Create("flag_red_h1")
		RedFlag:SetPos( ply:GetEyeTrace().HitPos + RedFlag:GetUp() * -20  )
		RedFlag:SetAngles(RedFlag:AlignAngles(RedFlag:GetAngles(), ply:GetRight():Angle() + Angle(0,-90,0)))
		RedFlag:Spawn()
		RedFlag:Activate()
		RedFlag.DroppedByPlayer = false
		undo.Create("Red Flag H1")
 		undo.AddEntity(RedFlag)
 		undo.SetPlayer(ply)
		undo.Finish()
		SafeRemoveEntity(ent)
	end
	elseif ( ent:GetClass() == "halo1_blueflag" ) then
		if (SERVER) and IsFirstTimePredicted() then
		local BlueFlag = ents.Create("flag_blue_h1")
		BlueFlag:SetPos( ply:GetEyeTrace().HitPos + BlueFlag:GetUp() * -20  )
		BlueFlag:SetAngles(BlueFlag:AlignAngles(BlueFlag:GetAngles(), ply:GetRight():Angle() + Angle(0,-90,0)))
		BlueFlag:Spawn()
		BlueFlag:Activate()
		BlueFlag.DroppedByPlayer = false
		undo.Create("Blue Flag H1")
 		undo.AddEntity(BlueFlag)
 		undo.SetPlayer(ply)
		undo.Finish()
		SafeRemoveEntity(ent)
	end
	elseif ( ent:GetClass() == "halo1_oddball" ) then
		if (SERVER) and IsFirstTimePredicted() then
		local OddBall = ents.Create("oddball_h1")
		OddBall:SetPos( ply:GetEyeTrace().HitPos + OddBall:GetUp() * 10  )
		OddBall:SetAngles(OddBall:AlignAngles(OddBall:GetAngles(), ply:GetRight():Angle() + Angle(0,90,0)))
		OddBall:Spawn()
		OddBall:Activate()
		OddBall.DroppedByPlayer = false
		undo.Create("OddBall H1")
 		undo.AddEntity(OddBall)
 		undo.SetPlayer(ply)
		undo.Finish()
		SafeRemoveEntity(ent)
	end
	end
end )

hook.Add( "PlayerPostThink", "GiveH1ObjWeapon", function( ply )

	if IsValid(ply) and ply:Alive() and ply.DroppedObjWeaponH1 == true and IsFirstTimePredicted() then
	ply.DroppedObjWeaponH1 = false
	timer.Simple( 0.0001, function() if IsValid(ply) and IsValid(ply:GetPreviousWeapon()) and ply:GetPreviousWeapon():IsWeapon() and IsFirstTimePredicted() then ply:SelectWeapon( ply:GetPreviousWeapon() ) end end )
	end

	if IsValid(ply) and ply:Alive() and ply.PickedUpObjWeaponH1 == true and IsFirstTimePredicted() then
	ply.PickedUpObjWeaponH1 = false
	timer.Simple( 0.0001, function() if IsValid(ply) and ply:GetNWString( "ObjWeaponH1" ) != nil and IsFirstTimePredicted() then timer.Stop( "ResetObjWeaponHaloSWEPS" .. ply:EntIndex() ) ply:Give( ply:GetNWString( "ObjWeaponH1" ) ) ply:SelectWeapon( ply:GetWeapon( ply:GetNWString( "ObjWeaponH1" ) ) ) timer.Create( "ResetObjWeaponHaloSWEPS" .. ply:EntIndex(), 0.5, 1, function() if IsValid(ply) then ply:SetNWString( "ObjWeaponH1", nil ) end end ) end end )
	end

	if IsValid(ply) and IsValid(ply:GetActiveWeapon()) and ply:GetNWBool( "H1WeaponDisplayAlt" ) == true and ply:GetViewEntity() == ply then
	ply:SetNWBool( "H1WeaponDisplayAlt", false )
	ply:SetNWBool( "H1WeaponDisplayMain", true )
	timer.Simple( 0.14, function() if IsValid(ply) then ply:SetNWBool( "H1WeaponDisplayMain", false ) end end )
	end

	if IsValid(ply) and IsValid(ply:GetActiveWeapon()) and ply:GetNWBool( "H1DroppedNeedlerWaitForModel" ) == true and ply:GetViewEntity() == ply then
	ply:SetNWBool( "H1DroppedNeedlerWaitForModel", false )
	ply:SetNWBool( "H1DroppedNeedler", true )
	timer.Simple( 0.14, function() if IsValid(ply) then ply:SetNWBool( "H1DroppedNeedler", false ) end end )
	end
	
end )

hook.Add( "OnEntityCreated", "AssignNextBotsHalo1", function( ent )
	if ( ent:IsNextBot() and IsValid(ent) ) then
		ent:SetNW2Bool( "HaloSWEPSEntIsNextBot", true )
	end
	if ent:GetClass() == "gmod_sent_vehicle_fphysics_wheel" then
	timer.Simple( 0.1, function() if IsValid(ent) then ent:RemoveFlags(FL_OBJECT) end end )
	end
end )

hook.Add( "OnEntityCreated", "SetUpNeedlerVarH1", function( ent )
	if ent:IsNPC() or ent:IsNextBot() and IsValid(ent) then
		ent:SetNW2Bool( "Niko663HaloSWEPSNeedles", 0 )
	end
end )

hook.Add( "EntityRemoved", "ResetTexturesRemovedH1", function( ent )

local HaloCEProjectiles = {
needle_h1 = true,
plasma_ball_pistol_oc_h1 = true,
rocket_h1 = true
}

if HaloCEProjectiles[ent:GetClass()] then
ent:StopSound("Halo1_Needler.FlyBy")
ent:StopSound("Halo1_PP.FlyBy")
ent:StopSound("Halo1_Rocket.Loop")
end

if IsValid(ent) and ent:GetClass() == "halo1_flamethrower" then
ent:StopSound(ent.sndFlamerH1Loop)
ent:StopSound(ent.sndBurnerH1)
end

	if ent:GetClass() == "halo1_flamethrower" and IsValid(ent) and IsValid(ent:GetOwner()) and ent:GetOwner():IsPlayer() and IsValid(ent:GetOwner():GetViewModel()) and ent:GetOwner():GetActiveWeapon() == ent or ent:GetClass() == "halo1_fuelrodcannon" and IsValid(ent) and IsValid(ent:GetOwner()) and ent:GetOwner():IsPlayer() and IsValid(ent:GetOwner():GetViewModel()) and ent:GetOwner():GetActiveWeapon() == ent or ent:GetClass() == "halo1_assaultrifle" and IsValid(ent) and IsValid(ent:GetOwner()) and ent:GetOwner():IsPlayer() and IsValid(ent:GetOwner():GetViewModel()) and ent:GetOwner():GetActiveWeapon() == ent then
		ent:GetOwner():SetNWBool( "H1WeaponDisplayAlt", true )
	end

	if ent:GetClass() == "halo1_needler" and IsValid(ent) and IsValid(ent:GetOwner()) and ent:GetOwner():IsPlayer() and IsValid(ent:GetOwner():GetViewModel()) and ent:GetOwner():GetActiveWeapon() == ent then
	ent:GetOwner():SetNWBool( "H1DroppedNeedlerWaitForModel", true )
	end
end )

hook.Add( "OnNPCKilled", "DeadFromNeedlerH1", function( npc, attacker, inflictor )
	if IsValid(npc) then
		npc.DeadByNeedlerH1 = true
	end
end )

hook.Add( "PlayerEnteredVehicle", "DescopeOnVehicleEnterH1", function( ply, veh, role )

local Halo1SWEPS = {
	halo1_assaultrifle = true,
	halo1_blueflag = true,
	halo1_flamethrower = true,
	halo1_fuelrodcannon = true,
	halo1_gravityrifle = true,
	halo1_needler = true,
	halo1_oddball = true,
	halo1_pistol = true,
	halo1_plasmapistol = true,
	halo1_plasmarifle = true,
	halo1_redflag = true,
	halo1_rocketlauncher = true,
	halo1_shotgun = true,
	halo1_sniper = true
}

 local ScopedWeaponH1 = {
	halo1_pistol = true,
	halo1_rocketlauncher = true,
	halo1_sniper = true
}


	if IsValid(ply:GetActiveWeapon()) and ScopedWeaponH1[ply:GetActiveWeapon():GetClass()] and ply:GetFOV() != GetConVarNumber("fov_desired") and ply:GetAllowWeaponsInVehicle() == false then
	ply:SetFOV( 0, 0.35 )
	end
	if IsValid(ply) and IsValid(ply:GetActiveWeapon()) and Halo1SWEPS[ply:GetActiveWeapon():GetClass()] then
	if ply:GetActiveWeapon():GetClass() == "halo1_flamethrower" and ply:GetActiveWeapon():GetNextPrimaryFire() > CurTime() and game.SinglePlayer() == false then
	timer.Simple( 0, function() if IsValid(ply) and IsValid(ply:GetActiveWeapon()) and IsFirstTimePredicted() then ply:GetActiveWeapon():EmitSound("Halo1_Flamethrower.FireStop") end end )
	end
	timer.Simple( 0, function() if IsValid(ply) and IsValid(ply:GetActiveWeapon()) and Halo1SWEPS[ply:GetActiveWeapon():GetClass()] then ply:GetActiveWeapon():EmitSound("Halo1_Weapon.StopSound") end end )
	end
end )

hook.Add( "PlayerLeaveVehicle", "FixNeedlerVehiclesH1", function( ply, veh )
if IsValid(ply) then
ply:SetNWBool( "H1DroppedNeedlerWaitForModel", true )
ply:SetNWBool( "H1WeaponDisplayAlt", true )
end end )

hook.Add( "OnPlayerPhysicsPickup", "DescopeOnPickupH1", function( ply, ent )

local Halo1SWEPS = {
	halo1_assaultrifle = true,
	halo1_blueflag = true,
	halo1_flamethrower = true,
	halo1_fuelrodcannon = true,
	halo1_gravityrifle = true,
	halo1_needler = true,
	halo1_oddball = true,
	halo1_pistol = true,
	halo1_plasmapistol = true,
	halo1_plasmarifle = true,
	halo1_redflag = true,
	halo1_rocketlauncher = true,
	halo1_shotgun = true,
	halo1_sniper = true
}

 local ScopedWeaponH1 = {
	halo1_pistol = true,
	halo1_rocketlauncher = true,
	halo1_sniper = true
}

	if IsValid(ply:GetActiveWeapon()) and ply:GetActiveWeapon():GetClass() == "halo1_flamethrower" and ply:GetActiveWeapon():GetNextPrimaryFire() > CurTime() and game.SinglePlayer() == false then
	timer.Simple( 0, function() if IsValid(ply) and IsValid(ply:GetActiveWeapon()) and IsFirstTimePredicted() then ply:GetActiveWeapon():EmitSound("Halo1_Flamethrower.FireStop") end end )
	end
	if IsValid(ply:GetActiveWeapon()) and ScopedWeaponH1[ply:GetActiveWeapon():GetClass()] and ply:GetFOV() != GetConVarNumber("fov_desired") then
	ply:SetFOV( 0, 0.35 )
	end

	timer.Simple( 0, function() if IsValid(ply) and IsValid(ply:GetActiveWeapon()) and Halo1SWEPS[ply:GetActiveWeapon():GetClass()] then ply:GetActiveWeapon():EmitSound("Halo1_Weapon.StopSound") end end )
end )

hook.Add( "PlayerCanPickupWeapon", "CantPickUpH1WeapTwice", function( ply, weapon )

 local DisposableWeapsTable = {
	halo1_fuelrodcannon = true,
	halo1_redflag = true,
	halo1_blueflag = true,
	halo1_oddball = true,
	halo1_gravityrifle = true,
	halo1_plasmarifle = true,
	halo1_plasmapistol = true
}
  if ( DisposableWeapsTable[weapon:GetClass()] and ply:HasWeapon( weapon:GetClass() ) ) then
		return false
	end
end )

hook.Add("PlayerDroppedWeapon", "H1FixWeaponDrops", function( owner, wep )

	if wep:GetClass() == "halo1_flamethrower" and IsValid(owner) or wep:GetClass() == "halo1_fuelrodcannon" and IsValid(owner) or wep:GetClass() == "halo1_assaultrifle" and IsValid(owner) then
	owner:SetNWBool( "H1WeaponDisplayAlt", true )
	end

	if wep:GetClass() == "halo1_needler" and IsValid(owner) and owner:IsPlayer() and IsValid(owner:GetViewModel()) then
	owner:SetNWBool( "H1DroppedNeedlerWaitForModel", true )
	end

	if IsValid(wep) and IsValid(owner) then
	if wep:GetClass() == "halo1_assaultrifle" then
	owner:StopSound("Halo1_AR.Deploy")
	elseif wep:GetClass() == "halo1_blueflag" or wep:GetClass() == "halo1_redflag" then
	owner:StopSound("Halo1_Flag.Deploy")
	elseif wep:GetClass() == "halo1_flamethrower" then
	owner:StopSound("Halo1_Flamethrower.Deploy")
	owner:StopSound("Halo1_Flamethrower.DeployAlt")
	elseif wep:GetClass() == "halo1_pistol" then
	owner:StopSound("Halo1_Pistol.Deploy")
	elseif wep:GetClass() == "halo1_needler" then
	owner:StopSound("Halo1_Needler.Deploy")
	elseif wep:GetClass() == "halo1_oddball" then
	owner:StopSound("Halo1_Ball.Deploy")
	elseif wep:GetClass() == "halo1_plasmapistol" then
	owner:StopSound("Halo1_PP.Deploy")
	elseif wep:GetClass() == "halo1_plasmarifle" or wep:GetClass() == "halo1_fuelrodcannon" then
	owner:StopSound("Halo1_PR.Deploy")
	elseif wep:GetClass() == "halo1_rocketlauncher" then
	owner:StopSound("Halo1_Rocket.Deploy")
	elseif wep:GetClass() == "halo1_shotgun" then
	owner:StopSound("Halo1_Shotgun.Deploy")
	elseif wep:GetClass() == "halo1_sniper" then
	owner:StopSound("Halo1_Sniper.Deploy")
	end
	end

end )

hook.Add( "PlayerSwitchWeapon", "H1FixWeaponSwitch", function( ply, oldWeapon, newWeapon )

if game.SinglePlayer() == true and IsValid(oldWeapon) and IsValid(ply) and IsValid(ply:GetViewModel()) and oldWeapon:GetClass() == "halo1_needler" then
ply:SetNWBool( "H1DroppedNeedler", true )
timer.Simple( 0.14, function() if IsValid(ply) then ply:SetNWBool( "H1DroppedNeedler", false ) end end )
end

if game.SinglePlayer() == true and IsValid(oldWeapon) and IsValid(ply) and IsValid(ply:GetViewModel()) and oldWeapon:GetClass() == "halo1_fuelrodcannon" or game.SinglePlayer() == true and IsValid(oldWeapon) and IsValid(ply) and IsValid(ply:GetViewModel()) and oldWeapon:GetClass() == "halo1_flamethrower" or game.SinglePlayer() == true and IsValid(oldWeapon) and IsValid(ply) and IsValid(ply:GetViewModel()) and oldWeapon:GetClass() == "halo1_assaultrifle" then
ply:SetNWBool( "H1WeaponDisplayAlt", true )
end

end )

hook.Add("PostDrawViewModel", "H1ResetTextures", function( viewmodel, player, weapon )

	if IsValid(player) and IsValid(viewmodel) and player:GetNWBool( "H1WeaponDisplayMain" ) == true then
	viewmodel:SetSubMaterial( 2, nil )
	viewmodel:SetSubMaterial( 4, nil )
	viewmodel:SetSubMaterial( 5, nil )
	end

	if IsValid(player) and IsValid(viewmodel) and player:GetNWBool( "H1DroppedNeedler" ) == true then
	viewmodel:ManipulateBonePosition( 38, Vector(0,0,0) )
	viewmodel:ManipulateBonePosition( 39, Vector(0,0,0) )
	viewmodel:ManipulateBonePosition( 40, Vector(0,0,0) )
	viewmodel:ManipulateBonePosition( 41, Vector(0,0,0) )
	viewmodel:ManipulateBonePosition( 42, Vector(0,0,0) )
	viewmodel:ManipulateBonePosition( 43, Vector(0,0,0) )
	viewmodel:ManipulateBonePosition( 44, Vector(0,0,0) )
	viewmodel:ManipulateBonePosition( 45, Vector(0,0,0) )
	viewmodel:ManipulateBonePosition( 46, Vector(0,0,0) )
	viewmodel:ManipulateBonePosition( 47, Vector(0,0,0) )
	viewmodel:ManipulateBonePosition( 48, Vector(0,0,0) )
	viewmodel:ManipulateBonePosition( 49, Vector(0,0,0) )
	viewmodel:ManipulateBonePosition( 50, Vector(0,0,0) )
	viewmodel:ManipulateBonePosition( 51, Vector(0,0,0) )
	viewmodel:ManipulateBonePosition( 52, Vector(0,0,0) )
	viewmodel:ManipulateBonePosition( 53, Vector(0,0,0) )
	end

end )

hook.Add( "ScaleNPCDamage", "NoHeadShotMultiH1", function( ply, hitgroup, dmginfo )

local NoHeadShotWeaps = {
	halo1_assaultrifle = true,
	halo1_shotgun = true
}

	 if IsValid(dmginfo:GetAttacker()) and dmginfo:GetAttacker():IsPlayer() and IsValid(dmginfo:GetAttacker():GetActiveWeapon()) and dmginfo:IsBulletDamage() and NoHeadShotWeaps[dmginfo:GetAttacker():GetActiveWeapon():GetClass()] and hitgroup == HITGROUP_HEAD then
		dmginfo:ScaleDamage( 0.5 )
	 end
end )

hook.Add( "ScalePlayerDamage", "NoHeadShotMultiH1", function( ply, hitgroup, dmginfo )

local NoHeadShotWeaps = {
	halo1_assaultrifle = true,
	halo1_shotgun = true
}

	 if IsValid(dmginfo:GetAttacker()) and dmginfo:GetAttacker():IsPlayer() and IsValid(dmginfo:GetAttacker():GetActiveWeapon()) and dmginfo:IsBulletDamage() and NoHeadShotWeaps[dmginfo:GetAttacker():GetActiveWeapon():GetClass()] and hitgroup == HITGROUP_HEAD then
		dmginfo:ScaleDamage( 0.5 )
	 end
end )

hook.Add( "PlayerInitialSpawn", "PrecacheBoomHalo1", function( ply )
ply:EmitSound( "halo1/grenade_expl_1.ogg", 75, 100, 0 )
ply:EmitSound( "halo1/grenade_expl_2.ogg", 75, 100, 0 )
ply:EmitSound( "halo1/grenade_expl_3.ogg", 75, 100, 0 )
ply:EmitSound( "halo1/fuelrod_expl_1.ogg", 75, 100, 0 )
ply:EmitSound( "halo1/fuelrod_expl_2.ogg", 75, 100, 0 )
ply:EmitSound( "halo1/needler_expl.ogg", 75, 100, 0 )
end )

hook.Add("PreCleanupMap", "HaloSWEPSRemoveNeedles", function()
for _, ply in ipairs( player.GetAll() ) do
	if IsValid(ply) then ply:SetNW2Int("Niko663HaloSWEPSNeedles", 0 ) end
	end
end )

hook.Add("PopulateToolMenu", "HaloSWEPSGrenadeMenu", function()
		spawnmenu.AddToolMenuOption("Utilities", "Admin", "halosweps_options", "Halo SWEPS", "", "", function(panel)
			panel:SetName("Options")
			panel:AddControl("Header", {
				Text = "",
				Description = "Halo SWEPS - Options."
			})

			panel:AddControl("Checkbox", {
				Label = "Halo CE SWEPS - Allow Grenades",
				Command = "halo1_grenade"
			})

			panel:AddControl("Checkbox", {
				Label = "Halo 2 SWEPS - Allow Grenades",
				Command = "halo2_grenade"
			})

			panel:AddControl("Checkbox", {
				Label = "Halo 3 SWEPS - Allow Grenades",
				Command = "halo3_grenade"
			})

			panel:AddControl("Checkbox", {
				Label = "Halo 3: ODST SWEPS - Allow Grenades",
				Command = "halo3o_grenade"
			})

			panel:AddControl("Checkbox", {
				Label = "Give Grenades On Spawn",
				Command = "halosweps_givegrenades"
			})

			panel:AddControl("Checkbox", {
				Label = "9999 Grenades",
				Command = "halosweps_9999nades"
			})
	
			panel:AddControl("Checkbox", {
				Label = "Objective/Support Weapons Reduce Move Speed?",
				Command = "halosweps_objweaponspeedloss"
			})

			panel:AddControl("Checkbox", {
				Label = "Enable Shell Ejection Effects?",
				Command = "halosweps_shelleffects"
			})
end)

end)

sound.Add({
	name =				"Halo1_Weapon.StopSound",
	channel =			CHAN_WEAPON,
	volume =			1.0,
	soundlevel =			80,
	sound =				"halo1/null.ogg"
})

sound.Add({
	name =				"Halo1_Weapon.Zoom",
	channel =			CHAN_STATIC,
	volume =			1.0,
	soundlevel =			80,
	sound =				"halo1/zoom.ogg"
})

sound.Add({
	name =				"Halo1_Weapon.ZoomOut",
	channel =			CHAN_STATIC,
	volume =			1.0,
	soundlevel =			80,
	sound =				"halo1/zoomout.ogg"
})

sound.Add({
	name =				"Halo1_UNSC.DryFire",
	channel =			CHAN_STATIC,
	volume =			1.0,
	soundlevel =			80,
	sound =				"halo1/unsc_empty.ogg"
})

sound.Add(
{
    name = "Halo1_Covie.DryFire",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = {"halo1/covie_empty_1.ogg", "halo1/covie_empty_2.ogg", "halo1/covie_empty_3.ogg"}
})

sound.Add(
{
    name = "Halo1_Needler.DryFire",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/needler_empty.ogg"
})

sound.Add({
	name =				"Halo1_AR.Fire",
	channel =			CHAN_STATIC,
	volume =			1.0,
	soundlevel =			90,
	sound =				{"halo1/ar_fire_1.ogg", "halo1/ar_fire_2.ogg", "halo1/ar_fire_3.ogg", "halo1/ar_fire_4.ogg"}
})

sound.Add({
	name =				"Halo1_AR.Deploy",
	channel =			CHAN_WEAPON,
	volume =			1.0,
	soundlevel =			80,
	sound =				"halo1/ar_deploy.ogg"
})

sound.Add({
	name =				"Halo1_AR.Melee",
	channel =			CHAN_STATIC,
	volume =			1.0,
	soundlevel =			80,
	sound =				"halo1/ar_melee.ogg"
})

sound.Add({
	name =				"Halo1_AR.Reload",
	channel =			CHAN_WEAPON,
	volume =			1.0,
	soundlevel =			80,
	sound =				"halo1/ar_reload.ogg"
})

sound.Add(
{
    name = "Halo1_Pistol.Deploy",
    channel = CHAN_WEAPON,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/pistol_deploy.ogg"
})

sound.Add(
{
    name = "Halo1_Pistol.Reload",
    channel = CHAN_WEAPON,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/pistol_reload.ogg"
})

sound.Add(
{
    name = "Halo1_Pistol.DryFire",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/pistol_empty.ogg"
})

sound.Add({
	name =				"Halo1_Pistol.Fire",
	channel =			CHAN_STATIC,
	volume =			1.0,
	soundlevel =			90,
	sound =				"halo1/pistol_fire.ogg"
})

sound.Add({
	name =				"Halo1_Pistol.Melee",
	channel =			CHAN_STATIC,
	volume =			1.0,
	soundlevel =			80,
	sound =				{"halo1/pistol_melee_1.ogg", "halo1/pistol_melee_2.ogg"}
})

sound.Add(
{
    name = "Halo1_Flamethrower.Deploy",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/flamethrower_deploy.ogg"
})

sound.Add(
{
    name = "Halo1_Flamethrower.DeployAlt",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/flamethrower_deploy2.ogg"
})

sound.Add(
{
    name = "Halo1_Flamethrower.FireStop",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 90,
    sound = "halo1/flamethrower_firestop.ogg"
})

sound.Add(
{
    name = "Halo1_Flamethrower.DryFire",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/flamethrower_empty.ogg"
})

sound.Add(
{
    name = "Halo1_Flamethrower.Reload",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/flamethrower_reload.ogg"
})

sound.Add(
{
    name = "Halo1_Flamethrower.Melee",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/flamethrower_melee.ogg"
})

sound.Add(
{
    name = "Halo1_Flamethrower.Impact_1",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/flamethrower_impact_1.ogg"
})

sound.Add(
{
    name = "Halo1_Flamethrower.Impact_2",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/flamethrower_impact_2.ogg"
})

sound.Add(
{
    name = "Halo1_Flamethrower.Impact_3",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/flamethrower_impact_3.ogg"
})

sound.Add(
{
    name = "Halo1_Flamethrower.BurnOut_1",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/flamethrower_burnout_1.ogg"
})

sound.Add(
{
    name = "Halo1_Flamethrower.BurnOut_2",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/flamethrower_burnout_2.ogg"
})

sound.Add(
{
    name = "Halo1_Flamethrower.BurnOut_3",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/flamethrower_burnout_3.ogg"
})

sound.Add(
{
    name = "Halo1_Rocket.Deploy",
    channel = CHAN_WEAPON,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/rocket_deploy.ogg"
})

sound.Add(
{
    name = "Halo1_Rocket.Rotate",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/rocket_rotate.ogg"
})

sound.Add({
	name =				"Halo1_Rocket.Fire",
	channel =			CHAN_STATIC,
	volume =			1.0,
	soundlevel =			90,
	sound =				{"halo1/rocket_fire_1.ogg", "halo1/rocket_fire_2.ogg"}
})

sound.Add({
	name =				"Halo1_Rocket.Melee",
	channel =			CHAN_STATIC,
	volume =			1.0,
	soundlevel =			80,
	sound =				"halo1/rocket_melee.ogg"
})

sound.Add({
	name =				"Halo1_Rocket.Reload",
	channel =			CHAN_WEAPON,
	volume =			1.0,
	soundlevel =			80,
	sound =				"halo1/rocket_reload.ogg"
})

sound.Add({
	name =				"Halo1_Rocket.ReloadEmpty",
	channel =			CHAN_WEAPON,
	volume =			1.0,
	soundlevel =			80,
	sound =				"halo1/rocket_reloadempty.ogg"
})

sound.Add(
{
    name = "Halo1_Rocket.Loop",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/rocket_flyby.wav"
})

sound.Add(
{
    name = "Halo1_Shotgun.Deploy",
    channel = CHAN_WEAPON,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/shotgun_deploy.ogg"
})

sound.Add(
{
    name = "Halo1_Shotgun.FirePump",
    channel = CHAN_WEAPON,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/shotgun_pump.ogg"
})

sound.Add({
	name =				"Halo1_Shotgun.Fire",
	channel =			CHAN_STATIC,
	volume =			1.0,
	soundlevel =			90,
	sound =				"halo1/shotgun_fire.ogg"
})

sound.Add({
	name =				"Halo1_Shotgun.Melee",
	channel =			CHAN_STATIC,
	volume =			1.0,
	soundlevel =			80,
	sound =				"halo1/shotgun_melee.ogg"
})

sound.Add(
{
    name = "Halo1_Shotgun.ShellInsert",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = {"halo1/shotgun_shellinsert_1.ogg", "halo1/shotgun_shellinsert_2.ogg", "halo1/shotgun_shellinsert_3.ogg" }
})

sound.Add(
{
    name = "Halo1_Shotgun.ReloadFinish",
    channel = CHAN_WEAPON,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/shotgun_reloadexit.ogg"
})

sound.Add(
{
    name = "Halo1_Shotgun.Pump",
    channel = CHAN_WEAPON,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/shotgun_reloadpump.ogg"
})

sound.Add({
	name =				"Halo1_Sniper.Deploy",
	channel =			CHAN_WEAPON,
	volume =			1.0,
	soundlevel =			80,
	sound =				"halo1/sniper_deploy.ogg"
})

sound.Add({
	name =				"Halo1_Sniper.Melee",
	channel =			CHAN_STATIC,
	volume =			1.0,
	soundlevel =			80,
	sound =				"halo1/sniper_melee.ogg"
})

sound.Add({
	name =				"Halo1_Sniper.Reload",
	channel =			CHAN_WEAPON,
	volume =			1.0,
	soundlevel =			80,
	sound =				"halo1/sniper_reload.ogg"
})

sound.Add({
	name =				"Halo1_Sniper.ReloadEmpty",
	channel =			CHAN_WEAPON,
	volume =			1.0,
	soundlevel =			80,
	sound =				"halo1/sniper_reloadempty.ogg"
})

sound.Add({
	name =				"Halo1_Sniper.Fire",
	channel =			CHAN_STATIC,
	volume =			1.0,
	soundlevel =			90,
	sound =				"halo1/sniper_fire.ogg"
})

sound.Add(
{
    name = "Halo1_Nade.Throw",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/grenade_toss.ogg"
})

sound.Add(
{
    name = "Halo1_FR.Melee",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/fuelrod_melee.ogg"
})

sound.Add({
	name =				"Halo1_FR.Fire",
	channel =			CHAN_STATIC,
	volume =			1.0,
	soundlevel =			90,
	sound =				"halo1/fuelrod_fire.ogg"
})

sound.Add(
{
    name = "Halo1_Needler.Deploy",
    channel = CHAN_WEAPON,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/needler_deploy.ogg"
})

sound.Add(
{
    name = "Halo1_Needler.SuperCombine",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/needler_expl.ogg"
})

sound.Add({
	name =				"Halo1_Needler.Fire",
	channel =			CHAN_STATIC,
	volume =			1.0,
	soundlevel =			90,
	sound =				{"halo1/needler_fire_1.ogg", "halo1/needler_fire_2.ogg"}
})

sound.Add({
	name =				"Halo1_Needler.Melee",
	channel =			CHAN_STATIC,
	volume =			1.0,
	soundlevel =			80,
	sound =				"halo1/needler_melee.ogg"
})

sound.Add(
{
    name = "Halo1_Needler.Reload",
    channel = CHAN_WEAPON,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/needler_reload.ogg"
})

sound.Add(
{
    name = "Halo1_PP.Deploy",
    channel = CHAN_WEAPON,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/ppistol_deploy.ogg"
})

sound.Add(
{
    name = "Halo1_PP.FlyBy",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/ppistol_flyby.wav"
})

sound.Add(
{
    name = "Halo1_Needler.FlyBy",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/needler_flyby.wav"
})

sound.Add({
	name =				"Halo1_PP.Fire",
	channel =			CHAN_STATIC,
	volume =			1.0,
	soundlevel =			90,
	sound =				{"halo1/ppistol_fire_1.ogg", "halo1/ppistol_fire_2.ogg"}
})

sound.Add({
	name =				"Halo1_PP.Melee",
	channel =			CHAN_STATIC,
	volume =			1.0,
	soundlevel =			80,
	sound =				"halo1/ppistol_melee.ogg"
})

sound.Add(
{
    name = "Halo1_PP.OH",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/ppistol_overheat.ogg"
})

sound.Add(
{
    name = "Halo1_PP.OHExit",
    channel = CHAN_WEAPON,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/ppistol_overheatexit.ogg"
})

sound.Add(
{
    name = "Halo1_PP.ChargeStart",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/ppistol_chargestart.ogg"
})

sound.Add(
{
    name = "Halo1_PP.ChargeFire",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/ppistol_chargeshot.ogg"
})

sound.Add(
{
    name = "Halo1_PR.OH",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/prifle_overheat.ogg"
})

sound.Add(
{
    name = "Halo1_PR.OHExit",
    channel = CHAN_WEAPON,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/prifle_overheatexit.ogg"
})

sound.Add(
{
    name = "Halo1_PR.Deploy",
    channel = CHAN_WEAPON,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/prifle_deploy.ogg"
})

sound.Add(
{
    name = "Halo1_PR.Fire",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 90,
    sound = {"halo1/prifle_fire_1.ogg", "halo1/prifle_fire_2.ogg"}
})

sound.Add({
	name =				"Halo1_PR.Melee",
	channel =			CHAN_STATIC,
	volume =			1.0,
	soundlevel =			80,
	sound =				"halo1/prifle_melee.ogg"
})

sound.Add(
{
    name = "Halo1_Ball.Deploy",
    channel = CHAN_WEAPON,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/oddball_deploy.ogg"
})

sound.Add(
{
    name = "Halo1_Ball.Melee",
    channel = CHAN_WEAPON,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/oddball_melee.ogg"
})

sound.Add(
{
    name = "Halo1_Flag.Deploy",
    channel = CHAN_WEAPON,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/flag_deploy.ogg"
})

sound.Add(
{
    name = "Halo1_Flag.Melee",
    channel = CHAN_WEAPON,
    volume = 1.0,
    soundlevel = 80,
    sound = "halo1/flag_melee.ogg"
})