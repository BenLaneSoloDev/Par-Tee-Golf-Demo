extends Node2D

var sprite: Control
var data: club_card_template

func setup(cardType: String, cardPosition: Vector2 = Vector2(0, 0)) -> void:
	
	# INFO This could have errors due to hard coded path
	# TODO Add error catch for invalid locations
	data = load("res://Deck/Cards/Clubs/Resources/" + cardType + ".tres")
	sprite = $TextureRect
	
	sprite.texture = data.sprite
	sprite.position = cardPosition
	
	print(sprite.texture)
	print(sprite.position)
