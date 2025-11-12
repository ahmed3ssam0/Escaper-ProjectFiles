extends CharacterBody2D

@onready var canvas_layer_2: CanvasLayer = %CanvasLayer2
@onready var sprite_2d: AnimatedSprite2D
@onready var game_manager: Node = %GameManager

const SPEED = 300.0
const JUMP_VELOCITY = -650.0
const INVINCIBILITY_TIME = 1.0
var allow_double_jump = false
var is_double_jump = false
var facing_left = false
var is_hit = false
var is_invincible = false
var spawn_position: Vector2
var is_spawning = true

func on_hit() -> void:
	if is_invincible or is_hit:
		return

	is_hit = true
	is_invincible = true

	# Respawn immediately
	global_position = spawn_position
	velocity = Vector2.ZERO

	# Play the hit animation
	sprite_2d.animation = "hit"
	sprite_2d.play()
	
	if HealthPanal.get_node("Panel").decrease():
		game_manager.play_hurt_sound()
	else:
		sprite_2d.hide()
		game_manager.play_lose_sound()
		get_tree().paused = true
		canvas_layer_2.show()
	
	# Invincibility window
	await get_tree().create_timer(INVINCIBILITY_TIME).timeout
	is_invincible = false
	

func disable_double_jump():
	allow_double_jump = false

func able_double_jump():
	allow_double_jump = true

func bounce():
	velocity.y = JUMP_VELOCITY + 100
	game_manager.play_jump_sound()

func tramp_effect() -> void:
	velocity.y = JUMP_VELOCITY - 550
	#velocity.x = SPEED + 540
	game_manager.play_double_jump_sound()

func _ready() -> void:
	sprite_2d = get_node("Sprite2D_" + GlobalState.selected_character_id)
	sprite_2d.show()
	HealthPanal.show()
	sprite_2d.animation = "appearing"
	spawn_position = global_position

func _physics_process(delta: float) -> void:
	
	if is_hit or is_spawning:
		return
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		game_manager.play_jump_sound()
		velocity.y = JUMP_VELOCITY
		allow_double_jump = true
		is_double_jump = false
		
	if Input.is_action_just_pressed("jump") and not is_on_floor() and allow_double_jump:
		game_manager.play_double_jump_sound()
		velocity.y = JUMP_VELOCITY - 80
		allow_double_jump = false
		is_double_jump = true
	
	# Animation logic
	if is_on_floor():
		is_double_jump = false
		if abs(velocity.x) > 1:
			sprite_2d.animation = "run"
		else:
			sprite_2d.animation = "default"
	else:
		if is_double_jump:
			sprite_2d.animation = "double_jump"
		elif velocity.y < 0:
			sprite_2d.animation = "jump"
		else:
			sprite_2d.animation = "fall"

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 14)

	move_and_slide()
	
	if velocity.x < 0:
		facing_left = true
	elif velocity.x > 0:
		facing_left = false
	sprite_2d.flip_h = facing_left


func _on_sprite_2d_animation_finished() -> void:
	if sprite_2d.animation == "appearing":
		is_spawning = false
		sprite_2d.play("default")

	if sprite_2d.animation == "hit":
		is_hit = false
		sprite_2d.play("default")
		
