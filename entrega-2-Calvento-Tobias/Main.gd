extends Node


func _ready():
	randomize()
	$Player.set_projectile_container(self)
	$TurretFactory.create($Player,3)


