extends Area2D

#Changing scene to mining caves when player enters area
func _on_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Scenes/Mining_Caves.tscn")
		global.sceneNum = 2
