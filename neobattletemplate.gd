extends Control



# Called when the node enters the scene tree for the first time.
func _ready():
	%Character.texture = PlayerData.ClassTexture
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var turns = 2
	if PlayerData.ambush == true:
		turns+=1
		PlayerData.ambush = false
	%battlestatus.text = "Soldiers: " + str(PlayerData.hp) + "\nInjured Soldiers: " + str(PlayerData.injured)
