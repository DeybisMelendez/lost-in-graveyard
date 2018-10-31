extends Label

func _process(delta):
	set_text("Keys: " + str(global.keys) + " / " + str(global.total_keys))