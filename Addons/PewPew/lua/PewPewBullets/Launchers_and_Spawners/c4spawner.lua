-- C4 Spawner

local BULLET = {}

-- General Information
BULLET.Name = "C4 Spawner"
BULLET.Author = "Divran"
BULLET.Description = "Spawns C4s so that you can applyForce them with E2."
BULLET.AdminOnly = false
BULLET.SuperAdminOnly = false

-- Appearance
BULLET.Model = "models/Items/grenadeAmmo.mdl"

-- Effects / Sounds
BULLET.FireSound = {"npc/attack_helicopter/aheli_mine_drop1.wav"}

-- Reloading/Ammo
BULLET.Reloadtime = 1
BULLET.Ammo = 0
BULLET.AmmoReloadtime = 0

-- Custom Functions 
-- (If you set the override var to true, the cannon/bullet will run these instead. Use these functions to do stuff which is not possible with the above variables)

-- Fire (Is called before the cannon is about to fire)
BULLET.FireOverride = true
function BULLET:Fire( self )
	local Dir, Pos = pewpew:GetFireDirection( self.Direction, self )
	
	local Bullet = pewpew:GetBullet("C4")
	
	ply = self.Owner
	
	if (!Bullet) then 
		ply:ChatPrint("This server does not have C4.") 
		return 
	end
	
	if (!ply:CheckLimit("pewpew")) then return end
	local ent = ents.Create( "pewpew_base_cannon" )
	if (!ent:IsValid()) then return end
	
	-- Pos/Model/Angle
	ent:SetModel( self.Bullet.Model )
	
	if (!util.IsInWorld(Pos)) then return end
	
	ent:SetPos( Pos )
	ent:SetAngles( self.Entity:GetAngles() )

	ent:SetOptions( Bullet, ply, fire, reload )
	
	ent:Spawn()
	ent:Activate()
	
	local phys = ent:GetPhysicsObject()
	phys:Wake()
	
	ply:AddCount("pewpew",ent)
	ply:AddCleanup ( "pewpew", ent )

	undo.Create( "pewpew" )
		undo.AddEntity( ent )
		undo.SetPlayer( ply )
	undo.Finish()
	
	self:EmitSound( self.Bullet.FireSound[1] )
	
	WireLib.TriggerOutput( self.Entity, "Last Fired", ent or nil )
	WireLib.TriggerOutput( self.Entity, "Last Fired EntID", ent:EntIndex() or 0 )
end

pewpew:AddBullet( BULLET )