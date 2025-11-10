extends Node


func play_main_sound():
	if not $MainSound.playing:
		$MainSound.play()

func pause_main_sound():
	if $MainSound.playing:
		$MainSound.stop()
