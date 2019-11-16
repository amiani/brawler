extends CharacterState
class_name IdleState

func handleInput(character, event)->CharacterState:
  if event.is_action_pressed("right"):
    character.direction.x = 1
    return WalkState.new()
  elif event.is_action_pressed('left'):
    character.direction.x = -1
    return WalkState.new()
  elif event.is_action_pressed('up') ||event.is_action_pressed('down'):
    return WalkState.new()
  return null

func enter(character)->void:
  pass