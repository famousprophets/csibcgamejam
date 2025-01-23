extends Control
var fight = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/ExitButton.hide()
	Travelmanager.locationstraveled +=1    #all this stuff here just makes the game progress whenever you reach a choice location.
	Travelmanager.hordedist +=20             #dont mess with it but if you rlly want to tell me what ur tryna do and ill see if it can be easily implemented
	Travelmanager.disttravel += PlayerData.caravanspeed  # but yea otherwise dont worry abt this
	
	$Panel/RichTextLabel.text = "As you navigate an unruly road, a massive creature suddenly pounces on one of the carvan members from the treeline!" #write whats happening in the scenario here.
	$Panel/HBoxContainer/Button.text = "fend off the creature and help the soldier" #input text for the choices
	$Panel/HBoxContainer/Button2.text = "flee and leave the soldier behind"

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
	$Panel/RichTextLabel.text = "You draw your sword and rush to fend the creature off" #write the outcome of the scenario here
	fight = true 


func _on_button_2_pressed():
	choicemade()
	$Panel/RichTextLabel.text = "You fled the scene but most of your caravaneers are not happy with your decision.\n-"
	PlayerData.max_hp -= 1
	PlayerData.morale -= 4 




func _on_exit_button_pressed():
	if fight == true:
		get_tree().change_scene_to_file("res://battles/wormencounter.tscn")
	else:
		get_tree().change_scene_to_file("res://caravanscreen/caravan.tscn")

	#if you want the scenario to end with a fight, just put in fightscene where carvanscreen/caravan.tscn is
	#and describe in a comment or over discord what enemies you want to appear in that fight scene z
