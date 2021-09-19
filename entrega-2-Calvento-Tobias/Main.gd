extends Node


func _ready():
	$Player.set_projectile_container(self)
	$Turret.set_initial_values(self,$Player)
	$Turret2.set_initial_values(self,$Player)
	$Turret3.set_initial_values(self,$Player)

