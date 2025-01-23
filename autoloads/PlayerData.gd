extends Node

var playerCharPath:String

enum ClassChoice {
	Knight,
	Peasant,
	Poacher,
	Barbarian
}
var Class = "Peasant"
var ClassTexture = load("res://images/Barbarian.png")

func classassign(x):
	if x == "Peasant":
		max_hp +=5
		hp+=5
		defense+=1
		attack-=1
		charisma+=2
		morale+=2
		ClassTexture = load("res://images/peasant.png")
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
		ClassTexture = load("res://images/knight.png")
	elif x == "Poacher":
		defense+=2
		forage+=2
		ClassTexture = load("res://images/Poacher.png")
	elif x == "Barbarian":
		isevil = true
		defense-=5
		veterans+=5
		gold+=3
		teaching +=6
		authority +=3
		ClassTexture = load("res://images/Barbarian.png")
	elif x == "devcheat":
		defense+=20
		gold+=999
		max_hp=300
		hp=300
		teaching += 18
		charisma += 10
		authority += 10
		horses += 4
		ClassTexture = load("res://battles/A_Smile_of_Betrayal.png")
var bittered = false

var hp : int = 30 #Represents the number of carvan members that are uninjured
var max_hp : int = 30 #Represents the number of carvan members you have
var veterans = 0 #veterans just deal as much damage as 2 regular soldiers
var attack : int = 0.01 #increases or decreases attack damage by 5% overall. increase or decrease sparingly
var defense : int = 0 #increases or decreases rate of death for wounded soldiers by 5%. increase or decrease sparingly
var teaching = 2 #increases chance of soldiers becoming veterans by 5%
var levelupchance = teaching * 5
var deathchance : int = 25 - (defense * 5)
var foodconsumption : int = max_hp / 3
var food : int = 0 #amount of food. for every 3 members of the caravan, 1 food is consumed per event. keep that in mind when giving the player food
var morale : int = 4 #morale slightly increases combat stats and the outcomes of some events. max morale is 10
var injured : int = 0 
var gold : int = 999 #coins are high value so dont grant too much. items cost from 1-7 gold, the most expensive being permanent upgrades
var horses = 4 #increases caravan speed if you have above 4
var caravanspeed = (horses / 4) * 25
var onfoot = false
var time = 0
var charisma = 1 
var authority = 1 #authority and charisma should be checked on scenarios using persuasion. these stats are determined on character creation
var forage = 1 #players skill in foraging food passively. increase sparingly
var isevil = false #true if the player picks barbarian. for evil actions, evil characters shouldnt get a morale hit
var foodgather = forage * 4
var ambush = false
var truedamage = hp + attack
var healamount = 4

#distance to travel to the castle is 500 miles

func cantmove():
	if horses >= 3 && not onfoot:
		caravanspeed = (horses / 4) * 25
	else: 
		caravanspeed = 0
func _onready():
	cantmove()
func _process(delta: float) -> void:
	if gold < 0:
		gold = 0
	if food < 0:
		food = 0
	if morale < 0:
		morale = 0
	truedamage = hp + attack
	caravanspeed = (horses / 4) * 25
	deathchance = 25 - (defense * 5)
	levelupchance = teaching * 5
	injured = max_hp - hp
	if hp > max_hp:
		hp = max_hp
	if Pinventory.medicalsupplies > 0:
		healamount = healamount + Pinventory.medicalsupplies

@export var speed = 0
@export var damage = 0
@export var image: Texture
