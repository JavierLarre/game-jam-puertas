extends Node

enum SoundType
{
	CAT,
	SQUEAK
}

var group_id := 0
var dialogue_id := 0
var current_dialogue_group: Array
var is_playing_dialogue := false

	
func update_group():
	if group_id >= dialogue_groups.size():
		current_dialogue_group = dialogue_groups[dialogue_groups.size() - 1]
	else:
		current_dialogue_group = dialogue_groups[group_id]
	group_id += 1
	dialogue_id = 0

func play_next_dialogue():
	if not is_playing_dialogue:
		is_playing_dialogue = true
		update_group()
		play_dialogue()


func play_dialogue():
	if dialogue_id >= current_dialogue_group.size():
		hide_characters()
		$Dialog.visible = false
		is_playing_dialogue = false
	if not is_playing_dialogue:
		return
	var dialogue = current_dialogue_group[dialogue_id]
	dialogue_id += 1
	var character_name = dialogue[0]
	show_character(character_name)
	var dialogue_text = dialogue[1]
	var sound_type = dialogue[2]
	$Dialog.visible = true
	$Dialog.show_text(character_name, dialogue_text, sound_type)
	
func hide_characters():
	$Catpintero.visible = false
	$Hotel.visible = false
	
func show_character(character_name: String):
	if character_name == "Catpintero":
		$Catpintero.visible = true
	else:
		$Hotel.visible = true
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			play_dialogue()

var dialogue_groups := [
	[
		["Catpintero", "Dale click al botón para empezar", SoundType.CAT],
	],
	[
		["Hotel", "Hola! Me gustaría una puerta bonita", SoundType.SQUEAK],
		["Catpintero", "De inmediato!", SoundType.CAT],
	],
	[
		["Hotel", "dame una puerta :c", SoundType.SQUEAK],
		["Catpintero", "Muchas gracias!", SoundType.CAT],
	],
	[
		["Hotel", "Me voy a morir si no me das una puerta ahora mismo.", SoundType.SQUEAK],
		["Catpintero", "", SoundType.CAT]
	]
]
