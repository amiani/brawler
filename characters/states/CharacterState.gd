extends Reference
class_name CharacterState

func enter(controller)->void:
  pass

func exit(controller)->void:
  pass

func update(controller, delta)->CharacterState:
  return null

func handleHit(controller, hitbox:Area2D):
  controller.character.animation.play('hit')