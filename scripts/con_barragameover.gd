extends Node

@onready var barra = $ProgressBar

# TIEMPO TOTAL
var tiempo = 100.0

func _process(delta):

	# BAJAR LA BARRA
	tiempo -= delta * 5

	# ACTUALIZAR BARRA
	barra.value = tiempo

	# SI LLEGA A 0
	if tiempo <= 0:

		tiempo = 0

		get_tree().change_scene_to_file("res://escenarios/gameover.tscn")
