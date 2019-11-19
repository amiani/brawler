extends Node
class_name StateController

var state : ActorState
export(NodePath) var actorPath
var actor
func _ready() -> void:
  actor = get_node(actorPath)
  actor.find_node('HurtBox').connect('area_entered', self, 'handleHurtBoxEntered')
  actor.animation.connect('animation_finished', self, 'handleAnimationFinished')

func updateState(delta):
  var nextState = state.update(self, delta)
  if nextState != null:
    state.exit(self)
    state = nextState
    state.enter(self)

func handleHurtboxEntered(area:Area2D):
  var yDistance = abs(area.get_parent().get_parent().roomPosition.y - actor.roomPosition.y)
  if area.is_in_group('hitboxes') && yDistance < actor.hitPlaneTolerance:
    state.handleHit(self, area)

func handleAnimationFinished(animation):
  state.handleAnimationFinished(animation)
