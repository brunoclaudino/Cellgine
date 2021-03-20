extends Node2D

var spt #= preload('') lembrar de passar o sprite quando tiver
var posicao_pai                          # Em tese vai armazenar a posição do ponto central do pai
var id
var nome = 'Nucleo'
var resumo = 'Armazena o DNA e faz controle de reações químicas'
var descricao = ['Maior organela da célula.',
'Armazenar DNA.',
'Controla reações químicas na célula.']


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.texture = spt
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func define_id(numero):
	self.id = numero
	
func em_mitose():
	pass

func define_posicao_pai(numero):
	self.posicao_pai = numero
