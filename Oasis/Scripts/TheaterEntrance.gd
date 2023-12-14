extends Area2D

#Changes scene to theater when player enters collision
func _on_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Scenes/Theater.tscn")
		global.sceneNum = 1
