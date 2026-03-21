extends CanvasLayer



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$ProgressBar.value = Global.lus
	if Global.inter == true:
		
		$Label.show()
	else:
		
		$Label.hide()
