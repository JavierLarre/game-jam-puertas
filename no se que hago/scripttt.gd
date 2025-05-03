extends Node2D

@onready var puerta = $Puerta
@onready var boton_rojo = $Rojo
@onready var boton_verde = $Verde
@onready var boton_azul = $Azul
@onready var boton_verde2 = $Verde2
@onready var manilla = $Manilla
@onready var cara = $Cara
@onready var opciones_manilla = $OptionButton
@onready var opciones_cara = $OptionButton2
@onready var pikachu: Node2D = $pikachu

var manilla_1 := load("res://assets/manilla_1.png")
var manilla_2 := load("res://assets/manilla_2.png")
var manilla_3 := load("res://assets/manilla_3.png")

var cara_1 := load("res://assets/face.png")
var cara_2 := load("res://assets/dospuntostres.png")
var cara_3 := load("res://assets/pico.png")

func _ready():
	pikachu.hide()
	boton_rojo.pressed.connect(func(): cambiar_color(Color("b07298")))
	boton_azul.pressed.connect(func(): cambiar_color(Color("a75737")))
	boton_verde.pressed.connect(func(): cambiar_color(Color("ebdfe5")))
	boton_verde2.pressed.connect(func(): cambiar_color(Color("f2d385"), true))
	opciones_manilla.item_selected.connect(cambiar_manilla)
	opciones_cara.item_selected.connect(cambiar_cara)

func cambiar_color(nuevo_color: Color, pika: bool = false):
	if pika:
		print("uwu")
		pikachu.show()
	else:
		pikachu.hide()
	puerta.material.set_shader_parameter("target_color", nuevo_color)

func cambiar_manilla(index: int):
	match index:
		0:
			$Manilla.texture = manilla_1
		1:
			$Manilla.texture = manilla_2
		2:
			$Manilla.texture = manilla_3

func cambiar_cara(index: int):
	match index:
		0:
			$Cara.texture = cara_1
		1:
			$Cara.texture = cara_2
		2:
			$Cara.texture = cara_3
