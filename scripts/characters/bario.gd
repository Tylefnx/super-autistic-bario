extends CharacterBody2D


const SPEED = 100
const JUMP_VELOCITY = -300.0
@onready var animation = $animated_sprite
@onready var attack_timer = $attack_timer
var dir = "Right"
var isPlayerAttacking = false
var health = 3
var chromosomes = 0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

###### FUNDAMENTAL MECHANICS ######
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
func attack():
	pass
func death():
	self.queue_free()
func update_animation():
	if velocity.length() == 0 and !isPlayerAttacking: 
		animation.play("idle"+dir)
	if Input.is_action_just_pressed("attack") and !isPlayerAttacking:
		attack_timer.start()
		isPlayerAttacking = true
		animation.play("atk"+dir)
		await attack_timer.timeout
		attack_timer.stop()
		isPlayerAttacking = false
	elif velocity and !isPlayerAttacking:
		if velocity.x > 0: dir = "Right"
		elif velocity.x < 0: dir = "Left"
		animation.play("walk" + dir)
func _physics_process(delta):
	update_animation()
	walk()
	jump(delta)
	move_and_slide()
