extends Node
@onready var music: CheckButton = $Music
var currently_selected_id = 'a'
@onready var char_slot: Panel = $Panel/CharSlot
@onready var char_slot_2: Panel = $Panel/CharSlot2
@onready var char_slot_3: Panel = $Panel/CharSlot3
@onready var char_slot_4: Panel = $Panel/CharSlot4

func _ready() -> void:
	music.button_pressed = MenuManager.music_on
	HealthPanal.hide()
	currently_selected_id = GlobalState.selected_character_id
	if GlobalState.selected_character_id == 'a':
		char_slot.show_selected()
	if GlobalState.selected_character_id == 'b':
		char_slot_2.show_selected()
	if GlobalState.selected_character_id == 'c':
		char_slot_3.show_selected()
	if GlobalState.selected_character_id == 'd':
		char_slot_4.show_selected()

func _on_music_toggled(toggled_on: bool) -> void:
	if toggled_on:
		MenuManager.cont_main_sound()
	elif not toggled_on:
		MenuManager.pause_main_sound()


func _on_exit_pressed() -> void:
	GlobalState.selected_character_id = currently_selected_id
	get_tree().change_scene_to_file("res://scenes/main_manu.tscn")


func _on_char_slot_pressed() -> void:
	currently_selected_id = 'a'


func _on_char_slot_2_pressed() -> void:
	currently_selected_id = 'b'


func _on_char_slot_3_pressed() -> void:
	currently_selected_id = 'c'


func _on_char_slot_4_pressed() -> void:
	currently_selected_id = 'd'
