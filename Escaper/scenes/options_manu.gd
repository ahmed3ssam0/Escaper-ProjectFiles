extends Node

@onready var game_manager: Node = %GameManager


func _on_music_toggled(toggled_on: bool) -> void:
	if toggled_on:
		game_manager.unmute_music()
	elif not toggled_on:
		game_manager.mute_music()


func _on_sfx_toggled(toggled_on: bool) -> void:
	if toggled_on:
		game_manager.unmute_sfx()
	elif not toggled_on:
		game_manager.mute_sfx()
