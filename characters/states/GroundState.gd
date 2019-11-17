extends CharacterState
class_name GroundState

func update(character, delta)->CharacterState:
  var i = character.inputs[0]
  if i.right.pressed || i.left.pressed || i.up.pressed || i.down.pressed:
    return character.states.walk.new()
  elif i.jump.just_pressed:
    return character.states.jump.new()
  elif i.attack.just_pressed:
    return character.states.jab.new()
  else:
    return character.states.idle.new()
  return null
