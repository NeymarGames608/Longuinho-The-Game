extends Node2D
onready var music = $Music

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	CurrentLevel.current_level = 2
	music.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


<<<<<<< HEAD
=======
func _on_Music_finished():
	music.play()
>>>>>>> f2ac463c33550f3e8a9d7b85bce6371161682795
