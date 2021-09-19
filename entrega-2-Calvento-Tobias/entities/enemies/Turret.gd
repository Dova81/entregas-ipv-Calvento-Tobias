extends Sprite

onready var fire_position:Position2D = $FirePosition

export (PackedScene) var projectile_scene:PackedScene

var projectile_container:Node
var player

func set_initial_values(container,player):
	projectile_container = container
	self.player = player
	$Timer.start()
	
func _on_Timer_timeout():
	fire()
	
func fire():
	var projectile_instance:Projectile = projectile_scene.instance()
	projectile_container.add_child(projectile_instance)
	projectile_instance.set_starting_values(fire_position.global_position, (player.global_position - global_position).normalized())
	projectile_instance.connect("delete_requested",self,"_on_projectile_deleted")


func _on_projectile_deleted(projectile):
	projectile_container.remove_child(projectile)
	projectile.queue_free()
