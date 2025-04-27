extends Label
class_name MouseText

const offset = Vector2(-45, -15)

func _ready() -> void:
	visible = false
	text = "waos"
	size = Vector2(10,10)

func _input(event: InputEvent) -> void:
	if (event is InputEventMouse):
		position = event.position + offset
