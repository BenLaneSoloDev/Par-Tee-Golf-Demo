extends Node

@export var drawPileTotals = {
	"AmPu": 8,
	"AmIr": 11,
	"AmDr": 6,
	"AdPi": 9,
	"AdIr": 10,
	"AdDr": 5,
	"PrIr": 9,
	"PrDr": 4,
	"SpHc": 4,
	"SpHio": 1,
	"PtCa": 7,
	"PtCp": 5,
	"PtLd": 3
}

var completeDeck: Array[String] = []
var cardObj: PackedScene = preload("res://Deck/Cards/card.tscn")

func generateDeck():
	
	# INFO Generate Clubs + ParTee Cards 
	# INFO (together as they have higher than 1 per type)
	for key in drawPileTotals.keys():
		for i in range(drawPileTotals[key]):
			completeDeck.append(key)
			
	# INFO Generate Courses
	

func shuffleDeck():
	completeDeck[0] # TODO NEED SHUFFLE CODE

func drawTopCard():
	
	if completeDeck.size() <= 0: return # DONT PROCEDE IF DECK EMPTY
	
	var cardType = completeDeck.pop_front()
	var card = cardObj.instantiate()
	card.setup(str(cardType).to_lower(), $ColorRect.position) # TODO update this to have image of the back
	add_child(card) # TODO Have this added to a scene or node in the game (not the deck)
	

func _ready() -> void:
	generateDeck()

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("click"):
		print("click")
		drawTopCard()
		
