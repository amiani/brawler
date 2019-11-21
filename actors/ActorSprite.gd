extends AnimatedSprite
class_name ActorSprite

export var basicPosition : Vector2 setget setBasicPosition
var flipVector : Vector2
func setBasicPosition(p:Vector2):
  basicPosition = p
  position = basicPosition * flipVector
