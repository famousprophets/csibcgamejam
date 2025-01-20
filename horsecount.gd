extends TextureRect


func _ready():
	pass 


func _process(delta):
	if PlayerData.horses < 4:
		
		PlayerData.onfoot = true
