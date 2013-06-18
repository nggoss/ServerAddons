-- Basic Cannon

local BULLET = {}

-- General Information
BULLET.Name = "Basic Artillery"
BULLET.Author = "Divran"
BULLET.Description = "Aim away from face."
BULLET.AdminOnly = false
BULLET.SuperAdminOnly = false

-- Appearance
BULLET.Model = "models/combatmodels/tankshell.mdl"
BULLET.Material = nil
BULLET.Color = nil
BULLET.Trail = nil

-- Effects / Sounds
BULLET.FireSound = {"arty/cannon.wav"}
BULLET.ExplosionSound = {"weapons/explode1.wav","weapons/explode2.wav"}
BULLET.FireEffect = "artyfire"
BULLET.ExplosionEffect = "big_splosion"

-- Movement
BULLET.Speed = 80
BULLET.Gravity = 0.25
BULLET.RecoilForce = 500
BULLET.Spread = 0
BULLET.AffectedBySBGravity = true

-- Damage
BULLET.DamageType = "BlastDamage"
BULLET.Damage = 800
BULLET.Radius = 500
BULLET.RangeDamageMul = 0.3
BULLET.NumberOfSlices = nil
BULLET.SliceDistance = nil
BULLET.PlayerDamage = 450
BULLET.PlayerDamageRadius = 500

-- Reloading/Ammo
BULLET.Reloadtime = 7.5
BULLET.Ammo = 0
BULLET.AmmoReloadtime = 0

BULLET.EnergyPerShot = 8000

pewpew:AddBullet( BULLET )