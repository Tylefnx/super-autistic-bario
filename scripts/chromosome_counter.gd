extends NinePatchRect
@onready var label = $Label
@onready var bario = $"../../../../bario"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update_text():
	label.text = "Chromosomes: " + str(bario.chromosomes)+ "\n\nHealth: " + str(bario.health)
func update_chromosome():
	bario.chromosomes += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	update_text()
	pass


func _on_chromosome_body_entered(body):
	if body.name == "bario":
		update_chromosome()
