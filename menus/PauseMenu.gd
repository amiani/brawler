extends Panel

func _ready():
  visible = false

func _input(event):
  if event.is_action_pressed('pause'):
    var tree = get_tree()
    if tree.paused:
      tree.paused = false
      visible = false
    else:
      tree.paused = true
      visible = true


func handleResumePressed() -> void:
  get_tree().paused = false
  visible = false

func handleFullScreenPressed():
  print('fullscreen pressed')
  OS.window_fullscreen = true
