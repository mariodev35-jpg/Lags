extends lus

func press():
	$AudioStreamPlayer.pitch_scale = 1.5
	
	encendido = true
func despress():
	
	$AudioStreamPlayer.pitch_scale = 2.38
	encendido = false
