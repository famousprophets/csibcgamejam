extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/ExitButton.hide()
	Travelmanager.locationstraveled +=1    #all this stuff here just makes the game progress whenever you reach a choice location.
	Travelmanager.hordedist +=20             #dont mess with it but if you rlly want to tell me what ur tryna do and ill see if it can be easily implemented
	Travelmanager.disttravel += PlayerData.caravanspeed  # but yea otherwise dont worry abt this
	
	$Panel/RichTextLabel.text = "You see a blind man on the ground begging for some money" #write whats happening in the scenario here.
	$Panel/HBoxContainer/Button.text = "Give him one gold" #input text for the choices
	$Panel/HBoxContainer/Button2.text = "Rob him"
	$Panel/HBoxContainer/Button3.text = "Invite him to the carriage"
	$Panel/HBoxContainer/Button4.text = "Ignore"

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
	$Panel/RichTextLabel.text = "You gave the blind man one gold" #write the outcome of the scenario here
	PlayerData.gold -= 1


func _on_button_2_pressed():
	choicemade()
	if PlayerData.isevil == true: 
		$Panel/RichTextLabel.text = "You rob the blind man of all his money"
		PlayerData.gold += 1
	else: 
		$Panel/RichTextLabel.text = "You rob the blind man of all his money. HE'S. SO. RICH. he was hoarding a wealth of an entire (One) gold coin. Also your soldiers hate you now. \n\n+1 gold"
		PlayerData.gold+=1
		PlayerData.morale-=10



func _on_button_3_pressed():
	choicemade()
	$Panel/RichTextLabel.text = "You invite him over to the carriage. It turns out he used to be a soldier, and while he can't fight in your ranks, he teaches your men some tactics defensive tactics in exchange for joining the caravan"
	if PlayerData.defense < 8:
		PlayerData.defense+=1
	PlayerData.morale += 4

func _on_button_4_pressed():
	choicemade()
	$Panel/RichTextLabel.text = "You ignore him and continue on with your journey"


func _on_exit_button_pressed():
		get_tree().change_scene_to_file("res://caravanscreen/caravan.tscn")



	#if you want the scenario to end with a fight, just put in fightscene where carvanscreen/caravan.tscn is
	#and describe in a comment or over discord what enemies you want to appear in that fight scene 
