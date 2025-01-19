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

var peasant 
var hp : int = 10
var max_hp : int = 10
var level = 0
var attack : int = 0
var defense : int = 0


@export var speed = 0
@export var damage = 0
@export var image: Texture
