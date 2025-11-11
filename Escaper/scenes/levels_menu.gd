extends Node

func _ready() -> void:
	HealthPanal.hide()


func _on_level_1_pressed() -> void:
	if get_tree().paused:
		get_tree().paused = false
	MenuManager.pause_main_sound()
	get_tree().change_scene_to_file("res://scenes/level1.tscn")


func _on_level_2_pressed() -> void:
	if get_tree().paused:
		get_tree().paused = false
	MenuManager.pause_main_sound()
	get_tree().change_scene_to_file("res://scenes/level2.tscn")

func _on_level_3_pressed() -> void:
	if get_tree().paused:
		get_tree().paused = false
	MenuManager.pause_main_sound()
	get_tree().change_scene_to_file("res://scenes/level3.tscn")
	
func _on_level_4_pressed() -> void:
	if get_tree().paused:
		get_tree().paused = false
	MenuManager.pause_main_sound()
	get_tree().change_scene_to_file("res://scenes/level4.tscn")

func _on_level_5_pressed() -> void:
	if get_tree().paused:
		get_tree().paused = false
	MenuManager.pause_main_sound()
	get_tree().change_scene_to_file("res://scenes/level5.tscn")

func _on_level_6_pressed() -> void:
	if get_tree().paused:
		get_tree().paused = false
	MenuManager.pause_main_sound()
	get_tree().change_scene_to_file("res://scenes/level6.tscn")

func _on_level_7_pressed() -> void:
	if get_tree().paused:
		get_tree().paused = false
	MenuManager.pause_main_sound()
	get_tree().change_scene_to_file("res://scenes/level7.tscn")

func _on_level_8_pressed() -> void:
	if get_tree().paused:
		get_tree().paused = false
	MenuManager.pause_main_sound()
	get_tree().change_scene_to_file("res://scenes/level8.tscn")

func _on_level_9_pressed() -> void:
	if get_tree().paused:
		get_tree().paused = false
	MenuManager.pause_main_sound()
	get_tree().change_scene_to_file("res://scenes/level9.tscn")

func _on_level_10_pressed() -> void:
	if get_tree().paused:
		get_tree().paused = false
	MenuManager.pause_main_sound()
	get_tree().change_scene_to_file("res://scenes/level10.tscn")

func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_manu.tscn")
