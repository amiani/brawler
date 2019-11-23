extends ActorState
class_name PlayerBattleStartState

func enter(controller):
  controller.actor.animation.play('battlestart')

func update(controller, delta):
  if animationFinished:
    return controller.states.idle.new()
  return null
