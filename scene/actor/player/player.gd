extends KinematicBody2D

var light = false
var light_pos = {

}
var speed = 50
var max_speed = 100
var dir = {
	up = Vector2(0, -1),
	down = Vector2(0, 1),
	right = Vector2(1, 0),
	left = Vector2(-1, 0),
}
var mov = Vector2()

func _physics_process(delta):
	if Input.is_action_pressed("up"):
		mov += dir.up * speed * delta
		mov.x = lerp(mov.x, 0, 0.2)
		$anim.play("off_up")
	elif Input.is_action_pressed("down"):
		mov += dir.down * speed * delta
		mov.x = lerp(mov.x, 0, 0.2)
		$anim.play("off_down")
	elif Input.is_action_pressed("left"):
		mov += dir.left * speed * delta
		mov.y = lerp(mov.y, 0, 0.2)
		$anim.play("off_left")
		$anim.flip_h = false
	elif Input.is_action_pressed("right"):
		mov += dir.right * speed * delta
		mov.y = lerp(mov.y, 0, 0.2)
		$anim.play("off_left") # Volveamos con flip_h
		$anim.flip_h = true
	else:
		$anim.stop()
		$anim.set_frame(0)
	mov.x = clamp(mov.x, -max_speed, max_speed)
	mov.y = clamp(mov.y, -max_speed, max_speed)
	mov = move_and_slide(mov)