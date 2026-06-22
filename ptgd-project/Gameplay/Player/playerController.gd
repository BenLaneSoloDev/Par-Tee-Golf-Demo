class_name PlayerNode
extends Node

@onready var handNode: HandNode = $Hand

# INFO | Gives the player a card
func givePlayerCard(cardType: String):
	handNode.addCard(cardType)
