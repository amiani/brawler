extends ActorState
class_name PlayerWalkState

func enter(controller):
  controller.actor.animation.play('walk')

func exit(controller):
  controller.actor.animation.stop()

var direction = Vector2()
func update(controller, delta) -> ActorState:
  var input = controller.inputs[0]
  if input.attack.just_pressed:
    return controller.states.attack.new(controller.attacks.jab)
  if input.jump.just_pressed:
    return controller.states.jump.new()

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

  if direction.x == 0 && direction.y == 0:
    return controller.states.idle.new()

  var groundVelocity = direction.normalized() * controller.actor.walkSpeed
  controller.actor.velocity.x = groundVelocity.x
  controller.actor.velocity.y = groundVelocity.y
  return null