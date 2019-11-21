extends EnemyGroundState
class_name EnemyFallingDownState

func enter(controller):
  controller.actor.velocity = Vector3()
  controller.actor.animation.play('fallingdown')

func update(controller, delta):
  if animationFinished:
    if controller.actor.health <= 0:
      return controller.states.die.new()
    else:
      controller.states.getup.new()
  return null