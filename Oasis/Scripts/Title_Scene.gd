extends Node2D



#Changes scene based on what button is pressed
func _on_start_button_button_down():
	get_tree().change_scene_to_file("res://Scenes/Main_Hub.tscn")


func _on_credits_button_button_down():
	get_tree().change_scene_to_file("res://Scenes/Credits.tscn")


func _on_instructions_button_button_down():
	get_tree().change_scene_to_file("res://Scenes/Instructions.tscn")
