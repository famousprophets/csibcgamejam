extends Control
var fight = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/ExitButton.hide()
	Travelmanager.locationstraveled +=1    #all this stuff here just makes the game progress whenever you reach a choice location.
	Travelmanager.hordedist +=20             #dont mess with it but if you rlly want to tell me what ur tryna do and ill see if it can be easily implemented
	Travelmanager.disttravel += PlayerData.caravanspeed  # but yea otherwise dont worry abt this
	
	$Panel/RichTextLabel.text = "A group of bandits demand half of your resources. What do you do?" #write whats happening in the scenario here.
	$Panel/HBoxContainer/Button.text = "Draw your weapon and fight them" #input text for the choices
	$Panel/HBoxContainer/Button2.text = "Flee"

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
	$Panel/RichTextLabel.text = "you and/or any remaining soldiers you have draw their swords to defend themselves" #write the outcome of the scenario here
	fight = true 


func _on_button_2_pressed():
	choicemade()
	if PlayerData.horses>=4: 
		$Panel/RichTextLabel.text = "You and your group successfully fled the bandits"
	
	else: 
			$Panel/RichTextLabel.text = "You and your group failed to flee. You have no choice but to fight"
			fight = true 





func _on_exit_button_pressed():
	if fight == true:
		get_tree().change_scene_to_file("res://battles/banditencounter.tscn")
	else:
		get_tree().change_scene_to_file("res://caravanscreen/caravan.tscn")


	#if you want the scenario to end with a fight, just put in fightscene where carvanscreen/caravan.tscn is
	#and describe in a comment or over discord what enemies you want to appear in that fight scene 
