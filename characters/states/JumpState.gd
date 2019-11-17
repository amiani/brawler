extends CharacterState
class_name JumpState

func enter(character):
  character.sprite.animation = 'jump'
  character.velocity.z = 400
  character.velocity.y = 0
  character.roomPosition.z = .1

func update(character, delta):
  if character.roomPosition.z == 0:
    return character.states.ground.new()