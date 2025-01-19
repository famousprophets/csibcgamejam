extends TextureButton


@export var playerClass : String


func _on_pressed():
	
	playerClass = "Peasant"
	print (playerClass)
