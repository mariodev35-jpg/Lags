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
	
	if encendido == true:
		$OmniLight3D.show()
		$Sprite3D.visible = false
		$AnimatedSprite3D.play("Encender")
		$AnimatedSprite3D.visible = true
		$Antorcha/Base_001.visible = false
		
		if has_node("AudioFuegoCrepitando"):
			$AudioFuegoCrepitando.play()
	else:
		$OmniLight3D.hide()
		
		$Sprite3D.visible = true
		$AnimatedSprite3D.stop()
		$AnimatedSprite3D.visible = false
		$Antorcha/Base_001.visible = true
		
		if has_node("AudioFuegoCrepitando"):
			$AudioFuegoCrepitando.stop()
