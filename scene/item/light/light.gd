extends Area2D

var tomado = false

func _on_light_body_entered(body):
	if body.is_in_group("jugador") and !tomado:
		tomado = true
		$AudioStreamPlayer2D.play()
		yield($AudioStreamPlayer2D,"finished")
		body.light_scale = 1
		queue_free()