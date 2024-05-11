extends Node2D 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
@onready var bario = $bario
@onready var dialog = $hud/Dialog
@onready var useless_timer = $grass_platform/uselesness/useless_timer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_end_stage_body_entered(body):
	if body.name == "bario":
		if bario.chromosomes == 83:
			bario.update_max_health()
		pass #get_tree().change_scene_to_file("res://scenes/levels/boss_1.tscn")


func _on_uselesness_body_entered(body):
	dialog.panel_visible(true)
	dialog.set_label("Useless Platform:\nEverybody calls me useless for the way I created...\nYou won't call me that way will you :((((")
	useless_timer.start()
	await useless_timer.timeout
	dialog.panel_visible(false)
