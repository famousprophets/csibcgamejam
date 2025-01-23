extends Label

func _process(_delta):
	var hp = PlayerData.hp
	var inj = PlayerData.max_hp - PlayerData.hp
	var gold = PlayerData.gold
	var food = PlayerData.food
	var morale = PlayerData.morale
	var cspeed = PlayerData.caravanspeed
	var hordespeed : String
	if PlayerData.caravanspeed < 25:
		hordespeed = "Catching up!!!"
	elif PlayerData.caravanspeed > 25:
		hordespeed = "Falling Behind..."
	else:
		hordespeed = "Same as yours."
	var red = Color(1.0,0.0,0.0,1.0)
	%"Stat Display".text = "Uninjured Soldiers:" + str(hp) + "\nInjured Soldiers: " + str(inj) + "\nGold: " + str(gold) + "\nFood Supply: " + str(food) + "\n Morale: " + str(morale) + " / 10\nCaravan Speed: Roughly" + str(cspeed) + " miles per day\nHorde Speed: " + hordespeed + "\nDays to castle: " + str(17-Travelmanager.locationstraveled)
	if Travelmanager.disttravel - Travelmanager.hordedist <= 25:
		%hordelabel.text = "The horde is right behind you!!"
		%hordelabel.label_settings.font_color = red
	elif Travelmanager.disttravel - Travelmanager.hordedist >= 25 && Travelmanager.disttravel <=50:
		%hordelabel.text = "The horde is roughly a day away."
	elif Travelmanager.disttravel - Travelmanager.hordedist >= 51 && Travelmanager.disttravel <=100:
		%hordelabel.text = "Rest easy. Your scouts report the horde is several days away."
	elif Travelmanager.disttravel - Travelmanager.hordedist >= 101 && Travelmanager.disttravel <=200:
		%hordelabel.text = "Your scouts see no traces of the horde. You won't have to worry about them for a while."
	await get_tree().create_timer(1.0).timeout
