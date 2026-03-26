extends Control

func _ready() -> void: 
	$resolucionbar.selected = Global.resolution
	cansincronist()
	if Global.screenfull == true:
		$fullscreen.button_pressed = true
	elif Global.screenfull == false:
		$fullscreen.button_pressed = false
	
func _process(delta: float) -> void:
	
	if AudioServer.is_bus_mute(0) == true:
		$mutebuton.button_pressed = true
	elif  AudioServer.is_bus_mute(0) == false:
		$mutebuton.button_pressed = false
	cansincronist()
func cansincronist():
	$musicbar.value = AudioServer.get_bus_volume_db(2)
	$sensbar.value = Global.sensi
	$efectbar.value = AudioServer.get_bus_volume_db(1)

func _on_musicbar_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(2,value)



func _on_efectbar_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(1,value)


func _on_mutebuton_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0,toggled_on)
	
	
	


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_resolucionbar_item_selected(index: int) -> void:
	Global.resolution = index
	if index == 0:
		
		DisplayServer.window_set_size(Vector2i(640,480),0)
	elif index == 1:
		
		DisplayServer.window_set_size(Vector2i(800,600),0)
	elif index == 2:
		DisplayServer.window_set_size(Vector2i(1024,768),0)
	
	elif index == 3:
		DisplayServer.window_set_size(Vector2i(1152,648),0)
	elif index == 4:
		DisplayServer.window_set_size(Vector2i(1280,960),0)
	
	


func _on_fullscreen_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		Global.screenfull = true
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		Global.screenfull = false
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_sensbar_value_changed(value: float) -> void:
	Global.sensi = value
	
	
	
