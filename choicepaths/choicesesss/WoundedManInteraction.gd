extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/ExitButton.hide()
	Travelmanager.locationstraveled +=1    #all this stuff here just makes the game progress whenever you reach a choice location.
	Travelmanager.hordedist +=20             #dont mess with it but if you rlly want to tell me what ur tryna do and ill see if it can be easily implemented
	Travelmanager.disttravel += PlayerData.caravanspeed  # but yea otherwise dont worry abt this
	
	$Panel/RichTextLabel.text = "You see a wounded man on the road" #write whats happening in the scenario here.
	$Panel/HBoxContainer/Button.text = "give him some bandages" #input text for the choices
	$Panel/HBoxContainer/Button2.text = "Put him out of his misery"
	$Panel/HBoxContainer/Button3.text = "Offer to Invite him"
	$Panel/HBoxContainer/Button4.text = "ignore him"

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
	$Panel/RichTextLabel.text = "You gave the man some bandages, he is grateful and in return he gives you something in return as payment" #write the outcome of the scenario here
	PlayerData.gold+= 1


func _on_button_2_pressed():
	choicemade()
	$Panel/RichTextLabel.text = "You decide to draw your sword and stab him through his head so he can suffer no more"



func _on_button_3_pressed():
	choicemade()
	$Panel/RichTextLabel.text = "You offer to invite him. He then takes refuge in your caravan while the rest of the villagers nurse him back to health. Eventually he becomes a soldier for the caravan"
	PlayerData.max_hp += 1
	PlayerData.hp+=1


func _on_button_4_pressed():
	choicemade()
	if PlayerData.iseveil == true:
		$Panel/RichTextLabel.text = "You've ignored the wounded man and continue on"
	else: 
		$Panel/RichTextLabel.text = "The members of your caravan watch the man die an agonizing and painful death"
		PlayerData.morale -= 3


func _on_exit_button_pressed():
		get_tree().change_scene_to_file("res://caravanscreen/caravan.tscn")



	#if you want the scenario to end with a fight, just put in fightscene where carvanscreen/caravan.tscn is
	#and describe in a comment or over discord what enemies you want to appear in that fight scene 
