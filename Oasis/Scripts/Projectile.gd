extends Area2D

var speed = 1000
var direction = Input.get_axis("ui_left", "ui_right")
var facingRight = true
# Called when the node enters the scene tree for the first time.
#Projectile physics
func _process(delta):
	if direction > 0:
		$Sprite2D.flip_h = false
		position += transform.x * direction * speed * delta
		facingRight = true
	if direction < 0:
		$Sprite2D.flip_h = true
		position += transform.x * direction * speed * delta
		facingRight = false
	if direction == 0:
		if facingRight == true:
			position += transform.x * speed * delta
		else:
			position -= transform.x * speed * delta
		
