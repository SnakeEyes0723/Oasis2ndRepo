extends Button


#Chaging the scene to the title scene when button is pressed
func _on_button_down():
	get_tree().change_scene_to_file("res://Scenes/Title_Scene.tscn")
