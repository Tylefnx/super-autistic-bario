extends CharacterBody2D
const SPEED = 400.0
const JUMP_VELOCITY = -400.0
var direction = Vector2.LEFT
var hitting = false
@onready var animation = $animation
@onready var attack_left = $attack_left
@onready var transformation = $transformation

var alive = true
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func death():
	if alive:
		if position.y >= 300:
			alive = false
			self.queue_free()
func run():
	transformation.start()
	animation.play("run")
	velocity = direction * SPEED
func update_animation():
	if hitting:
		animation.play("hit")
	elif alive:
		animation.play("idle")
func _physics_process(delta):
	death()
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()


func _on_area_2d_body_entered(body):
	if body.name == "bario":
		if body.has_method("seriously_hurt"):
			body.seriously_hurt()


func _on_transformation_timeout():
	run()
