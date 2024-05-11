extends Node2D 
@onready var dialog = $CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	dialog.show_panel(false)
	pass # Replace with function body.
@onready var bario = $bario


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_end_stage_body_entered(body):
	if bario.chromosomes == 83:
		bario.update_max_health()
	pass #get_tree().change_scene_to_file("res://scenes/levels/boss_1.tscn")


func _on_useless_body_entered(body):
	dialog.show_panel(true)
	dialog.label_set("Useless Platform:\nEverybody just steps on me and calls me useless... You won't call me that way don't you?")
