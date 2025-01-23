extends HBoxContainer
#
#
## Called when the node enters the scene tree for the first time.
#func _ready():
	#enemyfetch(0,0,0,0)
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
##0 for bandit 1 wendigo 2 strider 3 worm 4 for nothing
#var attack
#var health
#var dodge
#var bandits
#var wendigos
#var striders
#var worms
#var level

#func enemyfetch(enemy1,enemy2,enemy3,enemy4):
	#var array = [enemy1, enemy2, enemy3, enemy4]
	#var en1
	#var en2
	#var en3
	#var en4
	#var encount = 0
	#for item in array:
		#if item == 0:
			#get_node("enemy1")
				#en1="b"
			#bandits+=1
			#encount+=1
		#elif item == 1:
			#wendigos+=1
			#encount+=1
		#elif item == 2:
			#striders +=1
			#encount+=1
		#elif item == 3:
			#worms+=1
			#encount+=1
		#elif item == 4:
			#pass
	#
