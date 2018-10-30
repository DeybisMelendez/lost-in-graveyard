extends Area2D

func _on_key_body_entered(body):
	if body.is_in_group("jugador"):
		global.keys += 1
		queue_free()