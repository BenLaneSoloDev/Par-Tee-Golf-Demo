class_name CardNode
extends Node2D

var sprite: Control
var handRef: HandNode
var data: Resource
var faceUp: bool = true

# INFO | Movement variables
var is_dragging: bool = false
var mouse_in: bool = false

func setup(cardType: String, hand: HandNode) -> void:
	
	# INFO This could have errors due to hard coded path
	# TODO Add error catch for invalid locations
	data = Deck.getCardData(cardType)
	handRef = hand
	sprite = $Sprite
	sprite.texture = data.sprite

func _physics_process(delta: float) -> void:
	moveCard(delta)

func moveCard(delta: float):
	if (mouse_in or is_dragging) and (handRef.cardBeingDragged == null or handRef.cardBeingDragged == self):
		if Input.is_action_pressed("click"):
			global_position = lerp(global_position, get_global_mouse_position(), 22.0 * delta)
			sprite.z_index = 100
			is_dragging = true
			sprite.modulate.a = 0.75
			handRef.cardBeingDragged = self
			handRef.hasCardMovedPosition(get_index())
		else:
			is_dragging = false
			if handRef.cardBeingDragged == self:
				sprite.modulate.a = 1
				handRef.cardBeingDragged = null
				handRef.resetCardPosition(get_index())
				sprite.z_index = 0
		return

func _mouse_entered() -> void:
	mouse_in = true

func _mouse_exited() -> void:
	mouse_in = false
