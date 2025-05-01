extends CanvasLayer

signal building_arrived
signal building_sent

func _ready() -> void:
	$BuildingButton.building_view = $BuildingsView
	$BuildingButton.z_index += 2
	$BuildingsView.building_stopped_moving.connect(emit_building_signal)
	
func emit_building_signal() -> void:
	if $BuildingButton.is_building_here:
		building_arrived.emit()
	else:
		building_sent.emit()
