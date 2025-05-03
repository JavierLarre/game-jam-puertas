extends Node2D

const CATPINTERO = preload("res://catpintero.tres")

func _ready() -> void:
	var children := get_children()
	for child in children:
		child.material = CATPINTERO
