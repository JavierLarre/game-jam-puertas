extends CanvasLayer

@onready var vbox = $Puertas
@onready var mouse_text = $MouseText

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
	return button
	
func button_pressed() -> void:
	mouse_text.visible = not mouse_text.visible

func play_hotel_animation() -> void:
	var hotelAnimation = $BuildingsView/Hotel/BuildingAnimation
	hotelAnimation.play("Arriving")
	
func play_leave_hotel_animation() -> void:
	var hotelAnimation = $BuildingsView/Hotel/BuildingAnimation
	hotelAnimation.play("Leaving")
