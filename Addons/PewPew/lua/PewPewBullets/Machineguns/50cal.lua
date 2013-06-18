-- Basic Cannon

local BULLET = {}

-- General Information
BULLET.Name = "50 cal machinegun"
BULLET.Author = "Divran"
BULLET.Description = "50 caliber machinegun."
BULLET.AdminOnly = false
BULLET.SuperAdminOnly = false

-- Appearance
BULLET.Model = "models/combatmodels/tankshell_25mm.mdl"
BULLET.Material = nil
BULLET.Color = nil
BULLET.Trail = nil

-- Effects / Sounds
BULLET.FireSound = {"arty/50cal.wav"}
BULLET.ExplosionSound = nil
BULLET.FireEffect = "muzzleflash"
BULLET.ExplosionEffect = "mghit"
BULLET.EmptyMagSound = {"weapons/shotgun/shotgun_empty.wav"}

-- Movement
BULLET.Speed = 115
BULLET.Gravity = 0.15
BULLET.RecoilForce = 50
BULLET.Spread = 0.4
BULLET.AffectedBySBGravity = true

-- Damage
BULLET.DamageType = "PointDamage"
BULLET.Damage = 100
BULLET.Radius = nil
BULLET.RangeDamageMul = nil
BULLET.NumberOfSlices = nil
BULLET.SliceDistance = nil
BULLET.PlayerDamage = nil
BULLET.PlayerDamageRadius = nil

-- Reloading/Ammo
BULLET.Reloadtime = 0.2
BULLET.Ammo = 70
BULLET.AmmoReloadtime = 9

BULLET.EnergyPerShot = 300

pewpew:AddBullet( BULLET )