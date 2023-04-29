
CreateConVar( "frest_Cooldowng", 10, {FCVAR_REPLICATED, FCVAR_ARCHIVE}, "Cooldown on  Whiplash" ) 
CreateConVar( "frest_range", 2000, {FCVAR_REPLICATED, FCVAR_ARCHIVE}, "How long you can Phaseshift" )
if CLIENT then 
CreateClientConVar( "frest_bindg", KEY_F, true, true, "Key" ) 
end
if CLIENT then
	function frestStandsSetting1(panel)	
		check = panel:NumSlider("Cooldown on Whiplash\n0 will remove cooldown", "frest_Cooldowng",0,60 )
		check:SetValue(10)		
		check = panel:NumSlider("Range for Whiplash", "frest_range",500,5000 )
		check:SetValue(2000)
		check = panel:KeyBinder("Bind for Whiplash", "frest_bindg" )
		
	end
end
function frestsetting1()
	spawnmenu.AddToolMenuOption("Options", "Ultrakill", "Ultrakill", "Whiplash Options", "", "", frestStandsSetting1)
end

hook.Add("PopulateToolMenu", "frestsetting1", frestsetting1)
local ourMat = Material( "no.png" )
hook.Add( "PostDrawHUD", "blink", function()

	if czcionka != true and CLIENT then
		local mult = ScrW() / ScrH()
		 czcionka = true
	surface.CreateFont("fontstand", {

		font = "Comic Sans MS",

		size = 20,
	
		weight = 800,
	
		blursize = 0,

		scanlines = 0,

		antialias = true,

		underline= false,

		rotary = false,

		shadow = false,

		additive = true,

		outline = false
			
	})
	end


if LocalPlayer():HasWeapon("fres_grapple") then

------------ GrapplingHook
cam.Start2D()
			local at = ((LocalPlayer():GetNWFloat("linat",CurTime()) - CurTime())/ GetConVar("frest_Cooldowng"):GetInt() )
			local att = Lerp(at,0,60)
		
			local boxW,boxH = 150 * ScrW()/ 1920, 200 * ScrH() / 1920
			local boxofW, boxofH = ScrW() *0.3 - boxW/2 , ScrH() * 0.88
		
			
			
			
			
			
			surface.SetMaterial( ourMat )
			
			
			if Lerp((LocalPlayer():GetNWFloat("linat",CurTime()) - CurTime())*0.2,0,500) == 0 and !IsValid(LocalPlayer():SetNWEntity("lina",stando)) then
				surface.SetDrawColor(255,255,255,255)
			else
				surface.SetDrawColor(255,200,200,150)
			end
			surface.DrawTexturedRect(boxofW, boxofH, boxW, boxH)

			if IsValid(LocalPlayer():SetNWEntity("lina",stando)) then
				surface.SetDrawColor(0,0,0,200)
				surface.DrawTexturedRect(	boxofW, boxofH, att * ScrW() / 1920,boxH)
			end
		if LocalPlayer():GetNWFloat("linat",CurTime()) - CurTime() > 0 and !IsValid(LocalPlayer():SetNWEntity("lina",stando)) then
			
			draw.SimpleText( math.floor(( LocalPlayer():GetNWFloat("linat",CurTime()) - CurTime() ) +0,5), "fontstand", boxofW + boxW/2, boxofH * 1, color_white, TEXT_ALIGN_CENTER )

		end
cam.End2D()
	end
end)




hook.Add( "PlayerButtonDown", "graple", function( ply, button )
if button == ply:GetInfoNum("frest_bindg",KEY_F) and ply:HasWeapon("fres_grapple") and SERVER and ply:GetNWBool("blinking",false) == false then 
if !IsValid(ply:GetNWEntity("lina")) and ply:GetNWFloat("linat",CurTime()) <= CurTime() then
	ply:EmitSound( "grabgraple.wav", 50, 100, 5, CHAN_AUTO )	
		if !IsValid(ply:GetNWEntity("lina")) and SERVER then
		local stando = ents.Create("ent_fres_lina")
			if stando:IsValid() then
				stando:SetPos(ply:EyePos() + ply:GetRight() * -6 + ply:GetUp() * -4)
				stando:SetAngles(ply:GetAngles())
				stando:SetOwner(ply)
				stando:Spawn()
				ply:SetNWEntity("lina",stando)
				ply:SetNWFloat("linat",CurTime()+GetConVar("frest_Cooldowng"):GetInt())
			end 
		end

elseif IsValid(ply:GetNWEntity("lina")) then
	ply:GetNWEntity("lina"):Remove()
end
	end
	end)