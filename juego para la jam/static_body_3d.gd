extends StaticBody3D
@export var obje : Node3D
var pres = false

func use():
	pres = !pres
	if pres == false:
		$AnimationPlayer.play("play")
	else:
		$AnimationPlayer.play("desplay")

func _process(delta: float) -> void:
	if pres == true:
		obje.press()
	else:
		obje.despress()
func visi():
	$Sprite3D.show()
func invisi():
	$Sprite3D.hide()
	
	
