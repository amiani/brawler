extends EnemyGroundState
class_name EnemyHitState

func enter(controller):
  controller.actor.animation.play('hit')
  controller.actor.animation.connect('animation_finished', self, 'handleAnimationFinished')

var finished = false
func handleAnimationFinished():
  finished = true

func update(controller, delta)->ActorState:
  return controller.states.idle.new() if finished else null
