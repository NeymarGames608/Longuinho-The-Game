extends Node

var selected_character : int = 1  # Começa com o personagem 1 (Longuinho)

# Função para selecionar o personagem
func select_character(character_id: int):
	if character_id >= 1 and character_id <= 4:
		selected_character = character_id
