extends TextureButton


@export var playerClass : String


func _on_pressed():
	
	playerClass = "Peasant"
	get_tree().change_scene_to_file()
