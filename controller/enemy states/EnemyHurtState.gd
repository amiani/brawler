extends EnemyGroundState
class_name EnemyHurtState

func enter(controller):
  controller.actor.velocity = Vector3()
  controller.actor.animation.play('hurt')

func update(controller, delta)->ActorState:
  if animationFinished:
    if controller.actor.health <= 0:
      return controller.states.fallingdown.new()
    else:
      return controller.states.idle.new()
  return null
