extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$soundslizer.value = Saveoptiones.date_user["sounds"]
	$HSlider.value = Saveoptiones.date_user["music"]
	Saveoptiones.load_game()
func _on_h_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0,value)
	Saveoptiones.date_user["music"] = value
	
	
	
	


func _on_soundslizer_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(1,value)
	Saveoptiones.date_user["sounds"] = value


func _on_texture_button_pressed() -> void:
	Saveoptiones.save_game()
	get_tree().change_scene_to_file("res://menu.tscn")
	
	
	
	
