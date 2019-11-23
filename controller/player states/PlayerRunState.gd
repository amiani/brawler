extends ActorState
class_name PlayerRunState

func enter(controller):
  controller.actor.animation.play('run')

func update(controller, delta) -> ActorState:
  var input = controller.inputs[0]
  if input.attack.just_pressed:
    return controller.states.attack.new(controller.attacks.nutcracker)
  if input.jump.just_pressed:
    return controller.states.jump.new()
  var direction = Vector2()
  if input.right.pressed:
    direction.x = 1
  elif input.left.pressed:
    direction.x = -1

  if input.up.pressed:
    direction.y = -1
  elif input.down.pressed:
    direction.y = 1

  if direction.x == 0 && direction.y == 0:
    return controller.states.idle.new()
  var groundVelocity = direction.normalized() * controller.actor.runSpeed
  controller.actor.velocity.x = groundVelocity.x
  controller.actor.velocity.y = groundVelocity.y
  return null
