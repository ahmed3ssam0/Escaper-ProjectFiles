extends Node

var music_on:bool = true

func play_main_sound():
	if not $MainSound.playing:
		$MainSound.play()

func pause_main_sound():
	if $MainSound.playing:
		$MainSound.volume_db = -1000
		music_on = false

func cont_main_sound():
	$MainSound.volume_db = 0
	music_on = true
