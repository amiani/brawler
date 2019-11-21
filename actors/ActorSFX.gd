extends AudioStreamPlayer2D
class_name ActorSFX

export(AudioStreamSample) var hitStream
func handleHit():
  bus = 'Hit Bus'
  var lowPass = AudioServer.get_bus_effect(1, 0)
  lowPass.cutoff_hz = 
  stream = hitStream
  play()
