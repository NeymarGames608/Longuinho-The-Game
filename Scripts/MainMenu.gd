extends Control

# Referências aos botões
onready var vbox_container = $VBoxContainer
onready var button_play_longuinho = vbox_container.get_node("ButtonLonguinho")
onready var button_play_vigou = vbox_container.get_node("ButtonVigou")
onready var button_play_fling = vbox_container.get_node("ButtonFling")
onready var button_play_nina = vbox_container.get_node("ButtonNina")
onready var button_exit = vbox_container.get_node("ButtonExit")

# Referência aos AudioStreamPlayers
onready var audio_select = $AudioStreamPlayerSelect
onready var audio_accept = $AudioStreamPlayerAccept

# Lista de botões para navegação
var buttons = []

# Variável para controlar o foco
var current_focus_index = 0

func _ready():
	# Adiciona os botões à lista
	buttons = [button_play_longuinho, button_play_vigou, button_play_fling, button_play_nina, button_exit]

	# Configura o foco inicial
	buttons[current_focus_index].grab_focus()

	# Conectar os sinais de clique aos métodos
	button_play_longuinho.connect("pressed", self, "_on_ButtonPlayLonguinho_pressed")
	button_play_vigou.connect("pressed", self, "_on_ButtonPlayVigou_pressed")
	button_play_fling.connect("pressed", self, "_on_ButtonPlayFling_pressed")
	button_play_nina.connect("pressed", self, "_on_ButtonPlayNina_pressed")
	button_exit.connect("pressed", self, "_on_ButtonExit_pressed")
	
	# Definir o current_level
	CurrentLevel.current_level = 0

# Detecta os inputs para navegação e seleção
func _unhandled_input(event):
	# Se o foco estiver em um botão e o usuário interagir com ele usando setas ou joystick
	if event.is_action_pressed("ui_up"):
		# Navega para o botão anterior
		current_focus_index -= 1
		if current_focus_index < 0:
			current_focus_index = buttons.size() - 1  # Volta para o último botão
		buttons[current_focus_index].grab_focus()
		
		# Toca o som de seleção
		if audio_select:
			audio_select.play()

	elif event.is_action_pressed("ui_down"):
		# Navega para o próximo botão
		current_focus_index += 1
		if current_focus_index >= buttons.size():
			current_focus_index = 0  # Volta para o primeiro botão
		buttons[current_focus_index].grab_focus()
		
		# Toca o som de seleção
		if audio_select:
			audio_select.play()

	# Se o jogador pressionar o botão para selecionar
	elif event.is_action_pressed("ui_accept") or event.is_action_pressed("ui_select"):
		# Toca o som de aceitação
		if audio_accept:
			audio_accept.play()

		# Atraso de 0.1 segundos antes de executar a ação do botão
		var current_button = get_focus_owner()  # Armazenar a referência do botão
		if current_button and current_button is Button:
			var timer = Timer.new()  # Cria um timer
			add_child(timer)  # Adiciona o timer como filho da cena
			timer.wait_time = 0.1  # Define o tempo de espera do timer
			timer.one_shot = true  # O timer vai disparar apenas uma vez
			timer.start()  # Inicia o timer

			# Espera o tempo do timer
			yield(timer, "timeout")

			# Verifica se o botão ainda existe e executa a ação do botão
			if is_instance_valid(current_button):  # Verifica se o botão ainda é válido
				current_button.emit_signal("pressed")

# Lógica dos botões
func _on_ButtonPlayLonguinho_pressed():
	CharacterManager.select_character(1)
	get_tree().change_scene("res://Scenes/Levels/GardenStar.tscn")

func _on_ButtonPlayVigou_pressed():
	CharacterManager.select_character(2)
	get_tree().change_scene("res://Scenes/Levels/GardenStar.tscn")

func _on_ButtonPlayFling_pressed():
	CharacterManager.select_character(3)
	get_tree().change_scene("res://Scenes/Levels/GardenStar.tscn")

func _on_ButtonPlayNina_pressed():
	CharacterManager.select_character(4)
	get_tree().change_scene("res://Scenes/Levels/GardenStar.tscn")

func _on_ButtonExit_pressed():
	get_tree().quit()

# Detecta cliques do mouse ou toques na tela
func _input(event):
	if event is InputEventMouseButton:
		# Se o botão foi pressionado com o mouse ou toque
		if event.button_index == BUTTON_LEFT and event.pressed:
			for i in range(buttons.size()):
				if buttons[i].get_rect().has_point(event.position):
					# Se o clique foi dentro do botão, ganha foco e pressiona o botão
					buttons[i].grab_focus()
					buttons[i].emit_signal("pressed")
					break
