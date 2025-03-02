extends CanvasLayer

func _ready():
	# Conecte os sinais dos botões
	$PauseHUD/Continue.connect("pressed", self, "_on_Continue_pressed")
	$PauseHUD/Restart.connect("pressed", self, "_on_Restart_pressed")
	$PauseHUD/ExitFromTitle.connect("pressed", self, "_on_ExitFromTitle_pressed")
	$PauseHUD/ExitFromGame.connect("pressed", self, "_on_ExitFromGame_pressed")

	# Desabilite o processamento de entrada quando o menu de pausa estiver ativo
	set_process_input(false)

func show_pause_menu():
	set_process_input(true)  # Habilita o processamento de entrada para o menu de pausa
	show()  # Exibe o menu de pausa

func hide_pause_menu():
	set_process_input(false)  # Desabilita o processamento de entrada
	hide()  # Esconde o menu de pausa

# Funções de ação para os botões
func _on_Continue_pressed():
	get_tree().paused = false
	hide_pause_menu()

func _on_Restart_pressed():
	get_tree().paused = false
	hide_pause_menu()
	get_tree().reload_current_scene()  # Reinicia a cena

func _on_ExitFromTitle_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")  # Muda para o menu principal

func _on_ExitFromGame_pressed():
	get_tree().quit()  # Sai do jogo
