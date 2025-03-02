extends Node

# Define a tecla que vai alternar entre tela cheia e janela
var toggle_key = KEY_F11

func _ready():
	# Configura o modo inicial da janela (pode ser tela cheia ou janela)
	# Se você quiser começar em tela cheia, coloque `true`, caso contrário, `false`
	OS.window_fullscreen = false

func _process(delta):
	# Verifica se a tecla foi pressionada
	if Input.is_action_just_pressed("fullscreen_or_window"):
		# Alterna entre tela cheia e janela
		OS.window_fullscreen = !OS.window_fullscreen
