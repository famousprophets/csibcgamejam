extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	var rng = RandomNumberGenerator.new()
	var rand = rng.randf_range(0.0,1000.0)
	if rand >= 0:
		$".".text = "Kazi Navid Didnt Do Shit On This Project And My Back Hurts From Carrying"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_goback_pressed():
	pass # Replace with function body.
