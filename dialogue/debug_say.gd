extends VBoxContainer

@onready var dialog = $".."

func _on_button_pressed() -> void:
	dialog.show_text("Test :3", $TextEdit.text, dialog.SoundType.CAT if $CheckBox.button_pressed else dialog.SoundType.SQUEAK)
