extends Reference
class_name ActorState

func enter(controller)->void:
  pass

func exit(controller)->void:
  pass

func update(controller, delta)->ActorState:
  return null

var hurt = false
func handleHurt(controller, hitbox:Area2D):
  hurt = true
  controller.actor.takeDamage(hitbox.damage)

var animationFinished = false
func handleAnimationFinished(animation:String):
  animationFinished = true
