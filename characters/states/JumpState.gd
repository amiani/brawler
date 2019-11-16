extends CharacterState
class_name JumpState

func enter(character):
  character.sprite.animation = 'jump'
  character.velocity.z = 400
  character.roomPosition.z = .1

func update(character, delta, inputs):
  if character.roomPosition.z == 0:
    return character.states['idle'].new()