extends Control
var fight = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/ExitButton.hide()
	Travelmanager.locationstraveled +=1    #all this stuff here just makes the game progress whenever you reach a choice location.
	Travelmanager.hordedist +=20             #dont mess with it but if you rlly want to tell me what ur tryna do and ill see if it can be easily implemented
	Travelmanager.disttravel += PlayerData.caravanspeed  # but yea otherwise dont worry abt this
	
	$Panel/RichTextLabel.text = "Theres a couple creatures feasting on a carcass in front of the road. Theres too many of them are blocking the way and you can't really flee from them" #write whats happening in the scenario here.
	$Panel/HBoxContainer/Button.text = "Tell your soldiers to rush and strike at them first" #input text for the choices
	$Panel/HBoxContainer/Button2.text = "Tell a soldier to distract them"


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
	$Panel/RichTextLabel.text = "You and your soldiers rush in and strike at the creatures first" #write the outcome of the scenario here
	PlayerData.ambush == true 
	fight = true 
	PlayerData.authority +=1 


func _on_button_2_pressed():
	choicemade()
	if PlayerData.authority >= 3:
		$Panel/RichTextLabel.text = "You tell a soldier to distract one by going in the forest and making some noise. He listens and does it. He then safely returns to the group, now that the creatures are distracted and have gone into the forest, its clear for you to continue."
	else: 
		$Panel/RichTextLabel.text = "He doesnt listen to you as he thinks its a bad idea. Time has been enough wasted because the creatures have sensed you"
		fight = true 





func _on_exit_button_pressed():
	if fight == true:
		get_tree().change_scene_to_file("res://battle_scene.tscn")
	else:
		get_tree().change_scene_to_file("res://caravanscreen/caravan.tscn")


	#if you want the scenario to end with a fight, just put in fightscene where carvanscreen/caravan.tscn is
	#and describe in a comment or over discord what enemies you want to appear in that fight scene 
