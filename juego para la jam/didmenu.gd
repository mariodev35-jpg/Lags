extends Control
signal did
func _process(delta: float) -> void:
	if Global.did == true:
		show()
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		get_tree().paused = true
	else:
		hide()
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		get_tree().paused = false


func _on_button_pressed() -> void:
	did.emit()
	get_tree().paused = false


func _on_button_2_pressed() -> void:
	
	get_tree().paused = false
	Global.did = false
	get_tree().change_scene_to_file("res://menu.tscn")
	
	
	
	
	
	
	
	
