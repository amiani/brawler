extends CharacterState
class_name WalkState

func enter(character):
  character.sprite.animation = 'walk'

var direction = Vector2()
func update(character, delta, inputs) -> CharacterState:
  match inputs.pop_front():
    'RIGHT_PRESSED', 'LEFT_RELEASED':
      direction.x += 1
    'LEFT_PRESSED', 'RIGHT_RELEASED':
      direction.x -= 1
    'UP_PRESSED', 'DOWN_RELEASED':
      direction.y -= 1
    'DOWN_PRESSED', 'UP_RELEASED':
      direction.y += 1
    'JUMP_PRESSED':
      return character.states['jump'].new()

  var groundVelocity = direction.normalized() * character.walkSpeed
  character.velocity.x = groundVelocity.x
  character.velocity.y = groundVelocity.y
  if direction.x == 0 && direction.y == 0:
    return character.states['idle'].new()
  return null
