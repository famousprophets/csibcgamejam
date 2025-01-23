extends Control
var fight = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/ExitButton.hide()
	Travelmanager.locationstraveled +=1    #all this stuff here just makes the game progress whenever you reach a choice location.
	Travelmanager.hordedist +=20             #dont mess with it but if you rlly want to tell me what ur tryna do and ill see if it can be easily implemented
	Travelmanager.disttravel += PlayerData.caravanspeed  # but yea otherwise dont worry abt this
	
	$Panel/RichTextLabel.text = "You and your group hears something. Hissing and snarling. You see the branches of trees suddenly move. Something is watching you and the group" #write whats happening in the scenario here.
	$Panel/HBoxContainer/Button.text = "Draw your sword and get ready for a fight" #input text for the choices
	$Panel/HBoxContainer/Button2.text = "Flee"
	$Panel/HBoxContainer/Button3.text = "wait and see what happens"
	

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
	$Panel/RichTextLabel.text = "A Strider jumps from a tree in front of you, fully intent on killing you and the group. Since you're already prepared by drawing your sword, you get the first turn" #write the outcome of the scenario here
	PlayerData.ambush = true 
	fight = true 


func _on_button_2_pressed():
	choicemade()
	if PlayerData.horses >= 5:
		$Panel/RichTextLabel.text = "You and your group sucsessfully fleed"
	
	else: 
		$Panel/RichTextLabel.text = "A Strider jumps from the tree's in front of you before you could escape, you have no choice but to battle"
		fight = true 



func _on_button_3_pressed():
	choicemade()
	$Panel/RichTextLabel.text = "A Strider jumps from the tree's in front of you"
	fight = true 





func _on_exit_button_pressed():
	if fight == true:
		get_tree().change_scene_to_file("res://battle_scene.tscn")
	else:
		get_tree().change_scene_to_file("res://caravanscreen/caravan.tscn")



	#if you want the scenario to end with a fight, just put in fightscene where carvanscreen/caravan.tscn is
	#and describe in a comment or over discord what enemies you want to appear in that fight scene 
