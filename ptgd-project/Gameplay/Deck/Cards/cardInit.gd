extends Node2D

var sprite: Control
var data: Resource
var faceUp: bool = true

func setup(cardType: String) -> void:
	
	# INFO This could have errors due to hard coded path
	# TODO Add error catch for invalid locations
	data = Deck.getCardData(cardType)
	sprite = $Sprite
	sprite.texture = data.sprite

# WARNING / TODO | Should Add StateMachine To Cards For Input

func _hovered() -> void:
	GameTweens.cardRaise(self, self.get_parent().position)

func _unhovered() -> void:
	GameTweens.cardLower(self, self.get_parent().position)
