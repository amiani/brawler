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

var inputTolerance = 10
func update(controller, delta) -> ActorState:
  if animationFinished:
    var inputs = controller.inputs
    for i in range(controller.inputs.size() - inputTolerance - 1, -1, -1):
      for c in data.combo:
        if c.relevanceMask & controller.inputs[i].mask == c.inputMask:
          var nextAttack = controller.attacks[c.attack]
          return controller.states.attack.new(nextAttack)
    return controller.states.idle.new()
  return null
