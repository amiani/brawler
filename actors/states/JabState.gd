extends GroundState
class_name JabState

func enter(actor)->void:
  actor.velocity = Vector3()
  actor.animation.connect('animation_finished', self, 'handleAnimationFinished')
  actor.animation.play('jab')

func update(actor, delta) -> ActorState:
  var animFrame = floor(actor.animation.current_animation_position * 12)

  if finished:
    return actor.states.idle.new()
  return null

var finished = false
func handleAnimationFinished(animation):
  finished = true