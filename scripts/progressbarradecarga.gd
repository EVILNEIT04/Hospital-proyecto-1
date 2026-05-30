extends Node2D

@onready var barra = $ProgressBar

var carga = 0


func _process(delta):

	carga += 30 * delta

	barra.value = carga

	if carga >= 100:
		get_tree().change_scene_to_file("res://escenarios/nuevaPartida.tscn")
