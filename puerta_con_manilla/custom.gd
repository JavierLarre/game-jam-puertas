extends CanvasLayer

@onready var manilla1 = $Manilla1
@onready var manilla2 = $Manilla2

func _ready() -> void:
	manilla1.visible = false
	manilla2.visible = false
	create_buttons()

func create_buttons() -> void:
	var btn1 = Button.new()
	btn1.text = "Manilla 1"
	btn1.position = Vector2(100, 300)
	btn1.custom_minimum_size = Vector2(200, 60)
	btn1.pressed.connect(show_manilla.bind(1))
	add_child(btn1)

	var btn2 = Button.new()
	btn2.text = "Manilla 2"
	btn2.position = Vector2(100, 400)
	btn2.custom_minimum_size = Vector2(200, 60)
	btn2.pressed.connect(show_manilla.bind(2))
	add_child(btn2)
	
	var btn3 = Button.new()
	btn3.text = "Quitar manillas"
	btn3.position = Vector2(100, 500)
	btn3.custom_minimum_size = Vector2(200, 60)
	btn3.pressed.connect(show_manilla.bind(3))
	add_child(btn3)

func show_manilla(option: int) -> void:
	if option == 1:
		manilla1.visible = true
		manilla2.visible = false
	elif option == 2:
		manilla1.visible = false
		manilla2.visible = true
	elif option == 3:
		manilla1.visible = false
		manilla2.visible = false
