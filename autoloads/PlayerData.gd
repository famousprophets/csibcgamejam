extends Node

var playerCharPath:String

enum ClassChoice {
	Knight,
	Peasant,
	Poacher,
	Barbarian
}
var Class = ClassChoice.Peasant

func classassign(x):
	if x == "Peasant":
		max_hp +=5
		hp+=5
		defense+=1
		attack-=1
		charisma+=2
		morale+=2
	elif x == "Knight":
		defense-=3
		attack+=1
		veterans+=3
		max_hp+=3
		hp+=3
		morale+=2
		gold+=5
		authority+=2
		teaching +=4
	elif x == "Poacher":
		defense+=2
		forage+=2
	elif x == "Barbarian":
		isevil = true
		defense-=5
		veterans+=5
		gold+=3
		teaching +=6
		authority +=3
	elif x == "devcheat":
		defense+=20
		gold+=999
		max_hp=300
		hp=300
		teaching += 18
		charisma += 10
		authority += 10
		horses += 4

var hp : int = 30
var max_hp : int = 30
var veterans = 0
var attack : int = 0
var defense : int = 0
var teaching = 2
var levelupchance = teaching * 5
var deathchance : int = 25 - (defense * 5)
var foodconsumption : int = max_hp / 3
var food : int = 0
var morale : int = 4
var injured : int = 0
var gold : int = 0
var horses = 4
var caravanspeed = (horses / 4) * 25
var onfoot = false
var time = 0
var charisma = 1
var authority = 1
var forage = 1
var isevil = false
var foodgather = forage * 4

#distance to travel to the castle is 500 miles, 

func cantmove():
	if horses >= 3 && not onfoot:
		caravanspeed = (horses / 4) * 25
	else: 
		caravanspeed = 0
func _onready():
	cantmove()

@export var speed = 0
@export var damage = 0
@export var image: Texture
