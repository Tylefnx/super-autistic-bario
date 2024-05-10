extends Area2D

@onready var chromosome = $Area2D

func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.name == "bario":
		self.queue_free()
		if body.has_method("pick_chromosome"):
			body.pick_chromosome()
	
