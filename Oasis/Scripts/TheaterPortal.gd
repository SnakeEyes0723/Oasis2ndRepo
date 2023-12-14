extends Area2D


var gateScene = preload("res://Scenes/Main_Hub.tscn").instantiate()

var gate = gateScene.get_node("StaticBody2D5")


#Sends player to a boss depending on what scene they are in. 
func _on_body_entered(body):
	if global.sceneNum == 1:
		get_tree().change_scene_to_file("res://Scenes/Theater_Boss.tscn")
		global.theaterClosed = true
	if global.sceneNum == 2:
		get_tree().change_scene_to_file("res://Scenes/Cave_Boss.tscn")
		global.cavesClosed = true
	if global.sceneNum == 3:
		get_tree().change_scene_to_file("res://Scenes/Museum_Boss.tscn")
		global.museumClosed = true
		
