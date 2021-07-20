extends Node2D


# Declare member variables here. Examples:
var cromossomos
var nome = 'DNA'

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func separar():
	var i = 0
	while i < 100:
		cromossomos[0][0].position -= Vector2(8, 0)
		cromossomos[0][1].position += Vector2(8, 0)
		cromossomos[1][0].position -= Vector2(8, 0)
		cromossomos[1][1].position += Vector2(8, 0)
		cromossomos[2][0].position -= Vector2(8, 0)
		cromossomos[2][1].position += Vector2(8, 0)
		cromossomos[3][0].position -= Vector2(8, 0)
		cromossomos[3][1].position += Vector2(8, 0)
		if i % 3 == 0:
			cromossomos[0][0].position -= Vector2(0, 2)
			cromossomos[0][1].position -= Vector2(0, 2)
			cromossomos[1][0].position -= Vector2(0, 6.2)
			cromossomos[1][1].position -= Vector2(0, 6.2)
			cromossomos[2][0].position += Vector2(0, 2)
			cromossomos[2][1].position += Vector2(0, 2)
			cromossomos[3][0].position += Vector2(0, 6.2)
			cromossomos[3][1].position += Vector2(0, 6.2)
		i += 1
		yield(get_tree().create_timer(0.01), "timeout")
	yield(get_tree().create_timer(1), "timeout")
	for j in cromossomos:
		j[0].queue_free()
		j[1].queue_free()
	

func voltar_default():
	$Textura.play('default', false)

func _on_AnimatedSprite_animation_finished():
	if $Textura.animation == 'cromossomo':
		$Textura.play('invisivel', false)
		cromossomos = [[Sprite.new(), Sprite.new()],
		 [Sprite.new(), Sprite.new()], [Sprite.new(), Sprite.new()], [Sprite.new(), Sprite.new()]]
		for i in cromossomos:
			i[0].texture = load("res://assets/img/dna/cromossomo_esquerdo.png")
			i[1].texture = load("res://assets/img/dna/cromossomo_direita.png")
			i[0].scale = Vector2(0.5, 0.5)
			i[1].scale = Vector2(0.5, 0.5)
			add_child(i[0])
			add_child(i[1])
		var j = 0
		while j < 50:
			cromossomos[0][0].position += Vector2(0, 1.5)
			cromossomos[0][1].position += Vector2(0, 1.5)
			cromossomos[1][0].position += Vector2(0, 4.5)
			cromossomos[1][1].position += Vector2(0, 4.5)
			cromossomos[2][0].position -= Vector2(0, 1.5)
			cromossomos[2][1].position -= Vector2(0, 1.5)
			cromossomos[3][0].position -= Vector2(0, 4.5)
			cromossomos[3][1].position -= Vector2(0, 4.5)
			j += 1
			yield(get_tree().create_timer(0.1), "timeout")
		separar()
