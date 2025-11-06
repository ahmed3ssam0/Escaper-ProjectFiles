extends Control

@onready var panel_2: Panel = $"../../UI/Panel2"
@onready var canvas_layer: CanvasLayer = %CanvasLayer
@onready var canvas_layer_2: CanvasLayer = %CanvasLayer2
@onready var game_manager: Node = %GameManager

var is_layer_visible = false

func resume():
	get_tree().paused = false

func pasue():
	get_tree().paused = true
	

func escTec():
	if Input.is_action_just_pressed("esc") and get_tree().paused and not is_layer_visible:
		resume()
		canvas_layer.hide()
		
	elif Input.is_action_just_pressed("esc") and not get_tree().paused and not is_layer_visible:
		pasue()
		canvas_layer.show()
		$AudioStreamPlayer2D.play()

func _on_resume_pressed() -> void:
	resume()
	canvas_layer.hide()


func _on_restart_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_manu.tscn")


func _process(_delta: float) -> void:
	escTec()
	if canvas_layer_2.visible:
		is_layer_visible = true
	


func _on_music_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		game_manager.unmute_music()
	elif not toggled_on:
		game_manager.mute_music()


func _on_sfx_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		game_manager.unmute_sfx()
	elif not toggled_on:
		game_manager.mute_sfx()
