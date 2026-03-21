extends CPUParticles3D
@export var player : CharacterBody3D

func _process(delta: float) -> void:
	global_position = player.position
