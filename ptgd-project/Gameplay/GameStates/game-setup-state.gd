class_name GameSetupState
extends State

@export var cardsDealt: int = 5
var gameNode: GameNode

func enter():
	print("Enter Setup State")
	gameNode = state_machine.get_parent()
	pass

func update(delta):
	if gameNode.drawPile.created:
		dealCards()
		gameNode.drawPile.created = false
		# TODO | ADD STATE CHANGE HERE

func dealCards():
	for card in range(0, cardsDealt):
		for player in gameNode.players:
			var cardType = gameNode.drawPile.drawTopCard()
			player.givePlayerCard(cardType)
