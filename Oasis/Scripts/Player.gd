extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var time = 0
var interval = 0.5
@onready var projectile = preload("res://Scenes/Projectile.tscn")


func _physics_process(delta):
	
	time += delta
	
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AudioStreamPlayer2D.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		if is_on_floor():
			print(global.objectives)
			$Sprite2D.play("run")
		else:
			$Sprite2D.play("jump")
		if direction < 0:
			$Sprite2D.flip_h = true
		else:
			$Sprite2D.flip_h = false
			
		velocity.x = direction * SPEED
	else:
		$Sprite2D.flip_h = false
		$Sprite2D.stop()
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	#Calls fire_projectile() when left click is pressed
	if Input.is_action_just_pressed("Fire") && time >= interval:
		fire_projectile()
		time = 0
	await get_tree().create_timer(5.0).timeout

# Fires projectile when left click is pressed
func fire_projectile():
	var playerProjectile = projectile.instantiate()
	get_parent().add_child(playerProjectile)
	playerProjectile.global_position = $ProjSpawn.global_position
	playerProjectile.add_to_group("Bullet")
	$AudioStreamPlayer2D2.play()
	

	



