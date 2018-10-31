extends CenterContainer

export (PackedScene) var juego

func _on_anim_animation_finished(anim_name):
	get_tree().change_scene_to(juego)