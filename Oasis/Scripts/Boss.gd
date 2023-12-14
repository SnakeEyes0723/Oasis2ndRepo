extends Area2D

@onready var _animated_sprite = $Sprite2D
@onready var projectile = preload("res://Scenes/BossProjectile.tscn")
var gateScene = preload("res://Scenes/Main_Hub.tscn").instantiate()
var gate = gateScene.get_node("StaticBody2D5")
var health = 6
var time = 0
var interval = 2
# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer2D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	time += delta
	print(time)
	position.x -= 5
	await get_tree().create_timer(.8).timeout

	position.x += 5
	
	if time >= interval:
		var bossProjectile = projectile.instantiate()
		get_parent().add_child(bossProjectile)
		bossProjectile.global_position = $BossProjSpawn.global_position
		time = 0
	

#Decreases health when hit with a bullet. Despawns when health = 0 and adds to the global objective variable.
func _on_area_entered(area):
	if area.is_in_group("Bullet"):
		area.queue_free()
		health -= 1
		$AudioStreamPlayer2D2.play()
		if(health == 0):
			area.queue_free
			queue_free()
			#If global objectives becomes > 2, sends player to win screen. Otherwise, sends them to main hub. 
			if global.objectives < 2:
				global.objectives += 1
				get_tree().change_scene_to_file("res://Scenes/Main_Hub.tscn")
				gate.set_process_mode(PROCESS_MODE_INHERIT)
				gate.visible = true
			else:
				get_tree().change_scene_to_file("res://Scenes/WinScreen.tscn")
				global.theaterClosed = false
				global.cavesClosed = false
				global.museumClosed = false
				global.objectives = 0
				global.sceneNum = 0
#Runs animation 
func _process(delta):
	_animated_sprite.play("run")

#Resets scene if player collides with boss
func _on_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().reload_current_scene()
