class_name PlayerNode
extends Node

# INFO | Card Scene for Hand
var cardObj: PackedScene = preload("res://Gameplay/Deck/Cards/card.tscn")

@onready var handNode: Node2D = $Hand
var handData: Array[String]
var handPadding: float = 10.0

# INFO | Ran when hand size changes to center it with gaps
func adjustHand():
	var cards = handNode.get_children()
	
	if cards.size() <= 0: return
	
	var total_gap_width = (cards.size() - 1) * handPadding
	var start_x = -total_gap_width / 2.0
	for i in range(cards.size()):
		cards[i].position.x = start_x + (i * handPadding)

func addCardToHand(cardType: String):
	handData.append(cardType) # Save list of card types in hand
	
	var card = cardObj.instantiate()
	card.setup(str(cardType).to_lower())
	handNode.add_child(card)
	
	adjustHand()

# TODO | Allow Targetted Cards to be Removed from the Hand
func removeCardFromHand():
	adjustHand()
