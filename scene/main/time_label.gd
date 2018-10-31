extends Label

func _process(delta):
	set_text("Time: " + str(global.time))