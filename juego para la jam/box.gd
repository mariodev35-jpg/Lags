extends RigidBody3D
var gara = false
var posi 
func agar(pos):
	gara = true
	posi = pos
func soltar():
	gara = false
func _process(delta: float) -> void:
	if gara == true:
		sleeping =true
		$CollisionShape3D.disabled = true
		global_position = posi
	else:
		sleeping = false
		$CollisionShape3D.disabled = false
	
func visi():
	$Sprite3D.show()
func invisi():
	$Sprite3D.hide()
	
