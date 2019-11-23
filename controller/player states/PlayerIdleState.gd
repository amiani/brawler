extends ActorState
class_name PlayerIdleState

func enter(controller):
  controller.actor.animation.play('idle')
  controller.actor.velocity = Vector3()

func update(controller:StateController, delta)->ActorState:
  var i = controller.inputs[0]
  if i.attack.just_pressed:
    return controller.states.attack.new(controller.attacks.jab)
  elif checkRun(controller):
    return controller.states.run.new()
  elif i.right.pressed || i.left.pressed || i.up.pressed || i.down.pressed:
    return controller.states.walk.new()
  elif i.jump.just_pressed:
    return controller.states.jump.new()
  return null

func checkRun(controller)->bool:
  var latestInput = controller.inputs[0]
  var direction : String
  if latestInput.right.pressed:
    direction = 'right'
  elif latestInput.left.pressed:
    direction = 'left'
  else:
    return false
  
  var presses = 0
  for i in range(controller.inputs.size()-1, -1, -1):
    var input = controller.inputs[i]
    if input[direction].just_pressed:
      presses += 1
  if presses >= 2:
    return true
  return false