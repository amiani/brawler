extends ActorState
class_name EnemyDieState

func enter(controller):
  controller.actor.velocity = Vector3()
  controller.actor.animation.play('die')

func update(controller, delta):
  if animationFinished:
    controller.actor.die()
  else:
    return null