extends Control

@onready var panel = $Panel
@onready var label = $Panel/Label

func panel_visible(boolean):
	panel.visible = boolean
func set_label(lbl):
	label.text = lbl
# Called when the node enters the scene tree for the first time.
func _ready():
	panel_visible(false)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
