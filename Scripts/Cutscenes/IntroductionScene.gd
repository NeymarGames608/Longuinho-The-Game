extends Node2D

onready var character = $Longuinho
onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	character.play("default")
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
