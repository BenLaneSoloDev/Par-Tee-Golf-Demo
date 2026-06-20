extends Node

@onready var sprite: TextureRect = $TextureRect

@export var type: Deck.Type
@export var interactable: bool = true

@onready var cardDB: Dictionary = Deck.getDB(type)
var cards: Array[String] = []
var cardObj: PackedScene = preload("res://Deck/Cards/card.tscn")

# Takes the data needed to make a given pile and the pile reference, and creates the deck
func generateDeck():
	# INFO Generate Clubs + ParTee Cards 
	# INFO (together as they have higher than 1 per type)
	for key in cardDB.keys():
		for i in range(cardDB[key]):
			cards.append(key)
			
	# INFO Generate Courses

func shuffleDeck():
	cards[0] # TODO NEED SHUFFLE CODE

func drawTopCard():
	if cards.size() <= 0: return # DONT PROCEDE IF DECK EMPTY
	
	var cardType = cards.pop_front()
	var card = cardObj.instantiate()
	card.setup(str(cardType).to_lower(), sprite.position) # TODO update this to have image of the back
	add_child(card) # TODO Have this added to a scene or node in the game (not the deck)	

func _ready() -> void:
	generateDeck()

func _input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("click") && interactable:
		print("Draw Card")
		drawTopCard()
