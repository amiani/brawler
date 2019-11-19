extends Area2D
class_name HitBox

export var damage = 0
export(NodePath) var actorPath
onready var actor = get_node(actorPath)

export var basicPosition : Vector2 setget setBasicPosition, getBasicPosition
func setBasicPosition(p:Vector2):
  basicPosition = p
  if actor:
    position = basicPosition * actor.flipVector
func getBasicPosition()->Vector2:
  return basicPosition
