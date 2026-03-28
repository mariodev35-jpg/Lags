extends Control

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause") and Global.pausegame == false:
		Global.pausegame = true
	elif Input.is_action_just_pressed("pause") and Global.pausegame == true:
		Global.pausegame = false
	if Global.pausegame == true:
		show()
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		get_tree().paused = true
	else:
		hide()
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		get_tree().paused = false


func _on_button_pressed() -> void:
	if Global.pausegame == true:
		Global.pausegame = false
		get_tree().change_scene_to_file("res://menu.tscn")


func _on_button_2_pressed() -> void:
	if Global.pausegame == true:
		Global.pausegame = false
		
