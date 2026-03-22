extends CharacterBody3D

var alumbra = false
var agar = false
var cantcoji = 0
var box 
var fall = false
@export var  lus = 100
@export var spawn_pos : Marker3D
@onready var cam = $Camera3D
var sens = 0.2
const SPEED = 5.0
const JUMP_VELOCITY = 4.5
func _input(event: InputEvent) -> void:
	if event is InputEventScreenDrag and event.position.x >= 620 or event is InputEventMouseMotion :
		cam.rotate_x(deg_to_rad(-event.relative.y* sens))
		#$PhantomCamera3D.horizontal_rotation_offset(deg_to_rad(-event.relative.x * sens))
		rotate_y(deg_to_rad(-event.relative.x * sens))
		cam.rotation.x = clamp(cam.rotation.x,deg_to_rad(-45),deg_to_rad(30))
func _process(delta: float) -> void:
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	Input.mouse_mode  = Input.MOUSE_MODE_CAPTURED
	if $Camera3D/RayCast3D.is_colliding():
		var obj = $Camera3D/RayCast3D.get_collider()
		box = obj
		if obj.has_method("use") and Input.is_action_just_pressed("use"):
			obj.use()
		if obj.is_in_group("agarrable") and agar == false and obj.has_method("agar") and Input.is_action_pressed("use"):
			
			agar = true
		
		if obj.has_method("use") or obj.is_in_group("agarrable"):
			Global.inter = true
	else:
		Global.inter = false
	if Input.is_action_just_released("use") and agar ==true:
		agar = false
	if box != null:
		if box.is_in_group("agarrable") and agar == true:
			box.agar($Camera3D/Marker3D.global_position) 
			$Camera3D/RayCast3D.enabled = false
		elif box.is_in_group("agarrable") and agar == false:
			box.soltar()
			$Camera3D/RayCast3D.enabled = true
	if direction and is_on_floor():
		$AnimationPlayer2.play("run")
		$sonudos/AudioStreamPlayer.pitch_scale = randf_range(1,3)
	elif !direction and is_on_floor() and $suelodetect.body_entered:
		$AnimationPlayer2.play("idle")
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimationPlayer2.play("jump")
		$sonudos/AudioStreamPlayer.pitch_scale = 1
	Global.lus = $Camera3D/OmniLight3D.omni_range 
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	var tween = create_tween()
	if Global.stoplight == true and !direction and alumbra == false:
		
		$AnimationPlayer.play("osvu")
		
	elif Global.stoplight == true and direction:
		Global.stoplight == false
		$AnimationPlayer.play("ilu")
	
	
	if direction:
		#$sonudos/paso.play()s
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		#$sonudos/paso.stop()
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		

	move_and_slide()
#esta es la funcion de muerte
func did():
	global_position = spawn_pos.global_position

#region esta es la revisa si tienes objetos interacuables serca
func _on_interazone_body_entered(body: Node3D) -> void:
	
	if body.is_in_group("inter") and Global.stoplight == false:
		$AnimationPlayer.play("serca")
		body.visi()

func _on_interazone_body_exited(body: Node3D) -> void:
	if body.is_in_group("inter") and Global.stoplight == false:
		$AnimationPlayer.play("ilu")
		body.invisi()
#endregion
	
#region detecta si hay una fuente de lus cerca
func _on_lusdetect_body_entered(body: Node3D) -> void:
	if body.is_in_group("lus") and body.encendido == true :
		alumbra = true
func _on_lusdetect_body_exited(body: Node3D) -> void:
	if body.is_in_group("lus") and body.encendido == true:
		alumbra = false
#endregion


func _on_suelodetect_body_entered(body: Node3D) -> void:
	if not  velocity.y >= 0:
		$AnimationPlayer2.play("fall")
