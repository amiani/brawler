extends Area2D
class_name HitBox

export var damage = 0
var actor
export(Vector2) var basicPosition setget setBasicPosition
func setBasicPosition(p:Vector2):
  basicPosition = p
  if actor:
    position = basicPosition * actor.flipVector