extends Reference
class_name CharacterState

func enter(character)->void:
  pass

func exit(character)->void:
  pass

func update(character, delta)->CharacterState:
  return null

func handleHit(character, hitbox:Area2D):
  character.animation.play('hit')