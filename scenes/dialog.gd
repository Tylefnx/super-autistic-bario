extends CanvasLayer

@onready var label = $Control/Panel/Label
@onready var panel = $Control/Panel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func label_set(text):
	label.text = text
func show_panel(boolean):
	panel.visible = boolean
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
