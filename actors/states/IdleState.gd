extends GroundState
class_name IdleState

func enter(controller)->void:
  controller.actor.animation.play('idle')
  controller.actor.velocity = Vector3()
