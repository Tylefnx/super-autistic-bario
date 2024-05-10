extends Node2D
@onready var bario = $bario
@onready var label = $Label
@onready var muscle_man = $muscle_man
@onready var dialogue_cam = $dialogue
@onready var camera_2d = $Camera2D
@onready var panel = $CanvasLayer/Panel
@onready var dialogue_timer = $CanvasLayer/Panel/dialogue_timer
@onready var cutscene = $CanvasLayer/Panel/Label/AnimationPlayer
@onready var musc_anim = $muscle_man/AnimatedSprite2D
@onready var run_timer = $muscle_man/run_timer

# Called when the node enters the scene tree for the first time.
func _ready():
	panel.visible = false

func dialogue():
	camera_2d.enabled = false
	dialogue_cam.enabled = true
	bario.in_dialog = true
	panel.visible = true
	dialogue_timer.start()
	cutscene.play("bario_1")
	await dialogue_timer.timeout
	dialogue_timer.start()
	cutscene.play("muscle_man1")
	await dialogue_timer.timeout
	dialogue_timer.start()
	cutscene.play("bario_2")
	await dialogue_timer.timeout
	dialogue_timer.start()
	cutscene.play("bario_2_1")
	await dialogue_timer.timeout
	dialogue_timer.start()
	cutscene.play("muscle_man2")
	await dialogue_timer.timeout
	dialogue_timer.start()
	cutscene.play("bario_3")
	await dialogue_timer.timeout
	dialogue_timer.start(1)
	cutscene.play("muscle_man3")
	musc_anim.play("transformation")
	await dialogue_timer.timeout
	run_timer.start()
	musc_anim.play("running")
	await run_timer.timeout
	dialogue_timer.start()
	cutscene.play("bario4")
	await dialogue_timer.timeout

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	label.text = ''	
	dialogue()


func _on_area_2d_body_exited(body):
	pass


func _on_area_2d_input_event(viewport, event, shape_idx):
	#if event == Input.is_action_just_pressed("interact"):
	print("Cutscene")


func _on_run_timer_timeout():
	musc_anim.stop()
