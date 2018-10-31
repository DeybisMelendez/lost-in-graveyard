extends Node2D

var game = load ("res://scene/main/story.tscn")
var start = false

func _ready():
	global.get_node("rain").stop()

func _on_TextureButton_pressed():
	if !start:
		start = true
		$sound.play()
		$anim.play("anim")
		yield($anim,"animation_finished")
		get_tree().change_scene_to(game)