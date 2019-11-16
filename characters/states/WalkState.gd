extends CharacterState
class_name WalkState

func handleInput(character, event)->CharacterState:
  if event.is_action_pressed('right'):
    character.direction.x += 1
  elif event.is_action_released('right'):
    character.direction.x -= 1
  elif event.is_action_pressed('left'):
    character.direction.x -= 1
  elif event.is_action_released('left'):
    character.direction.x += 1
  elif event.is_action_pressed('up'):
    character.direction.y -= 1
  elif event.is_action_released('up'):
    character.direction.y += 1
  elif event.is_action_pressed('down'):
    character.direction.y += 1
  elif event.is_action_released('down'):
    character.direction.y -= 1
  return null

func enter(character):
  pass

func update(character, delta) -> void:
  pass