extends Node


func _on_music_toggled(toggled_on: bool) -> void:
	if toggled_on:
		MenuManager.play_main_sound()
	elif not toggled_on:
		MenuManager.pause_main_sound()



func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_manu.tscn")
