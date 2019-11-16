extends CharacterState
class_name IdleState

func enter(character)->void:
  character.sprite.animation = 'idle'
  character.velocity = Vector3()

func update(character, delta, inputs)->CharacterState:
  var input = inputs.pop_front()
  match input:
    'RIGHT_PRESSED', 'LEFT_PRESSED', 'UP_PRESSED', 'DOWN_PRESSED':
      inputs.push_front(input)
      return character.states['walk'].new()
    'JUMP_PRESSED':
      return character.states['jump'].new()
  return null