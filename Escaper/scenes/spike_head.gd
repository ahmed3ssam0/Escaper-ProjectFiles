extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export var stomp_threshold: float = 100.0  # how "downward" the player must be moving

func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		if body.velocity.y > stomp_threshold:  
			die()
			body.bounce()
		else:
			body.on_hit()



func die():
	animated_sprite_2d.play("hit")
	await get_tree().create_timer(0.5).timeout
	queue_free()
