extends Control
@export var scene : String = "res://map1.tscn"


func _on_btnplay_pressed() -> void:
	Global.change_scene = scene
	get_tree().change_scene_to_file("res://barradecarga.tscn")

func _on_btnconfi_pressed() -> void:
	get_tree().change_scene_to_file("res://configmenu.tscn")

func _on_btnexit_pressed() -> void:
	get_tree().quit()
