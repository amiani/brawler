extends Reference
class_name ActorState

func enter(controller)->void:
  pass

func exit(controller)->void:
  pass

func update(controller, delta)->ActorState:
  return null

func handleHit(actor, hitbox:Area2D):
  actor.animation.play('hit')
