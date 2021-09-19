extends Node


export (PackedScene) var turret:PackedScene

func create(player, quantity):
	for n in quantity:
		var turretT = turret.instance()
		self.add_child(turretT)
		turretT.set_initial_values(self,player)
