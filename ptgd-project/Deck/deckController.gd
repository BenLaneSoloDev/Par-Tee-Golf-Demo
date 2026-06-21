extends Node

@onready var sprite: TextureRect = $Sprite

@export var type: Deck.Type
@export var interactable: bool = true

@onready var cardDB: Dictionary = Deck.getDB(type)
var cards: Array[String] = []
var cardObj: PackedScene = preload("res://Deck/Cards/card.tscn")

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
	print(cards)

func drawTopCard():
	if cards.size() <= 0: return # DONT PROCEDE IF DECK EMPTY
	
	var cardType = cards.pop_front()
	var card = cardObj.instantiate()
	card.setup(str(cardType).to_lower(), sprite.position) # TODO update this to have image of the back
	add_child(card) # TODO Have this added to a scene or node in the game (not the deck)	

func _ready() -> void:
	generateDeck()
	shuffleDeck()

# TODO Add a way to move and drag around the cards (and separate from decks completely)
func _input_event(_viewport: Node, _event: InputEvent, _shape_idx: int) -> void:
	if Input.is_action_just_pressed("click") && interactable:
		print("Draw Card")
		drawTopCard()
