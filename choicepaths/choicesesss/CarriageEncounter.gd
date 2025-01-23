extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/ExitButton.hide()
	Travelmanager.locationstraveled +=1    #all this stuff here just makes the game progress whenever you reach a choice location.
	Travelmanager.hordedist +=20             #dont mess with it but if you rlly want to tell me what ur tryna do and ill see if it can be easily implemented
	Travelmanager.disttravel += PlayerData.caravanspeed  # but yea otherwise dont worry abt this
	
	$Panel/RichTextLabel.text = "You spot a carriage carrying a sizeable group of people. They seem wealthy. You could rob them, if you think its worth it." #write whats happening in the scenario here.
	$Panel/HBoxContainer/Button.text = "Rob the carriage" #input text for the choices
	$Panel/HBoxContainer/Button2.text = "Ignore and continue on"
	$Panel/HBoxContainer/Button3.text = ""
	$Panel/HBoxContainer/Button4.text = ""

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
	if PlayerData.isevil == true && PlayerData.authority >= 3:
		$Panel/RichTextLabel.text = "You pillage the carriage, and the terrified family doesn't resist. They have seemingly given up. As your caravan members carry the loot off, one of the carriage hands chucks a lit fire flask, killing two of your men before anybody can react. Your caravaneers quickly stab the man, and leave the dead caravan members in a shallow grave. \n\n+6 gold\n+20 food\n+3 Bandage" #write the outcome of the scenario here
		PlayerData.gold += 6
		PlayerData.food +=20
		PlayerData.bandage += 3
		PlayerData.max_hp-=2
	else: 
		$Panel/RichTextLabel.text = "The carvavan members reluctantly rob the carriage. You leave the family some scraps, but they're likely going to die on their way to the castle.\n\n+6 gold\n+14 food\n+Oil flask\n+2 Bandage\n-4 Morale"
		PlayerData.gold += 6
		PlayerData.food +=14
		Pinventory.oilflask +=1
		Pinventory.bandage += 2
		PlayerData.morale-=4
func _on_button_2_pressed():
	choicemade()
	$Panel/RichTextLabel.text = "You ignore the carriage to focus on the journey ahead"




func _on_exit_button_pressed():
		get_tree().change_scene_to_file("res://caravanscreen/caravan.tscn")



	#if you want the scenario to end with a fight, just put in fightscene where carvanscreen/caravan.tscn is
	#and describe in a comment or over discord what enemies you want to appear in that fight scene 
