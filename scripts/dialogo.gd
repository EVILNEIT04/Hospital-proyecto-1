extends CanvasLayer

@onready var label = $Panel/Label
@onready var boton_dialogo = $BotonDialogo
@onready var boton_escena = $BotonEscena
@onready var personaje = $Sprite2D


# DIALOGOS
var dialogos = [
	"Hola paciente...",
	"Bienvenido al hospital.",
	"Necesitamos hacerte unos examenes.",
	"No tengas miedo.",
	"Todo saldra bien."
]


# IMAGENES
var imagenes = [
	preload("res://sprites personajes/prof.gre/1.png"),
	preload("res://sprites personajes/prof.gre/2.png"),
	preload("res://sprites personajes/prof.gre/3.png"),
	preload("res://sprites personajes/prof.gre/2.png"),
	preload("res://sprites personajes/prof.gre/1.png")
]


# CONTROL
var indice = 0
var velocidad = 0.03

var escribiendo = false
var texto_actual = ""


func _ready():

	# BOTON DE ESCENA OCULTO
	boton_escena.visible = false

	# CONECTAR BOTONES
	boton_dialogo.pressed.connect(_continuar_dialogo)
	boton_escena.pressed.connect(_cambiar_escena)

	# INICIAR DIALOGO
	mostrar_dialogo()


func mostrar_dialogo():

	escribiendo = true

	label.text = ""

	texto_actual = dialogos[indice]

	# CAMBIAR IMAGEN
	personaje.texture = imagenes[indice]

	for letra in texto_actual:

		# SI EL JUGADOR PRESIONA CONTINUAR
		if escribiendo == false:

			label.text = texto_actual

			break

		label.text += letra

		await get_tree().create_timer(velocidad).timeout

	escribiendo = false


func _continuar_dialogo():

	# SI TODAVIA ESCRIBE
	if escribiendo:

		escribiendo = false

		return

	# SIGUIENTE DIALOGO
	indice += 1

	# SI HAY MAS DIALOGOS
	if indice < dialogos.size():

		mostrar_dialogo()

	# SI TERMINARON LOS DIALOGOS
	else:

		# OCULTAR BOTON CONTINUAR
		boton_dialogo.visible = false

		# MOSTRAR BOTON CAMBIAR ESCENA
		boton_escena.visible = true


func _cambiar_escena():

	var tree = get_tree()

	if tree:

		tree.change_scene_to_file("res://escenarios/escnariosdeltutorial/consultorio.tscn")


func _on_boton_dialogo_pressed() -> void:
	pass # Replace with function body.
