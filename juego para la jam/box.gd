extends RigidBody3D
var topy_box = 1
var gara = false
var posi 
func _ready() -> void:
	topy_box = randi_range(1,2)
	if topy_box == 1 :
		$box1.show()
		$box2.hide()
	elif topy_box == 2:
		$box1.hide()
		$box2.show()
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
	
