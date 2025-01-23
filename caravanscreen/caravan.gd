extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if PlayerData.caravanspeed < 15:
		print("the caravan has halted. you can abandon your supplies and walk forward or stay in the area and search for a horse")



func _on_nextloc_pressed():
	Travelmanager.findnextlocation()
