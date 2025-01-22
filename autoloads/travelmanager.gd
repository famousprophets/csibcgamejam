extends Node

var locationstraveled = 0
var disttravel = 0
var hordedist = 0
var badluck = 0
var timescaught = 0
var difficulty = 0 #goes up as the player travels. mainly to keep track of roughly what our stats should look like
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# at set amounts of locations traveled, caravan encounters a canon Always present location.
var rng = RandomNumberGenerator.new()

func findnextlocation():
	if locationstraveled == 5:
		pass
	if locationstraveled == 3:
		pass
	if locationstraveled == 9:
		pass
	elif badluck > 4:
		pass #good event
		badluck = 0
	elif PlayerData.food < 25:
		var ranloc = rng.randf_range(1,4)
		if ranloc == 1:
			pass #food granting location
		if ranloc == 2:
			pass #food granting location with ordeal
		if ranloc == 3:
			pass #randomgoodorneutralevent
		if ranloc == 4:
			pass #randombadevent
			badluck+=1
	elif PlayerData.max_hp < difficulty:
		var ranloc = rng.randf_range(1,4)
		if ranloc == 1:
			pass #random people granting location
		if ranloc == 2:
			pass #random people granting location with ordeal
		if ranloc == 3:
			pass #randomgoodorneutralevent
		if ranloc == 4:
			pass #randombadevent
			badluck+=1
	elif PlayerData.gold < (difficulty/2):
		var ranloc = rng.randf_range(1,4)
		if ranloc == 1:
			pass 
		if ranloc == 2:
			pass
		if ranloc == 3:
			pass
		if ranloc == 4:
			pass
			badluck+=1
	else:
		pass#random picked from all events
