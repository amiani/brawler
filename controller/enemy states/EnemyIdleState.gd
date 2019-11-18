extends EnemyGroundState
class_name EnemyIdleState

func enter(controller)->void:
  controller.actor.velocity = Vector3()

func update(controller, delta)->ActorState:
  return EnemyWalkState.new()
