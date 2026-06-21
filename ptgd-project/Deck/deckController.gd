extends Node

class_name DeckNode

@export var type: Deck.Type
@export var interactable: bool = true
@export var faceUp: bool = false

@onready var sprite: TextureRect = $Sprite
@onready var cardDB: Dictionary = Deck.getDB(type)
var cards: Array[String] = []
signal sgnl_drawCard(cardType: String, cardPos: Vector2)

# Takes the data needed to make a given pile and the pile reference, and creates the deck
func generateDeck():
	for key in cardDB.keys():
		for i in range(cardDB[key]):
			cards.append(key)

func shuffleDeck():
	for i in range(cards.size()):
		var j = randi_range(0, cards.size()-1)
		var tmpCard = cards[i]
		cards[i] = cards[j] 
		cards[j] = tmpCard

func drawTopCard():
	if cards.size() <= 0: return # DONT PROCEDE IF DECK EMPTY
	var cardType = cards.pop_back()
	sgnl_drawCard.emit(cardType, sprite.global_position) # SEND SIGNAL OF CARD DRAWN
	updateSprite()

func updateSprite():
	if cards.size() <= 0: return # DONT PROCEDE IF DECK EMPTY
	var topCard = Deck.getCardData(cards[cards.size()-1])
	sprite.texture = topCard.spriteBack # WARNING MIGHT BREAK DUE TO HARD REFERENCE

func _ready() -> void:
	generateDeck()
	shuffleDeck()
	updateSprite()

# TODO Add a way to move and drag around the cards (and separate from decks completely)
func _input_event(_viewport: Node, _event: InputEvent, _shape_idx: int) -> void:
	if Input.is_action_just_pressed("click") && interactable:
		drawTopCard()

func _hovered() -> void:
	GameTweens.cardHover($Sprite)
	
func _unhovered() -> void:
	GameTweens.cardUnhover($Sprite)
