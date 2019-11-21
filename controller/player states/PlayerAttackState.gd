extends ActorState
class_name PlayerAttackState

var data : Dictionary
func _init(data:Dictionary):
  self.data = data

func enter(controller)->void:
  var actor = controller.actor
  actor.velocity = Vector3()
  actor.animation.play(data.animation)
  actor.hitbox.damage = data.damage

func update(controller, delta) -> ActorState:
  if animationFinished:
    if findInput('attack', 'just_pressed', controller.inputs.slice(0, 9)) > -1:
      if data.combo.has('attack'):
        var nextAttack = controller.attacks[data.combo.attack]
        return controller.states.attack.new(nextAttack)
    return controller.states.idle.new()
  return null

func findInput(action:String, stroke:String, inputBuffer:Array) -> int:
  for i in range(0, inputBuffer.size()):
    if inputBuffer[i][action][stroke]:
      return i
  return -1
