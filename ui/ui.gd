extends CanvasLayer

@onready var menu: CanvasLayer = $Menu


func _ready() -> void:
	$Menu/Button.pressed.connect(remove_menu)
	$Carpinteria.building_arrived.connect(show_puerta)
	$Carpinteria.building_sent.connect(hide_puerta)
	
func remove_menu() -> void:
	remove_child($Menu)
	$Dialogues.play_next_dialogue()

func show_puerta():
	$Dialogues.play_next_dialogue()
	$DecorarPuerta.visible = true

func hide_puerta():
	$DecorarPuerta.visible = false
