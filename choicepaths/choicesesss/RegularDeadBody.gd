extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/ExitButton.hide()
	Travelmanager.locationstraveled +=1    #all this stuff here just makes the game progress whenever you reach a choice location.
	Travelmanager.hordedist +=20             #dont mess with it but if you rlly want to tell me what ur tryna do and ill see if it can be easily implemented
	if PlayerData.bittered == true:
		Travelmanager.disttravel += (PlayerData.caravanspeed) * 2
	else:
		Travelmanager.disttravel += PlayerData.caravanspeed  
	
	$Panel/RichTextLabel.text = "you spot a dead body on the side of the road" #write whats happening in the scenario here.
	$Panel/HBoxContainer/Button.text = "Investigate" #input text for the choices
	$Panel/HBoxContainer/Button2.text = "Ignore"


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
	$Panel/RichTextLabel.text = "You investigate the body and found some valuables in its pockets" #write the outcome of the scenario here
	PlayerData.food += 5
	PlayerData.medicalsupplies += 1


func _on_button_2_pressed():
	choicemade()
	$Panel/RichTextLabel.text = "You decided to ignore the dead body"





func _on_exit_button_pressed():
		get_tree().change_scene_to_file("res://caravanscreen/caravan.tscn")



	#if you want the scenario to end with a fight, just put in fightscene where carvanscreen/caravan.tscn is
	#and describe in a comment or over discord what enemies you want to appear in that fight scene 
