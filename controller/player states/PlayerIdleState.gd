extends ActorState
class_name PlayerIdleState

func enter(controller):
  controller.actor.animation.play('idle')

func update(controller:StateController, delta)->ActorState:
  var i = controller.inputs[0]
  if i.attack.just_pressed:
    return controller.states.attack.new(controller.attacks.jab)
  elif i.right.pressed || i.left.pressed || i.up.pressed || i.down.pressed:
    return controller.states.walk.new()
  elif i.jump.just_pressed:
    return controller.states.jump.new()
  return null
