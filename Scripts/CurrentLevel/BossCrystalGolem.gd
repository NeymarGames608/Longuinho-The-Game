extends Node2D


# Declare member variables here. Examples:
onready var music = $Music
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	CurrentLevel.current_level = 3.5
	music.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

