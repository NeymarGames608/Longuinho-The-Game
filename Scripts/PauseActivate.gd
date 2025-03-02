extends Node

func _ready():
	CanPause.enable_pause()  # Ativa a possibilidade de pausar nas fases

func _input(event):
	if event.is_action_pressed("pause"):  # Verifica se a ação "pause" foi pressionada
		if get_tree().paused:
			$PauseHUD/PauseHUD.hide_pause_menu()  # Esconde o menu de pausa
			get_tree().paused = false  # Despausa o jogo
		else:
			$PauseHUD/PauseHUD.show_pause_menu()  # Mostra o menu de pausa
			get_tree().paused = true  # Pausa o jogo
