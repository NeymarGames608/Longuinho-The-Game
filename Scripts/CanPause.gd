extends Node

var can_open_pause = false  # Controle inicial do pause

# Ativa a possibilidade de pausar
func enable_pause():
	can_open_pause = true

# Desativa a possibilidade de pausar
func disable_pause():
	can_open_pause = false
