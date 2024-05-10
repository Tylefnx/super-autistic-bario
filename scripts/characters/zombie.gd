extends CharacterBody2D

@onready var raycast_left = $raycast_left
@onready var raycast_right = $raycast_right

const speed = 30.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = Vector2.RIGHT

func change_direction():
	if raycast_left.is_colliding():
		direction = Vector2.RIGHT
	elif raycast_right.is_colliding():
		direction = Vector2.LEFT

func _physics_process(delta):
	change_direction()
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity = speed * direction

	move_and_slide()
