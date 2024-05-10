extends Node2D
@onready var bario = $bario
@onready var label = $Label
@onready var muscle_man = $muscle_man


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	label.text = 
