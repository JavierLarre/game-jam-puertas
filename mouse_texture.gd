extends Control

func save_texture(texture: Texture):
	$TextureRect.texture = texture
	$TextureRect.visible = true
	$DefaultTexture.visible = false
	
func pop_texture() -> Texture:
	$DefaultTexture.visible = true
	$TextureRect.visible = false
	return $TextureRect.texture

func _input(event: InputEvent) -> void:
	if event is InputEventMouse:
		position = event.position
