class_name GameNode
extends Node2D

# Pile References
@export var drawPile: DeckNode
@export var coursePile: DeckNode
@export var discardPile: DeckNode

# Player References
@export var playerNode: Node2D
var players: Array[PlayerNode] = []
var activePlayer: int = 0

func _ready() -> void:
	# Allows for Z-Index Based Input (Only top item clicks) Throughout the game
	get_viewport().physics_object_picking_first_only = true
	get_viewport().physics_object_picking_sort = true
	
	# Grabs reference to as many players as given in the game
	# TODO | Can eventually have UI add the amount of players wanted prior
	for child in playerNode.get_children():
		if child is PlayerNode:
			players.append(child)
	linkDeckInteraction()

# INFO | Gives Player The Card
func linkDeckInteraction():
	drawPile.sgnl_drawCard.connect(players[activePlayer].givePlayerCard)
	coursePile.sgnl_drawCard.connect(players[activePlayer].givePlayerCard)
	discardPile.sgnl_drawCard.connect(players[activePlayer].givePlayerCard)
