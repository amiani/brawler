extends GroundState
class_name JabState

func enter(character)->void:
  character.velocity = Vector3()
  character.animation.connect('animation_finished', self, 'handleAnimationFinished')
  character.animation.play('jab')

func update(character, delta) -> CharacterState:
  var animFrame = floor(character.animation.current_animation_position * 12)

  if finished:
    return character.states.idle.new()
  return null

var finished = false
func handleAnimationFinished(animation):
  finished = true