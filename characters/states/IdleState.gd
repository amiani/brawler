extends GroundState
class_name IdleState

func enter(controller)->void:
  controller.character.animation.play('idle')
  controller.character.velocity = Vector3()
