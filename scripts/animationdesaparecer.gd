extends Node2D

func _ready():

	$npc.visible = false

	$AnimatedSprite2D/AnimationPlayer.play("npc1")

	$AnimatedSprite2D/AnimationPlayer.animation_finished.connect(_cuando_termina)


func _cuando_termina(_anim_name):

	$AnimatedSprite2D.visible = false

	$npc.visible = true
