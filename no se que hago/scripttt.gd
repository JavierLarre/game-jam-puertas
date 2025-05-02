extends Node2D

@onready var puerta = $Sprite2D
@onready var boton_rojo = $Rojo
@onready var boton_verde = $Verde
@onready var boton_azul = $Azul

func _ready():
	boton_rojo.pressed.connect(func(): cambiar_color(Color(1, 0, 0)))
	boton_verde.pressed.connect(func(): cambiar_color(Color(0, 1, 0)))
	boton_azul.pressed.connect(func(): cambiar_color(Color(0, 0, 1)))

func cambiar_color(nuevo_color: Color):
	puerta.material.set_shader_parameter("target_color", nuevo_color)
