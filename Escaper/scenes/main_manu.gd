extends Node

func _ready() -> void:
	MenuManager.play_main_sound()
	HealthPanal.hide()

func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels_menu.tscn")


func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/options_manu.tscn")
