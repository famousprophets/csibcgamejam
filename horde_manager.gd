extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	if Travelmanager.disttravel <= Travelmanager.hordedist:
		if Travelmanager.timescaught <= 1:
			Travelmanager.timescaught +=1
			get_tree().change_scene_to_file("hordescene1")
		else:
			get_tree().change_scene_to_file("gameover")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
