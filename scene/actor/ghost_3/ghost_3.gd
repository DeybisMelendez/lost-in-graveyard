extends KinematicBody2D

var player_pos = Vector2()
var follow = false
var dir = Vector2()
var vel = 0

func _physics_process(delta):
	player_pos = get_tree().get_nodes_in_group("jugador")[0].global_position
	if  global_position.distance_to(player_pos) > 300:
		change_position()
	if follow:
		dir = (player_pos - global_position).normalized()
		vel = (600 - global.time)/10
		move_and_slide(dir * vel)
		print (dir * vel)
	if !global.light_on:
		change_position()

func change_position():
	global_position = player_pos + Vector2(300 ,0).rotated(rand_range(PI, -PI)) 

func _on_follow_body_entered(body):
	if body.is_in_group("jugador"):
		$anim.set_self_modulate(Color(1,1,1,1))
		$appear.play()
		follow = true

func _on_follow_body_exited(body):
	if body.is_in_group("jugador"):
		$anim.set_self_modulate(Color(1,1,1,0.1))
		follow = false
		$appear.stop()

func _on_sensor_body_entered(body):
	if body.is_in_group("jugador"):
		global.terminar = true