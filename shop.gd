extends VBoxContainer

var limitedstock = 2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	getinv()
	%goldcount.text = str(PlayerData.gold)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func getinv():
	%RichTextLabel.text ="\nOil Flasks: " + str(Pinventory.oilflask) + "\nBandages: " + str(Pinventory.bandage) + "\nHorse Bitters: " + str(Pinventory.horsebitters) + "\nAssorted Entertainment: " + str(Pinventory.assortedgames) + "\nLanterns: " + str(Pinventory.lantern) + "\nMedical Supplies: " + str(Pinventory.medicalsupplies) + "\nTraining Manuals: " + str(Pinventory.warbook) + "\nHandgonnes: " + str(Pinventory.handgonne)


func _on_oflask_pressed() -> void:
	if PlayerData.gold >= 2:
		Pinventory.oilflask+=1
		PlayerData.gold-=2
		%goldcount.text = "Gold:" + str(PlayerData.gold)
		getinv()


func _on_bandage_pressed() -> void:
	if PlayerData.gold >= 1:
		Pinventory.bandage+=1
		PlayerData.gold-=1
		%goldcount.text = "Gold:" + str(PlayerData.gold)
		getinv()



func _on_horsebitters_pressed() -> void:
	if PlayerData.gold >= 3:
		Pinventory.horsebitters+=1
		PlayerData.gold-=3
		%goldcount.text = "Gold:" + str(PlayerData.gold)
		getinv()



func _on_entertainment_pressed() -> void:
	if PlayerData.gold >= 2:
		Pinventory.assortedgames+=1
		PlayerData.gold-=2
		%goldcount.text = "Gold:" + str(PlayerData.gold)
		getinv()



func _on_lantern_pressed() -> void:
	if PlayerData.gold >= 1:
		Pinventory.lantern+=1
		PlayerData.gold-=1
		%goldcount.text = "Gold:" + str(PlayerData.gold)
		getinv()



func _on_medsupplies_pressed() -> void:
	if PlayerData.gold >= 6:
		Pinventory.medicalsupplies+=1
		PlayerData.gold-=6
		%goldcount.text = "Gold:" + str(PlayerData.gold)
		getinv()



func _on_warbook_pressed() -> void:
	if PlayerData.gold >= 5:
		Pinventory.warbook+=1
		PlayerData.gold-=5
		%goldcount.text = "Gold:" + str(PlayerData.gold)
		getinv()


func _on_handgonne_pressed() -> void:
	if PlayerData.gold >= 7:
		Pinventory.handgonne+=1
		PlayerData.gold-=7
		%goldcount.text = "Gold:" + str(PlayerData.gold)
		getinv()


func _on_button_pressed():
	get_tree().change_scene_to_file("res://caravanscreen/caravan.tscn")
