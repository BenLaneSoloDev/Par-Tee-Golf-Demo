class_name GameTweens

static var cardHoverDuration = 0.1
static var cardRaiseHeight = -15
static var cardRaiseDuration = 0.15

static func cardHover(node):
	var tween = node.get_tree().create_tween()
	tween.tween_property(node, "scale", Vector2(1.1, 1.1), cardHoverDuration).set_trans(Tween.TRANS_BOUNCE)

static func cardUnhover(node):
	var tween = node.get_tree().create_tween()
	tween.tween_property(node, "scale", Vector2(1.0, 1.0), cardHoverDuration).set_trans(Tween.TRANS_BOUNCE)

static func cardRaise(node, startPos: Vector2):
	var tween = node.get_tree().create_tween()
	tween.tween_property(node, "position", Vector2(node.position.x, startPos.y + cardRaiseHeight), cardRaiseDuration).set_trans(Tween.TRANS_EXPO)
	
static func cardLower(node, startPos: Vector2):
	var tween = node.get_tree().create_tween()
	tween.tween_property(node, "position", Vector2(node.position.x, startPos.y), cardRaiseDuration).set_trans(Tween.TRANS_EXPO)
