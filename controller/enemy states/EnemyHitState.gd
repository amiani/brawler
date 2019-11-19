extends EnemyGroundState
class_name EnemyHitState

func enter(controller):
  controller.actor.animation.play('hit')

func update(controller, delta)->ActorState:
  return controller.states.idle.new() if animationFinished else null
