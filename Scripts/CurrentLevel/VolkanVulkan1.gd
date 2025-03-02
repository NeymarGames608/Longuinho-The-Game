extends Node2D


# Declare member variables here. Examples:
onready var music = $Music


# Called when the node enters the scene tree for the first time.
func _ready():
	CurrentLevel.current_level = 4
	music.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Music_finished():
	music.play()
