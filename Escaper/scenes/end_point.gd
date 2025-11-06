extends Area2D

@export var level_target : PackedScene
@onready var game_manager: Node = %GameManager

var play = true

func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		if play:
			game_manager.play_end_sound()
			play = false
		await get_tree().create_timer(6).timeout
		get_tree().change_scene_to_packed(level_target)
		play = true
