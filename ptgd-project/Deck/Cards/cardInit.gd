extends Node2D

var sprite: Control
var data: Resource
var faceUp: bool = true

func setup(cardType: String, cardPosition: Vector2 = Vector2(0, 0)) -> void:
	
	# INFO This could have errors due to hard coded path
	# TODO Add error catch for invalid locations
	data = Deck.getCardData(cardType)
	sprite = $Sprite
	
	sprite.texture = data.sprite
	sprite.position = cardPosition
