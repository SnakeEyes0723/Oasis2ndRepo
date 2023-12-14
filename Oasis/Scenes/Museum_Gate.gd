extends StaticBody2D


func _ready():
	if global.museumClosed == true:
		self.set_process_mode(PROCESS_MODE_INHERIT)
		self.visible = true
	else:
		self.set_process_mode(PROCESS_MODE_DISABLED)
		self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
