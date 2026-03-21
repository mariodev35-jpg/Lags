extends StaticBody3D
class_name lus
@export var encendido = false
var sound = preload("res://Efectos de sonidos /Ambiente /encendido fuego.ogg")
func visi():
	$Sprite3D.show()
func invisi():
	$Sprite3D.hide()
	
func use():
	
	$AudioStreamPlayer.stream = sound
	$AudioStreamPlayer.playing = true
	encendido = true
func _process(delta: float) -> void:
	if encendido == true:
		$OmniLight3D.show()
	else:
		$OmniLight3D.hide()
