extends ActorState
class_name JumpState

func enter(controller):
  controller.actor.sprite.animation = 'jump'
  controller.actor.velocity.z = 400
  controller.actor.velocity.y = 0
  controller.actor.roomPosition.z = .1

func update(controller, delta):
  if controller.actor.roomPosition.z == 0:
    return controller.states.ground.new()
