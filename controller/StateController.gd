extends Node
class_name StateController

var state : ActorState
export(NodePath) var actorPath
var actor
func _ready() -> void:
  actor = get_node(actorPath)
  actor.animation.connect('animation_finished', self, 'handleAnimationFinished')

func updateState(delta):
  var nextState = state.update(self, delta)
  if nextState != null:
    state.exit(self)
    state = nextState
    state.enter(self)

signal hurt
func handleHurtboxEntered(area:Area2D):
  if area.is_in_group('hitboxes') && area.actor != actor:
    var yDistance = abs(area.actor.position.y - actor.position.y)
    if yDistance < actor.hitPlaneTolerance:
      state.handleHurt(self, area)
      emit_signal('hurt')

signal hit
func handleHitboxEntered(area:Area2D):
  if area.is_in_group('hurtboxes') && area.actor != actor:
    var yDistance = abs(area.actor.position.y - actor.position.y)
    if yDistance < actor.hitPlaneTolerance:
      emit_signal('hit')

func handleAnimationFinished(animation):
  state.handleAnimationFinished(animation)
