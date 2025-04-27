extends CanvasLayer

@onready var vbox = $ColorRect/Puertas
@onready var mouse_text = $MouseText

func _ready() -> void:
	for i in range(3):
		var button = create_button()
		vbox.add_child(button)
	
func button_pressed() -> void:
	mouse_text.visible = not mouse_text.visible

func create_button() -> Button:
	var button = Button.new()
	button.text = "omg hazme click"
	button.pressed.connect(button_pressed)
	return button
