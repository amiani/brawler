extends Node
class_name Controller

var state : CharacterState
export(NodePath) var characterPath
var character
func _ready() -> void:
  character = get_node(characterPath)
  character.find_node('HurtBox').connect('area_entered', self, 'handleHurtBoxEntered')

func updateState(delta):
  var nextState = state.update(self, delta)
  if nextState != null:
    state.exit(self)
    state = nextState
    state.enter(self)

func handleHurtboxEntered(area:Area2D):
  var yDistance = abs(area.get_parent().roomPosition.y - character.roomPosition.y)
  if area.is_in_group('hitboxes') && yDistance < character.hitPlaneTolerance:
    state.handleHit(self, area)