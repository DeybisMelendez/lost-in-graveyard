extends StaticBody2D

func _on_sensor_body_entered(body):
	if body.is_in_group("jugador") and global.total_keys == global.keys:
		global.terminar = true