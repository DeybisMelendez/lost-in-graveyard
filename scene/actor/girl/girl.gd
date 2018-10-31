extends Area2D

var vel = Vector2()
var mov = false

func _on_girl_body_entered(body):
	if body.is_in_group("jugador"):
		mov = true
		$scream.play()
		$anim.play("scream")
		vel = (body.global_position - global_position).normalized()
		yield($scream,"finished")
		queue_free()

func _physics_process(delta):
	if mov:
		global_position += vel * 20 * delta

func _on_body_body_entered(body):
	if body.is_in_group("jugador"):
		global.terminar = true