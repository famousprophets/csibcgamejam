extends TextureButton


@export var playerClass : String


func _on_pressed():
	
	PlayerData.classassign("Peasant")
	get_tree().change_scene_to_file("res://choicepaths/startchoice.tscn")
