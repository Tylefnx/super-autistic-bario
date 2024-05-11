extends Node2D
@onready var control = $hud/Control
@onready var dialogue_timer = $hud/Control/dialogue_timer
@onready var dialogue_line_timer = $hud/Control/dialogue_line_timer
@onready var muscle_man = $muscle_man
@onready var label = $bario/Label
@onready var bario = $bario
@onready var victry = $hud/Control/Label
@onready var victory_cutscene = $hud/Control/Label/AnimationPlayer
@onready var timer = $hud/Control/Label/Timer
@onready var victr = $hud/Control/Label


# Called when the node enters the scene tree for the first time.
func _ready():
	victry.visible = false
	bario.in_dialog = true
	label.visible = false
	control.panel_visible(true)
	control.set_label("Bario:\nI... NEED... THE HOLY CHROMOSOME !!!!")
	dialogue_timer.start()
	dialogue_line_timer.start()
	await dialogue_line_timer.timeout
	control.set_label("Muscle Man:\nHOW ARE YOU STILL ALIVE?\nAnyway I'll fucking destroy you !!!!")	
	dialogue_line_timer.start()
	await dialogue_line_timer.timeout
	await dialogue_timer.timeout
	control.panel_visible(false)
	muscle_man.transformation.start()
	muscle_man.animation.play("transformation")
	bario.in_dialog = false
	dialogue_timer.start()
	await dialogue_timer.timeout
	victory()
	
func victory():
	dialogue_line_timer.start()
	control.panel_visible(true)
	control.set_label("Bario:\nLOL WHAT A FUCKING RETARD AHAHAHAHH")
	await dialogue_line_timer.timeout
	control.set_label("")
	bario.no_animation = true
	dialogue_line_timer.start(9)
	victr.visible = true
	victory_cutscene.play("where")
	await dialogue_line_timer.timeout
	get_tree().change_scene_to_file("res://scenes/credits.tscn")
		
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
