extends EnemyGroundState
class_name EnemyFallingDownState

func enter(controller):
  controller.actor.velocity = Vector3()
  controller.actor.animation.play('fallingdown')

func update(controller, delta):
  return controller.states.die.new() if animationFinished else null