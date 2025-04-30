extends CanvasLayer

@onready var menu: CanvasLayer = $Menu


func _ready() -> void:
	$Menu/Button.pressed.connect(remove_menu)
	
func remove_menu() -> void:
	remove_child($Menu)
