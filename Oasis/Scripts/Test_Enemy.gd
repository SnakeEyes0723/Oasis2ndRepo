extends Area2D

@onready var _animated_sprite = $Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.x -= 5
	await get_tree().create_timer(.8).timeout

	position.x += 5

#Despawns enemy when colliding with a bullet
func _on_area_entered(area):
	if area.is_in_group("Bullet"):
		area.queue_free()
		queue_free()
		
#Runs animation 
func _process(delta):
	_animated_sprite.play("run")

#Resets scene if player collides with enemy
func _on_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().reload_current_scene()
