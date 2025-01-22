extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/ExitButton.hide()
	Travelmanager.locationstraveled +=1    #all this stuff here just makes the game progress whenever you reach a choice location.
	Travelmanager.hordedist +=20             #dont mess with it but if you rlly want to tell me what ur tryna do and ill see if it can be easily implemented
	Travelmanager.disttravel += PlayerData.caravanspeed  # but yea otherwise dont worry abt this
	
	$Panel/RichTextLabel.text = "Text" #write whats happening in the scenario here.
	$Panel/HBoxContainer/Button.text = "Choice 1" #input text for the choices
	$Panel/HBoxContainer/Button2.text = "Choice 2"
	$Panel/HBoxContainer/Button3.text = "Choice 3"
	$Panel/HBoxContainer/Button4.text = "Choice 4"

func _process(delta):
	pass #doesnt do anything jus leave it alone

func choicemade(): #this just hides all the choice buttons and shows the exit scenario button. dont worry abt it
	$Panel/HBoxContainer/Button.hide()
	$Panel/HBoxContainer/Button2.hide()
	$Panel/HBoxContainer/Button3.hide()
	$Panel/HBoxContainer/Button4.hide()
	$Panel/ExitButton.show()

func _on_button_pressed(): 
	choicemade()
	$Panel/RichTextLabel.text = "Outcome" #write the outcome of the scenario here
	pass # Replace pass with the stat changes that occur


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


func _on_exit_button_pressed(): #this just takes you back to the caravan screen. if you want an event to take you somewhere else just ask me
	get_tree().change_scene_to_file("res://caravanscreen/caravan.tscn") 
	#if you want the scenario to end with a fight, just put in fightscene where carvanscreen/caravan.tscn is
	#and describe in a comment or over discord what enemies you want to appear in that fight scene z
