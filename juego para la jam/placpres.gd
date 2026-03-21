extends StaticBody3D

@export var objetive : Node3D

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("pesado"):
		$AnimationPlayer.play("pres")
		if objetive != null:
			objetive.press()
func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("pesado"):
		$AnimationPlayer.play("despres")
		if objetive != null:
			objetive.despress()
func visi():
	$Sprite3D.show()
func invisi():
	$Sprite3D.hide()
	


func _on_area_3d_body_entered(body: Node3D) -> void:
	pass # Replace with function body.


func _on_area_3d_body_exited(body: Node3D) -> void:
	pass # Replace with function body.
