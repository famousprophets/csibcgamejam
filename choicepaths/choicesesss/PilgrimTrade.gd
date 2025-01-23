extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/ExitButton.hide()
	Travelmanager.locationstraveled +=1    #all this stuff here just makes the game progress whenever you reach a choice location.
	Travelmanager.hordedist +=20             #dont mess with it but if you rlly want to tell me what ur tryna do and ill see if it can be easily implemented
	if PlayerData.bittered == true:
		Travelmanager.disttravel += (PlayerData.caravanspeed) * 2
	else:
		Travelmanager.disttravel += PlayerData.caravanspeed    # but yea otherwise dont worry abt this
	
	$Panel/RichTextLabel.text = "You spot a pilgrim in the road. Seems like he's up for some trade" #write whats happening in the scenario here.
	$Panel/HBoxContainer/Button.text = "Give him (15) food for . in exchange for some literature" #input text for the choices
	$Panel/HBoxContainer/Button2.text = "give him a bandage in exchange for some Horse Bitters"
	$Panel/HBoxContainer/Button3.text = "Tell him a funny joke and leave"
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
	if PlayerData.food >= 5:
		$Panel/RichTextLabel.text = "You give him a random item, in exchange he gives you some gold" #write the outcome of the scenario here
		PlayerData.food -= 30 
	else: 
		$Panel/RichTextLabel.text = "You lack the sufficient materials for trade"


func _on_button_2_pressed():
	choicemade()
	if PlayerData.bandage >= 1:
		$Panel/RichTextLabel.text = "You give him a bandage, in exchange he gives you some horsebitters" #write the outcome of the scenario here
		PlayerData.food -= 1 
	else: 
		$Panel/RichTextLabel.text = "You lack the sufficient materials for trade"



func _on_button_3_pressed():
	choicemade()
	if PlayerData.charisma >= 3:
		$Panel/RichTextLabel.text = "He laughed at your joke and you went off on your own way"
		PlayerData.charisma +=2 
	else: 
		$Panel/RichTextLabel.text = "Your joke was ass and he didnt laugh at all. -100000000 aura"
		PlayerData.charisma -=1


func _on_button_4_pressed():
	choicemade()
	$Panel/RichTextLabel.text = "You decline to trade and continue on your journey"


func _on_exit_button_pressed():
		get_tree().change_scene_to_file("res://caravanscreen/caravan.tscn")



	#if you want the scenario to end with a fight, just put in fightscene where carvanscreen/caravan.tscn is
	#and describe in a comment or over discord what enemies you want to appear in that fight scene 
