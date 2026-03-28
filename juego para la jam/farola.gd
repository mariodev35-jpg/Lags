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
		var tewn = create_tween()
		tewn.tween_property($OmniLight3D,"range",1,1.5)
		$OmniLight3D.show()
		$Sprite3D.visible = false
		$AnimatedSprite3D.play("Encender")
		$AnimatedSprite3D.visible = true
		$Antorcha/Base_001.visible = false
	else:
		$OmniLight3D.hide()
