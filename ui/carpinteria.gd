extends CanvasLayer

signal building_arrived
signal building_sent

func _ready() -> void:
	$BuildingButton.building_view = $BuildingsView
	$BuildingButton.z_index += 2
	$BuildingsView.building_stopped_moving.connect(emit_building_arrived)
	$BuildingButton.pressed.connect(emit_building_sent)
	
func emit_building_arrived() -> void:
	if $BuildingButton.is_building_here:
		building_arrived.emit()

func emit_building_sent() -> void:
	if not $BuildingButton.is_building_here:
		building_sent.emit()
