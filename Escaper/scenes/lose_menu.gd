extends Control


func _on_restart_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	HealthPanal.get_node("Panel").increase()


func _on_exit_pressed() -> void:
	HealthPanal.get_node("Panel").reset()
	get_tree().change_scene_to_file("res://scenes/main_manu.tscn")
