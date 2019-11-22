extends Button

onready var label = get_child(0)

func _process(delta):
  label.text = 'Windowed' if OS.window_fullscreen else 'Full Screen'
