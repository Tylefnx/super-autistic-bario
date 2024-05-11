extends CharacterBody2D


const SPEED = 250.0
const JUMP_VELOCITY = -400.0
var direction = Vector2.LEFT
var hitting = false
@onready var animation = $animation
var alive = true
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func run():
	velocity = direction * SPEED
func update_animation():
	if hitting:
		animation.play("hit")
	elif alive:
		animation.play("idle")
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()


func _on_area_2d_body_entered(body):
	if body.name == "bario":
		if body.has_method("seriously_hurt"):
			body.seriously_hurt()
