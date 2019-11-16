extends KinematicBody2D
class_name Character

var halfScreenSize : Vector2
var state : CharacterState
export var speed = 300
var direction : Vector2
var sprite : AnimatedSprite
func _ready():
  halfScreenSize = get_viewport_rect().size / 2
  sprite = get_child(0)
  state = IdleState.new()
  state.enter(self)

func _physics_process(delta):
  var nextState = state.update(self, delta, inputs)
  if nextState != null:
    state = nextState
    state.enter(self)

  if sprite.flip_h && direction.x > 0:
    sprite.flip_h = false
  elif !sprite.flip_h && direction.x < 0:
    sprite.flip_h = true
  move_and_slide(direction.normalized()*speed)
  position.x = clamp(position.x, -halfScreenSize.x, halfScreenSize.x)
  position.y = clamp(position.y, 130, halfScreenSize.y)

var inputs = []
const actions = ['RIGHT', 'LEFT', 'UP', 'DOWN', 'JUMP']
func _input(event):
  for a in actions:
    if event.is_action_pressed(a):
      inputs.push_back(a+'_PRESSED')
    elif event.is_action_released(a):
      inputs.push_back(a+'_RELEASED')