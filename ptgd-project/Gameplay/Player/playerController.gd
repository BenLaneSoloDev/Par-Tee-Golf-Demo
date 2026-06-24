class_name PlayerNode
extends Node

@onready var handNode: HandNode = $Hand
@onready var handBG: ColorRect = $HandBG

@export var playerName: String = "player"
@export var handColor: Color

func _ready() -> void:
	handBG.color = handColor

# INFO | Gives the player a card
func givePlayerCard(cardType: String):
	handNode.addCard(cardType)

# INFO | Toggle's use depending on if they are the active player
func isActive(active: bool):
	self.visible = active;
