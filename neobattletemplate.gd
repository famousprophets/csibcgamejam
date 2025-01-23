extends Control
var enemyalive = false
var enemyhealth = 0
var enemy1health = 20
var enemy2health = 70
var enemy3health = 35
var enemy4health = 50
var pdamage = 0
var enemy1dmg = 1
var enemy2dmg = 4
var enemy3dmg = 3
var enemy4dmg = 2
var handgonneshots = Pinventory.handgonne
var playerturns = 1
var turnsused = 0
var damagebonus = 0
var saved = 0 #number of saved dead soldiers
var wounded = 0
var dead = 0
# Called when the node enters the scene tree for the first time.
func _enter_tree():
	$BattleOverScreen.hide()
	%Character.texture = PlayerData.ClassTexture
	handgonneshots = Pinventory.handgonne
	$combatflavortext.text = "Your enemies study you like you're some sort of specimen."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var turns = 2
	if PlayerData.ambush == true:
		turns+=1
		PlayerData.ambush = false
	%battlestatus.text = "Soldiers: " + str(PlayerData.hp) + "\nInjured Soldiers: " + str(PlayerData.injured)
	if enemy1health <= 0:
		$CanvasLayer/HBoxContainer/Bandit.hide()
	if enemy2health <= 0:
		$CanvasLayer/HBoxContainer/Wendigo.hide()
	if enemy3health <= 0:
		$CanvasLayer/HBoxContainer/enemy3.hide()
	if enemy4health <= 0:
		$CanvasLayer/HBoxContainer/enemy4.hide()
	if enemy1health <= 0 && enemy2health <= 0 && enemy3health <= 0 && enemy4health <= 0:
		battlewon()
	if PlayerData.hp <= 0:
		get_tree().change_scene_to_file("res://game_over.tscn")
	if $AudioStreamPlayer2D.playing == false:
		$AudioStreamPlayer2D.play()

func battler():
	while enemyalive == true:
		if enemy1health <= 0 && enemy2health <= 0 && enemy3health <= 0 && enemy4health <=0:
			enemyalive == false
			break
		else:
			pass
		

func enemyturns():
	var totaldamage = 0
	await get_tree().create_timer(1).timeout
	if enemy1health > 0:
		totaldamage += enemy1dmg
	if enemy2health > 0:
		totaldamage += enemy2dmg
	if enemy3health > 0:
		totaldamage += enemy3dmg
	if enemy4health > 0:
		totaldamage += enemy4dmg
	$combatflavortext.text = "Your enemies clash with your soldiers, wounding " + str(totaldamage) + " of them."
	PlayerData.hp -= totaldamage
	wounded += totaldamage
	turnsused = 0

func _on_attack_pressed():
	if turnsused < playerturns:
		pdamage = PlayerData.truedamage + damagebonus
		if enemy1health > 0:
			enemy1health -= pdamage
			turnsused +=1
		elif enemy2health >0:
			enemy2health -= pdamage
			turnsused +=1
		elif enemy3health >0:
			enemy3health -= pdamage
			turnsused +=1
		elif enemy4health > 0:
			enemy4health -= pdamage
			turnsused +=1
		else:
			pass
		$combatflavortext.text = "Your soldiers charge the nearest enemy, dealing " + str(pdamage) + " damage"
		if turnsused == playerturns:
			enemyturns()
	
	
	
#func enemyreveal(x):
	#var attack
	#var health
	#if x == 0:
		#attack = 1
		#health = 20
	#elif x == 1:
		#attack = 4
		#health = 90
	#elif x == 2:
		#attack = 3
		#health = 15
		#dodge = 4
	#elif x == 3:
		#attack = 2
		#health = 50
	#elif x == 4:
		#health = 0
		#attack = 0
	#
	#while health >= 0:

#0 for bandit 1 wendigo 2 strider 3 worm 4 for nothing
var attack
var health
var dodge
var bandits
var wendigos
var striders
var worms


func enemyfetch(enemy1,enemy2,enemy3,enemy4):
	var array = [enemy1, enemy2, enemy3, enemy4]
	var count = 1
	for item in array:
		pass
	


func _on_item_pressed():
	$CanvasLayer/VBoxContainer/Panel/Panel.show()

func _on_flee_pressed():
	$combatflavortext.text = "Theres nowhere to flee to."
	pass # Replace with function body.
	

func _on_bandages_pressed():
	if Pinventory.bandage > 0:
		Pinventory.bandage -= 1
		saved += 1
		$combatflavortext.text = "A medic applies a bandage to a soldier."
	else:
		$combatflavortext.text = "Not enough item charges..."

func _on_lantern_pressed():
	if Pinventory.lantern > 0:
		damagebonus += 5
		Pinventory.lantern -= 1
		$combatflavortext.text = "The lantern burns bright, making it easier to hit your enemy."
	else:
		$combatflavortext.text = "Not enough item charges..."

func _on_oilflask_pressed():
	if Pinventory.oilflask > 0:
		enemy1health -=20
		enemy2health -=20
		enemy3health -=20
		enemy4health -=20
		Pinventory.oilflask -= 1
		$combatflavortext.text = "The flask explodes into a wall of flame as your enemies recoil."
	else:
		$combatflavortext.text = "Not enough item charges..."


func _on_handgonne_pressed():
	if handgonneshots > 0:
		enemy1health -=20
		enemy2health -=20
		enemy3health -=20
		enemy4health -=20
		handgonneshots -= 1
		$combatflavortext.text = "With a thundering boom, you spray shrapnel shards into your enemies."
		
	else:
		$combatflavortext.text = "Not enough item charges..."
func _on_back_pressed():
	$CanvasLayer/VBoxContainer/Panel/Panel.hide()

func battlewon():
	dead = (wounded / 4) - saved
	$BattleOverScreen.show()
	%BattleGains.text = "Of your " + str(wounded) + " wounded soldiers, " + str(dead) + " have died."
	PlayerData.max_hp-=dead


func _on_exit_button_pressed():
	get_tree().change_scene_to_file("res://caravanscreen/caravan.tscn")
