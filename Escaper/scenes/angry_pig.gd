extends CharacterBody2D

@export var speed := 150
@export var health := 5
@onready var top_hit_area = $TopHitArea
@onready var body_area = $BodyArea
@onready var detect_area = $DetectArea
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var game_manager: Node = %GameManager
@onready var end_point: Area2D = $"../SceneObjects/EndPoint"
@onready var end_col: CollisionShape2D = end_point.get_child(1)

var player: Node = null
var is_chasing = false
var is_hit = false
var speed_up = 0

func _ready() -> void:
	end_col.disabled = true

func _physics_process(delta: float) -> void:
	if is_chasing and player:
		chase_player(delta)


func _on_detect_area_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		animated_sprite_2d.play("angry")
		player = body
		is_chasing = true


func _on_detect_area_body_exited(body: Node2D) -> void:
	if is_hit:
		return
	if body == player:
		player = null
		is_chasing = false
		velocity.x = 0
		animated_sprite_2d.play("default")


func _on_top_hit_area_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		if is_hit:
			return
		
		is_hit = true
		is_chasing = false
		velocity.x = 0
		take_damage(1)
		body.bounce()
		for i in range(3):
			if health <= 0:
				return
			animated_sprite_2d.play("hit")
			await animated_sprite_2d.animation_finished
		
		is_hit = false
		
		if player and is_instance_valid(player) and detect_area.overlaps_body(player):
			is_chasing = true
			animated_sprite_2d.play("angry")
		else:
			player = null
			is_chasing = false
			animated_sprite_2d.play("default")


func _on_body_area_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		body.on_hit()


func chase_player(delta):
	var dir = sign(player.global_position.x - global_position.x)
	velocity.x = dir * (speed + speed_up)
	move_and_slide()
	animated_sprite_2d.flip_h = dir > 0

func take_damage(amount):
	speed_up += 40
	health -= amount
	game_manager.count_points()
	print("Boss Health:", health)
	if health <= 0:
		die()

func die():
	animated_sprite_2d.play("death")
	await get_tree().create_timer(0.6).timeout
	queue_free()
	end_point.visible = true
	end_col.disabled = false
	await get_tree().create_timer(6).timeout
