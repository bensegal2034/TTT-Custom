function EFFECT:Init(data)
	
	if !IsValid(data:GetEntity()) then return end
	
	self.WeaponEnt = data:GetEntity()
	self.Attachment = data:GetAttachment()
	
	if !IsValid(self.WeaponEnt) or !IsValid(self.WeaponEnt:GetOwner()) then
		return
	else
	
	self.Position = self:GetTracerShootPos(data:GetOrigin(), self.WeaponEnt, self.Attachment)
	self.Forward = data:GetNormal()
	self.Angle = self.Forward:Angle()
	self.Right = self.Angle:Right()
	
	local AddVel = self.WeaponEnt.Owner:GetVelocity()
	
	local emitter = ParticleEmitter(self.Position)
	if emitter != nil then	
		local particle = emitter:Add( "effects/halo3/electric_bolts", self.Position )
		if particle != nil then
	
			particle:SetVelocity( AddVel )
			particle:SetGravity( Vector( 0, 0, 10 ) )
			particle:SetAirResistance( 230 )

			particle:SetDieTime( math.Rand( 0.1, 0.1 ) )

			particle:SetStartSize( 4 )
			particle:SetEndSize( 6.5 )

			particle:SetRoll( math.random(0,3) )
			particle:SetRollDelta( math.Rand( 0, 10 ) )
			
			particle:SetColor( 30, 144,255 )
		
		for i = 1,4 do
			local particle = emitter:Add( "effects/halo3/electric_arcs", self.Position )

				particle:SetVelocity( AddVel )
			particle:SetGravity( Vector( 0, 0, 10 ) )
			particle:SetAirResistance( 230 )

			particle:SetDieTime( math.Rand( 0.1, 0.1 ) )

			particle:SetStartSize( 4 )
			particle:SetEndSize( 6.5 )

			particle:SetRoll( math.random(2,3) )
			particle:SetRollDelta( math.Rand( 2, 3 ) )
			
			particle:SetColor( 30, 144, 255 )
		end
		end
	emitter:Finish()
	end
	end
	
end


function EFFECT:Render()
end


