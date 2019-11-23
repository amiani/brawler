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
    for i in range(controller.inputs.size()-1, -1, -1):
      for c in data.combo:
        if c.inputMask & controller.inputs[i].mask == c.relevanceMask:
          var nextAttack = controller.attacks[c.attack]
          return controller.states.attack.new(nextAttack)
    return controller.states.idle.new()
  return null