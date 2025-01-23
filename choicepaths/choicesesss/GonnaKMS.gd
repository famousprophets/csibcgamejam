extends Control
var fight = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/ExitButton.hide()
	Travelmanager.locationstraveled +=1    #all this stuff here just makes the game progress whenever you reach a choice location.
	Travelmanager.hordedist +=20             #dont mess with it but if you rlly want to tell me what ur tryna do and ill see if it can be easily implemented
	Travelmanager.disttravel += PlayerData.caravanspeed  # but yea otherwise dont worry abt this
	
	$Panel/RichTextLabel.text = "A bandit threatens to rob you of your resources. He's armed but he's only one person. A few of your caravan members cackle at how ridiculously outnumbered he is." #write whats happening in the scenario here.
	$Panel/HBoxContainer/Button.text = "Let him rob you" #input text for the choices
	$Panel/HBoxContainer/Button2.text = "Bribe"
	$Panel/HBoxContainer/Button3.text = "Fight"
	$Panel/HBoxContainer/Button4.text = "Flee"

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
	$Panel/RichTextLabel.text = "You choose to let him rob you. He takes some of your resources and runs off. Your troops think you're an idiot" #write the outcome of the scenario here
	PlayerData.food -= 20
	PlayerData.oilflask -=2
	PlayerData.bandage -=4
	PlayerData.morale -=5 


func _on_button_2_pressed():
	choicemade()
	$Panel/RichTextLabel.text = "You chose to bribe the bandit. He accepts it then runs off without laying a finger on you, your crew and your resources"
	PlayerData.gold -=1 


func _on_button_3_pressed():
	choicemade()
	$Panel/RichTextLabel.text = "You flash a sword at the bandit, and he begins cackling. The cackling becomes guttural and disgusting, and the bandits limbs split like plant stalks. Before you can even process whats happening, the bandit has transformed into a gargantuan wendigo."
	fight = true 


func _on_button_4_pressed():
	choicemade()
	if PlayerData.horses >= 2:
		$Panel/RichTextLabel.text = "You successfully fled the bandit"
	else:
		$Panel/RichTextLabel.text = "You've unsuccessfully fled the bandit and screwed up big time. You flash a sword at the bandit, and he begins cackling. The cackling becomes guttural and disgusting, and the bandits limbs split like plant stalks. Before you can even process whats happening, the bandit has transformed into a gargantuan wendigo."
		fight = true

func _on_exit_button_pressed():
	if fight == true:
		get_tree().change_scene_to_file("res://battle_scene.tscn")
	else:
		get_tree().change_scene_to_file("res://caravanscreen/caravan.tscn")



	#if you want the scenario to end with a fight, just put in fightscene where carvanscreen/caravan.tscn is
	#and describe in a comment or over discord what enemies you want to appear in that fight scene 
