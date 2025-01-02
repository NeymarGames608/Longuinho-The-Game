# controller.gd
extends Node2D

func _ready():
	if CharacterManager.selected_character == 4:
		# Código para mostrar o botão de voo quando Nina for selecionada
		$CanvasLayer/Control/Fly.show()  # Tornar o botão Fly visível
	else:
		$CanvasLayer/Control/Fly.hide()  # Esconder o botão Fly para outros personagens
