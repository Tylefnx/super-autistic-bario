extends CanvasLayer

@onready var label = $Control/Panel/Label
@onready var animation = $Control/Panel/AnimationPlayer
@onready var timer = $Control/Panel/Timer
@onready var button = $Control2/Button

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start()
	animation.play("title_drop")
	await timer.timeout
	animation.play("menu_title")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/intro.tscn")
