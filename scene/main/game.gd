extends Node2D

func _ready():
	global.get_node("rain").play()
	global.get_node("ambience").play()