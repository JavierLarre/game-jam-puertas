extends Control

@onready var building_animation: AnimationPlayer = $Hotel/BuildingAnimation

signal building_stopped_moving

func _ready() -> void:
	$Hotel/BuildingAnimation.animation_finished.connect(emit_building_signal)

func bring_building() -> void:
	building_animation.play("Arriving")

func send_building() -> void:
	building_animation.play("Leaving")

func emit_building_signal(animation_name) -> void:
	building_stopped_moving.emit()
