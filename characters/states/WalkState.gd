extends CharacterState
class_name WalkState

func enter(character):
  character.sprite.animation = 'walk'

func update(character, delta, inputs) -> CharacterState:
  match inputs.pop_front():
    'RIGHT_PRESSED', 'LEFT_RELEASED':
      character.direction.x += 1
    'LEFT_PRESSED', 'RIGHT_RELEASED':
      character.direction.x -= 1
    'UP_PRESSED', 'DOWN_RELEASED':
      character.direction.y -= 1
    'DOWN_PRESSED', 'UP_RELEASED':
      character.direction.y += 1
  return null