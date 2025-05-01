extends Button

var building_view
var is_building_here := false

func _ready() -> void:
	text = "Traer Hotel"

func _pressed() -> void:
	print("waos")
	building_view.building_stopped_moving.connect(change_text)
	if is_building_here:
		building_view.send_building()
	else:
		building_view.bring_building()
		is_building_here = true
		
func change_text():
	text = "Enviar hotel"
