extends Button

# Nombre de la nueva línea de tiempo que creaste
@export var nombre_timeline: String = "timeline2"

func _pressed() -> void:
	# 1. Iniciamos el diálogo de la segunda parte
	# Esto hará que el personaje aparezca según lo configuraste en Dialogic
	Dialogic.start(nombre_timeline)
	
	# 2. Hacemos que el botón desaparezca para que no estorbe la vista
	# o lo desactivamos para evitar que se reinicie el diálogo
	self.visible = false
	
	# 3. (Opcional) Si quieres que pase algo cuando termine este diálogo
	Dialogic.timeline_ended.connect(_final_de_dialogo, CONNECT_ONE_SHOT)

func _final_de_dialogo():
	print("El diálogo 'timeline2' ha terminado.")
	# Aquí podrías activar el movimiento del jugador o mostrar otro menú
