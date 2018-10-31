extends KinematicBody2D

var player = null
var dir = Vector2()
var volume = 0

func _on_sensor_body_entered(body):
	if body.is_in_group("jugador"):
		player = body
		#$audio.play()

func _on_sensor_body_exited(body):
	if body.is_in_group("jugador"):
		player = null
		#$audio.stop()

func _physics_process(delta):
	if !player == null:
		if !global.light_on:
			dir = (player.global_position - global_position).normalized()
			move_and_slide(dir * 50)

func _on_body_body_entered(body):
	if body.is_in_group("jugador"):
		global.terminar = true