extends CanvasLayer

@onready var label = $Panel/Label
@onready var boton_dialogo = $Button
@onready var boton_escena = $Button2

var dialogos = [
	"Hola paciente...",
	"Bienvenido al hospital.",
	"Prepárate para comenzar el tutorial.",
	"Buena suerte."
]

var indice = 0

func _ready():
	label.text = dialogos[indice]
	
	boton_escena.visible = false
	
	boton_dialogo.pressed.connect(_siguiente_dialogo)
	boton_escena.pressed.connect(_cambiar_escena)

func _siguiente_dialogo():
	indice += 1
	
	if indice < dialogos.size():
		label.text = dialogos[indice]
	else:
		boton_dialogo.visible = false
		boton_escena.visible = true

func _cambiar_escena():
	get_tree().change_scene_to_file("res://escenarios/consultorio.tscn")
