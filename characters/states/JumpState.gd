extends CharacterState
class_name JumpState

func enter(controller):
  controller.character.sprite.animation = 'jump'
  controller.character.velocity.z = 400
  controller.character.velocity.y = 0
  controller.character.roomPosition.z = .1

func update(controller, delta):
  if controller.character.roomPosition.z == 0:
    return controller.states.ground.new()
