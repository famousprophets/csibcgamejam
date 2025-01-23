extends Control
var fight = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/ExitButton.hide()
	Travelmanager.locationstraveled +=1    #all this stuff here just makes the game progress whenever you reach a choice location.
	Travelmanager.hordedist +=20             #dont mess with it but if you rlly want to tell me what ur tryna do and ill see if it can be easily implemented
	Travelmanager.disttravel += PlayerData.caravanspeed  # but yea otherwise dont worry abt this
	
	$Panel/RichTextLabel.text = "You hear footsteps and some scurrying noises. You tell everyone to stay put, you and the remaining soldiers you have investigate. Somewhere near the path you see a shadowy creature eating a deer. But it hasnt spotted you yet." #write whats happening in the scenario here.
	$Panel/HBoxContainer/Button.text = "Sneak attack" #input text for the choices
	$Panel/HBoxContainer/Button2.text = "leave it alone and crouch away quietly"
	$Panel/HBoxContainer/Button3.text = "wait until its done"
	$Panel/HBoxContainer/Button4.text = "run away"

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
	$Panel/RichTextLabel.text = "you draw your weapon quietly and ambush it" #write the outcome of the scenario here
	PlayerData.ambush = true 
	fight = true 


func _on_button_2_pressed():
	choicemade()
	$Panel/RichTextLabel.text = "You and your group crouch away quietly"



func _on_button_3_pressed():
	choicemade()
	$Panel/RichTextLabel.text = "the creature sensed it was being watched. It suddenly looks towards you and charges"
	fight = true


func _on_button_4_pressed():
	choicemade()
	$Panel/RichTextLabel.text = "The creature heard the footsteps of your men and begins charging you, you have no choice but to fight back"
	fight = true 

func _on_exit_button_pressed():
	if fight == true  or PlayerData.ambush == true :
		get_tree().change_scene_to_file("res://battles/striderencounter.tscn")
	else:
		get_tree().change_scene_to_file("res://caravanscreen/caravan.tscn")



	#if you want the scenario to end with a fight, just put in fightscene where carvanscreen/caravan.tscn is
	#and describe in a comment or over discord what enemies you want to appear in that fight scene 
