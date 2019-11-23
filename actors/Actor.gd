extends KinematicBody2D
class_name Actor

var halfScreenSize : Vector2
var roomPosition : Vector3
var velocity = Vector3()
export var walkSpeed = 300
export var runSpeed = 500
export var gravity = -100
export var hitPlaneTolerance = 100
export var outsideScreenDistance = 0
export var health = 5
export var jabDamage = 1
var focus : Node2D
var sprite : AnimatedSprite
var animation : AnimationPlayer
var hitboxes : Array
var hurtboxes : Array
var hitbox : Area2D
var hurtbox : Area2D
var priority = 0

func _enter_tree():
  focus = find_node('Focus')
  sprite = focus.find_node('ActorSprite')
  sprite.actor = self
  animation = find_node('AnimationPlayer')
  hurtboxes = focus.find_node('Hurtboxes').get_children()
  hitboxes = focus.find_node('Hitboxes').get_children()
  hitbox = hitboxes[0]
  hurtbox = hurtboxes[0]
  for h in hitboxes:
    h.actor = self
  for h in hurtboxes:
    h.actor = self

func _ready():
  halfScreenSize = get_viewport_rect().size / 2
  roomPosition = Vector3(position.x, position.y, 0)

func _physics_process(delta):
  integrate(delta)
  if focus.scale.x < 0 && velocity.x > 0:
    focus.scale.x = 1
  elif focus.scale.x > 0 && velocity.x < 0:
    focus.scale.x = -1

var snap : int
func snap(pixels:int):
  snap = pixels

func integrate(delta):
  roomPosition.x = position.x
  roomPosition.y = position.y
  if roomPosition.z > 0:
    velocity.z += gravity
  else:
    velocity.z = 0
    roomPosition.z = 0
  velocity.x += snap * focus.scale.x / delta
  roomPosition += velocity * delta
  roomPosition.x = clamp(roomPosition.x, -halfScreenSize.x - outsideScreenDistance, halfScreenSize.x + outsideScreenDistance)
  roomPosition.y = clamp(roomPosition.y, 180, halfScreenSize.y)
  roomPosition.z = clamp(roomPosition.z, 0, 100)
  var clampedVelocity = Vector2(roomPosition.x - position.x, roomPosition.y - position.y) / delta
  focus.position.y = -roomPosition.z - 92
  var collision = move_and_collide(clampedVelocity * delta)
  velocity.x -= snap * focus.scale.x / delta
  if collision:
    var collider = collision.collider
    if collider.priority < priority:
      var snapRemainder = snap - int(abs(collision.travel.x))
      collider.snap = -snapRemainder
      snap = snapRemainder
  else:
    snap = 0
  if velocity.length() < .1:
    velocity = Vector3()
  z_index = roomPosition.y

func takeDamage(damage:int):
  health -= damage

func die():
  queue_free()
