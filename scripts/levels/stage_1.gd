extends Node2D 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
@onready var bario = $bario


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_end_stage_body_entered(body):
	if bario.chromosomes == 83:
		bario.update_max_health()
	pass #get_tree().change_scene_to_file("res://scenes/levels/boss_1.tscn")
