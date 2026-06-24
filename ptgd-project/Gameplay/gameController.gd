class_name GameNode
extends Node2D

# UI References
@onready var playerIndexLabel: Label =  $"Canvas/UI/PlayerDetails/Index"
@onready var playerNameLabel: Label =  $"Canvas/UI/PlayerDetails/Name"

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
			child.isActive(false)
	setActivePlayer(activePlayer) # Gives Deck Interaction to player

# INFO | Temp function for changing through players
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("p"):
		setActivePlayer(cycleActivePlayer())

# INFO | Increments ActivePlayer through the player list
func cycleActivePlayer():
	var nextActivePlayer = activePlayer + 1
	if nextActivePlayer >= players.size(): nextActivePlayer = 0
	return nextActivePlayer

# INFO | Change Active Player to Given Index
func setActivePlayer(index: int):
	# RESET ORIGINAL
	breakDeckInteraction()
	players[activePlayer].isActive(false)
	
	# CHANGE PLAYER
	activePlayer = index
	
	# SETUP NEW
	players[activePlayer].isActive(true)
	linkDeckInteraction()
	
	# Update UI
	playerIndexLabel.text = "Player " + str(activePlayer + 1)
	playerNameLabel.text = players[activePlayer].playerName

# INFO | Gives Player The Card
func linkDeckInteraction():
	var decks: Array[DeckNode] = [drawPile, coursePile, discardPile]
	for deck in decks:
		deck.sgnl_drawCard.connect(players[activePlayer].givePlayerCard)

# INFO | Removes Ability for Players to take Cards
func breakDeckInteraction():
	var decks: Array[DeckNode] = [drawPile, coursePile, discardPile]
	for deck in decks:
		if deck.sgnl_drawCard.is_connected(players[activePlayer].givePlayerCard):
			deck.sgnl_drawCard.disconnect(players[activePlayer].givePlayerCard)
