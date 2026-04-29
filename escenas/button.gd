extends Button

# Cambia esto por la ruta de tu siguiente escena (por ejemplo, el interior del hospital)
@export_file("*.tscn") var siguiente_escena: String = "res://escenas/InteriorHospital.tscn"

func _ready() -> void:
	pass

func _pressed() -> void:
	# 1. Conectamos la señal 'timeline_ended' a una función local
	# Esto le dice a Godot: "Cuando Dialogic termine, ejecuta la función _al_terminar_dialogo"
	Dialogic.timeline_ended.connect(_al_terminar_dialogo)
	
	# 2. Iniciamos tu línea de tiempo
	Dialogic.start("timeline")

func _al_terminar_dialogo():
	# 3. Desconectamos la señal para evitar errores si regresas a esta escena
	Dialogic.timeline_ended.disconnect(_al_terminar_dialogo)
	
	# 4. Cambiamos de escena
	if siguiente_escena != "":
		get_tree().change_scene_to_file("res://escenas/interior.tscn")
	else:
		print("Error: No has definido la ruta de la siguiente escena en el Inspector.")
	

	
