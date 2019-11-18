extends GroundState
class_name WalkState

func enter(actor):
  actor.animation.play('walk')

var direction = Vector2()
func update(actor, delta) -> ActorState:
  var input = actor.inputs[0]
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
    return actor.states.jab.new()
  if input.jump.just_pressed:
    return actor.states.jump.new()

  var groundVelocity = direction.normalized() * actor.walkSpeed
  actor.velocity.x = groundVelocity.x
  actor.velocity.y = groundVelocity.y
  if direction.x == 0 && direction.y == 0:
    return actor.states.idle.new()
  return null
