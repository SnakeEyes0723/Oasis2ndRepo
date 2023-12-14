extends Node2D


@onready var path_follow: PathFollow2D = $Path2D/PathFollow2D

@onready var speed = 100

#Allows enemy to follow a set path
func _process(delta: float) -> void:
	path_follow.progress += speed * delta
	
