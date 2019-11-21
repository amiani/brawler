extends EnemyGroundState
class_name EnemyHurtState

func enter(controller):
  """
  controller.actor.velocity = Vector3()
  controller.actor.animation.play('hurt')
  """

func update(controller, delta)->ActorState:
  return controller.states.fallingdown.new()
  return controller.states.idle.new() if animationFinished else null
