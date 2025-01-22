extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rng = RandomNumberGenerator.new()
	var rand = rng.randf_range(0,100)
	if rand >= 0 && rand <= 20:
		$".".text = "The merchant and his guards stare you down."
	if rand >= 21 && rand <=40:
		$".".text = "In the poor lighting, the merchant and his guards look more like bandits than traders."
	if rand >= 41 && rand <=60:
		$".".text = "The merchant is grinning grotesquely. He knows you have no choice but to accept his prices"
	if rand >= 61 && rand <=80:
		$".".text = "The merchant seems more at home amongst the nether beasts. Something about him is offputting."
	if rand >= 81 && rand <=99:
		$".".text = "The merchant idly whittles away while your peruse the store."
	if rand == 100:
		$".".text = "fix your hearts or die."


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
