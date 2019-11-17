extends GroundState
class_name WalkState

func enter(character):
  character.sprite.animation = 'walk'

var direction = Vector2()
func update(character, delta) -> CharacterState:
  var input = character.inputs[0]
  if input.right.pressed:
    direction.x = 1
  elif input.left.pressed:
    direction.x = -1
  else:
    direction.x = 0

  if input.up.pressed:
    direction.y = -1
  elif input.down.pressed:
    direction.y = 1
  else:
    direction.y = 0

  if input.attack.just_pressed:
    return character.states.jab.new()
  if input.jump.just_pressed:
    return character.states.jump.new()

  var groundVelocity = direction.normalized() * character.walkSpeed
  character.velocity.x = groundVelocity.x
  character.velocity.y = groundVelocity.y
  if direction.x == 0 && direction.y == 0:
    return character.states.idle.new()
  return null
