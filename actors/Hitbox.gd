extends Area2D
class_name HitBox

export var damage = 0
var actor
export var basicPosition : Vector2 setget setBasicPosition
func setBasicPosition(p:Vector2):
  basicPosition = p
  if actor:
    position = basicPosition * actor.flipVector
