extends GroundState
class_name IdleState

func enter(character)->void:
  character.sprite.animation = 'idle'
  character.velocity = Vector3()