extends Label

onready var total_keys = get_tree().get_nodes_in_group("key").size()

func _process(delta):
	set_text("Keys: " + str(global.keys) + " / " + str(total_keys))