extends Node2D

@export var drawPile: DeckNode
@export var coursePile: DeckNode
@export var discardPile: DeckNode

var cardObj: PackedScene = preload("res://Deck/Cards/card.tscn")

func _ready() -> void:
	drawPile.sgnl_drawCard.connect(createCard)
	coursePile.sgnl_drawCard.connect(createCard)
	discardPile.sgnl_drawCard.connect(createCard)

# TODO | Maybe Separate this out into card creating object
func createCard(cardType: String, cardPos: Vector2):
	var card = cardObj.instantiate()
	card.setup(str(cardType).to_lower(), cardPos) # TODO update this to have image of the back
	add_child(card) # TODO Have this added to a scene or node in the game (not the deck)	
