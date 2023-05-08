
function EFFECT:Init( data )
	
	self.Normal = data:GetNormal()
	self.Position = data:GetOrigin()
	self.Speed = data:GetMagnitude()
	
	local Pos = self.Position
	local Norm = Vector(0,0,1)

	local emitter = ParticleEmitter( Pos )
	
		for i=1, 6 do
		
			local particle = emitter:Add( "effects/halo3/muzzle_flash_round_gaseous", Pos + self.Normal * 2 )

				particle:SetVelocity( Vector(math.random(self.Speed * -1, self.Speed),math.random(self.Speed * -1, self.Speed),math.random(self.Speed * -1, self.Speed)) )
				particle:SetDieTime( 0.42 )
				particle:SetStartAlpha( 255 )
				particle:SetEndAlpha( 0 )
				particle:SetStartSize( 2 )
				particle:SetEndSize( 77 )
				particle:SetRoll( math.Rand( 240, 400 ) )
				particle:SetRollDelta( math.Rand( -1, 1 ) )
				
			end

		for i=1, 7 do
		
			local particle = emitter:Add( "effects/halo3/flash_large", self.Position + self.Normal * 2 )
			
			particle:SetVelocity( Vector(math.random(self.Speed * -1, self.Speed),math.random(self.Speed * -1, self.Speed),math.random(self.Speed * -1, self.Speed)) )
			particle:SetDieTime( math.Rand( 0.6, 0.69 ) )
			particle:SetStartAlpha( 255 )
			particle:SetEndAlpha( 0 )
			particle:SetStartSize( math.Rand( 7, 11 ) )
			particle:SetEndSize( 82 )
			particle:SetRoll( math.Rand(-155, 185) )
			particle:SetRollDelta( math.Rand( -2, 3 ) )
			particle:SetGravity( Vector( 0, 0, 0 ) )
			particle:SetColor(249, 200, 244)
			particle:SetCollide( true )
			particle:SetBounce( 0 )
			particle:SetAirResistance( 500 )
				
			end
		

	emitter:Finish()
	
end

function EFFECT:Think()
	return false	
end

function EFFECT:Render()
end