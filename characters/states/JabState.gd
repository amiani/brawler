extends GroundState
class_name JabState

func enter(controller)->void:
  controller.character.velocity = Vector3()
  controller.character.animation.connect('animation_finished', self, 'handleAnimationFinished')
  controller.character.animation.play('jab')

func update(controller, delta) -> CharacterState:
  var animFrame = floor(controller.character.animation.current_animation_position * 12)

  if finished:
    return controller.states.idle.new()
  return null

var finished = false
func handleAnimationFinished(animation):
  finished = true