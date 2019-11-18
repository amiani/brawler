extends ActorState
class_name GroundState

func update(controller, delta)->ActorState:
  var i = controller.inputs[0]
  if i.attack.just_pressed:
    return controller.states.jab.new()
  elif i.right.pressed || i.left.pressed || i.up.pressed || i.down.pressed:
    return controller.states.walk.new()
  elif i.jump.just_pressed:
    return controller.states.jump.new()
  else:
    return controller.states.idle.new()
