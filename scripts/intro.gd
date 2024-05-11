extends Node2D
@onready var bario = $bario
@onready var label = $Label
@onready var muscle_man = $muscle_man
@onready var dialogue_cam = $dialogue
@onready var camera_2d = $Camera2D
@onready var panel = $CanvasLayer/Control/Panel
@onready var dialogue_timer = $CanvasLayer/Control/Panel/dialogue_timer
@onready var cutscene = $CanvasLayer/Control/Panel/Label/AnimationPlayer
@onready var musc_anim = $muscle_man/AnimatedSprite2D
@onready var run_timer = $muscle_man/run_timer
@onready var hit_and_run = $muscle_man/hit_and_run

# Called when the node enters the scene tree for the first time.
func _ready():
	#bario_epic_fall.stop()
	panel.visible = false

func dialogue():
	var bario_epic_fall = $bario/AnimationPlayer
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
	hit_and_run.play("run and hit")
	await run_timer.timeout
	cutscene.play("bario4")
	dialogue_timer.start()
	musc_anim.play("hot")
	await dialogue_timer.timeout
	bario_epic_fall.play("throwed")
	cutscene.play("aaa")
	run_timer.start(6)
	await run_timer.timeout
	get_tree().change_scene_to_file("res://scenes/levels/stage_1.tscn")
	return

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	label.text = ""
	if not bario.in_dialog:
		dialogue()
