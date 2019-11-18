extends GroundState
class_name PlayerIdleState

func enter(controller)->void:
  controller.actor.animation.play('idle')
  controller.actor.velocity = Vector3()
