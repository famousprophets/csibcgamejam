extends Label

func _process(_delta):
	var hp = PlayerData.hp
	var inj = PlayerData.injured
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
	
	%"Stat Display".text = "Uninjured Soldiers:" + str(hp) + "\nInjured Soldiers: " + str(inj) + "\nGold: " + str(gold) + "\nFood Supply: " + str(food) + "\n Morale: " + str(morale) + " / 10\nCaravan Speed: Roughly" + str(cspeed) + " miles per day\nHorde Speed: " + hordespeed
	await get_tree().create_timer(1.0).timeout
