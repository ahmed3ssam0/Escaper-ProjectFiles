extends Node

@onready var points_label: Label = %PointsLabel

var points = 0

func count_points():
	points += 1
	points_label.text = str(points)

func mute_music():
	$MainSound.volume_db = -1000
	
func mute_sfx():
	$CollectionsSound.volume_db = -1000
	$DoubleJumbSound.volume_db = -1000
	$EndSound.volume_db = -1000
	$HurtSound.volume_db = -1000
	$JumpSound.volume_db = -1000
	$LoseSound.volume_db = -1000
	
func unmute_music():
	$MainSound.volume_db = -7
	
func unmute_sfx():
	$CollectionsSound.volume_db = 0
	$DoubleJumbSound.volume_db = 0
	$EndSound.volume_db = 0
	$HurtSound.volume_db = 0
	$JumpSound.volume_db = 0
	$LoseSound.volume_db = 0

func play_collections_sound():
	$CollectionsSound.play()

func play_end_sound():
	$MainSound.stop()
	$EndSound.play()

func play_jump_sound():
	$JumpSound.play()
	
func play_double_jump_sound():
	$DoubleJumbSound.play()
	
func play_hurt_sound():
	$HurtSound.play()

func play_lose_sound():
	$MainSound.stop()
	$LoseSound.play()
