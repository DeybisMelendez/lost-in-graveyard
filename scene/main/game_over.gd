extends Node2D

var menu = load("res://scene/main/menu.tscn")

func _ready():
	$AnimationPlayer.play("Nueva animación")
	yield($AnimationPlayer,"animation_finished")
	get_tree().change_scene_to(menu)