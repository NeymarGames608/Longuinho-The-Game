extends Node

# Caminho para salvar os prints
const SCREENSHOT_PATH = "res://Media/screenshot_"

# Chamado ao iniciar o nó
func _ready():
	# Cria a pasta Media se não existir
	var dir = Directory.new()
	if not dir.dir_exists("res://Media"):
		dir.make_dir("res://Media")

# Captura o print quando a tecla é pressionada
func _input(event):
	if event.is_action_pressed("print"):  # Tecla 'P'
		save_screenshot()

# Salva o print em .png
func save_screenshot():
	var screenshot = get_viewport().get_texture().get_data()
	var path = SCREENSHOT_PATH + str(OS.get_ticks_msec()) + ".png"
	screenshot.flip_y()
	screenshot.save_png(path)
	print("Screenshot salvo em: ", path)
