extends KinematicBody2D

var jugador = null
var dir = Vector2()
var volume = 0

func _on_sensor_body_entered(body):
	if body.is_in_group("jugador"):
		jugador = body
		#$audio.play()


func _on_sensor_body_exited(body):
	if body.is_in_group("jugador"):
		jugador = null
		#$audio.stop()

func _physics_process(delta):
	if !jugador == null:
		dir = (jugador.global_position - global_position).normalized()
		move_and_slide(dir * 50)