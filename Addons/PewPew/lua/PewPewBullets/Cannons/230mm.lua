-- Basic Cannon

local BULLET = {}

-- General Information
BULLET.Name = "230mm Cannon"
BULLET.Author = "Divran"
BULLET.Description = "Very slow rate of fire, very high damage."
BULLET.AdminOnly = false
BULLET.SuperAdminOnly = false

-- Appearance
BULLET.Model = "models/combatmodels/tankshell_230mm.mdl"
BULLET.Material = nil
BULLET.Color = nil
BULLET.Trail = nil

-- Effects / Sounds
BULLET.FireSound = {"arty/230mm.wav"}
BULLET.ExplosionSound = {"weapons/explode1.wav","weapons/explode2.wav"}
BULLET.FireEffect = "cannon_flare"
BULLET.ExplosionEffect = "Enersplosion"

-- Movement
BULLET.Speed = 150
BULLET.Gravity = 0.1
BULLET.RecoilForce = 700
BULLET.Spread = 0
BULLET.AffectedBySBGravity = true

-- Damage
BULLET.DamageType = "BlastDamage"
BULLET.Damage = 2000
BULLET.Radius = 900
BULLET.RangeDamageMul = 0.7
BULLET.NumberOfSlices = nil
BULLET.SliceDistance = nil
BULLET.PlayerDamage = 1000
BULLET.PlayerDamageRadius = 600

-- Reloading/Ammo
BULLET.Reloadtime = 17.5
BULLET.Ammo = 0
BULLET.AmmoReloadtime = 0

BULLET.EnergyPerShot = 20000

pewpew:AddBullet( BULLET )