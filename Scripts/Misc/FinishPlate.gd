extends StaticBody2D

# Referências aos nós
onready var finish_sprite = $Sprite
onready var collision_shape = $CollisionShape2D
onready var area = $Area2D

func _ready():
	# A placa estará visível desde o início
	finish_sprite.show()
	
	# Conecta o sinal de colisão da área
	area.connect("body_entered", self, "_on_body_entered")

# Função chamada quando um corpo entra na área
func _on_body_entered(body):
	# Verifica se o corpo que entrou pertence ao grupo "Player"
	if body.is_in_group("Player"):
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
