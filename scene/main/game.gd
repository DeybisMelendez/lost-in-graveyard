extends Node2D

export (PackedScene) var game_over
export (PackedScene) var key
export (PackedScene) var light
export (PackedScene) var girl
export (PackedScene) var ghost_1
export (PackedScene) var ghost_2
const keys = 5
const lights = 3
const ghosts_1 = 2
const ghosts_2 = 2
const girls = 2
func _ready():
	global.get_node("rain").play()
	global.time = 600
	global.terminar = false
	var grass = $ground.get_used_cells_by_id(0)
	randomize()
	for i in range(keys):
		var n = key.instance()
		n.global_position = grass[randi()% grass.size() - 1] * 32
		$bodies.add_child(n)
	for i in range(lights):
		var n = light.instance()
		n.global_position = grass[randi()% grass.size() - 1] * 32
		$bodies.add_child(n)
	for i in range(ghosts_1):
		var n = ghost_1.instance()
		n.global_position = grass[randi()% grass.size() - 1] * 32
		$bodies.add_child(n)
	for i in range(ghosts_2):
		var n = ghost_2.instance()
		n.global_position = grass[randi()% grass.size() - 1] * 32
		$bodies.add_child(n)
	for i in range(girls):
		var n = girl.instance()
		n.global_position = grass[randi()% grass.size() - 1] * 32
		$bodies.add_child(n)
	global.total_keys = keys
func _on_Timer_timeout():
	global.time -= 1
	if global.time < 60:
		global.get_node("heartbeat").play()
	if global.time == 0:
		$Timer.stop()

func _physics_process(delta):
	if global.terminar:
		get_tree().change_scene_to(game_over)