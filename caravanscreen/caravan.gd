extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _enter_tree() -> void:
	%horsebitters.text = "Use Horse Bitters? : " + str(Pinventory.horsebitters)
	%assortedgames.text = "Entertain caravan? : " + str(Pinventory.assortedgames) 
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_nextloc_pressed():
	Travelmanager.findnextlocation()


func _on_forage_pressed() -> void:
	Travelmanager.hordedist += 15
	PlayerData.food += (PlayerData.hp / 2)
