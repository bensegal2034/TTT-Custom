function EFFECT:Init(data)
	
	if !IsValid(data:GetEntity()) or !IsValid(data:GetEntity():GetOwner()) then return end
	
	if data:GetFlags() == 2 then
	if LocalPlayer():ShouldDrawLocalPlayer() then
        ParticleEffectAttach( "halo1_muzzle_plasmapistolcharged", PATTACH_POINT_FOLLOW, data:GetEntity(), data:GetAttachment())
        elseif data:GetEntity():GetOwner() != LocalPlayer() then
	ParticleEffectAttach( "halo1_muzzle_plasmapistolcharged", PATTACH_POINT_FOLLOW, data:GetEntity(), data:GetAttachment())
	end
	return end

	if data:GetFlags() == 4 then
	if LocalPlayer():ShouldDrawLocalPlayer() then
        ParticleEffectAttach( "halo1_unsc_flame_third", PATTACH_POINT_FOLLOW, data:GetEntity(), data:GetAttachment())
        elseif data:GetEntity():GetOwner() != LocalPlayer() then
	ParticleEffectAttach( "halo1_unsc_flame_third", PATTACH_POINT_FOLLOW, data:GetEntity(), data:GetAttachment())
	end
	return end

	if LocalPlayer():ShouldDrawLocalPlayer() and GetViewEntity() == LocalPlayer() then
        ParticleEffectAttach(data:GetEntity().MuzzleEffectH1, PATTACH_POINT_FOLLOW, data:GetEntity(), data:GetAttachment())
        elseif data:GetEntity():GetOwner() != LocalPlayer() or GetViewEntity() != LocalPlayer() then
	ParticleEffectAttach(data:GetEntity().MuzzleEffectH1, PATTACH_POINT_FOLLOW, data:GetEntity(), data:GetAttachment())
	end
	
end


function EFFECT:Render()
end


