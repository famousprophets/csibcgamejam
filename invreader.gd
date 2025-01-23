extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	getinv()
func getinv():
	$".".text ="\nOil Flasks: " + str(Pinventory.oilflask) + "\nBandages: " + str(Pinventory.bandage) + "\nHorse Bitters: " + str(Pinventory.horsebitters) + "\nAssorted Entertainment: " + str(Pinventory.assortedgames) + "\nLanterns: " + str(Pinventory.lantern) + "\nMedical Supplies: " + str(Pinventory.medicalsupplies) + "\nTraining Manuals: " + str(Pinventory.warbook) + "\nHandgonnes: " + str(Pinventory.handgonne)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
