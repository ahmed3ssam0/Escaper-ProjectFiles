extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	animated_sprite_2d.visible = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		animated_sprite_2d.visible = true
		animated_sprite_2d.play("jump")
		body.tramp_effect()
		body.disable_double_jump()
