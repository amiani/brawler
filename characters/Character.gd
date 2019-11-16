extends KinematicBody2D
class_name Character

var halfScreenSize : Vector2
var state : CharacterState
export var speed = 300
var direction : Vector2
var sprite : AnimatedSprite
func _ready():
  halfScreenSize = get_viewport_rect().size / 2
  state = IdleState.new()

func _physics_process(delta):
  state.update(self, delta)
  move_and_slide(direction.normalized()*speed)
  position.x = clamp(position.x, -halfScreenSize.x, halfScreenSize.x)
  position.y = clamp(position.y, 130, halfScreenSize.y)

func _input(event):
  var nextState = state.handleInput(self, event)
  if nextState != null:
    state = nextState
    state.enter(self)