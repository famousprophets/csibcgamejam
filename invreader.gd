extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".text = "Bandages: " + str(Pinventory.bandage) + "\nLanterns: " + str(Pinventory.lantern) + "\nOil Flasks: " + str(Pinventory.oilflask)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
