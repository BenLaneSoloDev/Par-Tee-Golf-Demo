class_name HandNode
extends Node

# INFO | Card Scene for Hand
var cardObj: PackedScene = preload("res://Gameplay/Deck/Cards/card.tscn")

var handData: Array[String] = []
var cardPositions: Array[float] = []
var cardPadding: float = 20.0

var cardBeingDragged: CardNode
var cardUnderMouse: CardNode

# INFO | Ran when hand size changes to center it with gaps
func adjustHand():
	var cards = get_children()
	
	if cards.size() <= 0: return
	
	var total_gap_width = (cards.size() - 1) * cardPadding
	var start_x = -total_gap_width / 2.0
	
	cardPositions.clear()
	for i in range(cards.size()):
		cardPositions.append(start_x + (i * cardPadding))
		cards[i].position.x = start_x + (i * cardPadding)

# INFO | Auto arranges cards around moved one
func hasCardMovedPosition(index: int):
	
	var originalPos = cardPositions[index]
	var currentPos = get_children()[index].position.x

	if currentPos > originalPos + cardPadding or currentPos < originalPos - cardPadding:
		# INFO CARD HAS SWAPPED PLACE
		var direction = sign(currentPos - (originalPos + cardPadding))
		var swapIndex = int(index + direction)
		
		if swapIndex >= 0 && swapIndex < get_children().size():
			var movingCard = get_children()[swapIndex]
			var movementTween = get_tree().create_tween()
			movementTween.tween_property(movingCard, "position", Vector2(originalPos, 0), 0.1).set_trans(Tween.TRANS_BOUNCE)
			
			move_child(get_children()[index], swapIndex)

# INFO | Resets a moved cards position when released from drag
func resetCardPosition(index: int):
	var movingCard = get_children()[index]
	var movementTween = get_tree().create_tween()
	movementTween.tween_property(movingCard, "position", Vector2(cardPositions[index], 0), 0.05).set_trans(Tween.TRANS_BOUNCE)	

func addCard(cardType: String):
	handData.append(cardType) # Save list of card types in hand
	
	var card = cardObj.instantiate()
	card.setup(str(cardType).to_lower(), self)
	add_child(card)
	
	adjustHand()

# TODO | Allow Targetted Cards to be Removed from the Hand
func removeCard():
	adjustHand()

# INFO | Used to constantly know which node is under mouse (used for z-index based input)
func _physics_process(delta: float) -> void:
	pass
