extends CanvasLayer

var fps_label : Label

func _ready():
	fps_label = $Label

func _process(_delta):
	fps_label.text = "FPS: " + str(int(Engine.get_frames_per_second()))
