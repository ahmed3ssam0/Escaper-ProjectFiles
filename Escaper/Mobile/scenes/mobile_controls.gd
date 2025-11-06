extends CanvasLayer
@onready var left: TouchScreenButton = $Left
@onready var right: TouchScreenButton = $Right
@onready var jump: TouchScreenButton = $Jump
@onready var menu: TouchScreenButton = $Menu
@onready var mobile_controls: CanvasLayer = $"."


func _ready():
	var platform_name = OS.get_name()
	if not platform_name == "Android":
		visible = false
		return

	_update_layout()

func _notification(what):
	if what == NOTIFICATION_WM_SIZE_CHANGED:
		_update_layout()

func _update_layout():
	var screen = get_viewport().get_visible_rect().size
	var btn_size = screen.x * 0.12  # Scale buttons by screen width
	var margin = screen.x * 0.03

	# Resize buttons
	for btn in [left, right, jump, menu]:
		btn.custom_minimum_size = Vector2(btn_size, btn_size)

	var landscape = screen.x > screen.y

	if landscape:
		left.position = Vector2(margin, screen.y - btn_size - margin)
		right.position = Vector2(btn_size + 2 * margin, screen.y - btn_size - margin)
		jump.position = Vector2(screen.x - btn_size - margin, screen.y - btn_size - margin)
		menu.position = Vector2(screen.x - btn_size - margin, margin)
	else:
		left.position = Vector2(margin, screen.y - btn_size * 1.5 - margin)
		right.position = Vector2(btn_size + 2 * margin, screen.y - btn_size * 1.5 - margin)
		jump.position = Vector2(screen.x - btn_size - margin, screen.y - btn_size * 1.5 - margin)
		menu.position = Vector2(screen.x - btn_size - margin, margin)
