extends Reference
class_name ActorState

func enter(actor)->void:
  pass

func exit(actor)->void:
  pass

func update(actor, delta)->ActorState:
  return null

func handleHit(actor, hitbox:Area2D):
  actor.animation.play('hit')