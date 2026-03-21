extends CPUParticles3D
@export var player : CharacterBody3D

func _process(delta: float) -> void:
	var pos = player.get_node("pos")
	global_position = pos.position
