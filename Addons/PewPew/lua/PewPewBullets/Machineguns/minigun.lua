-- Basic Cannon

local BULLET = {}

-- General Information
BULLET.Name = "Minigun"
BULLET.Author = "Divran"
BULLET.Description = "Extreme fire rate, low accuracy and damage."
BULLET.AdminOnly = false
BULLET.SuperAdminOnly = false

-- Appearance
BULLET.Model = "models/combatmodels/tankshell_25mm.mdl"
BULLET.Material = nil
BULLET.Color = nil
BULLET.Trail = nil

-- Effects / Sounds
BULLET.FireSound = {"arty/mg42.wav"}
BULLET.ExplosionSound = nil
BULLET.FireEffect = "muzzleflash"
BULLET.ExplosionEffect = "mghit"

-- Movement
BULLET.Speed = 100
BULLET.Gravity = 0.1
BULLET.RecoilForce = 35
BULLET.Spread = 0.5
BULLET.AffectedBySBGravity = true

-- Damage
BULLET.DamageType = "PointDamage"
BULLET.Damage = 30

-- Reloading/Ammo
BULLET.Reloadtime = 0.05
BULLET.Ammo = 180
BULLET.AmmoReloadtime = 14

-- Other
BULLET.EnergyPerShot = 80

-- Wire Input (This is called whenever a wire input is changed) (Is run on: Cannon)
BULLET.WireInputOverride = true
function BULLET:WireInput( self, name, value )
	if (name == "Fire") then
		if (value != 0) then
			self.Firing = true
		else
			self.Firing = false
		end
		if (value != 0 and self.CanFire == true) then
			self.LastFired = CurTime()
			self.CanFire = false
			WireLib.TriggerOutput(self.Entity, "Can Fire", 0)
		end
	elseif (name == "Reload") then
		if (self.Ammo and self.Ammo > 0 and self.Ammo < self.Bullet.Ammo) then
			if (self.Bullet.Ammo and self.Bullet.Ammo > 0 and self.Bullet.AmmoReloadtime and self.Bullet.AmmoReloadtime > 0) then
				if (value != 0) then
					if (self.Ammo and self.Ammo > 0) then
						self.Ammo = 0
						self.LastFired = CurTime() + self.Bullet.Reloadtime
						self.CanFire = false					
						WireLib.TriggerOutput( self.Entity, "Can Fire", 0)
						WireLib.TriggerOutput( self.Entity, "Ammo", 0 )
					end
				end
			end
		end
	end
end

-- Cannon Think (Is run on: Cannon)
BULLET.CannonThinkOverride = true
function BULLET:CannonThink( self )
	if (!self.ChargeSound) then self.ChargeSound = CreateSound( self.Entity, "ambient/machines/spin_loop.wav" ) end
	if (!self.ChargeUpTime) then self.ChargeUpTime = 0 end
	if (CurTime() - self.LastFired > self.Bullet.Reloadtime and self.CanFire == false) then -- if you can fire
		if (self.Ammo <= 0 and self.Bullet.Ammo > 0) then -- check for ammo
			-- if we don't have any ammo left...
			if (self.Firing) then -- if you are holding down fire
				-- Sound
				if (self.Bullet.EmptyMagSound and self.SoundTimer and CurTime() > self.SoundTimer) then
					self.SoundTimer = CurTime() + self.Bullet.Reloadtime
					local soundpath = ""
					if (table.Count(self.Bullet.EmptyMagSound) > 1) then
						soundpath = table.Random(self.Bullet.EmptyMagSound)
					else
						soundpath = self.Bullet.EmptyMagSound[1]
					end
					self:EmitSound( soundpath )
				end			
			end
			self.CanFire = false
			WireLib.TriggerOutput( self.Entity, "Can Fire", 0)
			if (CurTime() - self.LastFired > self.Bullet.AmmoReloadtime) then -- check ammo reloadtime
				self.Ammo = self.Bullet.Ammo
				WireLib.TriggerOutput( self.Entity, "Ammo", self.Ammo )
				self.CanFire = true
				if (self.Firing) then 
					self.LastFired = CurTime()
					self.CanFire = false
				else
					WireLib.TriggerOutput( self.Entity, "Can Fire", 1)
				end
			end
		else
			-- if we DO have ammo left
			self.CanFire = true
			if (self.Firing) then
				self.LastFired = CurTime()
				self.CanFire = false
				if (self.ChargeUpTime >= 145) then
					self:FireBullet()
				else
					self.ChargeUpTime = self.ChargeUpTime + 5
				end
				if (!self.ChargeSound:IsPlaying()) then
					self.ChargeSound:Play()
				end
				self.ChargeSound:ChangePitch(math.max(self.ChargeUpTime,1))
			else
				WireLib.TriggerOutput( self.Entity, "Can Fire", 1)

			end
		end
	end
	if (!self.Firing or self.Ammo == 0) then
		if (self.ChargeUpTime > 0) then 
			self.ChargeUpTime = self.ChargeUpTime - 2
			self.ChargeSound:ChangePitch(math.max(self.ChargeUpTime,1))
		else 
			self.ChargeSound:Stop() 
		end
	end
	if (self.Bullet.Reloadtime and self.Bullet.Reloadtime < 0.5) then
		-- Run more often!
		self.Entity:NextThink( CurTime() )
		return true
	end
end

pewpew:AddBullet( BULLET )