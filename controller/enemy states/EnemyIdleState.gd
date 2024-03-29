extends EnemyGroundState
class_name EnemyIdleState

func enter(controller)->void:
  controller.actor.velocity = Vector3()
  controller.actor.animation.play('idle')

var delay = .5
var time = 0
func update(controller, delta)->ActorState:
  if controller.actor.health <= 0:
    return controller.states.fallingdown.new()
  if hurt:
    return controller.states.hurt.new()

  time += delta
  if time >= delay:
    return controller.states.walk.new()
  return null