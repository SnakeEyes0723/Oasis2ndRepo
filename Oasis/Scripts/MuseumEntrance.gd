extends Area2D

#Changes scene to Museum when player enters area
func _on_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Scenes/Museum.tscn")
		global.sceneNum = 3
