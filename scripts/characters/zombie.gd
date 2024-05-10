extends CharacterBody2D

@onready var raycast_left = $raycast_left
@onready var raycast_right = $raycast_right
@onready var animation = $AnimatedSprite2D
var dir = "Left"
const speed = 30.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = Vector2.RIGHT
var health = 1

func update_animations():
	if velocity.length() == 0:
		animation.play("idle"+dir)
	else:
		if velocity.x > 0: dir = "Right"
		elif velocity.x < 0: dir = "Left"
		animation.play("walk"+dir)

func change_direction():
	if raycast_left.is_colliding():
		direction = Vector2.RIGHT
	elif raycast_right.is_colliding():
		direction = Vector2.LEFT

func _physics_process(delta):
	update_animations()
	change_direction()
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity = speed * direction

	move_and_slide()
