class_name GameTweens

static var cardHoverDuration = 0.15

static func cardHover(node):
	var tween = node.get_tree().create_tween()
	tween.tween_property(node, "scale", Vector2(1.1, 1.1), cardHoverDuration).set_trans(Tween.TRANS_EXPO)

static func cardUnhover(node):
	var tween = node.get_tree().create_tween()
	tween.tween_property(node, "scale", Vector2(1.0, 1.0), cardHoverDuration).set_trans(Tween.TRANS_EXPO)
