extends CharacterBody2D


const SPEED = 100
const JUMP_VELOCITY = -300.0
@onready var animation = $animated_sprite
@onready var attack_timer = $attack_timer
@onready var damage_timer = $damage_timer
@onready var hitbox = $hitbox
@onready var damage_cooldown = $damage_cooldown
@onready var death_timer = $death_timer

var dir = "Right"
var barioCanAttack = false
var health = 3
var chromosomes = 0
var enemy_can_attack = false
var pressed_attack = false
var bario_dead = false
var in_dialog = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

###### FUNDAMENTAL MECHANICS ######
func jump(delta):
	if not bario_dead and not in_dialog:
		if not is_on_floor(): velocity.y += gravity * delta
		if Input.is_action_just_pressed("ui_up") and is_on_floor():
			velocity.y = JUMP_VELOCITY
func walk():
	if not pressed_attack and not bario_dead and not in_dialog:
		var direction = Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			animation.play("idle"+dir)
			velocity.x = move_toward(velocity.x, 0, SPEED)
func attack(body):
	if body.name == "zombie" and not in_dialog:
		if Input.is_action_just_pressed("attack") and barioCanAttack:
			if body.has_meta("health"):
				body.health -= 1
			

func death():
	if not bario_dead:
		if health <= 0 or position.y > 300:
			bario_dead = true
			death_timer.start()
			await death_timer.timeout
		
func update_animation():
	if bario_dead:
		print("bairo dead")
		animation.play("death")
	elif in_dialog:
		animation.play("idleRight")
	else:
		if Input.is_action_just_pressed("attack") and not pressed_attack:
			attack_timer.start()
			pressed_attack = true
			animation.play("atk"+dir)
			await attack_timer.timeout
			pressed_attack = false
		else:
			if velocity.length() == 0 and not pressed_attack: 
				animation.play("idle"+dir)
			
			elif velocity and !pressed_attack:
				if velocity.x > 0: dir = "Right"
				elif velocity.x < 0: dir = "Left"
				animation.play("walk" + dir)
func pick_chromosome():
	chromosomes += 1
		
func _physics_process(delta):
	if not in_dialog:
		death()
		walk()
		jump(delta)
		move_and_slide()
	update_animation()



func _on_hitbox_body_entered(body):
	enemy_can_attack = true
	barioCanAttack = true
	damage_timer.start()

func _on_hitbox_body_exited(body):
	enemy_can_attack = false
	barioCanAttack = false


func _on_damage_timer_timeout():
	if enemy_can_attack and not bario_dead:
		print("damage taken")
		health -= 1

func _on_damage_cooldown_timeout():
	enemy_can_attack = true
	


func _on_death_timer_timeout():
	self.queue_free()
	get_tree().reload_current_scene()
