extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/ExitButton.hide()
	Travelmanager.locationstraveled +=1    #all this stuff here just makes the game progress whenever you reach a choice location.
	Travelmanager.hordedist +=20             #dont mess with it but if you rlly want to tell me what ur tryna do and ill see if it can be easily implemented
	Travelmanager.disttravel += PlayerData.caravanspeed  # but yea otherwise dont worry abt this
	
	$Panel/RichTextLabel.text = "You see a group of people in the road. They seem to be a mercenary company looking for contractors in exchange for some gold" #write whats happening in the scenario here.
	$Panel/HBoxContainer/Button.text = "Ask for 1 soldier (2 gold)" #input text for the choices
	$Panel/HBoxContainer/Button2.text = "Ask for 2 soldiers (4 gold)"
	$Panel/HBoxContainer/Button3.text = "Ask for 3 soldiers (6 gold)"
	$Panel/HBoxContainer/Button4.text = "decline offer and move on"

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
	$Panel/RichTextLabel.text = "You ask for one soldier. You pay them 2 gold" #write the outcome of the scenario here
	PlayerData.gold -= 2
	PlayerData.max_hp +=1
	PlayerData.hp+=1
func _on_button_2_pressed():
	choicemade()
	$Panel/RichTextLabel.text = "You ask for two soldiers. in exchange you pay them 4 gold"
	PlayerData.gold -= 4 
	PlayerData.max_hp +=2
	PlayerData.hp +=2

func _on_button_3_pressed():
	choicemade()
	$Panel/RichTextLabel.text = "You ask for three soldiers. In exchange you pay them 6 gold"
	PlayerData.gold -= 6 
	PlayerData.max_hp += 3
	PlayerData.hp += 3



func _on_button_4_pressed():
	choicemade()
	$Panel/RichTextLabel.text = "You decline the offer and move on with your journey"




func _on_exit_button_pressed():
		get_tree().change_scene_to_file("res://caravanscreen/caravan.tscn")



	#if you want the scenario to end with a fight, just put in fightscene where carvanscreen/caravan.tscn is
	#and describe in a comment or over discord what enemies you want to appear in that fight scene 
