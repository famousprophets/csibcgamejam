extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/ExitButton.hide()
	Travelmanager.locationstraveled +=1    #all this stuff here just makes the game progress whenever you reach a choice location.
	Travelmanager.hordedist +=20             #dont mess with it but if you rlly want to tell me what ur tryna do and ill see if it can be easily implemented
	Travelmanager.disttravel += PlayerData.caravanspeed  # but yea otherwise dont worry abt this
	
	$Panel/RichTextLabel.text = "As you are walking through the road you then see goku (pick your dialogue)" #write whats happening in the scenario here.
	$Panel/HBoxContainer/Button.text = "Hi goku" #input text for the choices
	$Panel/HBoxContainer/Button2.text = "ignore goku"


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
	$Panel/RichTextLabel.text = "Goku: Hi its me goku! good luck on your journey!\n\nyou wake up from a nap. you feel invigorated." #write the outcome of the scenario here
	PlayerData.attack+=1


func _on_button_2_pressed():
	choicemade()
	$Panel/RichTextLabel.text = "Goku looks disappointed. You wake up from a nap and realize your body is disintegrating. haha jk ur fine lol"




func _on_exit_button_pressed():
		get_tree().change_scene_to_file("res://caravanscreen/caravan.tscn")



	#if you want the scenario to end with a fight, just put in fightscene where carvanscreen/caravan.tscn is
	#and describe in a comment or over discord what enemies you want to appear in that fight scene 
