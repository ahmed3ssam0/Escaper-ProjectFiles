extends Panel

var health = 3
@onready var health_label: Label = $HealthLabel


func decrease() -> bool:
	if health > 1:
		health -= 1
		health_label.text = "x" + str(health)
		return true
	else:
		health -= 1
		health_label.text = "x" + str(health)
		return false


func increase():
	health += 1
	health_label.text = "x" + str(health)


func reset():
	health = 3
	health_label.text = "x" + str(health)
