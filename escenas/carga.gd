extends Sprite2D

var vida = 100
var tiempo = 0.0

func _ready():
	actualizar_barra()

func _process(delta):

	tiempo += delta

	if tiempo >= 1.0:
		tiempo = 0
		vida -= 10
		actualizar_barra()

		if vida <= 0:
			get_tree().change_scene_to_file("res://escenas/gameover.tscn")

func actualizar_barra():

	if vida >= 100:
		texture = preload("res://carga/100.png")

	elif vida >= 90:
		texture = preload("res://carga/90.png")

	elif vida >= 80:
		texture = preload("res://carga/80.png")

	elif vida >= 70:
		texture = preload("res://carga/70.png")

	elif vida >= 60:
		texture = preload("res://carga/60.png")

	elif vida >= 50:
		texture = preload("res://carga/50.png")

	elif vida >= 40:
		texture = preload("res://carga/40.png")

	elif vida >= 30:
		texture = preload("res://carga/30.png")

	elif vida >= 20:
		texture = preload("res://carga/20.png")

	elif vida >= 10:
		texture = preload("res://carga/10.png")

	else:
		texture = preload("res://carga/0.png")
