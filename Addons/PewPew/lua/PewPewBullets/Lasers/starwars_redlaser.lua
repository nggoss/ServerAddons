-- Red Laser

local BULLET = {}

-- General Information
BULLET.Name = "Red Star Wars Laser"
BULLET.Author = "Divran"
BULLET.Description = "The red Star Wars laser."
BULLET.AdminOnly = false
BULLET.SuperAdminOnly = false

-- Appearance
BULLET.Model = "models/PenisColada/redlaser.mdl"
BULLET.Material = nil
BULLET.Color = nil
BULLET.Trail = nil

-- Effects / Sounds
BULLET.FireSound = {"starwars/red.wav"}
BULLET.ExplosionSound = nil
BULLET.FireEffect = nil
BULLET.ExplosionEffect = nil

-- Movement
BULLET.Speed = 100
BULLET.Gravity = 0.01
BULLET.RecoilForce = 0
BULLET.Spread = 0.05
BULLET.AffectedBySBGravity = true

-- Damage
BULLET.DamageType = "PointDamage"
BULLET.Damage = 280
BULLET.Radius = nil
BULLET.RangeDamageMul = nil
BULLET.NumberOfSlices = nil
BULLET.SliceDistance = nil
BULLET.PlayerDamage = nil
BULLET.PlayerDamageRadius = nil

-- Reloading/Ammo
BULLET.Reloadtime = 0.35
BULLET.Ammo = 3
BULLET.AmmoReloadtime = 1

BULLET.EnergyPerShot = 500

pewpew:AddBullet( BULLET )