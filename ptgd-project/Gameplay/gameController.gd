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
