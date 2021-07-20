extends Node2D


# Declare member variables here. Examples:
var esquerda = preload("res://assets/img/dna/cromossomo_esquerdo.png")
var direita = preload("res://assets/img/dna/cromossomo_direita.png")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimatedSprite_animation_finished():
	if $Textura.animation == 'cromossomo':
		$Textura.play('invisivel', false)
		var cromossomos = [[Sprite.new(), Sprite.new()],
		 [Sprite.new(), Sprite.new()], [Sprite.new(), Sprite.new()]]
		for i in cromossomos:
			i[0].textura = esquerda.instance()
			i[1].textura = direita.instance()
		var j = 0
		while j < 120:
			cromossomos[0] += Vector2(0, 10)
			cromossomos[0] += Vector2(0, 20)
			cromossomos[0] -= Vector2(0, 10)
			cromossomos[0] -= Vector2(0, 20)
