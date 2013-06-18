-- Thud Rounds

local BULLET = {}

-- General Information
BULLET.Name = "Thud Rounds"
BULLET.Author = "Divran"
BULLET.Description = "Pushes the target away, but deals no damage."
BULLET.AdminOnly = false
BULLET.SuperAdminOnly = false

-- Appearance
BULLET.Model = "models/dav0r/hoverball.mdl"
BULLET.Material = "debug/debugdrawflat"
BULLET.Color = Color(0,0,0)
BULLET.Trail = { StartSize = 10, EndSize = 0, Length = 2, Texture = "trails/smoke.vmt", Color = Color(0,0,0) }

-- Effects / Sounds
BULLET.FireSound = { "weapons/grenade_launcher1.wav" }
BULLET.ExplosionSound = {"npc/waste_scanner/grenade_fire.wav" }
BULLET.FireEffect = "muzzleflash"
BULLET.ExplosionEffect = nil
BULLET.EmptyMagSound = { "npc/turret_floor/click1.wav" }

-- Movement
BULLET.Speed = 100
BULLET.Gravity = 0.15
BULLET.RecoilForce = 400
BULLET.Spread = 0.5
BULLET.AffectedBySBGravity = true

-- Reloading/Ammo
BULLET.Reloadtime = 0.5
BULLET.Ammo = 5
BULLET.AmmoReloadtime = 7

-- Other
BULLET.Lifetime = {0,0}
BULLET.ExplodeAfterDeath = false
BULLET.EnergyPerShot = 1000

BULLET.ExplodeOverride = true
function BULLET:Explode( self, trace )
	if (!trace or !trace.Hit) then return end
	if (trace.Entity and trace.Entity:IsValid()) then
		if (!pewpew:FindSafeZone(trace.Entity:GetPos())) then
			local dir = (self:GetPos() - trace.HitPos):GetNormalized()
			if (trace.Entity:IsPlayer()) then
				trace.Entity:SetVelocity( dir * 1000 )
			else
				local phys = trace.Entity:GetPhysicsObject()
				if (phys) then
					phys:ApplyForceCenter( dir * 10000000 )
				end
			end
		end
		WorldSound( self.Bullet.ExplosionSound[1], trace.HitPos+trace.HitNormal*5,100,100)
	end
	self:Remove()
end


pewpew:AddBullet( BULLET )