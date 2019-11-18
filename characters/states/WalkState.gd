extends GroundState
class_name WalkState

func enter(controller):
  controller.character.animation.play('walk')

var direction = Vector2()
func update(controller, delta) -> CharacterState:
  var input = controller.inputs[0]
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
    return controller.states.jab.new()
  if input.jump.just_pressed:
    return controller.states.jump.new()

  var groundVelocity = direction.normalized() * controller.character.walkSpeed
  controller.character.velocity.x = groundVelocity.x
  controller.character.velocity.y = groundVelocity.y
  if direction.x == 0 && direction.y == 0:
    return controller.states.idle.new()
  return null
