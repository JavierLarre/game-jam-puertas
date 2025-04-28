extends CanvasLayer

@export var name_label: RichTextLabel
@export var content_label: RichTextLabel
@export var meow_sound: AudioStreamPlayer
@export var squeak_sound: AudioStreamPlayer

enum SoundType
{
	CAT,
	SQUEAK
}

func show_text(speaker_name: String, content: String, sound_type: SoundType = SoundType.SQUEAK):
	name_label.text = speaker_name
	content_label.text = content

	var sound: AudioStreamPlayer
	if sound_type == SoundType.CAT:
		sound = meow_sound
	else:
		sound = squeak_sound

	var regex = RegEx.new()
	regex.compile("\\[.*?\\]")
	var typewriter_text_length = regex.sub(content, "", true).length()

	for i in range(typewriter_text_length):
		content_label.visible_characters = i + 1

		if i == typewriter_text_length - 1:
			sound.pitch_scale = 1
		else:
			sound.pitch_scale = randf_range(.9, 1.1)

		sound.play()
		await get_tree().create_timer(.025).timeout
	
	content_label.visible_characters = -1
