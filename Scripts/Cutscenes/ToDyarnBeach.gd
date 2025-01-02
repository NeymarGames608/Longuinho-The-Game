extends Node2D

onready var longuinho_anim = $Longuinho/AnimationPlayer
onready var vigou_anim = $Vigou/AnimationPlayer
onready var fling_anim = $Fling/AnimationPlayer
onready var nina_anim = $Nina/AnimationPlayer
onready var bee_anim = $Bee/AnimationPlayer
onready var grdnstar = $GardenStarBckgrd/AnimationPlayer
onready var drynbch = $DyarnBeachBckgrd/AnimationPlayer
onready var timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	longuinho_anim.play("Idle")
	vigou_anim.play("Idle")
	fling_anim.play("Idle")
	nina_anim.play("Idle")
	bee_anim.play("Fly")
	grdnstar.play("Move")
	drynbch.play("Move")
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/Levels/DyarnBeach.tscn")
