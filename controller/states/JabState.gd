extends GroundState
class_name JabState

func enter(controller)->void:
  controller.actor.velocity = Vector3()
  controller.actor.animation.connect('animation_finished', self, 'handleAnimationFinished')
  controller.actor.animation.play('jab')

func update(controller, delta) -> ActorState:
  var animFrame = floor(controller.actor.animation.current_animation_position * 12)

  if finished:
    return controller.states.idle.new()
  return null

var finished = false
func handleAnimationFinished(animation):
  finished = true