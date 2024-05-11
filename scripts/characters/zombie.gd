extends CharacterBody2D

@onready var raycast_left = $raycast_left
@onready var raycast_right = $raycast_right
@onready var animation = $AnimatedSprite2D
@onready var death_timer = $death_timer
@onready var bario = $"../bario"

var dir = "Left"
const speed = 30.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = Vector2.RIGHT
var health = 1
var zombie_can_take_damage = false
var zombie_dead = false

func update_animations():
	if zombie_dead:
		animation.play("death")
	else:
		if velocity.length() == 0:
			animation.play("idle"+dir)
		else:
			if velocity.x > 0: dir = "Right"
			elif velocity.x < 0: dir = "Left"
			animation.play("walk"+dir)

func change_direction():
	if not zombie_dead:
		if raycast_left.is_colliding():
			direction = Vector2.RIGHT
		elif raycast_right.is_colliding():
			direction = Vector2.LEFT
func take_damage():
	if not zombie_dead:
		if Input.is_action_just_pressed("attack") and zombie_can_take_damage:
			zombie_dead = true
			if dir == "Left":
				position.x += 10
			else:
				position.x -= 10
			health -= 1
			death_timer.start()
		
func _physics_process(delta):
	take_damage()
	update_animations()
	change_direction()
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		if not zombie_dead:
			velocity = speed * direction

	move_and_slide()


func _on_area_2d_body_entered(body):
	zombie_can_take_damage = true


func _on_area_2d_body_exited(body):
	zombie_can_take_damage = false
		


func _on_death_timer_timeout():
	self.queue_free()
	bario.chromosomes += 1
