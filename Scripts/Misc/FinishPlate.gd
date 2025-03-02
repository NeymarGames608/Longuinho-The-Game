extends StaticBody2D

# Referências aos nós
onready var finish_sprite = $Sprite
onready var collision_shape = $CollisionShape2D
onready var area = $Area2D

func _ready():
	# A placa estará visível desde o início
	finish_sprite.show()
<<<<<<< HEAD
	
	# Conecta o sinal de colisão da área
	area.connect("body_entered", self, "_on_body_entered")
=======

	# Conecta o sinal de colisão da área
	area.connect("body_entered", self, "_on_body_entered")
	area.connect("body_exited", self, "_on_body_exited")
>>>>>>> f2ac463c33550f3e8a9d7b85bce6371161682795

# Função chamada quando um corpo entra na área
func _on_body_entered(body):
	# Verifica se o corpo que entrou pertence ao grupo "Player"
	if body.is_in_group("Player"):
<<<<<<< HEAD
		var next_scene = ""
		
		match CurrentLevel.current_level:
			1:
				CurrentLevel.current_level = 1.5
				next_scene = "res://Scenes/Levels/NextLevel.tscn"
			1.5:
				next_scene = "res://Scenes/Levels/Bosses/BossBee.tscn"
			2:
				CurrentLevel.current_level = 2.5
				next_scene = "res://Scenes/Levels/Bosses/BossFish.tscn"
			2.5:
				next_scene = "res://Scenes/Levels/Bosses/BossFish.tscn"
			3:
				next_scene = "res://Scenes/Levels/Bosses/BossCrystalGolem.tscn"
			4:
				next_scene = "res://Scenes/Levels/Bosses/VolkanVulkan1Boss.tscn"
			_:
				next_scene = "res://Scenes/MainMenu.tscn"
		
		# Se houver um próximo cenário definido, muda para ele instantaneamente
		if next_scene != "":
			get_tree().change_scene(next_scene)
		
		# Oculta a placa imediatamente após o jogador tocar nela
		finish_sprite.hide()
		
		# Desabilita a colisão imediatamente para evitar toque duplo
		collision_shape.set_deferred("disabled", true)
=======
		# Verifica se o nível atual é 1
		if CurrentLevel.current_level == 1:
			# Atualiza o nível para 1.5
			CurrentLevel.current_level = 1.5
			
		# Verifica se o nível atual é 1.5
		elif CurrentLevel.current_level == 1.5:
			# Muda para a fase do chefe BossBee
			get_tree().change_scene("res://Scenes/Levels/Bosses/BossBee.tscn")
		
		# Verifica se o nível atual é 2
		elif CurrentLevel.current_level == 2:
			# Atualiza o nível para 2.5
			CurrentLevel.current_level = 2.5

			# Muda para a fase do chefe BossFish
			get_tree().change_scene("res://Scenes/Levels/Bosses/BossFish.tscn")
		
		# Verifica se o nível atual é 2.5
		elif CurrentLevel.current_level == 2.5:
			# Muda para a fase do chefe BossFish
			get_tree().change_scene("res://Scenes/Levels/Bosses/BossFish.tscn")
		
		# Se o nível for 0 ou outro valor, vai para o menu principal
		else:
			get_tree().change_scene("res://Scenes/MainMenu.tscn")

		# Oculta a placa após o jogador ter encostado nela
		finish_sprite.hide()
		
		# Usa set_deferred para desabilitar a colisão depois do processamento físico
		collision_shape.set_deferred("disabled", true)

# Função chamada quando um corpo sai da área
func _on_body_exited(body):
	# Aqui, pode-se realizar alguma ação se necessário, por exemplo, mostrar algo novamente
	pass
>>>>>>> f2ac463c33550f3e8a9d7b85bce6371161682795
