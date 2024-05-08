extends CharacterBody2D


const SPEED = 100
const JUMP_VELOCITY = -300.0
@onready var animation = $animated_sprite
var dir = "Right"
@onready var walk_timer = $move_timer
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

###### FUNDAMENTAL MECHANICS ######
func update_animation():
	#walk_timer.start()
	if velocity:
		if velocity.x > 0: dir = "Right"
		elif velocity.x < 0: dir = "Left"
		
		animation.play("walk" + dir)
		
	else: animation.play("idle"+dir)
func jump(delta):
	if not is_on_floor(): velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
func walk():
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		animation.play("idle"+dir)
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
func _physics_process(delta):
	update_animation()
	walk()
	jump(delta)
	move_and_slide()
	
