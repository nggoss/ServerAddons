-- Green Laser

local BULLET = {}

-- General Information
BULLET.Name = "Green Star Wars Laser"
BULLET.Author = "Divran"
BULLET.Description = "The green Star Wars laser."
BULLET.AdminOnly = false
BULLET.SuperAdminOnly = false

-- Appearance
BULLET.Model = "models/PenisColada/greenlaser.mdl"
BULLET.Material = nil
BULLET.Color = nil
BULLET.Trail = nil

-- Effects / Sounds
BULLET.FireSound = {"starwars/green.wav"}
BULLET.ExplosionSound = nil
BULLET.FireEffect = nil
BULLET.ExplosionEffect = nil

-- Movement
BULLET.Speed = 115
BULLET.Gravity = 0.01
BULLET.RecoilForce = 0
BULLET.Spread = 0.3
BULLET.AffectedBySBGravity = true

-- Damage
BULLET.DamageType = "PointDamage"
BULLET.Damage = 225
BULLET.Radius = nil
BULLET.RangeDamageMul = nil
BULLET.NumberOfSlices = nil
BULLET.SliceDistance = nil
BULLET.PlayerDamage = nil
BULLET.PlayerDamageRadius = nil

-- Reloading/Ammo
BULLET.Reloadtime = 0.25
BULLET.Ammo = 5
BULLET.AmmoReloadtime = 1.5

BULLET.EnergyPerShot = 285

pewpew:AddBullet( BULLET )