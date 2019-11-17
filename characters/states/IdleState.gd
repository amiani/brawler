extends GroundState
class_name IdleState

func enter(character)->void:
  character.animation.play('idle')
  character.velocity = Vector3()
