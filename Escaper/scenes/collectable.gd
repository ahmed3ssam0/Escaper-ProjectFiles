extends Area2D

@onready var game_manager: Node = %GameManager

func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		game_manager.count_points()
		game_manager.play_collections_sound()
		queue_free()
