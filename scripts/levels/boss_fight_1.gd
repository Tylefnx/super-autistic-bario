extends Node2D
@onready var control = $hud/Control
@onready var dialogue_timer = $hud/Control/dialogue_timer
@onready var dialogue_line_timer = $hud/Control/dialogue_line_timer


# Called when the node enters the scene tree for the first time.
func _ready():
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
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
