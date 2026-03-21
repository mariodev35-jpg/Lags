extends Control
@onready var progres  : Array
@onready var scene_statu: int
func _ready() -> void:
	
	get_tree().paused = false
	ResourceLoader.load_threaded_request(Global.change_scene)
	
	
func _process(delta: float) -> void:
	scene_statu = ResourceLoader.load_threaded_get_status(Global.change_scene, progres)
	
	$TextureProgressBar.value = progres[0] * 100
	
	if scene_statu == ResourceLoader.THREAD_LOAD_LOADED:
		print("cargo con exito")
		get_tree().call_deferred("change_scene_to_packed", ResourceLoader.load_threaded_get(Global.change_scene))
		
	
