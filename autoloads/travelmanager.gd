extends Node

var locationstraveled = 0
var disttravel = 0
var hordedist = -35
var badluck = 0
var timescaught = 0
var difficulty = 0 #goes up as the player travels. mainly to keep track of roughly what our stats should look like
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _process(delta: float) -> void:
	if hordedist >= disttravel:
		get_tree().change_scene_to_file("res://hordescenes/hordeevent.tscn")

# at set amounts of locations traveled, caravan encounters a canon Always present location.
var rng = RandomNumberGenerator.new()

func findnextlocation():
	rng.randomize()
	
	if locationstraveled == 5:
		get_tree().change_scene_to_file("res://choicepaths/wolffind.tscn")
	if locationstraveled == 17:
		get_tree().change_scene_to_file("res://choicepaths/finale.tscn")
	elif badluck > 4:
		pass #good event
		badluck = 0
	elif PlayerData.food < 25:
		var ranloc = int(rng.randf_range(1,3))
		if ranloc == 1:
			get_tree().change_scene_to_file("res://choicepaths/food1.tscn")
		if ranloc == 2:
			get_tree().change_scene_to_file("res://choicepaths/food2.tscn")
		if ranloc == 3:
			randevent()
		
	elif PlayerData.max_hp < difficulty:
		var ranloc = int(rng.randf_range(1,3))
		if ranloc == 1:
			get_tree().change_scene_to_file("res://choicepaths/soldiers1.tscn")
		if ranloc == 2:
			get_tree().change_scene_to_file("res://choicepaths/soldiers2.tscn")
		if ranloc == 3:
			randevent()

	elif PlayerData.gold < (difficulty/2):
		var ranloc = int(rng.randf_range(1,3))
		if ranloc == 1:
			get_tree().change_scene_to_file("res://choicepaths/gold1.tscn")
		if ranloc == 2:
			get_tree().change_scene_to_file("res://choicepaths/gold2.tscn")
		if ranloc == 3:
			randevent()
	else:
		randevent()
func randevent():
	var ranloc = int(rng.randf_range(1,21))
	if ranloc == 1:
		get_tree().change_scene_to_file("res://choicepaths/blindpersonencounter.tscn")
	if ranloc == 2:
		get_tree().change_scene_to_file("res://choicepaths/banditgroup.tscn")
	if ranloc == 3:
		get_tree().change_scene_to_file("res://choicepaths/carriageencounter.tscn")
	if ranloc == 4:
			get_tree().change_scene_to_file("res://choicepaths/creatureattack.tscn")
	if ranloc == 5:
		get_tree().change_scene_to_file("res://choicepaths/creatureinterraction.tscn")
	if ranloc == 6:
		get_tree().change_scene_to_file("res://choicepaths/gkms.tscn")
	if ranloc == 7:
		get_tree().change_scene_to_file("res://choicepaths/gokuevent.tscn")
	if ranloc == 8:
		get_tree().change_scene_to_file("res://choicepaths/groupofcreatures.tscn")
	if ranloc == 9:
		get_tree().change_scene_to_file("res://choicepaths/mercc.tscn")
	if ranloc == 10:
		get_tree().change_scene_to_file("res://choicepaths/merccompany.tscn")
	if ranloc == 11:
		get_tree().change_scene_to_file("res://choicepaths/mercenarydialogueinteraction.tscn")
	if ranloc == 12:
		get_tree().change_scene_to_file("res://choicepaths/mfdoomslenderman.tscn")
	if ranloc == 13:
		get_tree().change_scene_to_file("res://choicepaths/pilgrimtrade.tscn")
	if ranloc == 14:
		get_tree().change_scene_to_file("res://choicepaths/regulardeadbody.tscn")
	if ranloc == 15:
		get_tree().change_scene_to_file("res://choicepaths/shapeshiftingbody.tscn")
	if ranloc == 16:
		get_tree().change_scene_to_file("res://choicepaths/striderevent.tscn")
	if ranloc == 17:
		get_tree().change_scene_to_file("res://choicepaths/swordsmanencounter.tscn")
	if ranloc == 18:
		get_tree().change_scene_to_file("res://choicepaths/trilowormevent.tscn")
	if ranloc == 19:
		get_tree().change_scene_to_file("res://choicepaths/wendigocounter2.tscn")
	if ranloc == 20:
		get_tree().change_scene_to_file("res://choicepaths/wendigoencounter1.tscn")
	if ranloc == 21:
		get_tree().change_scene_to_file("res://choicepaths/woundedmaninteraction.tscn")
