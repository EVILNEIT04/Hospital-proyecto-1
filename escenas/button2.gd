extends Button

@export var nombre_timeline: String = "timeline2"

func _ready() -> void: 
	# Conectamos la señal de forma segura
	if not pressed.is_connected(_al_tocar_boton):
		pressed.connect(_al_tocar_boton)

func _al_tocar_boton() -> void:
	# En Dialogic 2, simplemente llamamos a start
	# Si el nombre está mal, Dialogic tirará un error propio en consola
	Dialogic.start(nombre_timeline)
	
	# Usamos 'visible = false' en lugar de 'queue_free' por ahora 
	# para asegurarnos de que no rompa nada más
	self.visible = false
