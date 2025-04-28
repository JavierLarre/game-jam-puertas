extends CanvasLayer

@onready var vbox = $Puertas
@onready var mouse_text = $MouseText
var has_hotel_left = false

func _ready() -> void:
	mouse_text.z_index += 1
	create_buttons()
	play_hotel_animation()
	$DoneButton.pressed.connect(play_leave_hotel_animation)
	
func create_buttons() -> void:
	for i in range(3):
		var button = create_button()
		vbox.add_child(button)

func create_button() -> Button:
	var button = Button.new()
	button.text = "omg hazme click"
	button.pressed.connect(button_pressed)
	button.tooltip_text = "estas a punto de escoger una poerta"
	return button
	
func button_pressed() -> void:
	mouse_text.visible = not mouse_text.visible

func play_hotel_animation() -> void:
	var hotelAnimation = $BuildingsView/Hotel/BuildingAnimation
	hotelAnimation.play("Arriving")
	
func play_leave_hotel_animation() -> void:
	if (has_hotel_left):
		return
	has_hotel_left = true
	var hotelAnimation = $BuildingsView/Hotel/BuildingAnimation
	hotelAnimation.play("Leaving")
