extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("on_hit") and body.name == "CharacterBody2D":
		body.on_hit()
