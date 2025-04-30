extends Control

func _ready() -> void:
	$Button.pressed.connect(place_texture)
	$Control.gui_input.connect(handle_mouse_input)
	
func place_texture() -> void:
	$MouseTexture.save_texture(CanvasTexture.new())

func handle_mouse_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			var texture = $MouseTexture.pop_texture()
			var text_rect = TextureRect.new()
			add_child(text_rect)
			text_rect.texture = texture
			text_rect.position = event.global_position
			text_rect.size = Vector2(15, 15)
