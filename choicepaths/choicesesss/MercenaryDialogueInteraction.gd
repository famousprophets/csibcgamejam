extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/ExitButton.hide()
	Travelmanager.locationstraveled +=1    #all this stuff here just makes the game progress whenever you reach a choice location.
	Travelmanager.hordedist +=20             #dont mess with it but if you rlly want to tell me what ur tryna do and ill see if it can be easily implemented
	Travelmanager.disttravel += PlayerData.caravanspeed  # but yea otherwise dont worry abt this
	
	$Panel/RichTextLabel.text = "A mercenary band cuts ahead of your path. Their leader seem to have long white silver hair and blue eyes. The leader asks you where you're headed to (pick your dialogue)" #write whats happening in the scenario here.
	$Panel/HBoxContainer/Button.text = "The only safe castle there is. A bunch of monsters are breaking through" #input text for the choices
	$Panel/HBoxContainer/Button2.text = "Who are you and what do you want?"
	$Panel/HBoxContainer/Button3.text = "Escorting this caravan to safety, Thats all."
	$Panel/HBoxContainer/Button4.text = "Have you come to rob us?"

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
	$Panel/RichTextLabel.text = "Leader: I see. Well safe travels then! and do be careful up ahead. Heard some strange noises" #write the outcome of the scenario here
	PlayerData.charisma +=2 


func _on_button_2_pressed():
	choicemade()
	$Panel/RichTextLabel.text = "Leader: Just a mercenary band, nothing else. Just checking since you have civilians with you"
	

func _on_button_3_pressed():
	choicemade()
	$Panel/RichTextLabel.text = "Leader: So I see. well just making sure. Nothing of your concern"



func _on_button_4_pressed():
	choicemade()
	$Panel/RichTextLabel.text = "Leader: Rob you? Why would we rob you? We're just making sure if you and you're caravan is alright. Anyways we're off. "

func _on_exit_button_pressed():
		get_tree().change_scene_to_file("res://caravanscreen/caravan.tscn")



	#if you want the scenario to end with a fight, just put in fightscene where carvanscreen/caravan.tscn is
	#and describe in a comment or over discord what enemies you want to appear in that fight scene 
