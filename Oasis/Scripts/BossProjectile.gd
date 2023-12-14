extends Area2D

var speed = 100
@onready var _animated_sprite = $Sprite2D
#Determines the projectile's orientation when spawned in. Also plays its animation. 
func _process(delta):
	position += transform.y * speed * delta
	_animated_sprite.play("run")
	

#Resets scene if player is hit by a projectile
func _on_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().reload_current_scene()
