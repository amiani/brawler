extends PlayerGroundState
class_name PlayerJabState

func enter(controller)->void:
  var actor = controller.actor
  actor.velocity = Vector3()
  actor.animation.play('jab')
  actor.hitbox.damage = actor.jabDamage

func update(controller, delta) -> ActorState:
  var animFrame = floor(controller.actor.animation.current_animation_position * 12)

  if animationFinished:
    return controller.states.idle.new()
  return null
