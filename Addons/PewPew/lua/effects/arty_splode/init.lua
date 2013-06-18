

EFFECT.Mat = Material( "effects/select_ring" )

/*---------------------------------------------------------
   Initializes the effect. The data is a table of data 
   which was passed from the server.
---------------------------------------------------------*/
function EFFECT:Init( data )
	

	local vOffset = data:GetOrigin()
	
	
	
	local Low = vOffset - Vector(32, 32, 32 )
	local High = vOffset + Vector(32, 32, 32 )
	
	local NumParticles = 50
	
	local emitter = ParticleEmitter( vOffset )
	
		for i=0, (NumParticles / 5) do
		
			local Pos = Vector( math.Rand(-1,1), math.Rand(-1,1), math.Rand(-1,1) ):GetNormalized()
		
			local particle = emitter:Add( "particles/smokey", vOffset + Pos * math.Rand(50, 500 ))
			if (particle) then
				particle:SetVelocity( Pos * math.Rand(75, 150) )
				particle:SetLifeTime( 0 )
				particle:SetDieTime( math.Rand( 2, 10 ) )
				particle:SetStartAlpha( math.Rand( 200, 255 ) )
				particle:SetEndAlpha( 0 )
				particle:SetStartSize( 0 )
				particle:SetEndSize( 800 )
				particle:SetRoll( math.Rand(0, 360) )
				particle:SetRollDelta( math.Rand(-0.2, 0.2) )
				particle:SetColor( 40 , 40 , 40 )
			end
			
		end
		
		for i=0, (NumParticles) do
		
			local Pos = Vector( math.Rand(-1,1), math.Rand(-1,1), 0 ):GetNormalized()
		
			local particle = emitter:Add( "particles/flamelet"..math.random(1,5), vOffset + Pos * math.Rand(250, 500 ))
			if (particle) then
				particle:SetVelocity( Pos * math.Rand(600, 1500) )
				particle:SetLifeTime( 0 )
				particle:SetDieTime( math.Rand( 0.2, 1 ) )
				particle:SetStartAlpha( math.Rand( 200, 255 ) )
				particle:SetEndAlpha( 0 )
				particle:SetStartSize( 180 )
				particle:SetEndSize( 0 )
				particle:SetRoll( math.Rand(0, 360) )
				particle:SetRollDelta( math.Rand(-2, 2) )
				particle:SetColor( 255 , 100 , 100 )
			end
			
		end
		
		for i=0, (NumParticles) do
		
			local Pos = Vector( math.Rand(-1,1), math.Rand(-1,1), math.Rand(-1,1) ):GetNormalized()
		
			local particle = emitter:Add( "particles/flamelet"..math.random(1,5), vOffset + Pos * math.Rand(40, 80 ))
			if (particle) then
				particle:SetVelocity( Pos + Vector( math.Rand(-1,1), math.Rand(-1,1), math.Rand(0,2)):GetNormalized()  * math.Rand(150, 500) )
				particle:SetLifeTime( 0 )
				particle:SetDieTime( math.Rand( 3, 8 ) )
				particle:SetStartAlpha( math.Rand( 200, 255 ) )
				particle:SetEndAlpha( 0 )
				particle:SetStartSize( 500 )
				particle:SetEndSize( 0 )
				particle:SetRoll( math.Rand(0, 360) )
				particle:SetRollDelta( math.Rand(-2, 2) )
				particle:SetColor( 255 , 100 , 100 )
			end
			
		end
		
	emitter:Finish()
	
end


/*---------------------------------------------------------
   THINK
---------------------------------------------------------*/
function EFFECT:Think( )
	return false
end

/*---------------------------------------------------------
   Draw the effect
---------------------------------------------------------*/
function EFFECT:Render()
end
