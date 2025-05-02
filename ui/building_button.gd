extends Button

var building_view
var is_building_here := false
var is_locked := false


func _ready() -> void:
	text = "Traer Hotel"

func _pressed() -> void:
	if not is_locked:
		is_locked = true
		if not is_building_here:
			is_building_here = true
			building_view.bring_building()
			await building_view.building_stopped_moving

			text = "Enviar Hotel"
		else:
			is_building_here = false
			building_view.send_building()
			await building_view.building_stopped_moving

			text = "Traer Hotel"
		is_locked = false
