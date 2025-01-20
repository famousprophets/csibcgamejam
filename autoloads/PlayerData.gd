extends Node

var playerCharPath:String

enum ClassChoice {
	Knight,
	Peasant,
	Poacher,
	Viking
}
var Class = ClassChoice.Peasant

func classassign(x):
	if x == "Peasant":
		hp+=5
		defense+=2
		attack-=1
		max_hp+=5
	elif x == "Knight":
		defense-=2
		attack=1

var hp : int = 10
var max_hp : int = 10
var level = 0
var attack : int = 0
var defense : int = 0
var deathchance : int = 25 - (defense * 5)
var foodconsumption : int = max_hp / 3
var food : int = 0
var morale : int = 0
var injured : int = 0
var gold : int = 0
var horses = 2
var caravanspeed = (horses / 4) * 25
var onfoot = false
var time = 0

#distance to travel to the castle is 500 miles, 

func cantmove():
	if horses > 3 && not onfoot:
		caravanspeed = (horses / 4) * 25
	else: 
		caravanspeed = 0
func _onready():
	cantmove()

@export var speed = 0
@export var damage = 0
@export var image: Texture
