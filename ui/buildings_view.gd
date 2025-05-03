extends Node

@onready var building_animation: AnimationPlayer = $Hotel/BuildingAnimation
@onready var explosion: AudioStreamPlayer = $Explosion

var minion := load("res://assets/minion.png")
var hotel := load("res://assets/hotel.png")
var bathroom := load("res://assets/bathroom.png")

var rng := RandomNumberGenerator.new()

signal building_stopped_moving

func _ready() -> void:
	$Hotel/BuildingAnimation.animation_finished.connect(emit_building_signal)

func bring_building() -> void:
	var random_number = rng.randi_range(1, 3)
	match random_number:
		1:
			$Hotel.texture = minion
		2:
			$Hotel.texture = hotel
		3:
			$Hotel.texture = bathroom
	building_animation.play("Arriving")

func send_building() -> void:
	building_animation.play("Leaving")

func emit_building_signal(_animation_name) -> void:
	building_stopped_moving.emit()
	explosion.play()
