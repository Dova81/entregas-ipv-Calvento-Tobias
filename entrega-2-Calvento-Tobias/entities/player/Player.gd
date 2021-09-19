extends Sprite

onready var cannon:Sprite = $Cannon
var speed = 200 #Pixeles

var projectile_container:Node

export (float) var ACCELERATION:float = 30.0
export (float) var H_SPEED_LIMIT: float = 400.0
export (float) var FRICTION_WEIGHT:float = 0.05

var velocity:Vector2 = Vector2.ZERO

func set_projectile_container(container:Node):
	cannon.projectile_container = container
	projectile_container = container

func _physics_process(delta):
	var direction_optimized:int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))

	if direction_optimized != 0:
		velocity.x = clamp(velocity.x + (direction_optimized * ACCELERATION ), -H_SPEED_LIMIT, H_SPEED_LIMIT)
	else:
		velocity.x = lerp(velocity.x, 0 , FRICTION_WEIGHT) if abs(velocity.x) > 1 else 0

	position.x += velocity.x * delta
	
	var mouse_position:Vector2 = get_global_mouse_position()
#	var origen:Vector2 = global_position
#	var direction_position = mouse_position - origen
	
	cannon.look_at(mouse_position)
	
	if Input.is_action_just_pressed("fire"):
		cannon.fire()
	
	position.x += direction_optimized * speed * delta
