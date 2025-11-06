extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	animated_sprite_2d.visible = false

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("on_hit") and body.name == "CharacterBody2D":
		animated_sprite_2d.visible = true
		body.on_hit()
