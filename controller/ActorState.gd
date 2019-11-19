extends Reference
class_name ActorState

func enter(controller)->void:
  pass

func exit(controller)->void:
  pass

func update(controller, delta)->ActorState:
  return null

var hit = false
func handleHit(controller, hitbox:Area2D):
  hit = true
  controller.actor.takeDamage(hitbox.damage)
