extends KinematicBody2D

var mov = Vector2(0,0)

func _physics_process(delta):
	move_and_slide(mov)

func _on_sensor_body_entered(body):
	if body.is_in_group("jugador"):
		$anim.play("scream")
		mov = Vector2(rand_range(-1,1),rand_range(-1,1)) * 100
		$scream.play()
		yield($anim,"animation_finished")
		queue_free()

func _on_body_body_entered(body):
	if body.is_in_group("jugador"):
		global.terminar = true
