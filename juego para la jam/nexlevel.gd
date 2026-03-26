extends Area3D
@export var nexesene : PackedScene
@export var escen = ""


func _on_body_entered(body: Node3D) -> void:
	if body.name == "player":
		Global.change_scene = escen
		get_tree().change_scene_to_packed(nexesene)
