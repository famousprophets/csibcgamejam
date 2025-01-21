extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/ExitButton.hide()
	Travelmanager.locationstraveled +=1
	Travelmanager.hordedist +=20
	Travelmanager.disttravel += PlayerData.caravanspeed
	
	$Panel/RichTextLabel.text = "Text"
	$Panel/HBoxContainer/Button.text = "Choice 1"
	$Panel/HBoxContainer/Button2.text = "Choice 2"
	$Panel/HBoxContainer/Button3.text = "Choice 3"
	$Panel/HBoxContainer/Button4.text = "Choice 4"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func choicemade():
	$Panel/HBoxContainer/Button.hide()
	$Panel/HBoxContainer/Button2.hide()
	$Panel/HBoxContainer/Button3.hide()
	$Panel/HBoxContainer/Button4.hide()
	$Panel/ExitButton.show()

func _on_button_pressed():
	choicemade()
	$Panel/RichTextLabel.text = "Outcome"
	pass # Replace with function body.


func _on_button_2_pressed():
	choicemade()
	$Panel/RichTextLabel.text = "Outcome"
	pass # Replace with function body.


func _on_button_3_pressed():
	choicemade()
	$Panel/RichTextLabel.text = "Outcome"
	pass # Replace with function body.


func _on_button_4_pressed():
	choicemade()
	$Panel/RichTextLabel.text = "Outcome"
	pass # Replace with function body.


func _on_exit_button_pressed():
	get_tree().change_scene_to_file("res://caravanscreen/caravan.tscn")
