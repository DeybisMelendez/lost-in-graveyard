extends KinematicBody2D

var light = true
var light_pos = {

}
var speed = 100
var max_speed = 100
var weight = 0.1
var dir = {
	up = Vector2(0, -1),
	down = Vector2(0, 1),
	right = Vector2(1, 0),
	left = Vector2(-1, 0),
}
var mov = Vector2()
var light_scale = 1
var light_anim = "add"
var light_vel = 0.05
#var light_on = true

func _physics_process(delta):
	if Input.is_action_just_pressed("light"):
		if $Light2D.get_energy() == 1:
			$Light2D.set_energy(0.2)
			light = false
		else:
			$Light2D.set_energy(1)
			light = true
	if Input.is_action_pressed("up"):
		mov += dir.up * speed * delta
		mov.x = lerp(mov.x, 0, weight)
		$anim.play("off_up")
	elif Input.is_action_pressed("right"):
		mov += dir.right * speed * delta
		mov.y = lerp(mov.y, 0, weight)
		$anim.play("off_left") # Volveamos con flip_h
		$anim.flip_h = true
	elif Input.is_action_pressed("down"):
		mov += dir.down * speed * delta
		mov.x = lerp(mov.x, 0, weight)
		$anim.play("off_down")
	elif Input.is_action_pressed("left"):
		mov += dir.left * speed * delta
		mov.y = lerp(mov.y, 0, weight)
		$anim.play("off_left")
		$anim.flip_h = false
	else:
		$anim.stop()
		$anim.set_frame(0)
		mov.x = lerp(mov.x, 0, weight)
		mov.y = lerp(mov.y, 0, weight)
	mov.x = clamp(mov.x, -max_speed, max_speed)
	mov.y = clamp(mov.y, -max_speed, max_speed)
	mov = move_and_slide(mov)
	
	if light:
		light_scale -= 0.003 * delta
		$Light2D.rotation_degrees += 5 * delta
		#$Light2D2.rotation_degrees -= 5 * delta
		if $Light2D.get_texture_scale() >= light_scale:
			light_anim = "sub"
		elif $Light2D.get_texture_scale() <= light_scale - 0.05:
			light_anim = "add"
		if light_anim == "add":
			$Light2D.set_texture_scale($Light2D.get_texture_scale() + light_vel * delta)
		else:
			$Light2D.set_texture_scale($Light2D.get_texture_scale() - light_vel * delta)

func spark():
	var spark_texture = load("res://scene/actor/player/spark/spark_0" + str(randi()%4+1) + ".png")
	$effect/spark.set_texture(spark_texture)
	$effect/spark.rotation_degrees = randi()%360
	$spark_anim.play("spark")

func _on_spark_cycle_timeout():
	spark()
	$spark_cycle.set_wait_time(randi()%5+5)
	$spark_cycle.start()
