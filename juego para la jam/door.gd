extends AnimatableBody3D

var pos = 0
var open = false
func press():
	open = true
func despress():
	#open = false
	pass
func _process(delta: float) -> void:
	if open == true and pos <= 200:
		pos += 1
		position.y += 1 
	elif open == false and pos >= 0:
		pos -= 1
		position.y -= 1 
	
