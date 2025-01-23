extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _enter_tree() -> void:
	%horsebitters.text = "Use Horse Bitters? : " + str(Pinventory.horsebitters)
	%assortedgames.text = "Entertain caravan? : " + str(Pinventory.assortedgames) 
	$TextureRect4.texture = PlayerData.ClassTexture
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $AudioStreamPlayer2D.playing == false:
		$AudioStreamPlayer2D.play()
	pass


func _on_nextloc_pressed():
	if PlayerData.forage >= 1:
		PlayerData.food += 5
	if Pinventory.wolf >=1:
		PlayerData.morale += PlayerData.wolf
	
	if PlayerData.food >= PlayerData.foodconsumption:
		Travelmanager.findnextlocation()
	else: 
		$RichTextLabel.text = "Your caravan ran out of food and had to eat a horse for sustenance. Next time, you should forage before this happens."
		PlayerData.food+=20
		await get_tree().create_timer(5).timeout
		$RichTextLabel.text = ""
func _on_forage_pressed() -> void:
	Travelmanager.hordedist += 15
	PlayerData.food += (PlayerData.hp / 2)
	PlayerData.hp += PlayerData.healamount


func _on_merch_pressed():
	Travelmanager.hordedist += 10
	get_tree().change_scene_to_file("res://shopv_2.tscn")


func _on_horsebitters_pressed():
	$RichTextLabel.text = "Your horses absolutely hate the smell of those bitters. But it does make them run very fast. Travel cost to reach the next location is halved.\ncurrently bugged so this just gives you distance immediately as a fix"
	await get_tree().create_timer(8).timeout
	Travelmanager.disttravel + PlayerData.caravanspeed
	$RichTextLabel.text = ""
	PlayerData.bittered = true
	pass # Replace with function body.
