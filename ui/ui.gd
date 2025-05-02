extends CanvasLayer

@onready var menu: CanvasLayer = $Menu


func _ready() -> void:
	$Menu/Button.pressed.connect(remove_menu)
	$Carpinteria.building_arrived.connect(show_puerta)
	$Carpinteria.building_sent.connect(hide_puerta)
	
func remove_menu() -> void:
	remove_child($Menu)
	$Dialog.visible = true
	$Dialog.show_text("Catpintero", "Dale al boton para comenzar", $Dialog.SoundType.CAT)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if $Dialog.visible:
				$Dialog.visible = false

func show_puerta():
	$DecorarPuerta.visible = true

func hide_puerta():
	$DecorarPuerta.visible = false
