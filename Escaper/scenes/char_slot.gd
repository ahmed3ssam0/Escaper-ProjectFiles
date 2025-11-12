extends Panel

@export var champion_id: String = ""

var icon = null:
	set(value):
		icon = value
		$TextureButton.texture_normal = value
 
signal pressed
 
func _ready():
	$Select.hide()
 
func show_selected():
	$Select.show()
 
func _on_texture_button_pressed():
	for slot in get_parent().get_children():
		slot.deselect()
	$Select.show()
	pressed.emit()
 
func deselect():
	$Select.hide()
